const ctx = document.getElementById('myChart');
const titles = ['hp', 'crt', 'crd', 'hit', 'avd', 'spd', 'def', 'atk'];
const character_status = [0, 0, 0, 0, 0, 0, 0, 0];
function updateChart() {
  chart.update();
}

const chart = new Chart(ctx, {
  type: 'radar',
  data: {
    labels: titles,
    datasets: [{
      label: '# of Votes',
      data: character_status,
      borderWidth: 1
    }]
  },
  options: {
    scales: {
      r: {
        beginAtZero: true,
        max: 7500,
        min: 0,
        ticks: {
          display: false
        }
      }
    }
  }
});

const hp_js = document.getElementById('hp_js');
const atk_js = document.getElementById('atk_js');
const def_js = document.getElementById('def_js');
const spd_js = document.getElementById('spd_js');
const crt_js = document.getElementById('crt_js');
const crd_js = document.getElementById('crd_js');
const hit_js = document.getElementById('hit_js');
const avd_js = document.getElementById('avd_js');

const status_average = {
  hp_magnification : 0.5,
  crt_magnification : 7.5,
  crd_magnification : 7.5,
  hit_magnification : 60,
  avd_magnification : 75,
  spd_magnification : 50,
  def_magnification : 75,
  atk_magnification : 75
};

const status_limit = 7500;
//HPの計算式
hp_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.hp_magnification;
  if (value <= status_limit) {
    character_status[0] = value;
  } else {
    character_status[0] = status_limit;
  }
  updateChart();
});
//会心率の計算式
crt_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.crt_magnification;
  if (value <= status_limit) {
    character_status[1] = value;
  } else {
    character_status[1] = status_limit;
  }
  updateChart();
});
//会心ダメージの計算式
crd_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.crd_magnification;
  if (value <= status_limit) {
    character_status[2] = value;
  } else {
    character_status[2] = status_limit;
  }
  updateChart();
});
//命中率の計算式
hit_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.hit_magnification;
  if (value <= status_limit) {
    character_status[3] = value;
  } else {
    character_status[3] = status_limit;
  }
  updateChart();
});
//回避率の計算式
avd_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.avd_magnification;
  if (value <= status_limit) {
    character_status[4] = value;
  } else {
    character_status[4] = status_limit;
  }
  updateChart();
});
//素早さの計算式
spd_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.spd_magnification;
  if (value <= status_limit) {
    character_status[5] = value;
  } else {
    character_status[5] = status_limit;
  }
  updateChart();
});
//防御力の計算式
def_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.def_magnification;
  if (value <= status_limit) {
    character_status[6] = value;
  } else {
    character_status[6] = status_limit;
  }
  updateChart();
});
//攻撃力の計算式
atk_js.addEventListener('input', function (event){
  let value = parseInt(event.currentTarget.value);
  value = value * status_average.atk_magnification;
  if (value <= status_limit) {
    character_status[7] = value;
  } else {
    character_status[7] = status_limit;
  }
  updateChart();
});