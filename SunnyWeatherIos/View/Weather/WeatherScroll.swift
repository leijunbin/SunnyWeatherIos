//
//  WeatherScroll.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/30.
//

import SwiftUI
import RxSwift

struct WeatherScroll: View {
    @ObservedObject var viewModel = WeatherDetialViewModel()
    @State private var currentIndex = 0
    
    init() {
            UINavigationBar.appearance().setBackgroundImage(UIImage(named: "bg_sun_noon"), for: UIBarMetrics.default)
            UINavigationBar.appearance().shadowImage = UIImage()
            UINavigationBar.appearance().isTranslucent = true
            UINavigationBar.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        
        TabView(selection: $currentIndex) {
            NavigationView {
                Text("Hello world!")
                    .navigationBarTitle("Hello world!")
            }
            .background(WeatherBackground())
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        }
        
        
//        NavigationView{
//            ScrollView(.vertical, showsIndicators: false){
//                TabView(selection: $currentIndex) {                     ForEach(0..<viewModel.weahterDetialModels.count, id: \.self) { index in
//                            WeatherDetial(weatherDetialModel: viewModel.weahterDetialModels[index])
//                    }
//                    .navigationBarTitle("ShangHai")
//                }
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
//            }
//            .background(WeatherBackground())
//        }
    }
    
    private var addButton: some View {
        Button(action: {
        
        }){
            Image(systemName: "plus.circle.fill")
                .font(.title)
        }
    }
}

struct WeatherScroll_Previews: PreviewProvider {
    static var previews: some View {
        WeatherScroll()
    }
}
