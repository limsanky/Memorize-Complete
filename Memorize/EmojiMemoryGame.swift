//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    var cards: [Card] { model.cards }
    
    private static let emojis = ["🚂", "✈️", "🚗", "🚓", "🚡", "🚚", "🚎", "🚑", "⛵️",
                      "🚇", "🛵", "🛬", "🛫", "🛺", "🛰"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in emojis[pairIndex] }
    }
    
    @Published private(set) var model = createMemoryGame()
    
    // MARK: - Intents
    
    func choose(_ card: Card) { model.choose(card) }
    
    func shuffle() { model.shuffle() }
    
    // Restarting the game i.e. Create game once again
    func restart() { model = EmojiMemoryGame.createMemoryGame() }
}
