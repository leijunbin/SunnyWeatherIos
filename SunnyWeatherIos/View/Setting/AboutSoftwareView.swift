//
//  AboutSoftwareView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/9.
//

import SwiftUI

struct AboutSoftwareView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Spacer()
                    .frame(height: 50)
                Image("app_icon")
                    .resizable()
                    .frame(width: 100, height: 100)
                Text("SunnyWeatherIos")
                Text("V1.4")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Spacer()
                    .frame(height: 150)
                Text("barars出品")
                Text("https://github.com/leijunbin/SunnyWeatherIos")
                    .font(.system(size: 15))
            }
        }
        .navigationBarTitle("关于软件", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    private var backButton: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
        }
    }
}

