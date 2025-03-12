//alertModal 訊息視窗
function alertModal(html, btnText='確定'){
    $('body').append(`<div class="modal fade modal-style1 alertModal" id="alertModal" tabindex="-1" aria-labelledby="alertModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                      <div class="modal-dialog modal-dialog-centered modal-sm">
                        <div class="modal-content">
                          <div class="modal-body">
                            <div>
                              ` + html + `
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-main" data-dismiss="modal" id="alertOk"> ` + btnText + `</button>
                          </div>
                        </div>
                      </div>
                    </div>`);
    
    $('#alertModal').modal('show');
    
    $('#alertModal').on('hidden.bs.modal', function () {
      $(this).remove();
    });
}

//confirmModal 確認視窗
function confirmModal(html, okText='確定', cancelText='取消'){
    $('body').append(`<div class="modal fade modal-style1 confirmModal" id="confirmModal" tabindex="-1" aria-labelledby="confirmModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                      <div class="modal-dialog modal-sm" role="document">
                        <div class="modal-content">
                          <div class="modal-body">
                            <div>
                              ` + html + `
                            </div>
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-main" data-dismiss="modal" id="confirmOk">` + okText + `</button>
                            <button type="button" class="btn btn-default" data-dismiss="modal" id="confirmCancel">` + cancelText + `</button>
                          </div>
                        </div>
                      </div>
                    </div>`);
    
    $('#confirmModal').modal('show');
    
    $('#confirmModal').on('hidden.bs.modal', function () {
      $(this).remove();
    });
}