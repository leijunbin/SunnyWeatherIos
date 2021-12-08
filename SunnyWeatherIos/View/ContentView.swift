//
//  ContentView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import SwiftUI
import CoreData

struct ContentView: View {
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
        
        UIPageControl.appearance().currentPageIndicatorTintColor = .blue

        let scrollbarAppearance =  UINavigationBarAppearance()
        scrollbarAppearance.configureWithTransparentBackground()
        UINavigationBar.appearance().scrollEdgeAppearance = scrollbarAppearance

        let standardbarAppearance =  UINavigationBarAppearance()
        standardbarAppearance.backgroundEffect = UIBlurEffect.init(style: .regular)
        standardbarAppearance.shadowColor = .clear
        standardbarAppearance.shadowColor = nil
        UINavigationBar.appearance().standardAppearance = standardbarAppearance
    }
    
    var body: some View{
        NavigationView {
            WeatherDetial()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

