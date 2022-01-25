//
//  Cardify.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/24.
//

import SwiftUI

// ViewModifier is used to craete a custom view modifier
struct Cardify: Animatable, ViewModifier {
    var rotation: Double
    
    var animatableData: Double {
        get { rotation }
        set { rotation = newValue}
    }
    
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    // Instead of a var body, ViewModifier has a func body with content as its parameter
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle (cornerRadius: DrawingConstants.cornerRadius)
            
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
            } else {
                shape.fill()
            }
            
            content
                .opacity(rotation < 90 ? 1 : 0)
        }
        .rotation3DEffect(Angle(degrees: rotation), axis: (0, 1, 0))
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
    }
}

extension View {
    func cardify(isFaceUp: Bool) -> some View {
        modifier(Cardify(isFaceUp: isFaceUp))
    }
}
