//
//  FinderList.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/9.
//

import Foundation
import UIKit

class FinderList:ObservableObject {
    let url: URL
    @Published var items: [FinderItem] = []
    
    var relativePath:String{
        FinderList.relativePath(for: url)
    }
    
    func refresh(){
        items = FinderList.items(for: url)
    }
    
    init(url:URL) {
        self.url = url
        refresh()
    }
}


extension FinderList {
    static var rootURL:URL {
        guard
            let documentDirectory = try? FileManager.default.url(
                for: .documentDirectory,
                in: .userDomainMask,
                appropriateFor: nil,
                create: false)
        else {
            fatalError()
        }
        return documentDirectory
    }
    
    static func items(for url: URL)->[FinderItem] {//这个for就是个label
        guard
            let urls = try?FileManager.default.contentsOfDirectory(
                at: url,
                includingPropertiesForKeys:[.contentModificationDateKey,.isDirectoryKey])
        else{
            fatalError()
        }
        
        return urls.map { FinderItem(url: $0) }.sorted {//排个序，这里的map是个操作，不是kv形式
            $0.contentModificationDate > $1.contentModificationDate
        }
    }
    
    static func relativePath(for url:URL) ->String {
        let path = url.path.replacingOccurrences(of: rootURL.path, with: "")
        return path.isEmpty ? "/" : path
    }
    
    static func createExamples(){
        let root = FinderList(url: rootURL)
        let examplesURL = rootURL.appendingPathComponent("examples")
        if FileManager.default.fileExists(atPath: examplesURL.path) {
            return
        }
        
        
    }
}


extension FinderList {
    func deleteItem(item: FinderItem?) {
        guard let item = item else {return}
        
        if let index = items.firstIndex(of: item) {
            items.remove(at: index)
        }
        item.destroy()
    }
    
    func renameItem(item: FinderItem?, name: String) {
        guard let item = item else { return }

        item.rename(name: name)
        refresh()
    }
    
    func addItem(name: String, isDirectory: Bool) {
        let url = self.url.appendingPathComponent(name)

        if isDirectory {
            try? FileManager.default.createDirectory(at: url, withIntermediateDirectories: false)
        } else {
            try? "".write(to: url, atomically: true, encoding: .utf8)
        }
        refresh()
    }

}
