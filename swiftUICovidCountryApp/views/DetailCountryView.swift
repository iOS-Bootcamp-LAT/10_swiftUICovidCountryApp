//
//  DetailCountryView.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import SwiftUI

struct DetailCountryView: View {
    let countryViewModel: CountryViewModel
    
    var body: some View {
        VStack(alignment: .center) {
            Text(countryViewModel.name)
            
            AsyncImage(url: countryViewModel.imgUrl) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "flag.fill")
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .cornerRadius(10)
            
            Text("Country: \(countryViewModel.name)")
            Text("Deaths: \(countryViewModel.deaths)")
            
            Spacer()
        }
        .navigationBarTitle(countryViewModel.name)
        
    }
}

struct DetailCountryView_Previews: PreviewProvider {
    static var previews: some View {
        DetailCountryView(countryViewModel: CountryViewModel(model: Country.example))
    }
}
