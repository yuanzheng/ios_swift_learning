//
//  EmojiMemoryGameVM.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import SwiftUI

class EmojiMemoryGameVM {
    // completely seperated from View
    private var model: MemoryGame<String>
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) { // 没有外部名称
        model.choose(card)
    }
}

