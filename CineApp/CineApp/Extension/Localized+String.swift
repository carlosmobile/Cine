//
//  Localized+String.swift
//  CineApp
//
//  Created by Carlos on 14/2/23.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
