//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    static let emojis = ["🚂", "✈️", "🚗", "🚓", "🚡", "🚚", "🚎", "🚑", "⛵️",
                      "🚇", "🛵", "🛬", "🛫", "🛺", "🛰"]
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private(set) var model: MemoryGame<String> = createMemoryGame()
    
    // MARK: - Intents
    
    func choose(_ card: Card) { model.choose(card) }
    
}
