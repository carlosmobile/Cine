//
//  AppDelegate.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import UIKit
import SwiftUI

public enum TVThemeColor: Int {

    case `default`, TVWhite, TVBlack, TVGrayStrong, TVGray

    //MARK: - Colors
    public var Color: Color {
        switch self {
        case .default:
            return .white
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

public enum TVThemeImage: String {

    case `default`, tvDefaultNoImage

    //MARK: - Images
    public var TVImage: String {
        switch self {
        case .default:
            return "default"
        case .tvDefaultNoImage:
            return "mkDefaultNoImage"
        }
    }
}
