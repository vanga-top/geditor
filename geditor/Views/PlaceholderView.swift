//
//  PlaceholderView.swift
//  geditor
//
//  Created by 陈辉 on 2022/12/17.
//

import SwiftUI

struct PlaceholderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("No item selected.").font(.title2)
            Spacer()
        }
    }
}

struct PlaceholderView_Previews: PreviewProvider {
    static var previews: some View {
        PlaceholderView()
    }
}
