//
//  Cardify.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/24.
//

import SwiftUI

// ViewModifier is used to craete a custom view modifier
struct Cardify: ViewModifier {
    var isFaceUp: Bool
    
    // Instead of a var body, ViewModifier has a func body with content as its parameter
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle (cornerRadius: DrawingConstants.cornerRadius)
            
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                
                content
            } else {
                shape.fill()
            }
        }
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
