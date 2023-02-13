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
    let infoButtonCallback: () -> Void
    
    // MARK: - View
    var body: some View {
        ZStack() {
            HStack() {
                Button {
                    infoButtonAction()
                } label: {
                    Image(systemName: isChecked ? "heart" : "heart.fill")
                        .frame(alignment: .leading)
                }
                .frame(width: 24, height: 24)
                .padding([.top, .leading], 8)
                Spacer()
            }
            .frame(height: 32)
            
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
                        .padding(EdgeInsets(top: 0, leading: 4, bottom: 0, trailing: 4))
                }
                .frame(width: setWidthSizeToMultiImageCard() * 1, height: (setWidthSizeToMultiImageCard() * 1.6) - 32 )
            }
            .foregroundColor(Color.clear)
        }
        .frame(width: setWidthSizeToMultiImageCard(), height: setWidthSizeToMultiImageCard() * 1.6)
        .padding(.bottom, 0)
    }
    
    func setWidthSizeToMultiImageCard() -> CGFloat {
        let lateralMargins: CGFloat = 32
        let insideEdgesiPhone: CGFloat = 16
        let insideEdgesiPad: CGFloat = 32
        var offset: CGFloat = 0
        var widthSize: CGFloat = 0
        
        if TargetDevice.currentDevice() == .iPad {
            offset = lateralMargins + insideEdgesiPad
            widthSize = (UIScreen.screenWidth - offset) / 5
        } else {
            offset = lateralMargins + insideEdgesiPhone
            widthSize = (UIScreen.screenWidth - offset) / 3
        }
        
        return widthSize
    }
    
    func fullItemAction() {
        fullItemCallback()
    }
    
    func infoButtonAction() {
        infoButtonCallback()
    }
}
