//
//  EditView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/11.
//
import Introspect
import SwiftUI

struct EditView: View {
    enum Mode:String,CaseIterable,Identifiable {
        case edit = "Edit"
        case preview = "Preview"
        case split = "Split"
        
        var id:String {rawValue}
    }
    
    let item:FinderItem
    @State private var content = ""
    @State private var mode = Mode.edit
    @State private var reloader = false
    @State private var isPresentedActivity = false
    @State private var textView: UITextView?
    
    var webView : PreviewWebView {
        PreviewWebView(url: item.url, reloader: reloader)
    }
    
    var body: some View {
        HStack(spacing: 0.0) {
            if mode == .edit || mode == .split {
                TextEditor(text: $content)
                    .padding(.all, 8.0)
                    .onChange(of: content) { content in
                        item.update(content: content)
                        reloader.toggle()
                    }
                    .background(Settings.shared.backgroundColor)
                    .foregroundColor(Settings.shared.textColor)
                    .font(.custom(Settings.shared.fontName, size: Settings.shared.fontSize))
                    .disabled(!item.isEditable)
                    .introspectTextView(customize: {textView in
                        self.textView = textView
                    })
            }
            if mode == .split {
                Color
                    .black
                    .opacity(0.12)
                    .frame(width: 1.0)
            }
            if mode == .preview || mode == .split {
                webView
            }
        }
        .navigationTitle(item.url.lastPathComponent)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear{
            self.content =
            item.isEditable
            ? item.content : NSLocalizedString("The item cannot be edited", comment: "aaa")
        }
        .onAppear{
            UITextView.appearance().backgroundColor = .clear
        }.onDisappear {
            UITextView.appearance().backgroundColor = nil
        }
        .toolbar {
            
        }
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(forResource: "root_file", withExtension: "txt",subdirectory: "root")!
        let item = FinderItem(url: url)
        NavigationView {
            EditView(item: item)
        }
    }
}
