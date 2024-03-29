//
//  WeatherScrollview.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/1.
//

import SwiftUI

struct WeatherScrollview: View {
    var weatherDetialModel: WeatherDetialModel
    var isShowAlert: Bool
    var temperatureUnitOn: String
    
    var body: some View {
        VStack {
            Group {
                Spacer()
                    .frame(height: 200)
                TemperatureImformation(weatherDetialModel: weatherDetialModel, temperatureUnitOn: temperatureUnitOn)
                DateInformation(weatherDetialModel: weatherDetialModel, temperatureUnitOn: temperatureUnitOn)
            }
            Spacer()
                .frame(height: 10)
            Air_AlertButton(weatherDetialModel: weatherDetialModel, isShowAlert: isShowAlert)
            Spacer()
                .frame(height: 25)
            HourlyTemperatureInformation(weatherDetialModel: weatherDetialModel,temperatureUnitOn: temperatureUnitOn)
            Divider()
                .scaleEffect(CGSize(width: 1, height: 5))
                .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
            ForEach(weatherDetialModel.dailyInformation.indices, id: \.self){ j in
                DailyWeatherInformation(dailyInformation: weatherDetialModel.dailyInformation[j], temperatureUnitOn: temperatureUnitOn)
                if j != 4 {
                    Divider()
                }
            }
            Divider()
                .scaleEffect(CGSize(width: 1, height: 5))
                .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
            Group {
                Section(header:
                            HStack{
                    Text("气象信息")
                        .font(.title2)
                    Spacer()
                }) {
                    WeatherInformation(weatherDetialModel: weatherDetialModel, temperatureUnitOn: temperatureUnitOn)
                }
                Spacer()
                    .frame(height: 20)
                Section(header:
                            HStack{
                    Text("生活建议")
                        .font(.title2)
                    Spacer()
                }) {
                    LifeIndexInformation(weatherDetialModel: weatherDetialModel)
                }
            }
        }
        .padding()
    }
}

struct WeatherScrollview_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScrollview(weatherDetialModel: WeatherDetialModel(),isShowAlert: false, temperatureUnitOn: " ")
    }
}
