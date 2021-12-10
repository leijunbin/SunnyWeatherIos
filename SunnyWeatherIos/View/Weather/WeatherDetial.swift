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
                        await Task.sleep(1_500_000_000)
                    }) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i], isShowAlert: viewModel.weatherDetialModels.models[i].isShowAlert, temperatureUnitOn: getTempuratureUnit(index: viewModel.temperatureUnit))
                            .navigationBarItems(leading: addButton, trailing: settingButton)
                            .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
                    }
                    .tabItem {
                        Image(systemName: "location")
                    }
                }
                else {
                    ScrollRefreshable(title: "正在获取最新天气", tintColor: .black, onRefresh: {
                        viewModel.refreshWeather(index: i)
                        await Task.sleep(1_500_000_000)
                    }) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i], isShowAlert: viewModel.weatherDetialModels.models[i].isShowAlert, temperatureUnitOn: getTempuratureUnit(index: viewModel.temperatureUnit))
                            .navigationBarItems(leading: addButton, trailing: settingButton)
                            .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
        .background(WeatherBackground(skycon: viewModel.weatherDetialModels.models[viewModel.currentIndex].skycon))
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .onAppear {
            for i in 0..<viewModel.weatherDetialModels.models.count {
                if i == 0 {
                    viewModel.getCurrentLocation()
                }
                else {
                    viewModel.refreshWeather(index: i)
                }
            }
            print(viewModel.isCityManager)
        }
    }
    
    private var addButton: some View {
        HStack(spacing: 0){
            NavigationLink(destination: CityManagerView(cityViewModel: viewModel), isActive: $viewModel.isCityManager) {}.frame(width: 0, height: 0)
            Button(action: {
                viewModel.isCityManager = true
            }) {
                Image(systemName: "plus")
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                    .foregroundStyle(.tint)
            }
        }
    }
    
    private var settingButton: some View {
        HStack(spacing: 0){
            NavigationLink(destination: SettingView(settingViewModel: viewModel), isActive: $viewModel.isSetting) {}.frame(width: 0, height: 0)
            Button(action: {
                viewModel.isSetting = true
            }) {
                Image("setting")
                    .resizable()
                    .frame(width: 20, height: 20)
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
