//
//  HomeViewViewModel.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

class HomeViewViewModel: ObservableObject {
    
    var localization: HomeViewLocalizableType = HomeViewLocalization()
    @Published var currentUser: User?
    
}
