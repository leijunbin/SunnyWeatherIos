//
//  WeatherDetial.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI
import RxSwift
import Alamofire

struct WeatherDetial: View {
    @ObservedObject var viewModel = WeatherDetialViewModel()
    @State private var currentIndex = 0
    
    init() {
        UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bg_sun_noon"), for: UIBarMetrics.default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .clear
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue
    }
    
    var body: some View {
        NavigationView{
            TabView(selection: $currentIndex) {
                ForEach(viewModel.weatherDetialModels.models.indices, id: \.self) { i in
                    if i == 0 {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i])
                            .tabItem {
                                Image(systemName: "location")
                            }
                            .onAppear {
                                viewModel.getCityName(index: i)
                                viewModel.refreshWeather(index: i)
                            }
                    }
                    else {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i])
                            .onAppear {
                                viewModel.refreshWeather(index: i)
                            }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            .background(WeatherBackground())
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .always))
        }
    }
}

struct WeatherDetial_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetial()
    }
}
