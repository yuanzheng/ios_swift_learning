//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import SwiftUI

class EmojiMemoryGameVM {
    // a private global variable
    private static let emojis = ["👻", "💩", "🤡", "☠️", "🎃", "🙀", "👿", "👽", "🤑", "👺", "🤖", "🐌"]
    // completely seperated from View
    // init var variable, otherwise, we need to give an initializer
    // cardContentFactory is a closure
    private var model = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        return emojis[pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // 没有外部名称
        model.choose(card)
    }
}

