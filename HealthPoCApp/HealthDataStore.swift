//
//  HealthDataStore.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

public class HealthDataStore: ObservableObject {
    
    @Published var currentUser: UserModel?
    
    init(currentUser: UserModel? = StefanUser) { // TEMPL only for PoC demo purposes
        self.currentUser = currentUser
    }
}

// PoC Demo data
let StefanUser: UserModel = UserModel(name: "Stefan", bloodPressureRecords: [
    BloodPressureModel(dateTime: "18.4.2022 7:45".toDate(),  systolic: 134, diastolic: 88,   pulse: 87),
    BloodPressureModel(dateTime: "18.4.2022 18:22".toDate(), systolic: 144, diastolic: 89,   pulse: 88),
    BloodPressureModel(dateTime: "19.4.2022 8:01".toDate(),  systolic: 138, diastolic: 87,   pulse: 92),
    BloodPressureModel(dateTime: "19.4.2022 16:40".toDate(), systolic: 149, diastolic: 95,   pulse: 89),
    BloodPressureModel(dateTime: "20.4.2022 8:24".toDate(),  systolic: 132, diastolic: 92,   pulse: 91),
    BloodPressureModel(dateTime: "20.4.2022 17:15".toDate(), systolic: 151, diastolic: 96,   pulse: 93),
    BloodPressureModel(dateTime: "21.4.2022 7:55".toDate(),  systolic: 142, diastolic: 94,   pulse: 88),
    BloodPressureModel(dateTime: "21.4.2022 18:16".toDate(), systolic: 168, diastolic: 97,   pulse: 87),
    BloodPressureModel(dateTime: "22.4.2022 7:48".toDate(),  systolic: 154, diastolic: 102,  pulse: 92)
])

let ElenaUser: UserModel = UserModel(name: "Elena", bloodPressureRecords: [
    BloodPressureModel(dateTime: "18.4.2022 7:25".toDate(),  systolic: 112,  diastolic: 80,   pulse: 67),
    BloodPressureModel(dateTime: "18.4.2022 19:44".toDate(), systolic: 110,  diastolic: 79,   pulse: 68),
    BloodPressureModel(dateTime: "19.4.2022 8:28".toDate(),  systolic: 98,   diastolic: 78,   pulse: 64),
    BloodPressureModel(dateTime: "19.4.2022 17:14".toDate(), systolic: 110,  diastolic: 82,   pulse: 63),
    BloodPressureModel(dateTime: "20.4.2022 8:11".toDate(),  systolic: 112,  diastolic: 83,   pulse: 64),
    BloodPressureModel(dateTime: "20.4.2022 17:35".toDate(), systolic: 160,  diastolic: 95,   pulse: 85),
    BloodPressureModel(dateTime: "21.4.2022 7:49".toDate(),  systolic: 113,  diastolic: 82,   pulse: 62),
    BloodPressureModel(dateTime: "21.4.2022 17:47".toDate(), systolic: 122,  diastolic: 81,   pulse: 64),
    BloodPressureModel(dateTime: "22.4.2022 8:38".toDate(),  systolic: 121,  diastolic: 84,   pulse: 71)
])
