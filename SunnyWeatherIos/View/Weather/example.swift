//
//  example.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/30.
//

import SwiftUI

struct example: View {
    @State private var currentIndex = 0
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(0 ..< 15) { item in
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.orange)
                            .frame(height: 44)
                            .padding()
                    }
                }
            }
            .navigationTitle("List & NavView")
        }
        .onAppear {
            let appearance = UINavigationBarAppearance()
            appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appearance.backgroundColor = UIColor(Color.orange.opacity(0.2))
            
            // Inline appearance (standard height appearance)
            UINavigationBar.appearance().standardAppearance = appearance
            // Large Title appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}

struct example_Previews: PreviewProvider {
    static var previews: some View {
        example()
    }
}
