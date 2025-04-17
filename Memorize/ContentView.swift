//
//  ContentView.swift
//  Memorize
//
//  Created by Master on 2025/4/5.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGameVM
    
    let emojis: Array<String> = ["👻", "💩", "🤡", "☠️", "🎃", "🙀", "👿", "👽", "🤑", "👺", "🤖", "🐌"]
    
    var body: some View {
        
        ScrollView{
            cards
        }
        .padding(.horizontal)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            //CardView(content: "Lucas call first" + emojis[0], isFaceUp: true)
            //CardView(content: "lucas call second")
            //用for loop
            //ForEach(0..<4, id: \.self) {
            //ForEach(emojis.indices, id: \.self) {
            ForEach(emojis.indices, id: \.self) {
                index in
                CardView(content: "Lucas call " + emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
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
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {  // 三维空间，z轴
            let shape = RoundedRectangle(cornerRadius: 12)
            Group {
                //shape.fill().foregroundColor(.white)  // night shift
                shape.fill(.white) // 都一样
                shape.stroke(lineWidth: 2)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.orange)
                    Text("Hello, world! -- " + content)
                        .foregroundColor(Color.purple)
                        .padding()
                }
            }
            .opacity(isFaceUp ? 1:0)
            shape.fill().opacity(isFaceUp ? 0:1)
        }
        .foregroundColor(.orange)
        .onTapGesture {
            print("tapped here")
            isFaceUp.toggle()
            // 或 这样写： isFaceUp = !isFaceUp  // self不可变 （self指整个struct）每次点击需要重建整个视图 ，这时需要更改isFaceUp为pointer to memory,也就是说改变内存中的值，isFaceUp不变依旧指向那块内存
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
