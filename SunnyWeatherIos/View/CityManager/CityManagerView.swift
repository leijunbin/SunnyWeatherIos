//
//  CityManagerView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/3.
//

import SwiftUI
import Alamofire

struct CityManagerView: View {
    var cityViewModel: WeatherDetialViewModel
    @State private var queryString = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var isEditMode: EditMode = .inactive

    var body: some View {
        List{
            Button(action: {
                cityViewModel.currentIndex = 0
                cityViewModel.isBack = false
            }) {
                CityView(weatherDetialModel: cityViewModel.weatherDetialModels.models[0], flag: false)
            }
            .listRowSeparator(.hidden)
            ForEach(cityViewModel.weatherDetialModels.models.indices,id: \.self) { i in
                if i != 0 {
                    Button(action: {
                        cityViewModel.currentIndex = i
                        cityViewModel.isBack = false
                    }) {
                        CityView(weatherDetialModel: cityViewModel.weatherDetialModels.models[i], flag: true)
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .onDelete(perform: onDelete)
            .onMove(perform: onMove)
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle("城市管理", displayMode: .large)
        .navigationBarItems(leading: backButton, trailing: editButton)
        .navigationBarBackButtonHidden(true)
        .searchable(text: $queryString, placement: .navigationBarDrawer(displayMode: .always), prompt: "搜索全国城市")
        .environment(\.editMode, $isEditMode)
    }
    
    private var editButton: some View {
        Button(action: {
            switch isEditMode {
                case .active:
                    self.isEditMode = .inactive
                case .inactive:
                    self.isEditMode = .active
                default:
                    break
            }
        }, label: {
            isEditMode.isEditing ? Image(systemName: "xmark").foregroundColor(.black) : Image(systemName: "slider.horizontal.3").foregroundColor(.black)
        })
    }
    
    private var backButton: some View {
        Button(action: {
            cityViewModel.isBack = false
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
        }
    }
    
    private func onDelete(at offsets: IndexSet) {
        cityViewModel.weatherDetialModels.models.remove(atOffsets: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        cityViewModel.weatherDetialModels.models.move(fromOffsets: source, toOffset: destination)
    }
}

struct CityManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CityManagerView(cityViewModel: WeatherDetialViewModel())
.previewInterfaceOrientation(.portrait)
    }
}
