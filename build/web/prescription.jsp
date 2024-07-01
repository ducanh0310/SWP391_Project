<%-- 
    Document   : doctorAndNurse
    Created on : Jul 1, 2024, 9:06:29 PM
    Author     : Gia Huy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <style>
            /* Variables */
            :root {
                --font-stack: 'Open Sans', Helvetica, sans-serif;
                /* Media */
                --media-phone: 400px;
                /* Sizes */
                --spacing-xxxl: 3rem;
                --spacing-xxl: 2.5rem;
                --spacing-xl: 2rem;
                --spacing-l: 1.5rem;
                --spacing: 1rem;
                --spacing-xs: .75rem;
                --spacing-xxs: .5rem;
                --spacing-xxxs: .3rem;
                --spacing-xxxxs: .1rem;
                /* Fonts */
                --font-xxxl: 2.5rem;
                --font-xxl: 2rem;
                --font-xl: 1.5rem;
                --font-l: 1.25rem;
                --font: 1rem;
                --font-s: .9rem;
                --font-xs: .8rem;
                --font-xxs: .75rem;
                --font-xxxs: .7rem;
                /* Colors */
                --bg: #fcfdfd;
                --bg-100: #edf1fb;
                --bg-200: #26254f;
                --primary: #7e7fe8;
                --text: #0c0a3d;
                --text-1: #fff;
                --text-2: #9594ae;
                --success: #16c08f;
                --danger: #ff7d7d;
                --info: #758dff;
                --gray: #bbbbca;
            }

            /* Global Styles */
            *,
            *::before,
            *::after {
                box-sizing: border-box;
            }

            html {
                font-size: 12px;
            }

            body {
                height: 100%;
                overflow-x: hidden;
                margin: 0;
                font-family: var(--font-stack);
                color: var(--text);
            }

            input {
                font-family: var(--font-stack);
            }

            input:focus,
            select:focus,
            textarea:focus,
            button:focus {
                outline: none;
            }

            ul {
                list-style: none;
                padding: 0;
                margin: 0;
            }

            textarea:focus,
            input:focus {
                outline: none;
            }

            a {
                text-decoration: none;
                color: var(--gray);
            }

            /* Layout */
            .wrapper {
                display: grid;
                height: 100vh;
                grid-template-rows: 7.5rem 1fr;
                grid-template-columns: 6.5rem 1fr;
                grid-template-areas: "aside header" "aside main";
                flex-wrap: wrap;
            }

            @media screen and (max-width: var(--media-phone)) {
                .wrapper {
                    grid-template-columns: initial;
                    grid-template-rows: initial;
                }
            }

            /* Header */
            .header {
                grid-area: header;
                display: grid;
                grid-template-columns: max-content 1fr;
                align-items: center;
                padding: var(--spacing) var(--spacing-xxxl);
            }

            @media screen and (max-width: var(--media-phone)) {
                .header {
                    gap: var(--spacing-xs);
                    padding: var(--spacing-xs);
                }
            }

            .header .btn-appointment {
                padding: var(--spacing) var(--spacing-l);
                border-radius: var(--spacing-xxs);
                height: fit-content;
                color: var(--text-1);
                background: rgb(147, 149, 237);
                background: linear-gradient(90deg, rgba(147, 149, 237, 1) 0%, #6c6de3 100%);
                font-weight: 600;
            }

            .header .profile {
                justify-self: end;
                display: grid;
                grid-template-columns: 1fr 1fr;
                align-items: center;
                gap: var(--spacing);
            }

            .header .profile .image img {
                width: 4rem;
                height: 4rem;
                border-radius: 4rem;
            }

            .header .profile .image .notification {
                width: 1.25rem;
                height: 1.25rem;
                margin-top: -1.7rem;
                margin-left: 3rem;
                background-color: var(--danger);
                border-radius: 1.25rem;
                box-shadow: 0px 0px 10px 0px rgba(255, 125, 125, 1);
            }

            .header .profile select {
                height: fit-content;
                border: none;
                background: none;
                font-size: var(--font);
                font-weight: 600;
                font-family: var(--font-stack);
            }

            /* Aside */
            .aside {
                grid-area: aside;
                display: grid;
                gap: var(--spacing-l);
                padding: var(--spacing);
                justify-content: center;
                font-size: var(--font-xl);
                color: var(--gray);
                background-color: var(--bg);
            }

            @media screen and (max-width: var(--media-phone)) {
                .aside {
                    position: fixed;
                    bottom: 0;
                    width: 100%;
                    border-top: 1px solid #f1f1f1;
                    justify-content: initial;
                }
            }

            .aside ul {
                display: grid;
                grid-template-rows: repeat(8, min-content);
                gap: 3rem;
                margin-top: var(--spacing-xs);
            }

            @media screen and (max-width: var(--media-phone)) {
                .aside ul {
                    grid-template-columns: repeat(4, 1fr);
                    grid-template-rows: none;
                    margin-top: 0;
                }

                .aside ul .hide,
                .aside ul .logo.hide {
                    display: none;
                }
            }

            .aside ul li {
                display: grid;
                place-items: center;
                padding: var(--spacing-xxs) var(--spacing-xs);
            }

            .aside ul li.active {
                background-color: var(--text-1);
                box-shadow: 0px 0px 33px -10px rgba(126, 127, 232, .5);
                border-radius: var(--spacing-xs);
            }

            .aside ul li.active a {
                color: var(--primary);
            }

            .aside ul li.logo img {
                width: 3rem;
            }

            .aside ul li.logo a {
                color: var(--text-1);
                text-align: center;
                font-size: var(--font-l);
            }

            /* Main */
            .main {
                padding: var(--spacing-xxxl);
                grid-area: main;
                background-color: var(--bg-100);
                display: grid;
                grid-template-rows: 1fr 1fr;
                gap: var(--spacing-xl);
            }

            @media screen and (max-width: 1148px) {
                .main {
                    grid-template-rows: initial;
                }
            }

            @media screen and (max-width: var(--media-phone)) {
                .main {
                    padding: var(--spacing) 0 6rem 0;
                    gap: var(--spacing);
                }
            }

            .main .top {
                display: grid;
                grid-template-columns: 5fr 8fr;
                gap: var(--spacing-xl);
            }

            @media screen and (max-width: 1148px) {
                .main .top {
                    grid-template-columns: initial;
                }
            }

            @media screen and (max-width: var(--media-phone)) {
                .main .top {
                    gap: var(--spacing);
                }
            }

            .main .bottom {
                display: grid;
                gap: var(--spacing-xl);
                grid-template-columns: 4.2fr 3.8fr 5.2fr;
            }

            @media screen and (max-width: 1148px) {
                .main .bottom {
                    grid-template-columns: initial;
                }
            }

            @media screen and (max-width: var(--media-phone)) {
                .main .bottom {
                    gap: var(--spacing);
                }
            }

            .main .card {
                background-color: var(--text-1);
                border-radius: var(--spacing-xxxs);
                padding: var(--spacing-xl);
            }

            .main .card .card-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: var(--spacing-l);
            }

            .main .card .card-header .right {
                color: var(--gray);
            }

            .main .card .card-header h1 {
                display: inline-block;
                margin: 0;
                font-size: var(--font-l);
            }

            .main .card .card-header .header-container {
                display: grid;
                grid-template-columns: max-content max-content;
                gap: var(--spacing);
                align-items: end;
            }

            .main .card .card-header .header-container span {
                color: var(--gray);
                position: absolute;
                margin-left: 9rem;
                margin-top: .3rem;
            }

            .main .card .card-header select {
                height: fit-content;
                border: none;
                background: none;
                font-size: var(--font);
                font-weight: 600;
                font-family: var(--font-stack);
            }

            .main .card .card-body {
                display: grid;
                gap: var(--spacing-xl);
            }

            .main .card .appointment {
                display: grid;
                grid-template-columns: min-content max-content 1fr min-content min-content;
                grid-template-rows: repeat(3, min-content);
                grid-template-areas: "profile name name check times" "profile title title check times" "profile date time check times";
                column-gap: var(--spacing-l);
                row-gap: 0;
            }

            .main .card .appointment .image {
                width: 4rem;
                height: 4rem;
                border-radius: 4rem;
                box-shadow: 5px 5px 22px 0px rgba(116, 204, 214, .5);
            }

            .main .card .appointment .image.gray {
                box-shadow: 5px 5px 22px 0px rgba(199, 197, 210, 1);
            }

            .main .card .appointment .image.red {
                box-shadow: 5px 5px 22px 0px rgba(193, 68, 84, .5);
            }

            .main .card .appointment .name {
                font-weight: 600;
            }

            .main .card .appointment .title {
                font-size: var(--font-xs);
                color: #9695af;
            }

            .main .card .appointment .date i,
            .main .card .appointment .time i {
                color: var(--info);
            }

            .main .card .appointment .check {
                font-size: var(--font-xxl);
                align-self: center;
                color: var(--info);
            }

            .main .card .appointment .times {
                font-size: var(--font-xxl);
                align-self: center;
                color: var(--danger);
            }

            .main .card .chart-container {
                height: 17rem;
            }

            @media screen and (max-width: 650px) {
                .main .card .chart-container {
                    height: 10rem;
                }
            }

            .main .card .news-list .news {
                display: grid;
                grid-template-columns: 1fr min-content;
                grid-template-areas: "title arrow" "subtitle arrow";
                gap: var(--spacing-xxs);
            }

            .main .card .news-list .news .title {
                font-weight: 700;
                color: var(--text);
            }

            .main .card .news-list .news .subtitle {
                color: var(--text-2);
            }

            .main .card .news-list .news .fa-caret-right {
                align-self: center;
            }

            .main .card .news-list .news hr {
                width: 100%;
                border: none;
                background-color: var(--gray);
                height: 1px;
            }

            .main .card .news-list .more {
                text-align: center;
            }

            .main .card .news-list .more a {
                color: var(--primary);
                font-weight: bold;
            }

            .main .card.alert {
                background: linear-gradient(90deg, rgba(147, 149, 237, 1) 0%, #6c6de3 100%);
                color: var(--text-1);
            }

            .main .current-prescription-container {
                display: grid;
                grid-template-rows: 1fr max-content;
                gap: var(--spacing-xl);
            }

            .main .current-prescription-container ul {
                display: grid;
                row-gap: var(--spacing-xs);
            }

            /* Prescription Item */
            .prescription-item {
                display: grid;
                grid-template-areas: "dot title" "dot description";
                grid-template-columns: min-content 1fr;
                column-gap: var(--spacing-l);
            }

            .prescription-item .dot {
                width: 1.5rem;
                height: 1.5rem;
                border-radius: 1.5rem;
                align-self: center;
            }

            .prescription-item .dot.gray {
                background-color: #bccbf5;
                box-shadow: 2px 2px 10px 0px #bccbf5;
            }

            .prescription-item .dot.violet {
                background-color: var(--primary);
                box-shadow: 2px 2px 10px 0px var(--primary);
            }

            .prescription-item .title {
                color: var(--text);
                font-weight: 800;
            }

            .prescription-item .description {
            }

            /* Notifications */
            .notifications ul {
                display: grid;
                gap: var(--spacing-l);
            }

            .notifications .more {
                text-align: center;
            }

            .notifications .more a {
                color: var(--primary);
                font-weight: 600;
            }

            .notifications .notification {
                display: grid;
                grid-template-areas: "dot title date";
                grid-template-columns: min-content 1fr max-content;
                align-items: center;
                gap: var(--spacing);
            }

            .notifications .notification .dot {
                width: var(--spacing-xs);
                height: var(--spacing-xs);
                border-radius: var(--spacing-xs);
            }

            .notifications .notification .dot.green {
                background-color: var(--success);
            }

            .notifications .notification .dot.red {
                background-color: var(--danger);
            }

            .notifications .notification .dot.blue {
                background-color: var(--primary);
            }
            .aside ul li a {
                display: block; /* Để liên kết chiếm hết phần tử cha */
                padding: 10px 15px; /* Để tăng khu vực bấm */
                transition: background-color 0.3s ease; /* Hiệu ứng chuyển động */
            }

            .aside ul li a:hover {
                background-color: #f0f0f0; /* Màu nền khi di chuột qua */
                border-radius: 5px; /* Bo góc */
            }
        </style>
    </head>
    <body>

        <div class="wrapper">
            <header class="header">
                <a href="#" class="btn-appointment">Make an appointment</a>
               
            </header>
            <aside class="aside">
                <ul>
                    <li class="logo hide">
                        <a href="doctorAndNurse.jsp"><img src="https://ozcanzaferayan.github.io/healthcare-dashboard/img/logo.png" alt="logo" width="25"></a>
                    </li>
                    <li><a href="#"><i class="fa fa-folder" aria-hidden="true"></i></a></li>
                    <li><a href="prescription.jsp"><i class="fas fa-pills"></i></a></li>
                </ul>
            </aside>
            <main class="main">
                <div class="top">
                    


            </main>
        </div>
        <script src="./js/main.js"></script>
    </body>
    <script>
        // JS

        var ctx = document.getElementById('recentResultsChart').getContext('2d');
        var gradientFill = ctx.createLinearGradient(0, 0, 0, 200);
        gradientFill.addColorStop(0.1, "rgba(109,110,227, .3)");
        gradientFill.addColorStop(1, "rgba(255,255,255, .3)");


        var data = {
            labels: ["", "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", ""],
            datasets: [{
                    backgroundColor: "rgba(0,0,0,0)",
                    borderColor: "#6d6ee3",
                    borderWidth: 2,
                    fill: true,
                    backgroundColor: gradientFill,
                    data: [3, 5, 4, 10, 8, 9, 3, 15, 14, 17],
                    pointRadius: 5,
                    pointHoverRadius: 7,
                    pointColor: "#FFFFFF",
                    fillColor: "#FFFFFF",
                    strokeColor: "#FF0000",

                }]
        };

        var options = {
            responsive: true,
            maintainAspectRatio: false,
            legend: {
                display: false
            },
            tooltips: {
                mode: 'index',
                intersect: true,
                yPadding: 10,
                xPadding: 10,
                caretSize: 8,
                backgroundColor: '#fff',
                titleFontColor: "#6d6ee3",
                bodyFontStyle: 'bold',
                bodyFontColor: "#737295",
                displayColors: false,
                callbacks: {
                    label: function (tooltipItems, data) {
                        return "10.5";
                    }
                },
                bevelWidth: 3,
                bevelHighlightColor: 'rgba(255, 255, 255, 0.75)',
                bevelShadowColor: 'rgba(0, 0, 0, 0.5)'
            },
            showAllTooltips: true,
            scales: {
                yAxes: [{
                        display: true,
                        ticks: {
                            maxTicksLimit: 5,
                            min: 0,
                        },
                        gridLines: {
                            display: true
                        }
                    }],
                xAxes: [{
                        display: true,
                        ticks: {
                            fontSize: 12,
                            fontColor: '#c3c6de'
                        },
                        gridLines: {
                            display: false
                        }
                    }]
            },
            elements: {
                point: {
                    radius: 0
                }
            }
        };

        Chart.pluginService.register({
            beforeRender: function (chart) {
                if (chart.config.options.showAllTooltips) {
                    // create an array of tooltips
                    // we can't use the chart tooltip because there is only one tooltip per chart
                    chart.pluginTooltips = [];
                    chart.config.data.datasets.forEach(function (dataset, i) {
                        chart.getDatasetMeta(i).data.forEach(function (sector, j) {
                            chart.pluginTooltips.push(new Chart.Tooltip({
                                _chart: chart.chart,
                                _chartInstance: chart,
                                _data: chart.data,
                                _options: chart.options.tooltips,
                                _active: [sector]
                            }, chart));
                        });
                    });

                    // turn off normal tooltips
                    chart.options.tooltips.enabled = false;
                }
            },
            afterDraw: function (chart, easing) {
                if (chart.config.options.showAllTooltips) {
                    // we don't want the permanent tooltips to animate, so don't do anything till the animation runs atleast once
                    if (!chart.allTooltipsOnce) {
                        if (easing !== 1)
                            return;
                        chart.allTooltipsOnce = true;
                    }

                    // turn on tooltips
                    chart.options.tooltips.enabled = true;
                    Chart.helpers.each(chart.pluginTooltips, function (tooltip, i) {
                        if (i !== 3)
                            return;
                        tooltip.initialize();
                        tooltip.update();
                        // we don't actually need this since we are not animating tooltips
                        tooltip.pivot();
                        tooltip.transition(easing).draw();
                    });
                    chart.options.tooltips.enabled = false;
                }
            }
        });
        var myLineChart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: options
        });
    </script>
</html>
