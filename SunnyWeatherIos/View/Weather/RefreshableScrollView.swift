//
//  RefreshableScrollView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/7.
//

import SwiftUI

struct ScrollRefreshable<Content: View>: View {
    var content: Content
    var onRefresh: () async->()
    
    init(title: String, tintColor: Color,onRefresh: @escaping () async -> (), @ViewBuilder content: @escaping () -> Content) {
        self.content = content()
        self.onRefresh = onRefresh
        
        UIRefreshControl.appearance().attributedTitle = NSAttributedString(string: title)
        UIRefreshControl.appearance().tintColor = UIColor(tintColor)
    }
    
    var body: some View {
        List {
            content
                .listRowSeparatorTint(.clear)
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
        }
        .listStyle(PlainListStyle())
        .refreshable {
           await onRefresh()
        }
    }
}
