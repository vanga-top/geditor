//
//  FinderListView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/10.
//

import SwiftUI

struct FinderListView: View {
    @Environment(\.editMode) private var editMode
    @ObservedObject var list: FinderList
    
    @State private var selectedItem: FinderItem?
    @State private var isPresentedAddDialog = false
    @State private var isPresentedEditDialog = false
    @State private var isPresentedFilePrompt = false
    @State private var isPresentedDirectoryPrompt = false
    @State private var isPresentedDownloadPrompt = false
    @State private var isPresentedRenamePrompt = false
    @State private var isPresentMoveList = false
    @State private var isPresentedInfo = false
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            List(selection: $selectedItem) {
                ForEach(list.items, id: \.self){ item in
                    if item.isDirectory {
                        NavigationLink(
                            destination: FinderListView(list: FinderList(url: item.url))
                        ){
                            FinderItemView(item: item)
                        }.isDetailLink(false)
                    }else {
//                        NavigationLink(
//                            destination: FinderListView(list: FinderList(url: item.url))
//                        ) {
//                            FinderItemView(item: item)
//                        }
                    }
                }
            }
            .listStyle(.plain)
        }
    }
}

struct FinderListView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(forResource: "root", withExtension: nil)!
        let list = FinderList(url: url)
        NavigationView {
            FinderListView(list:list)
        }
    }
}
