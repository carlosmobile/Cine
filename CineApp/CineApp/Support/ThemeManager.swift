//
//  AppDelegate.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import UIKit
import SwiftUI

public enum TVThemeColor: Int {

    case TVWhite, TVBlack, TVGrayStrong, TVGray

    //MARK: - Colors
    public var Color: Color {
        switch self {
        case .TVWhite:
            return .white
        case .TVBlack:
            return .black
        case .TVGrayStrong:
            return SwiftUI.Color(.darkGray)
        case .TVGray:
            return .gray
        }
    }
}
