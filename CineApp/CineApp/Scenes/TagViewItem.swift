//
//  TagViewItem.swift
//  CineApp
//
//  Created by Carlos on 12/2/23.
//

import SwiftUI

struct TagViewItem: Hashable {
    
    var title: String
    var isSelected: Bool
    
    static func == (lhs: TagViewItem, rhs: TagViewItem) -> Bool {
        return lhs.isSelected == rhs.isSelected
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(isSelected)
    }
}
