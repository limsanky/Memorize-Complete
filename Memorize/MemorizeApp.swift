//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/12.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
