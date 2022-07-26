//
//  CountryCell.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import SwiftUI

struct CountryCell: View {
    let countryViewModel: CountryViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: countryViewModel.imgUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "flag.fill")
            }
            .frame(width: 50, height: 50)
            .cornerRadius(10)
            
            Text(countryViewModel.name)
                .font(.title3)
                .lineLimit(2)
            
            Spacer()
            
            
            VStack {
                
                Text("Deaths").font(.caption2)
                
                Text(countryViewModel.deaths)
                    .font(.caption2.weight(.heavy))
                
            }
            
        }.padding()
    }
}

struct CountryCell_Previews: PreviewProvider {
    static var previews: some View {
        CountryCell(countryViewModel: CountryViewModel(model: Country.example))
            .previewLayout(.fixed(width: 360, height: 80))
    }
}
