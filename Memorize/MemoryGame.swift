//
//  MemoryGame.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/14.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: [Card]
    
    private var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp }).oneAndOnly }
        set { cards.indices.forEach { cards[$0].isFaceUp = ($0 == newValue) } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
            !cards[chosenIndex].isFaceUp,
            !cards[chosenIndex].isMatched
        {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }
    
    func index(of card: Card) -> Int? {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        
        return nil
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards * 2 times number of cards into this array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            let id = 2 * pairIndex
            cards.append(Card(content: content, id: id))
            cards.append(Card(content: content, id: id + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var oneAndOnly: Element? {
        if self.count == 1 { return first }
        else { return nil }
    }
}
