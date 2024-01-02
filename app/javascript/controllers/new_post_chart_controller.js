import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['canvas', 'hp', 'atk', 'def', 'spd', 'crt', 'crd', 'hit', 'avd', 'input']

  connect() {
    this.chart = new Chart(this.canvasTarget.getContext('2d'), {
      type: 'radar',
      data: {
        labels: ['hp', 'crt', 'crd', 'hit', 'avd', 'spd', 'def', 'atk'],
        datasets: [{
          label: '# of Votes',
          data: [0, 0, 0, 0, 0, 0, 0, 0],
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
        },
        plugins: {
          legend: {
            display: false
          }
        }
      }
    });
  }

  updateChart() {
    this.chart.update();
  }


  calculateAndUpdateChart(index, value) {
    const characterStatus = this.chart.data.datasets[0].data;
    const statusIndex = ["hp", "crt", "crd", "hit", "avd", "spd", "def", "atk"]
    const statusAverage = {
      hp: 0.5, crt: 75, crd: 75, hit: 75,
      avd: 75, spd: 60, def: 7.5, atk: 7.5
    };
    const statusLimit = 7500;
    value *= statusAverage[statusIndex[index]];
    characterStatus[index] = value <= statusLimit ? value : statusLimit;
    this.updateChart();
  }

  hp_status() {
    this.calculateAndUpdateChart(0, this.hpTarget.value)
  }

  crt_status() {
    this.calculateAndUpdateChart(1, this.crtTarget.value)
  }

  crd_status() {
    this.calculateAndUpdateChart(2, this.crdTarget.value)
  }

  hit_status() {
    this.calculateAndUpdateChart(3, this.hitTarget.value)
  }

  avd_status() {
    this.calculateAndUpdateChart(4, this.avdTarget.value)
  }

  spd_status() {
    this.calculateAndUpdateChart(5, this.spdTarget.value)
  }

  def_status() {
    this.calculateAndUpdateChart(6, this.defTarget.value)
  }

  atk_status() {
    this.calculateAndUpdateChart(7, this.atkTarget.value)
  }
}
