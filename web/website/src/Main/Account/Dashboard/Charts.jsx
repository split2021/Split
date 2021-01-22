import React, {useEffect, useState} from 'react';
import {Line} from 'react-chartjs-2';

const Charts = () => {

    const [chartData, setCharData] = useState({});

    const chart = () => {

        setCharData({
            labels: ['Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi'],
            datasets: [
                {
                    label: "Groupes de paiement",
                    data: [32, 15, 25, 76, 69],
                    backgroundColor: ["rgba(75, 192, 192, 0.6"],
                    borderWidth: 2
                }
            ]
        });
    };

    useEffect(() => {
        chart();
    }, []);
    return (
        <div className={"chart"}>
            <Line
                data={chartData}
                options={{
                    responsive: true,
                    title: { text: "Groupes de paiement", display: true },
                    scales: {
                        yAxes: [
                            {
                                ticks: {
                                    autoSkip: true,
                                    maxTicksLimit: 10,
                                    beginAtZero: true
                                },
                                gridLines: {
                                    display: false
                                }
                            }
                        ],
                        xAxis: [
                            {
                                gridLines: {
                                    display: false
                                }
                            }
                        ]
                    }
                }}
            />
        </div>
    );
};

export default Charts;


