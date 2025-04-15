//
//  ContentView.swift
//  Memorize
//
//  Created by Master on 2025/4/5.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["👻", "💩", "🤡", "☠️"]
    @State var cardCount: Int = 2
    var body: some View {
        VStack {
            HStack {
                //CardView(content: "Lucas call first" + emojis[0], isFaceUp: true)
                //CardView(content: "lucas call second")
                //用for loop
                //ForEach(0..<4, id: \.self) {
                //ForEach(emojis.indices, id: \.self) {
                ForEach(0..<cardCount, id: \.self) {
                    index in
                    CardView(content: "Lucas call " + emojis[index])
                }
            }
            HStack {
                Button("Add Card") {
                    cardCount += 1
                }
            }
        }
        .padding(.horizontal)
    }
}

struct CardView:View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {  // 三维空间，z轴
            let shape = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                //shape.fill().foregroundColor(.white)  // night shift
                shape.fill(.white) // 都一样
                shape
                    .stroke(lineWidth: 2)
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.orange)
                    Text("Hello, world! -- " + content)
                        .foregroundColor(Color.purple)
                        .padding()
                }
            } else {
                shape.fill()
            }
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
