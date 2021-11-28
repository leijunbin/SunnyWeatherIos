//
//  WeatherDetial.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI

struct WeatherDetial: View {
    @ObservedObject var viewModel = WeatherDetialViewModel()
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bg_sun_noon"), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Group {
                        Spacer()
                            .frame(height: 200)
                        TemperatureImformation(weatherDetialModel: viewModel.weatherDetialModel)
                        DateInformation(weatherDetialModel: viewModel.weatherDetialModel)
                    }
                    Spacer()
                        .frame(height: 20)
                    Air_AlertButton()
                    Spacer()
                        .frame(height: 20)
                    HourlyTemperatureInformation(weatherDetialModel: viewModel.weatherDetialModel)
                    Divider()
                        .scaleEffect(CGSize(width: 1, height: 5))
                        .padding(Edge.Set.init(arrayLiteral: .top, .bottom), 20)
                    ForEach(viewModel.weatherDetialModel.dailyInformation.indices, id: \.self){ i in
                        DailyWeatherInformation(dailyInformation: viewModel.weatherDetialModel.dailyInformation[i])
                        if i != 4 {
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
                            WeatherInformation()
                        }
                        Spacer()
                            .frame(height: 20)
                        Section(header:
                            HStack{
                                Text("生活建议")
                                    .font(.title2)
                                Spacer()
                        }) {
                            LifeIndexInformation()
                        }
                    }
                }
                .padding()
            }
            .background(WeatherBackground())
            .navigationBarItems(trailing: addButton)
            .navigationBarTitle("ShangHai")
        }
    }
    
    private var addButton: some View {
        Button(action: {
            
        }){
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
    }
}

struct WeatherDetial_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetial()
    }
}
