//
//  Air_AlertButton.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/11/17.
//

import SwiftUI

struct Air_AlertButton: View {
    var weatherDetialModel: WeatherDetialModel
    var isShowAlert: Bool
    
    @State private var showingAirPopup = false
    @State private var showingAlertPopup = false
    let alertColor = [Color.gray, Color.blue, Color.yellow, Color.orange, Color.red]
    
    var body: some View {
        HStack(spacing: 3){
            Button(action: {
                showingAirPopup.toggle()
            }){
                Text("空气质量")
                    .font(.system(size: 15))
                    .foregroundColor(.black)
            }
            .frame(width: 70, height: 25)
            .buttonStyle(BorderlessButtonStyle())
            .font(.title)
            .padding()
            .background(Rectangle().fill(getAirColor(des: weatherDetialModel.air_quality.description)).blur(radius: 30))
            .foregroundColor(Color.white)
            .cornerRadius(12)
            .halfSheet(showSheet: $showingAirPopup) {
                VStack(alignment: .leading, spacing: 3) {
                    HStack{
                        Text("空气质量")
                            .font(.title)
                        Spacer()
                    }
                    HStack (spacing: 15){
                        Text(String(Int(weatherDetialModel.air_quality.aqi)))
                            .font(.system(size: 80))
                            .foregroundColor(getAirColor(des: weatherDetialModel.air_quality.description))
                        VStack(){
                            Spacer()
                                .frame(height: 32)
                            Text(weatherDetialModel.air_quality.description)
                                .font(.system(size: 25))
                                .foregroundColor(getAirColor(des: weatherDetialModel.air_quality.description))
                        }
                    }
                    HStack (spacing: 55){
                        VStack(spacing: 7) {
                            AirPositionView(name: "PM2.5", value: Int(weatherDetialModel.air_quality.pm25))
                            AirPositionView(name: "PM10", value: Int(weatherDetialModel.air_quality.pm10))
                        }
                        VStack(spacing: 7) {
                            AirPositionView(name: "NO2", value: Int(weatherDetialModel.air_quality.no2))
                            AirPositionView(name: "CO", value: Int(weatherDetialModel.air_quality.co))
                        }
                        VStack(spacing: 7) {
                            AirPositionView(name: "O3", value: Int(weatherDetialModel.air_quality.o3))
                            AirPositionView(name: "SO2", value: Int(weatherDetialModel.air_quality.so2))
                        }
                    }
                    Spacer()
                }
                .padding(Edge.Set.init(arrayLiteral: .top), 15)
                .padding(Edge.Set.init(arrayLiteral: .top, .bottom, .leading, .trailing), 15)
                .background(Color.white)
            } onEnd: {
                print("complete")
            }
            if isShowAlert {
                Button(action: {
                    showingAlertPopup.toggle()
                }){
                    Text("预警")
                        .font(.system(size: 15))
                        .foregroundColor(.black)
                }
                .frame(width: 40, height: 25)
                .buttonStyle(BorderlessButtonStyle())
                .font(.title)
                .padding()
                .background(Rectangle().fill(alertColor[weatherDetialModel.alert[0].code]).blur(radius: 30))
                .foregroundColor(Color.white)
                .cornerRadius(12)
                .padding(10)
                .halfSheet(showSheet: $showingAlertPopup){
                    VStack(alignment: .leading, spacing: 3) {
                        HStack{
                            Text("预警详情")
                                .font(.title)
                            Spacer()
                        }
                        List {
                            ForEach(weatherDetialModel.alert.indices, id: \.self) { i in
                                HStack{
                                    Text(weatherDetialModel.alert[i].title)
                                        .font(.title2)
                                }
                                Text("")
                                Text(weatherDetialModel.alert[i].description + "（预警信息来源：" + weatherDetialModel.alert[i].source + "）")
                                    .font(.system(size: 15))
                                Text("")
                            }
                            .listRowSeparatorTint(.clear)
                            .listRowBackground(Color.clear)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                        }
                        .listStyle(PlainListStyle())
                        Spacer()
                    }
                    .padding(Edge.Set.init(arrayLiteral: .top), 15)
                    .padding(Edge.Set.init(arrayLiteral: .top, .bottom, .leading, .trailing), 15)
                    .background(Color.white)
                } onEnd: {
                    print("complete")
                }
            }
            
            Spacer()
        }
    }
}

struct Air_AlertButton_Previews: PreviewProvider {
    static var previews: some View {
        Air_AlertButton(weatherDetialModel: WeatherDetialModel(), isShowAlert: true)
    }
}

