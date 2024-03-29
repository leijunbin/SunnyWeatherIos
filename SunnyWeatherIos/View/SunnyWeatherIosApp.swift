//
//  SunnyWeatherIosApp.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/7.
//

import SwiftUI

@main
struct SunnyWeatherIosApp: App {
    
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
        
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).title = "取消"
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
