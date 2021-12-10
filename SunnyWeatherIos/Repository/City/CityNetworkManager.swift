//
//  CityNetworkManager.swift
//  SunnyWeatherIos
//
//  Created by wanghaochen04 on 2021/12/2.
//

import Foundation
import Moya
import RxSwift
import CleanJSON

class CityNetworkManager {
    private let provider = MoyaProvider<CityService>()
    
    init() {}
    
    func getCityName(lat: Double, lon: Double) -> Observable<CityModel> {
        let decoder = CleanJSONDecoder()
        return provider.rx
            .request(.getCityName(lat: lat, lon: lon))
            .filterSuccessfulStatusCodes()
            .map(CityModel.self, using: decoder)
            .asObservable()
    }
    
    func searchCity(queryString: String) -> Observable<SearchModel> {
        let decoder = CleanJSONDecoder()
        return provider.rx
            .request(.searchPlace(queryString: queryString))
            .filterSuccessfulStatusCodes()
            .map(SearchModel.self, using: decoder)
            .asObservable()
    }
}
