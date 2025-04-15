//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
