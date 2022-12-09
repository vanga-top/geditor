//
//  FinderItem.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/9.
//

import Foundation

struct FinderItem:Identifiable,Hashable {
    
    var url: URL
    
    var id: String {
        url.path
    }
    
    var fileName: String {
        url.lastPathComponent
    }
    
    var _content:String? {
        try? String(contentsOf: url)
    }
    
    var content: String {
        _content ?? ""
    }
    
    var isDirectory:Bool {
        (try? url.resourceValues(forKeys: [.isDirectoryKey]).isDirectory) ?? false
    }
    
    var contentModificationDate:Date {
        (try? url.resourceValues(forKeys: [.contentModificationDateKey]).contentModificationDate) ?? Date.distantPast
    }
    
    var isEditable:Bool {
        _content != nil
    }
    
    var activeItems:[Any] {
        [
            url,
            _content as Any,
        
        ].compactMap{$0}
    }
    
    init(url:URL) {
        self.url = url
    }
    
    func update(content:String) {
        try? content.write(to: url,atomically: true,encoding: .utf8)
    }
    
    func destroy(){
        try? FileManager.default.removeItem(at: url)
    }
    
    
    
}
