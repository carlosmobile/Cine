//
//  SearchColorStyle.swift
//  CineApp
//
//  Created by Carlos on 15/2/23.
//

import SwiftUI

enum SearchColorStyle {
    case active
    case disabled
    case error
}

struct StatusColorView {
    @Binding var state: SearchColorStyle
    var render: some ShapeStyle {
        setStatusColor()
    }
    
    func setStatusColor() -> Color {
        switch state {
        case .active:
            return TVThemeColor.TVGrayStrong.Color
        case .disabled:
            return TVThemeColor.TVGray.Color
        case .error:
            return TVThemeColor.TVBlack.Color
        }
    }
}
