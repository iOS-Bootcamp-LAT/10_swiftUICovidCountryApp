//
//  CountryViewModel.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import Foundation

struct CountryViewModel {
    
    let model: Country
    
    var name: String {
        model.country
    }
    
    var deaths: String {
        "\(model.deaths)"
    }
    
    var imgUrl: URL? {
        URL(string: "https://countryflagsapi.com/png/\(model.country)" )
    }
}
