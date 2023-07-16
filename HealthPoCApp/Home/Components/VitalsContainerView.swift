//
//  VitalsContainerView.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import SwiftUI

struct VitalsContainerView: View {
    var viewModel: VitalsContainerViewModel
    
    init(viewModel: VitalsContainerViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: 16) {
            // Top section info bar
            HStack {
                Image(systemName: "heart.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(viewModel.iconColors.main, viewModel.iconColors.lighter)
                
                Text(viewModel.title)
                    .font(.caption)
                    .bold()
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
                    .bold()
            }
            
            // last result info bar
            if !viewModel.infoData.latest.isEmpty {
                Divider()

                HStack {
                    VStack(alignment: .leading) {
                        Text(viewModel.localization.infoTextLatest)
                            .font(.caption2)
                            .foregroundColor(viewModel.latestResultValues.textColor)
                        HStack(alignment: .bottom) {
                            Text(viewModel.infoData.latest)
                                .font(.body)
                                .bold()
                                .foregroundColor(viewModel.latestResultValues.textColor)
                            Text(viewModel.unitText)
                                .font(.caption2)
                                .foregroundColor(viewModel.latestResultValues.textColor)
                        }
                        
                    }
                    Spacer()
                    if !viewModel.infoData.min.isEmpty {
                        VStack(alignment: .leading) {
                            Text(viewModel.localization.infoTextMin)
                                .font(.body)
                                .foregroundColor(.gray)
                            Text(viewModel.infoData.min)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text(viewModel.localization.infoTextMax)
                                .font(.body)
                                .foregroundColor(.gray)
                            Text(viewModel.infoData.max)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            
            // Graph Content
            if !viewModel.dataPoints.isEmpty {
                HStack(alignment: .bottom) {
                    VStack(alignment: .trailing, spacing: 0) {
                        Group {
                            Text("180")
                            Text("150")
                            Text("120")
                            Text("90")
                            Text("60")
                            Text("30")
                        }
                        .frame(height: 30, alignment: .top)
                        .font(.caption2)
                    }
                    .frame(height: 180)
                    .padding(.bottom, 30)
                    
                    HStack(alignment: .bottom) {
                        ForEach(viewModel.dataPoints, id: \.day) { dataPoint in
                            Spacer()
                            VStack(alignment: .center) {
                                Capsule()
                                    .fill(dataPoint.color)
                                    .frame(width: 4, height: dataPoint.systolic - dataPoint.diastolic)
                                    .padding(.top, 180 - dataPoint.systolic)
                                Spacer()
                                    .frame(minHeight: 0)
                                Text(dataPoint.day)
                                    .frame(height: 30, alignment: .bottom)
                                    .font(.caption2)
                            }
                        }
                    }
                    .frame(height: 210)
                    
                }
                .padding(.vertical, 0)
            }
            
            // Warning if neccessery
            if viewModel.latestResultThreshold != .normal {
                HStack {
                    Image(systemName: "exclamationmark.octagon.fill")
                        .resizable()
                        .frame(width: 12, height: 12)
                        .foregroundColor(viewModel.latestResultValues.textColor)
                    Text(viewModel.latestResultValues.text)
                        .font(.caption2)
                        .foregroundColor(viewModel.latestResultValues.textColor)
                    Spacer()
                    Image(systemName: "chevron.right")
                        .resizable()
                        .frame(width: 4, height: 8)
                        .bold()
                        .foregroundColor(viewModel.latestResultValues.textColor)
                }
                .padding(16)
                .background(viewModel.latestResultValues.backgroundColor)
                .cornerRadius(12)
            }
        }
        .padding(16)
        .background(.white)
        .cornerRadius(12)
    }
}

struct VitalsContainerView_Previews: PreviewProvider {
    @ObservedObject static var dataStore = HealthDataStore()
    
    static var previews: some View {
        VitalsContainerView(viewModel: VitalsContainerViewModel(type: .bloodPressure, data: dataStore.currentUser?.bloodPressureRecords))
    }
}
