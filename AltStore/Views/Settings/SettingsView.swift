//
//  SettingsView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AltStoreCore
import Intents

struct SettingsView: View {
    
    @AppStorage("isBackgroundRefreshEnabled")
    var isBackgroundRefreshEnabled: Bool = true
    
    @State var isShowingAddShortcutView = false
    
    var body: some View {
        List {
            Section {
                
                if let team = DatabaseManager.shared.activeTeam() {
                    HStack {
                        Text("Name")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(team.name)
                    }
                    
                    HStack {
                        Text("E-Mail")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(team.account.appleID)
                    }
                    
                    HStack {
                        Text("Type")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(team.type.localizedDescription)
                    }
                }
            } header: {
                HStack {
                    Text("Connected Apple ID")
                    Spacer()
                    SwiftUI.Button {
                        
                    } label: {
                        Text("Sign Out")
                            .font(.callout)
                            .bold()
                    }
                }
            }
            
            Section {
                Toggle(isOn: self.$isBackgroundRefreshEnabled, label: {
                    Text("Background Refresh")
                })
                
                if #available(iOS 14.0, *) {
                    SwiftUI.Button {
                        self.isShowingAddShortcutView = true
                    } label: {
                        Text("Add to Siri...")
                    }
                    .sheet(isPresented: self.$isShowingAddShortcutView) {
                        if let shortcut = INShortcut(intent: INInteraction.refreshAllApps().intent) {
                            SiriShortcutSetupView(shortcut: shortcut)
                        }
                    }
                }
            } header: {
                Text("Refreshing Apps")
            } footer: {
                Text("Enable Background Refresh to automatically refresh apps in the background when connected to WiFi and with Wireguard active.")
            }
            
            
            Section {
                SwiftUI.Button(action: switchToUIKit) {
                    Text("Switch to UIKit")
                }

            } header: {
                Text("Debug")
            }
            
            
            Section {
                NavigationLink {
                    SafariView(url: URL(string: "https://fabian-thies.de")!)
                } label: {
                    HStack {
                        Text("SwiftUI Redesign")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text("fabianthdev")
                    }
                }

            } header: {
                Text("Credits")
            }
            
            Section {
                
            } footer: {
                Text("SideStore 1.0.0")
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity)
            }
        }
        .listStyle(InsetGroupedListStyle())
        .navigationTitle("Settings")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                SwiftUI.Button {
                    
                } label: {
                    Image(systemName: "person.crop.circle")
                        .imageScale(.large)
                }

            }
        }
    }
    
    
    func switchToUIKit() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! TabBarController
        
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
