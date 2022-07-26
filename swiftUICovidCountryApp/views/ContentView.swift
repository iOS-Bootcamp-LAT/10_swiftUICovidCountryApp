//
//  ContentView.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                HStack {
                    TextField("Search Country", text: $viewModel.searchText)
                    
                    if viewModel.isSearchEnable {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                }.padding()
                
                if viewModel.resultsAreEmpty {
                    Text("No results")
                }
                
                List(viewModel.results) { country in
                    let countryViewModel = CountryViewModel(model: country)
                    
                    
                    NavigationLink(destination: DetailCountryView(countryViewModel: countryViewModel)) {
                            
                        
                        CountryCell(countryViewModel: countryViewModel)
                        
                    }
                    
                    
                }
                .listStyle(.inset)
             
                
                Button {
                    viewModel.performSearch()
                    
                } label: {
                    Text("Search Country")
                        .frame(width: 250, height: 40)
                }
                .buttonStyle(.bordered)
                .disabled(!viewModel.isSearchEnable)
                .padding(.bottom, 10)
                
                

            }
            .navigationTitle("MVVM Covid Country")
        }

    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
