import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="elo-chart"
export default class extends Controller {
    static values = {
        data: Object,
    };

    connect() {
        let chartOption = {
            backgroundColor: "transparent",
            tooltip: {
                trigger: "axis",
                axisPointer: {
                    label: {
                        formatter: (params) => {
                            return echarts.time.format(new Date(params.value), "{yyyy}-{MM}-{dd}", true);
                        },
                    },
                },
            },
            legend: {
                selector: true,
            },
            grid: {
                containLabel: true,
                right: "0",
                left: "left",
            },
            dataZoom: {
                filterMode: "none",
                labelFormatter: (value, _) => {
                    return echarts.time.format(new Date(value), "{yyyy}-{MM}-{dd}", true, "DE");
                },
            },
            xAxis: {
                type: "time",
            },
            yAxis: {
                interval: 30,
                min: (value) => Math.trunc((value.min - 1000) / 30) * 30 + 1000 - 30,
                max: (value) => Math.trunc((value.max - 1000) / 30) * 30 + 1000 + 30,
            },
            series: Object.keys(this.dataValue).map((userId) => {
                return {
                    data: this.dataValue[userId].map((row) => Object.values(row).slice(0, 2)),
                    type: "line",
                    step: "end",
                    name: this.dataValue[userId][0].user_name,
                };
            }),
        };

        this.chart = echarts.init(this.element, "dark");
        this.chart.setOption(chartOption);

        this.chart.on("click", (params) => this.openGame(params.value.game_id));
    }

    disconnect() {
        this.chart.dispose();
    }

    resize() {
        this.chart.resize();
    }

    openGame(gameId) {
        const id = `game_${gameId}`;
        location.hash = "";
        location.hash = `#${id}`;
        document.getElementById(id).querySelector("details").open = true;
    }
}
