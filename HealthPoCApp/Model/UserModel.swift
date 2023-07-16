//
//  User.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

struct UserModel: Identifiable {
    var id = UUID().uuidString
    var name: String
    
    var temperatureRecords: [TemperatureModel]?
    var bloodPressureRecords: [BloodPressureModel]?
    var bloodSuggarRecords: [BloodSugarModel]?
}
