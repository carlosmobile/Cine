//
//  MultiImageItem.swift
//  CineApp
//
//  Created by Carlos on 11/2/23.
//

import SwiftUI
import Kingfisher

struct MultiImageItemView: View {
    // MARK: - Properties
    @State var urlImage: String = ""
    @State private var isChecked = false
    
    let fullItemCallback: () -> Void
    
    let topMargin: CGFloat = 16
    let bottomMargin: CGFloat = 16
    
    // MARK: - View
    var body: some View {
        ZStack() {
            Button {
                fullItemAction()
            } label: {
                HStack(spacing: 4) {
                    KFImage.url(URL(string: Constants.baseURL + urlImage)!)
                        .placeholder {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                                .scaleEffect(2)
                        }
                        .fade(duration: 0.25)
                        .resizable()
                        .memoryCacheExpiration(.expired)
                        .padding([.top, .bottom], 0)
                        .padding([.leading, .trailing], 4)
                }
                .frame(width: setWidthSizeToMultiImageCard() * 1,
                       height: (setWidthSizeToMultiImageCard() * 1.6) - (topMargin + bottomMargin))
            }
            .foregroundColor(.clear)
        }
        .frame(width: setWidthSizeToMultiImageCard(), height: setWidthSizeToMultiImageCard() * 1.6)
        .padding(.bottom, 0)
    }
    
    // MARK: - Private methods
    private func setWidthSizeToMultiImageCard() -> CGFloat {
        let lateralMargins: CGFloat = 32
        let insideEdgesiPhone: CGFloat = 16
        let insideEdgesiPad: CGFloat = 32
        let iPadColumns: CGFloat = 5
        let iPhoneColumns: CGFloat = 3
        var offset: CGFloat = 0
        var widthSize: CGFloat = 0
        
        if TargetDevice.currentDevice() == .iPad {
            offset = lateralMargins + insideEdgesiPad
            widthSize = (UIScreen.screenWidth - offset) / iPadColumns
        } else {
            offset = lateralMargins + insideEdgesiPhone
            widthSize = (UIScreen.screenWidth - offset) / iPhoneColumns
        }
        
        return widthSize
    }
    
    private func fullItemAction() {
        fullItemCallback()
    }
}
