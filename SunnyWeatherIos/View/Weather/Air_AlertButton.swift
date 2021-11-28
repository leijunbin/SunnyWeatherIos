//
//  Air_AlertButton.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct Air_AlertButton: View {
    var body: some View {
        HStack(spacing: 0){
            Button(action: {
                    
            }){
                Text("空气质量")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .font(.title)
            .padding()
            .background(Rectangle().fill(Color.gray).blur(radius: 30))
            .foregroundColor(Color.white)
            .cornerRadius(12)
                
            Button(action: {
                    
            }){
                Text("预警")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .font(.title)
            .padding()
            .background(Rectangle().fill(Color.gray).blur(radius: 30))
            .foregroundColor(Color.white)
            .cornerRadius(12)
            .padding(10)
                
            Spacer()
        }
    }
}

struct Air_AlertButton_Previews: PreviewProvider {
    static var previews: some View {
        Air_AlertButton()
    }
}
