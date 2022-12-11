//
//  PreviewWebView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/11.
//
import Ink
import SwiftUI
import WebKit

struct PreviewWebView: UIViewRepresentable {
    let url:URL
    let reloader:Bool
    
    func makeUIView(context: Context) -> WKWebView {
        WKWebView(frame: .zero)
    }
    
    func updateUIView(_ uiView: WKWebView,context:Context) {
        if isMarkdown {
            if let markdown = try? String(contentsOf: url) {
                let parser = MarkdownParser()
                let html = parser.html(from: markdown)
                uiView.loadHTMLString(html, baseURL: url.deletingLastPathComponent())
            } else {
                let req = URLRequest(url: url)
                uiView.load(req)
            }
        }
    }
    
    private var isMarkdown: Bool {
        url.lastPathComponent.hasSuffix(".md") || url.lastPathComponent.hasSuffix(".markdown")
    }
}

struct PreviewWebView_Previews: PreviewProvider {
    static var previews: some View {
        PreviewWebView(url: URL(string: "https://www.baidu.com")!, reloader: false)
    }
}
