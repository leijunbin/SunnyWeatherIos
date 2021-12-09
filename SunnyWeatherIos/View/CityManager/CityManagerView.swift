//
//  CityManagerView.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/3.
//

import SwiftUI
import Alamofire

struct CityManagerView: View {
    @ObservedObject var cityViewModel: WeatherDetialViewModel
    @State private var queryString = ""
    @State var isEditMode: EditMode = .inactive
    
    var body: some View {
        List{
            Button(action: {
                cityViewModel.currentIndex = 0
                cityViewModel.isCityManager = false
            }) {
                CityView(weatherDetialModel: cityViewModel.weatherDetialModels.models[0], flag: false, temperatureUnitOn: getTempuratureUnit(index: cityViewModel.temperatureUnit))
            }
            .listRowSeparator(.hidden)
            ForEach(cityViewModel.weatherDetialModels.models.indices,id: \.self) { i in
                if i != 0 {
                    Button(action: {
                        cityViewModel.currentIndex = i
                        cityViewModel.isCityManager = false
                    }) {
                        CityView(weatherDetialModel: cityViewModel.weatherDetialModels.models[i], flag: true, temperatureUnitOn: getTempuratureUnit(index: cityViewModel.temperatureUnit))
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
        .searchable(text: $queryString.onChange{ qString in
            cityViewModel.getSearchResult(queryString: qString)
        }, placement: .navigationBarDrawer(displayMode: .always), prompt: "搜索全国城市", suggestions: {
            if !queryString.isEmpty {
                ForEach(cityViewModel.searchResultModel.result.indices, id: \.self) { i in
                    Text(cityViewModel.searchResultModel.result[i].formatted_address)
                        .searchCompletion(String(i))
                }
            }
        })
        .onSubmit (of: .search){
            let pos = Int(queryString) ?? 0
            cityViewModel.addModels(lat: cityViewModel.searchResultModel.result[pos].lat, lon: cityViewModel.searchResultModel.result[pos].lng)
        }
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
            isEditMode.isEditing ? Image(systemName: "xmark").foregroundColor(.black).frame(width: 20, height: 20) : Image(systemName: "slider.horizontal.3").foregroundColor(.black).frame(width: 20, height: 20)
        })
    }
    
    private var backButton: some View {
        Button(action: {
            cityViewModel.isCityManager = false
        }) {
            Image(systemName: "arrow.backward")
                .foregroundColor(.black)
                .frame(width: 20, height: 20)
        }
    }
    
    private func onDelete(at offsets: IndexSet) {
        cityViewModel.deleteModels(at: offsets)
    }
    
    private func onMove(source: IndexSet, destination: Int) {
        cityViewModel.moveModels(source: source, destination: destination)
    }
}

struct CityManagerView_Previews: PreviewProvider {
    static var previews: some View {
        CityManagerView(cityViewModel: WeatherDetialViewModel())
.previewInterfaceOrientation(.portrait)
    }
}

extension Binding {
    func onChange(_ handler: @escaping (Value) -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler(newValue)
            }
        )
    }
}
