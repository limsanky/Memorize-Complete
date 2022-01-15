//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/14.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private(set) var themes: [Theme]
    private(set) var themeName: String
    private(set) var themeColor: String
    
    init() {
        self.themes = [
            Theme(name: "Random",
                  emojis: ["🐧","🐼","👻","✏️","🏀","🔧","🔮","💯","💛","📮","💍", "💼","👽"],
                  color: "cyan",
                  numberOfPairsOfCards: 13,
                  numberOfPairsOfCardsToShow: 13
                 ),
            Theme(name: "Vehicles",
                  emojis: ["🚂", "✈️", "🚗", "🚓", "🚡", "🚚", "🚎", "🚑", "⛵️", "🚇", "🛵", "🛬", "🛫", "🛺", "🛰"],
                  color: "red",
                  numberOfPairsOfCards: 15,
                  numberOfPairsOfCardsToShow: 6
                 ),
            Theme(
                name: "Faces",
                emojis: ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪"],
                color: "black",
                numberOfPairsOfCards: 27,
                numberOfPairsOfCardsToShow: 10
            ),
            Theme(name: "Hands",
                  emojis: ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟", "🤘", "🤙", "👈", "👉"],
                  color: "orange",
                  numberOfPairsOfCards: 15,
                  numberOfPairsOfCardsToShow: 10
                 ),
            Theme(name: "Humans",
                  emojis: ["👶", "👧", "🧒", "👦", "👩", "🧑", "👨", "👩‍🦱", "🧑‍🦱", "👨‍🦱", "👩‍🦰", "🧑‍🦰", "👨‍🦰"],
                  color: "blue",
                  numberOfPairsOfCards: 13,
                  numberOfPairsOfCardsToShow: 8
      
                 ),
            Theme(name: "Items",
                  emojis: ["🧳" ,"🌂" ,"☂️" ,"🧵", "🪡" ,"🪢", "🧶" ,"👓", "🕶" ,"🥽" ,"🥼" ,"🦺", "👔" ,"👕", "👖" ,"🧣"],
                  color: "green",
                  numberOfPairsOfCards: 16,
                  numberOfPairsOfCardsToShow: 9
                ),
            Theme(name: "Fruits",
                  emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌","🍉", "🍇", "🍓", "🫐", "🍈", "🍒"],
                  color: "yellow",
                  numberOfPairsOfCards: 12,
                  numberOfPairsOfCardsToShow: 12
                 )
        ]
        
        let randomIndex = Int.random(in: themes.indices)
        
        self.model = EmojiMemoryGame.createMemoryGame(theme: themes[randomIndex])
        self.themeName = themes[randomIndex].name
        self.themeColor = themes[randomIndex].color
        
        model.shuffle()
    }
    
    func addTheme(_ theme: Theme) {
        if theme.numberOfPairsOfCardsToShow > theme.numberOfPairsOfCards {
            themes.append(
                Theme(name: theme.name,
                      emojis: theme.emojis,
                      color: theme.color,
                      numberOfPairsOfCards: theme.numberOfPairsOfCards,
                      numberOfPairsOfCardsToShow: theme.numberOfPairsOfCards
                     )
            )
        } else {
            themes.append(theme)
        }
    }
    
    func getColorScheme() -> Color {
        switch(themeColor) {
        case "red": return .red
        case "blue": return .blue
        case "brown": return .brown
        case "orange": return .orange
        case "black": return .gray
        case "white": return .white
        case "gray": return .gray
        case "cyan": return .cyan
        case "mint": return .mint
        case "pink": return .pink
        case "green": return .green
        case "yellow": return .yellow
        default: return .red
        }
    }
    
    static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfPairsOfCardsToShow) { emojis[$0] }
    }
    
    @Published private(set) var model: MemoryGame<String>
    
    // MARK: - Intents
    
    func choose(_ card: Card) { model.choose(card) }
    
    func startGame() {
        let randomTheme = themes[Int.random(in: themes.indices)]
        
        model = EmojiMemoryGame.createMemoryGame(theme: randomTheme)
        model.shuffle()
        
        themeName = randomTheme.name
        themeColor = randomTheme.color
    }
}
