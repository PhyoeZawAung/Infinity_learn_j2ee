// Bar Chart Example
var ctx = document.getElementById("myBarChart");
var myLineChart = new Chart(ctx, {
  type: "bar",
  data: {
    labels: ["January", "February", "March", "April", "May", "June"],
    datasets: [
      {
        label: "Revenue",
        backgroundColor: "rgba(2,117,216,1)",
        borderColor: "rgba(2,117,216,1)",
        data: [4215, 5312, 6251, 7841, 9821, 14984],
      },
    ],
  },
  options: {
    scales: {
      xAxes: [
        {
          time: {
            unit: "month",
          },
          gridLines: {
            display: false,
          },
          ticks: {
            maxTicksLimit: 6,
          },
        },
      ],
      yAxes: [
        {
          ticks: {
            min: 0,
            max: 15000,
            maxTicksLimit: 5,
          },
          gridLines: {
            display: true,
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});

// Area Chart Example
var ctx = document.getElementById("student-chart");
var myLineChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: [
      "January",
      "February",
      "March",
      "April",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ],
    datasets: [
      {
        label: "Students",
        lineTension: 0.3,
        backgroundColor: "rgba(2,117,216,1)",
        borderColor: "rgba(2,117,216,1)",
        pointRadius: 5,
        pointBackgroundColor: "rgba(2,117,216,1)",
        pointBorderColor: "rgba(2,117,216,1)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(2,117,216,1)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [
          10000, 30162, 26263, 18394, 18287, 28682, 31274, 33259, 25849, 24159,
          32651, 31984,
        ],
      },
      {
        label: "Certified",
        lineTension: 0.3,
        backgroundColor: "rgb(255,193,7)",
        borderColor: "rgb(255,193,7)",
        pointRadius: 5,
        pointBackgroundColor: "rgb(255,193,7)",
        pointBorderColor: "rgb(255,193,7)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgb(255,193,7)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [
          500, 20162, 16263, 17394, 10287, 28182, 1274, 259, 5849, 4159, 2651,
          1984,
        ],
      },
    ],
  },
  options: {
    scales: {
      xAxes: [
        {
          time: {
            unit: "date",
          },
          gridLines: {
            display: false,
          },
          ticks: {
            maxTicksLimit: 7,
          },
        },
      ],
      yAxes: [
        {
          ticks: {
            min: 0,
            max: 40000,
            maxTicksLimit: 5,
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});

var ctx = document.getElementById("course-chart");
var myLineChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: [
      "January",
      "February",
      "March",
      "April",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December",
    ],
    datasets: [
      {
        label: "Courses",
        lineTension: 0.3,
        backgroundColor: "rgba(2,117,216,1)",
        borderColor: "rgba(2,117,216,1)",
        pointRadius: 5,
        pointBackgroundColor: "rgba(2,117,216,1)",
        pointBorderColor: "rgba(2,117,216,1)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgba(2,117,216,1)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [1, 2, 3, 4, 5, 6, 7, 4, 32, 5, 3, 2],
      },
      {
        label: "Reviewed",
        lineTension: 0.3,
        backgroundColor: "rgb(25, 135, 84)",
        borderColor: "rgb(25, 135, 84)",
        pointRadius: 5,
        pointBackgroundColor: "rgb(25, 135, 84)",
        pointBorderColor: "rgb(25, 135, 84)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgb(25, 135, 84)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [3, 2, 9, 6, 10, 12, 5, 8, 4, 11, 1, 7],
      },
      {
        label: "Draft",
        lineTension: 0.3,
        backgroundColor: "rgb(108, 117, 125)",
        borderColor: "rgb(108, 117, 125)",
        pointRadius: 5,
        pointBackgroundColor: "rgb(108, 117, 125)",
        pointBorderColor: "rgb(108, 117, 125)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgb(108, 117, 125)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [4, 8, 9, 3, 6, 11, 1, 7, 10, 2, 12, 5],
      },
      {
        label: "Under review",
        lineTension: 0.3,
        backgroundColor: "rgb(255,193,7)",
        borderColor: "rgb(255,193,7)",
        pointRadius: 5,
        pointBackgroundColor: "rgb(255,193,7)",
        pointBorderColor: "rgb(255,193,7)",
        pointHoverRadius: 5,
        pointHoverBackgroundColor: "rgb(255,193,7)",
        pointHitRadius: 50,
        pointBorderWidth: 2,
        data: [3, 10, 11, 6, 1, 9, 5, 8, 7, 12, 4, 2],
      },
    ],
  },
  options: {
    scales: {
      xAxes: [
        {
          time: {
            unit: "date",
          },
          gridLines: {
            display: false,
          },
          ticks: {
            maxTicksLimit: 7,
          },
        },
      ],
      yAxes: [
        {
          ticks: {
            min: 0,
            max: 40000,
            maxTicksLimit: 5,
          },
          gridLines: {
            color: "rgba(0, 0, 0, .125)",
          },
        },
      ],
    },
    legend: {
      display: false,
    },
  },
});
