//
//  VitalsContainerLocalizable.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation

protocol VitalsContainerLocalizableType {
    // Temperature
    var temperatureTitle: String { get }
    
    // Blood Pressure
    var bloodPressureTitle: String { get }

    // Blood Sugar
    var bloodSugarTitle: String { get }

    // Common
    var infoTextLatest: String { get }
    var infoTextMin: String { get }
    var infoTextMax: String { get }
    var infoTextCritical: String { get }
    var infoTextWarning: String { get }
}

struct VitalsContainerLocalization: VitalsContainerLocalizableType {
    var temperatureTitle: String { NSLocalizedString("Temperature", bundle: .main, comment: "") }
    var bloodPressureTitle: String { NSLocalizedString("Blood Pressure", bundle: .main, comment: "") }
    var bloodSugarTitle: String { NSLocalizedString("Blood Sugar", bundle: .main, comment: "") }
    
    var infoTextLatest: String { NSLocalizedString("Latest", bundle: .main, comment: "") }
    var infoTextMin: String { NSLocalizedString("Min", bundle: .main, comment: "") }
    var infoTextMax: String { NSLocalizedString("Max", bundle: .main, comment: "") }
    var infoTextCritical: String { NSLocalizedString("Your latest result reading has been critical. ", bundle: .main, comment: "") }
    var infoTextWarning: String { NSLocalizedString("Your latest result reading has been elavated. ", bundle: .main, comment: "") }
}
