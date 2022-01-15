//
//  Theme.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/14.
//

import Foundation

struct Theme {
    private(set) var name: String
    private(set) var emojis: [String]
    private(set) var color: String

    let numberOfPairsOfCards: Int
    var numberOfPairsOfCardsToShow: Int
}
