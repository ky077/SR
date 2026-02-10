$(function () {
  initLayout();
  initUIBehaviors();
});


/* ======= ======= ======= ======= ======= ======= =======
 * Layout
 * ======= ======= ======= ======= ======= ======= ======= */
function initLayout() {
  $('header').load('master_header.html', function () {
    $('#currentPage').html($('main .SR-h2').html()); // 當前頁名稱顯示
  });

  $('footer').load('master_footer.html');


  $('#sidebarMenu').load('master_sidebar.html', function () {
    const keys = ($('body').data('sidebar') || '').split(' ');

    keys.forEach(function (key) {
      const $links = $('#sidebarMenu .nav-link[href*="' + key + '"]');
      $links.addClass('active');

      // 如果是 collapse 區塊，順便展開
      $links.each(function () {
        const href = $(this).attr('href');

        // 命中的是子項目 → 展開父層
        if (href && !href.startsWith('#')) {
          const $collapse = $(this).closest('.collapse');
          if ($collapse.length) {
            $collapse.addClass('show');
            $collapse
              .closest('.nav-item')
              .children('.nav-link[data-bs-toggle="collapse"]')
              .addClass('active');
          }
        }
      });
    });
  });

}


/* ======= ======= ======= ======= ======= ======= =======
 * UI Behaviors
 * ======= ======= ======= ======= ======= ======= ======= */
function initUIBehaviors() {
  // 密碼 - 顯示 / 隱藏
  $(document).on('click', '.pd-show-hide button', function () {
    const $btn = $(this);
    const $input = $btn.closest('.input-group').find('input');

    $btn.find('i').toggleClass('fa-eye fa-eye-slash');
    $input.attr('type', $input.attr('type') === 'password' ? 'text' : 'password');
  });


  // 搜尋 [X] 顯示
  $(document).on('keyup', '.input-group-clear > input', function () {
    $(this).parent().toggleClass('active', !!$(this).val());
  });


  // 搜尋 [X] 清除
  $(document).on('click', '.input-group-clear > .btn-close', function () {
    $(this).parent().removeClass('active').find('input').val('');
  });


  // 上傳檔案顯示檔名
  $(document).on('change', '.input-group-file input[type="file"]', function () {
    const file = this.files[0];
    if (file) {
      $(this).siblings('input[type="text"]').val(file.name);
    }
  });
}


/* ======= ======= ======= ======= ======= ======= =======
 * Modal Utilities
 * ======= ======= ======= ======= ======= ======= ======= */
//alertModal 訊息視窗
function alertModal(html, callback) {
  $('body').append(`<div class="modal fade alertModal" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true" data-bs-backdrop="static" data-bs-keyboard="false">
                      <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                          <div class="modal-body">
                            <div>
                              ` + html + `
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-primary mx-auto btn-sm" data-bs-dismiss="modal">確定</button>
                          </div>
                        </div>
                      </div>
                    </div>`);

  $('#alertModal').modal('show');

  $('#alertModal').on('hidden.bs.modal', function () {
    if (typeof callback === 'function') callback();
    $(this).remove();
  });
}

//confirmModal 確認視窗
function confirmModal(html) {
  $('body').append(`<div class="modal fade confirmModal" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true">
                      <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                          <div class="modal-body">
                            <div>
                              ` + html + `
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-outline-primary mx-auto" data-bs-dismiss="modal">取消</button><button type="button" class="btn btn-primary mx-auto" data-bs-dismiss="modal" id="confirmOk">確定</button>
                          </div>
                        </div>
                      </div>
                    </div>`);

  $('#confirmModal').modal('show');

  $('#confirmModal').on('hidden.bs.modal', function () {
    $(this).remove();
  });
}


/* ======= ======= ======= ======= ======= ======= =======
 * DataTable Utilities 
 * ======= ======= ======= ======= ======= ======= ======= */
function datatableInputPage(table) {
  //到第X頁DOM
  let info = table.DataTable().page.info();

  let inputHTML = '<div class="add_dataTables_input">'
    + '到第&nbsp;'
    + '<input type="text" class="form-control input-lg d-inline paginate_input">'
    + '&nbsp;頁'
    + '<a class="btn paginate_button">確定</a>'
    + '</div>';

  $('#' + table.attr('id') + '_wrapper').find('.datatables-custom-footer').append(inputHTML);

  let textGoPage = $('#' + table.attr('id') + '_wrapper').find('.add_dataTables_input .paginate_input');
  let btnGoPage = $('#' + table.attr('id') + '_wrapper').find('.add_dataTables_input .paginate_button');

  //頁碼欄位輸入後按ENTER鍵觸發[確定]
  textGoPage.keypress(function (event) {
    if (event.keyCode === 13) {
      btnGoPage.click();
    }
  });
  //頁碼欄位監聽清除invalid
  textGoPage.keyup(function () {
    if (parseInt(textGoPage.val()) > 0 && parseInt(textGoPage.val()) <= info.pages || !textGoPage.val()) {
      textGoPage.removeClass('invalid');
    }
  });

  //頁碼[確定]
  btnGoPage.click(function () {
    if (parseInt(textGoPage.val()) > 0 && parseInt(textGoPage.val()) <= info.pages) {
      table.DataTable().page(parseInt(textGoPage.val()) - 1).draw(false);
    } else {
      alertModal('<div class="text-red">請輸入正確頁數。</div>');

      $('#alertModal').on('hidden.bs.modal', function () {
        textGoPage.addClass('invalid').focus();
      });
    }
  });


  //點擊table頁碼滑動至最表格上方
  table.on('page.dt', function () {
    textGoPage.removeClass('invalid').val(''); //清空頁碼輸入欄位 

    if (table.parents('.modal').length > 0) {
      console.log('modal');
      $('.modal').animate({
        scrollTop: 0
      }, 0);
    } else {
      console.log('html, body');
      $('html, body').animate({
        scrollTop: 0
      }, 0);
    }
  });
}

function initDataTableSearch() {
  // 點搜尋按鈕
  $(document).on('click', '[id*="btnSearch"]', function () {
    const $group = $(this).closest('.input-group'); // 找到包含 data-dt-target 的父層
    const targetSelector = $group.data('dt-target');
    if (!targetSelector) return;

    const $table = $(targetSelector).DataTable();
    const $input = $group.find('input[type="text"]');
    $table.search($input.val()).draw();
  });

  // 點 X 按鈕清空
  $(document).on('click', '.input-group-clear .btn-close', function () {
    const $group = $(this).closest('.input-group');
    const targetSelector = $group.data('dt-target');
    if (!targetSelector) return;

    const $table = $(targetSelector).DataTable();
    const $input = $group.find('input[type="text"]');
    $input.val('');
    $table.search('').draw();
  });
	
	// 搜尋 狀態
/*	$(document).on('change', '[id*="searchStatus"]', function () {
		const $select = $(this);
		const tableSelector = $select.data('dt-target');
		const val = $select.val();

		const table = $(tableSelector).DataTable();

		table
			.column('.col-status') // ⭐ 狀態欄統一用 class
			.search(val)
			.draw();
	});*/
	$(document).on('change', '[data-dt-column]', function () {
  const $el = $(this);

  const tableSelector = $el.data('dt-target');
  const columnSelector = $el.data('dt-column');
  const val = $el.val();

  if (!tableSelector || !columnSelector) return;

  const table = $(tableSelector).DataTable();

  table
    .column(columnSelector)
    .search(val)
    .draw();
});
}
