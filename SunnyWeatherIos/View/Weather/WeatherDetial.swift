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
    
    var body: some View {
        TabView(selection: $viewModel.currentIndex) {
            ForEach(viewModel.weatherDetialModels.models.indices, id: \.self) { i in
                if i == 0 {
                    ScrollRefreshable(title: "正在获取最新天气", tintColor: .black, onRefresh: {
                        viewModel.getCurrentLocation()
                        await Task.sleep(1_000_000_000)
                    }) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i], isShowAlert: viewModel.weatherDetialModels.models[i].isShowAlert)
                            .navigationBarItems(leading: addButton)
                            .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
                            .onAppear {
                                viewModel.getCurrentLocation()
                            }
                    }
                    .tabItem {
                        Image(systemName: "location")
                    }
                }
                else {
                    ScrollRefreshable(title: "正在获取最新天气", tintColor: .black, onRefresh: {
                        viewModel.refreshWeather(index: i)
                        await Task.sleep(1_000_000_000)
                    }) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i], isShowAlert: viewModel.weatherDetialModels.models[i].isShowAlert)
                            .navigationBarItems(leading: addButton)
                            .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
                            .onAppear {
                                viewModel.refreshWeather(index: i)
                            }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(WeatherBackground(skycon: viewModel.weatherDetialModels.models[viewModel.currentIndex].skycon))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        
    }
    
    private var addButton: some View {
        HStack(spacing: 0){
            NavigationLink(destination: CityManagerView(cityViewModel: viewModel), isActive: $viewModel.isBack) {}.frame(width: 0, height: 0)
            Button(action: {
                viewModel.isBack = true
            }) {
                Image(systemName: "plus")
                    .foregroundColor(.black)
                    .foregroundStyle(.tint)
            }
        }
    }
}

struct WeatherDetial_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDetial()
    }
}
