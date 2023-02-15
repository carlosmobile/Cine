//
//  TVCustomScrollView.swift
//  CineApp
//
//  Created by Carlos on 15/2/23.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue = CGFloat.zero
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct TVCustomScrollView<Content>: View where Content : View {
    @Namespace var scrollSpace
    
    @Binding var scrollOffset: CGFloat
    @Binding var scrollTotalHeight: CGFloat
    let content: (ScrollViewProxy) -> Content
    
    public init(scrollOffset: Binding<CGFloat>,
         scrollTotalHeight: Binding<CGFloat>,
         @ViewBuilder content: @escaping (ScrollViewProxy) -> Content) {
        _scrollOffset = scrollOffset
        _scrollTotalHeight = scrollTotalHeight
        self.content = content
    }
    
    public var body: some View {
        ScrollView(showsIndicators: false) {
            ScrollViewReader { proxy in
                content(proxy)
                    .background(GeometryReader { geo in
                        let offset = -geo.frame(in: .named(scrollSpace)).minY
                        
                        Color.clear
                            .preference(key: ScrollViewOffsetPreferenceKey.self,
                                        value: offset)
                            .onAppear {
                                scrollTotalHeight = geo.frame(in: .named(scrollSpace)).maxY
                            }
                    })
            }
        }
        .coordinateSpace(name: scrollSpace)
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self) { value in
            scrollOffset = value
        }
    }
}
