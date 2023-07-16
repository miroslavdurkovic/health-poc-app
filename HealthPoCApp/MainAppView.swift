//
//  ContentView.swift
//  HealthPoCApp
//
//  Created by Miroslav Durkovic on 16/07/2023.
//

import SwiftUI

struct MainAppView: View {
    @ObservedObject var dataStore = HealthDataStore()
    
    init() {
        configureNavigationBar()
    }
    
    func configureNavigationBar() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithOpaqueBackground()
        navigationAppearance.backgroundColor = UIColor(.white)
        navigationAppearance.titleTextAttributes = [.foregroundColor: UIColor(.black)]
        navigationAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(.black), .font: UIFont.systemFont(ofSize: 32, weight: .bold)]
        
        navigationAppearance.shadowImage = nil
        navigationAppearance.shadowColor = .clear
        
        UINavigationBar.appearance().standardAppearance = navigationAppearance
        UINavigationBar.appearance().compactAppearance = navigationAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationAppearance
        
        UINavigationBar.appearance().tintColor = UIColor(.black)
    }
    
    var body: some View {
        TabView {
            Group {
                HomeView()
                    .tabItem {Label(NSLocalizedString("Home", comment: ""), systemImage: "house.fill")}
                MeasurementsView()
                    .tabItem {Label(NSLocalizedString("Measurements", comment: ""), systemImage: "doc.text")}
                PlanView()
                    .tabItem {Label(NSLocalizedString("Plan", comment: ""), systemImage: "doc.plaintext")}
                MoreView()
                    .tabItem {Label(NSLocalizedString("More", comment: ""), systemImage: "ellipsis.circle")}
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Color.white, for: .tabBar)
            .environmentObject(dataStore)
        }
        .onAppear() {
            UITabBar.appearance().backgroundColor = .white
        }
    }
}

struct MainAppView_Previews: PreviewProvider {
    static var previews: some View {
        MainAppView()
    }
}
