//
//  User.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

struct User: Identifiable {
    var id = UUID().uuidString
    var name: String
    
    var bloodPressureRecords: [BloodPressure]
}
