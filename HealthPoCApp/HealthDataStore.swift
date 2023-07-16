//
//  HealthDataStore.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

public class HealthDataStore: ObservableObject {
    
    @Published var currentUser: User?
    
    init(currentUser: User? = StefanUser) { // TEMPL only for PoC demo purposes
        self.currentUser = currentUser
    }
}

// PoC Demo data
let StefanUser: User = User(name: "Stefan", bloodPressureRecords: [
    BloodPressure(dateTime: "18.4.2022 7:45".toDate(),  systolic: 134, diastolic: 88,   pulse: 87),
    BloodPressure(dateTime: "18.4.2022 18:22".toDate(), systolic: 144, diastolic: 89,   pulse: 88),
    BloodPressure(dateTime: "19.4.2022 8:01".toDate(),  systolic: 138, diastolic: 87,   pulse: 92),
    BloodPressure(dateTime: "19.4.2022 16:40".toDate(), systolic: 149, diastolic: 95,   pulse: 89),
    BloodPressure(dateTime: "20.4.2022 8:24".toDate(),  systolic: 132, diastolic: 92,   pulse: 91),
    BloodPressure(dateTime: "20.4.2022 17:15".toDate(), systolic: 151, diastolic: 96,   pulse: 93),
    BloodPressure(dateTime: "21.4.2022 7:55".toDate(),  systolic: 142, diastolic: 94,   pulse: 88),
    BloodPressure(dateTime: "21.4.2022 18:16".toDate(), systolic: 168, diastolic: 97,   pulse: 87),
    BloodPressure(dateTime: "22.4.2022 7:48".toDate(),  systolic: 154, diastolic: 102,  pulse: 92)
])

let ElenaUser: User = User(name: "Elena", bloodPressureRecords: [
    BloodPressure(dateTime: "18.4.2022 7:25".toDate(),  systolic: 112,  diastolic: 80,   pulse: 67),
    BloodPressure(dateTime: "18.4.2022 19:44".toDate(), systolic: 110,  diastolic: 79,   pulse: 68),
    BloodPressure(dateTime: "19.4.2022 8:28".toDate(),  systolic: 98,   diastolic: 78,   pulse: 64),
    BloodPressure(dateTime: "19.4.2022 17:14".toDate(), systolic: 110,  diastolic: 82,   pulse: 63),
    BloodPressure(dateTime: "20.4.2022 8:11".toDate(),  systolic: 112,  diastolic: 83,   pulse: 64),
    BloodPressure(dateTime: "20.4.2022 17:35".toDate(), systolic: 160,  diastolic: 95,   pulse: 85),
    BloodPressure(dateTime: "21.4.2022 7:49".toDate(),  systolic: 113,  diastolic: 82,   pulse: 62),
    BloodPressure(dateTime: "21.4.2022 17:47".toDate(), systolic: 122,  diastolic: 81,   pulse: 64),
    BloodPressure(dateTime: "22.4.2022 8:38".toDate(),  systolic: 121,  diastolic: 84,   pulse: 71)
])
