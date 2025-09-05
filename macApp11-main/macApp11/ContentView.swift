//
//  ContentView.swift
//  macApp11
//
//  Created by VOLKAN EFE on 24.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSettings = false
    
    
    var body: some View {
        
        
        TabView{
            HomeView()
                .tabItem {
                    Label("Ana Sayfa", systemImage: "house.fill")
                }
            InfoView()
                .tabItem {
                    Label("Hakkında", systemImage: "info.circle")
                }
            DataView()
                .tabItem {
                    Label("Veriler", systemImage: "square.and.arrow.up")
                }
        }
        .frame(minWidth: 500, minHeight: 300)
        .tabViewStyle(.sidebarAdaptable)
        .tabViewSidebarBottomBar{
            Button {
                showingSettings = true
            } label : {
                Label("Ayarlar", systemImage: "gearshape")
            }
            .labelStyle(.titleAndIcon)
            .buttonStyle(PlainButtonStyle())
            .sheet(isPresented: $showingSettings){
                SettingsView()
                
            }
            
            
        }
        
    }
}

#Preview {
    ContentView()
}
