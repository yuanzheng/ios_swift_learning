//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Master on 2025/4/5.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    var viewModel: EmojiMemoryGameVM = EmojiMemoryGameVM()
        
    var body: some View {
        
        ScrollView{
            cards
        }
        .padding(.horizontal)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            //CardView(content: "Lucas call first" + emojis[0], isFaceUp: true)
            //CardView(content: "lucas call second")
            //用for loop
            //ForEach(0..<4, id: \.self) {
            //ForEach(emojis.indices, id: \.self) {
            ForEach(viewModel.cards.indices, id: \.self) {
                index in
                CardView(card: viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.orange)
    }
    /*
    var cardCountAdjusters: some View {
        HStack {
            cardAdder
            cardRemover
        }
        .imageScale(.large)
        .font(.largeTitle)
    }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label:{
            Image(systemName: symbol)
        })
        .disabled(cardCount+offset > emojis.count || cardCount+offset < 1)
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: 1, symbol: "plus.circle.fill")
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "minus.circle.fill")
    }
     */
    
}

struct CardView:View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {  // 三维空间，z轴
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                //shape.fill().foregroundColor(.white)  // night shift
                shape.fill(.white) // 都一样
                shape.stroke(lineWidth: 2)
                VStack {
                    
                    Text("Hello, world! -- " + card.content)
                        .font(.system(size:20))
                        .minimumScaleFactor(0.02)
                        .aspectRatio(1, contentMode: .fit)
                        .foregroundColor(Color.purple)
                        .padding()
                }
            }
            .opacity(card.isFaceUp ? 1:0)
            shape.fill().opacity(card.isFaceUp ? 0:1)
        }
    }
}

struct EmojiMemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView()
            
    }
}
