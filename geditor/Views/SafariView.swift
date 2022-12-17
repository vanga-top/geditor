//
//  SafariView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/17.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<SafariView>)
        ->SFSafariViewController {
        let controller = SFSafariViewController(url: url)
            controller.dismissButtonStyle = .close
            return controller
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }

}

struct SafariView_Previews: PreviewProvider {
    static var previews: some View {
        SafariView(url: URL(string: "https://www.baidu.com")!)
    }
}
