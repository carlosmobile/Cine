//
//  File.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import SwiftUI

struct FormDetailView:View {
        
    var title: String = ""
    var value: String = ""
    var widthSize: CGFloat = 80

    var body: some View {
        HStack() {
            VStack() {
                Text(title)
                    .font(.system(size: 18, weight: .regular))
                    .foregroundColor(.gray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }.frame(width: widthSize).padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 8))
            VStack() {
                Text(value)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(EdgeInsets(top: 0, leading: 0, bottom: 4, trailing: 8))
        }
    }
}
