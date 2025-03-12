/*
Tools.Charts.js
2016-11-23
Ray Hsu
Tools for AES-HAN Elementary system usage
*****************************************
2022-04-19
KyLin 
change for SR
*****************************************
參考:
http://www.chartjs.org/docs/#polar-area-chart-introduction
http://www.bootcss.com/p/chart.js/docs/
*/


// array Xaxis_                     : 橫軸欄位名稱['名稱1','名稱2','名稱3',...]
// array(key,value) Data_           : 資料集格式:array[{dataName:(string)資料集代表名稱,data:(array)[數字1,數字2,...]},...]
function BuildBarData(Xaxis_, Data_) {
  var barChartData = {
    labels: Xaxis_,
    datasets: []
  };

  // -- 建立&設定資料集 --
  $.each(Data_, function (DatasetName, value) {

    barChartData.datasets.push({
      label: value['labelname1'],
      backgroundColor: value['color1'],
      data: value['data1']
    }, {
      label: value['labelname2'],
      backgroundColor: value['color2'],
      data: value['data2']
    })
  });

  return barChartData;
}


// -- ** 請注意!須將所有想要繪製的資料一併加入ArrayData_後呼叫此function，否則同一頁中只會繪製最後一筆圖表資料 ** --
// array ArrayData_     : [{Type : (sring)圖表類型 ,ParentNode_ID : (string)<div>ID ,ChartName : (string)圖表名稱 , Data: (array)各Build_OOO_Data資料}, ...]
function MainChartsDraw(ArrayData_) {
  window.onload = function () {
    $.each(ArrayData_, function (ArrayDataIndex, value) {
      var type = ArrayData_[ArrayDataIndex]['Type'];
      var ParentNode_ID = ArrayData_[ArrayDataIndex]['ParentNode_ID'];
      var ChartName = ArrayData_[ArrayDataIndex]['ChartName'];
      var Data = ArrayData_[ArrayDataIndex]['Data'];

      switch (type) {
        case 'bar':
          var ctxBar = document.getElementById(ParentNode_ID).getContext("2d");
          window.myBar = new Chart(eval(ctxBar), {
            type: type,
            data: Data,
            options: {
              responsive: true,
              title: {
                display: false,
                text: ChartName
              },
              legend: {
                display: true,
                position: 'right',
                align: 'end',
                labels: {
                  boxWidth: 13,
                  fontSize: 13
                }
              },
              scales: {
                xAxes: [{
                  stacked: true,
                  gridLines: {
                    color: "#ccc",
                  },
                  ticks: {
                    fontSize: 13,
                    fontFamily: 'Microsoft JhengHei',
                  },
                  //categoryPercentage: 1,
                  //barPercentage: .55,
                }],
                yAxes: [{
                  stacked: true,
                  gridLines: {
                    color: "#ccc",
                  },
                  ticks: {
                    //min: 0,
                    //max: 800,
                    //stepSize:  50,
                    beginAtZero: true,
                    fontSize: 13,
                    fontFamily: 'Microsoft JhengHei',  
                    //maxTicksLimit: 10,
                  },
                }]
              },
              layout: {
                padding: {
                  top: 40
                }
              },
              tooltips: {
                enabled: false
              },
              hover: {
                mode: 'null',
                animationDuration: 1
              },
              animation: {
                duration: 1 ,  
                onComplete: drawValue,  
              },
            },
          });
          break;

        default:
          break;
      }
    });
  };
}

function drawValue() {
  var chartInstance = this.chart;
  var ctx = chartInstance.ctx;
  ctx.textAlign = "center";
  ctx.font = "300 16px 'Noto Sans SC','Helvetica Neue',Helvetica,Arial,sans-serif";
  //draw each value on bar        
  Chart.helpers.each(this.data.datasets.forEach(function (dataset, i) {
    var meta = chartInstance.controller.getDatasetMeta(i);
    Chart.helpers.each(meta.data.forEach(function (bar, index) {
      var data = dataset.data[index];
      var barHeight = bar._model.y - bar._model.base;
      var centerY = bar._model.base + barHeight / 2;
      ctx.fillStyle = "#fff";
      if (data > 0) {
        ctx.fillText(data, bar._model.x, centerY);
      }
    }), this);
  }), this);

  // draw total count
  this.data.datasets[0].data.forEach(function (data, index) {
    var total = data + this.data.datasets[1].data[index];
    var meta = chartInstance.controller.getDatasetMeta(1);
    var posX = meta.data[index]._model.x;
    var posY = meta.data[index]._model.y;
    //畫矩形 w70,h30 + paddingBottom10 + 三角 w10,h5 
    if (this.data.datasets[index].backgroundColor == '#ebc941') {//怕換標籤名稱或改語系，故用顏色判定
      ctx.fillStyle = "rgba(67,160,71, 0)";
    } else {
      ctx.fillStyle = "rgba(67,160,71, .5)";
    }
    ctx.beginPath();
    ctx.moveTo(posX - 35, posY - 40);
    ctx.arcTo(posX - 35 + 70, posY - 40, posX - 35 + 70, posY - 40 + 30, 5);
    ctx.arcTo(posX - 35 + 70, posY - 40 + 30, posX - 35, posY - 40 + 30, 5);
    ctx.lineTo(posX - 35 + 40, posY - 40 + 30);
    ctx.lineTo(posX - 35 + 35, posY - 40 + 35);
    ctx.lineTo(posX - 35 + 30, posY - 40 + 30);
    ctx.arcTo(posX - 35, posY - 40 + 30, posX - 35, posY - 40, 5);
    ctx.arcTo(posX - 35, posY - 40, posX - 35 + 70, posY - 40, 5);
    ctx.closePath();
    ctx.fill();
    ctx.fillStyle = "#fff";
    ctx.fillText(total, posX, posY - 26);
  }, this);
}
