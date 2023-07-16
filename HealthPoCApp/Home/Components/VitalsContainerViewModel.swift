//
//  VitalsContainerViewModel.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import Foundation
import SwiftUI

enum VitalsType {
    case temperature
    case bloodPressure
    case bloodSugar
}

enum VitalsThresholdType {
    case critical
    case warning
    case normal
}

class VitalsContainerViewModel: ObservableObject {
    
    var localization: VitalsContainerLocalizableType = VitalsContainerLocalization()
    var type: VitalsType
    var data: [Any]?
    var latestResultThreshold: VitalsThresholdType = .normal
    var dataPoints: [(day: String, systolic: CGFloat, diastolic: CGFloat, color: Color)] = []
    
    private var lastResult: Any?
    
    init(type: VitalsType, data: [Any]?) {
        self.type = type
        self.data = data
        if let lastResult = data?.last {
            self.lastResult = lastResult
            self.checkLastResultThreshold()
            self.prepareLast7Results()
        }
    }
    
    // MARK: - Functions
    func checkLastResultThreshold() {
        switch type {
        case .temperature:
            // TODO: Add temperature threshold logic
            return
        case .bloodPressure:
            // Check if blood pressure is in risk or not, based on https://medlineplus.gov/lab-tests/measuring-blood-pressure/
            guard let lastResult = self.lastResult as? BloodPressureModel else { return }
            latestResultThreshold = checkThresholdForItem(lastResult)
            return
        case .bloodSugar:
            // TODO: Add blood sugar threshold logic
            return
        }
    }
    
    func checkThresholdForItem(_ item: Any) -> VitalsThresholdType {
        switch type {
        case .temperature:
            
            return .normal
        case .bloodPressure:
            // Check if blood pressure is in risk or not, based on https://medlineplus.gov/lab-tests/measuring-blood-pressure/
            guard let item = item as? BloodPressureModel else { return .normal }
            if item.systolic > 180 && item.diastolic > 120 {
                return .critical
            } else if item.systolic > 140 || item.diastolic > 90 {
                return .warning
            }
            return .normal
        case .bloodSugar:
            return .normal
        }
    }
    
    func prepareLast7Results() {
        switch type {
        case .temperature:
            return
        case .bloodPressure:
            guard let data = self.data as? [BloodPressureModel] else { return }
            let last7Entries = Array(data.suffix(7))
            let dataPoints = last7Entries.enumerated().map { (index, element) in
                let result = checkThresholdForItem(element)
                var color: Color
                switch result {
                case .critical:
                    color = Color.errorColor
                case .warning:
                    color = Color.warningColor
                default:
                    color = .green
                }
                return ("\(index + 1)", CGFloat(element.systolic) , CGFloat(element.diastolic), color)
            }
            self.dataPoints = dataPoints
            return
        case .bloodSugar:
            return
        }
    }
    
    // MARK: - Computed Properties
    var title: String {
        switch type {
        case .temperature:
            return localization.temperatureTitle
        case .bloodPressure:
            return localization.bloodPressureTitle
        case .bloodSugar:
            return localization.bloodSugarTitle
        }
    }
    
    var iconColors: (main: Color, lighter: Color) {
        switch type {
        case .temperature:
            return (Color.purpleColor, Color.lightPurpleColor)
        case .bloodPressure:
            return (Color.errorColor, Color.lightErrorColor)
        case .bloodSugar:
            return (Color.warningColor, Color.lightWarningColor)
        }
    }
    
    var infoData: (latest: String, min: String, max: String) {
        switch type {
        case .temperature:
            return ("", "", "")
        case .bloodPressure:
            guard let lastResult = self.lastResult as? BloodPressureModel else { return ("", "", "") }
            return ("\(lastResult.systolic)/\(lastResult.diastolic)", "", "")
        case .bloodSugar:
            return ("", "", "")
        }
    }
    
    var unitText: String {
        switch type {
        case .temperature:
            return "°C"
        case .bloodPressure:
            return "mmHg"
        case .bloodSugar:
            return "mmol/L"
        }
    }
    
    var latestResultValues: (textColor: Color, backgroundColor: Color, text: String) {
        switch latestResultThreshold {
        case .critical:
            return (Color.errorColor, Color.lightErrorColor, localization.infoTextCritical)
        case .warning:
            return (Color.darkWarningColor, Color.lightWarningColor, localization.infoTextWarning)
        case .normal:
            return (Color.gray, Color.white, "")
        }
    }
}

