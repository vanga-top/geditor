//
//  InfoView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/17.
//

import SwiftUI

struct InfoView: View {
    
    @State var keyboardAccessory = Settings.shared.keyboardAccessory
    @State var isPresentedAcknowledgment = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section(header:Text("Setting")) {
                Toggle("Keyboard Accessory", isOn: $keyboardAccessory)
                NavigationLink("Font") {
                    FontSettingsView()
                }
            }
            Section{
                Button("Acknowledgments") {
                    isPresentedAcknowledgment.toggle()
                }
            }
        }
        .navigationTitle("Info")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Close") {
                    dismiss()
                }
            }
        }
        .sheet(isPresented: $isPresentedAcknowledgment){
            SafariView(url: URL(string: "https://github.com/vanga-top")!)
        }
        .onChange(of: keyboardAccessory) {
            Settings.shared.keyboardAccessory = $0
        }
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
