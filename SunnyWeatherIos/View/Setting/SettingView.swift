//
//  SettingManager.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/8.
//

import SwiftUI

struct SettingView: View {
    @ObservedObject var settingViewModel: WeatherDetialViewModel
    
    var body: some View {
        List{
            Section(header: Text("单位") ) {
                Menu{
                    Button(action: {
                        settingViewModel.temperatureUnit = 0
                        settingViewModel.refreshAlltempure()
                        UserDefaults.standard.set(settingViewModel.temperatureUnit, forKey: "temperatureUnit")
                    }) {
                        Text("摄氏度" + getTempuratureUnit(index:0))
                    }
                    Button(action: {
                        settingViewModel.temperatureUnit = 1
                        UserDefaults.standard.set(settingViewModel.temperatureUnit, forKey: "temperatureUnit")
                        settingViewModel.refreshAlltempure()
                    }) {
                        Text("华氏度" + getTempuratureUnit(index:1))
                    }
                } label: {
                    HStack{
                        Text("温度单位")
                            .foregroundColor(.black)
                        Spacer()
                        Text(getTempuratureUnit(index: settingViewModel.temperatureUnit))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                Menu {
                    Button(action: {
                        settingViewModel.windSpeedUnit = 0
                        settingViewModel.refreshAlltempure()
                        UserDefaults.standard.set(settingViewModel.windSpeedUnit, forKey: "windSpeedUnit")
                    }) {
                        Text(getWindSpeedUnit(index: 0))
                    }
                    Button(action: {
                        settingViewModel.windSpeedUnit = 1
                        settingViewModel.refreshAlltempure()
                        UserDefaults.standard.set(settingViewModel.windSpeedUnit, forKey: "windSpeedUnit")
                    }) {
                        Text(getWindSpeedUnit(index: 1))
                    }
                } label: {
                    HStack {
                        Text("风力单位")
                            .foregroundColor(.black)
                        Spacer()
                        Text(getWindSpeedUnit(index: settingViewModel.windSpeedUnit))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
                
            }
            Section(header: Text("关于软件")) {
                HStack{
                    NavigationLink(destination: AboutSoftwareView())
                    {
                        Text("关于SunnyWeatherIos")
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .navigationBarTitle("设置", displayMode: .large)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
    }
    
    
    private var backButton: some View {
        Button(action: {
            settingViewModel.isSetting = false
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
        }
    }
}

struct SettingManager_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(settingViewModel: WeatherDetialViewModel())
    }
}
