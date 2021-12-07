//
//  WeatherDetial.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/8.
//

import SwiftUI
import RxSwift
import Alamofire
import SwiftUIRefresh

struct WeatherDetial: View {
    @ObservedObject var viewModel = WeatherDetialViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.currentIndex) {
            ForEach(viewModel.weatherDetialModels.models.indices, id: \.self) { i in
                if i == 0 {
                    ScrollView(.vertical, showsIndicators: false) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i])
                            .navigationBarItems(leading: addButton)
                            .tabItem {
                                Image(systemName: "location")
                            }
                            .onAppear {
                                viewModel.refreshWeather(index: i)
                            }
                    }
                    .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
                    .tabItem {
                        Image(systemName: "location")
                    }
                }
                else {
                    ScrollView(.vertical, showsIndicators: false) {
                        WeatherScrollview(weatherDetialModel: viewModel.weatherDetialModels.models[i])
                            .navigationBarItems(leading: addButton)
                            .onAppear {
                                viewModel.refreshWeather(index: i)
                            }
                    }
                    .navigationBarTitle(viewModel.weatherDetialModels.models[i].city)
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
