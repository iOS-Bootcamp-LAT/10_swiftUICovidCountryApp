//
//  Country.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import Foundation

struct Country: Decodable, Identifiable {
    let id: String
    let country: String
    let countryCode: String
    let date: String
    let deaths: Int
    
    enum CodingKeys: String, CodingKey {
        case id =  "ID"
        case country = "Country"
        case countryCode =  "CountryCode"
        case date = "Date"
        case deaths = "Deaths"
        
    }
}

#if  DEBUG
extension Country {
    
    static var example: Country {
        Country(id: "1234", country: "Bolivia", countryCode: "1234", date: "2022-04-01T00:00:00Z", deaths: 0)
    }
    
}
#endif
