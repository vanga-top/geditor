//
//  FinderItemView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/10.
//

import SwiftUI

struct FinderItemView: View {
    let item: FinderItem

    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Image(systemName: item.isDirectory ? "folder" : "doc.text")
                    .frame(minWidth: 24.0)
                Text(item.fileName)
                
            }
                Spacer()
                Text(item.contentModificationDate.description(with: Locale.current))
                    .font(.caption)
        }
        .padding([.top, .bottom], 8.0)
    }
}

struct FinderItemView_Previews: PreviewProvider {
    static var previews: some View {
        let url = Bundle.main.url(
            forResource: "root_file", withExtension: "txt",subdirectory: "root")!
        let item = FinderItem(url: url)
        List {
            FinderItemView(item: item)
        }
        .listStyle(.plain)
    }
}
