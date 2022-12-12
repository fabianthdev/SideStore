//
//  SettingsView.swift
//  SideStoreUI
//
//  Created by Fabian Thies on 18.11.22.
//  Copyright © 2022 Fabian Thies. All rights reserved.
//

import SwiftUI
import AsyncImage
import AltStoreCore
import Intents

struct SettingsView: View {
    
    var connectedAppleID: Team? {
        DatabaseManager.shared.activeTeam()
    }
    
    @SwiftUI.FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "%K == YES", #keyPath(Team.isActiveTeam)))
    var connectedTeams: FetchedResults<Team>
    
    
    @AppStorage("isBackgroundRefreshEnabled")
    var isBackgroundRefreshEnabled: Bool = true
    
    @State var isShowingConnectAppleIDView = false
    @State var isShowingAddShortcutView = false
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? ""
    
    var body: some View {
        List {
            Section {
                
                if let connectedAppleID = connectedTeams.first {
                    HStack {
                        Text("Name")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(connectedAppleID.name)
                    }
                    
                    HStack {
                        Text("E-Mail")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(connectedAppleID.account.appleID)
                    }
                    
                    HStack {
                        Text("Type")
                            .foregroundColor(.secondary)
                        Spacer()
                        Text(connectedAppleID.type.localizedDescription)
                    }
                } else {
                    SwiftUI.Button {
                        self.connectAppleID()
                    } label: {
                        Text("Connect your Apple ID")
                    }
                }
            } header: {
                if !connectedTeams.isEmpty {
                    HStack {
                        Text("Connected Apple ID")
                        Spacer()
                        SwiftUI.Button {
                            self.disconnectAppleID()
                        } label: {
                            Text("Sign Out")
                                .font(.callout)
                                .bold()
                        }
                    }
                }
            } footer: {
                VStack(spacing: 4) {
                    Text("Your Apple ID is required to sign the apps you install with SideStore.")
                    
                    Text("Your credentials are only sent to Apple's servers and are not accessible by the SideStore Team. Once successfully logged in, the login details are stored securely on your device.")
                }
            }
            
            Section {
                Toggle(isOn: self.$isBackgroundRefreshEnabled, label: {
                    Text("Background Refresh")
                })
                
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
            } header: {
                Text("Refreshing Apps")
            } footer: {
                Text("Enable Background Refresh to automatically refresh apps in the background when connected to WiFi and with Wireguard active.")
            }
            
            
            Section {
                SwiftUI.Button(action: switchToUIKit) {
                    Text("Switch to UIKit")
                }

                SwiftUI.Button(action: resetImageCache) {
                    Text("Reset Image Cache")
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
                Text("SideStore \(appVersion)")
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
    
    
//    var appleIDSection: some View {
//
//    }
    
    
    
    func connectAppleID() {
        AppManager.shared.authenticate(presentingViewController: nil) { (result) in
            DispatchQueue.main.async {
                switch result
                {
                case .failure(OperationError.cancelled):
                    // Ignore
                    break
                    
                case .failure(let error):
                    NotificationManager.shared.reportError(error: error)
                    
                case .success: break
                }
            }
        }
    }
    
    func disconnectAppleID() {
        DatabaseManager.shared.signOut { (error) in
            DispatchQueue.main.async {
                if let error = error
                {
                    NotificationManager.shared.reportError(error: error)
                }
            }
        }
    }
    
    
    func switchToUIKit() {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let rootVC = storyboard.instantiateViewController(withIdentifier: "tabBarController") as! TabBarController
        
        UIApplication.shared.keyWindow?.rootViewController = rootVC
    }
    
    func resetImageCache() {
        do {
            let url = try FileManager.default.url(
                for: .cachesDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: true)
            try FileManager.default.removeItem(at: url.appendingPathComponent("com.zeu.cache", isDirectory: true))
        } catch let error {
            fatalError("\(error)")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}


