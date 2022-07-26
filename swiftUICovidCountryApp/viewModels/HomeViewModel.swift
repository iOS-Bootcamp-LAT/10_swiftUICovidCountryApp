//
//  HomeViewModel.swift
//  swiftUICovidCountryApp
//
//  Created by David Granado Jordan on 7/25/22.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var results = [Country]()
    @Published var searchText = "" {
        didSet {
            isSearchEnable = searchText.count > 2
        }
    }
    @Published var isSearchEnable = false
    @Published var resultsAreEmpty = false
    
    
    func performSearch() {
        
        let search = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? ""
        
        guard let url = URL(string: "https://api.covid19api.com/live/country/\(search)/status/confirmed?from=2022-04-01T00:00:00Z&to=2022-04-18T00:00:00Z") else { return }
        
        
        Task {
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode([Country].self, from: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.results = response
                    self?.resultsAreEmpty = response.isEmpty
                }
                
                
            } catch {
                self.resultsAreEmpty = true
            }
            
        }
        
    }
    
    
    
}
