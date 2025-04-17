//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import SwiftUI

class EmojiMemoryGameVM {
    // completely seperated from View
    // init var variable, otherwise, we need to give an initializer
    // cardContentFactory is a closure
    private var model = MemoryGame(
        numberOfPairsOfCards: 4,
        cardContentFactory: { (index: Int) -> String in
            return ["👻", "💩", "🤡", "☠️", "🎃", "🙀", "👿", "👽", "🤑", "👺", "🤖", "🐌"][index]
        }
    )
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // 没有外部名称
        model.choose(card)
    }
}

