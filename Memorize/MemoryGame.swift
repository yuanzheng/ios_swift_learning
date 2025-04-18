//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Yuanzheng on 2025/4/15.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>  // 只有set这个变量是私有的
    
    // initializer is required in ViewModel
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        self.cards = []
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    struct Card {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
    }
}
