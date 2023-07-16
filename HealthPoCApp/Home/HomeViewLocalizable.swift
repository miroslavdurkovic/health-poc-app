//
//  HomeViewLocalizable.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

protocol HomeViewLocalizableType {
    var title: String { get }
}

struct HomeViewLocalization: HomeViewLocalizableType {
    var title: String { NSLocalizedString("Home", bundle: .main, comment: "") }
}
