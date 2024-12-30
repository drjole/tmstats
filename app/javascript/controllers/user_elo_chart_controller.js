import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="user-elo-chart"
export default class extends Controller {
    static values = {
        data: Array,
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
            grid: {
                containLabel: true,
                top: "10px",
                right: 20,
                left: 20,
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
            dataset: {
                source: this.dataValue,
            },
            series: {
                type: "line",
                step: "end",
                name: "Rating",
                encode: {
                    x: "time",
                    y: "Rating",
                },
            },
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
