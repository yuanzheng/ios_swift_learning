//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>  // 只有set这个变量是私有的
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
