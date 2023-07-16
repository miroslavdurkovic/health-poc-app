//
//  HomeView.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var dataStore: HealthDataStore
    @ObservedObject private var viewModel: HomeViewViewModel = HomeViewViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.backgroundColor
                    .ignoresSafeArea()
                ScrollView {
                    Text(viewModel.currentUser?.name ?? "nothing there")

                    VStack(spacing: 16) {
                        VitalsContainerView(viewModel: VitalsContainerViewModel(type: .temperature, data: viewModel.currentUser?.temperatureRecords))
                        VitalsContainerView(viewModel: VitalsContainerViewModel(type: .bloodPressure, data: viewModel.currentUser?.bloodPressureRecords))
                        VitalsContainerView(viewModel: VitalsContainerViewModel(type: .bloodSugar, data: viewModel.currentUser?.bloodSuggarRecords))
                    }
                    .padding(16)
                }
            }
            .navigationTitle(viewModel.localization.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Text(viewModel.localization.title).font(.title).bold()
                        
                        Spacer()
                        
                        Button {
                            print("Add tapped!")
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(.black, .primary)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.viewModel.currentUser = dataStore.currentUser
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    @ObservedObject static var dataStore = HealthDataStore()
    
    static var previews: some View {
        HomeView()
            .environmentObject(dataStore)
    }
}
