//
//  ContentView.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/12.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame

    var body: some View {
        VStack {
            nameOfTheme
                .font(.system(.title))
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    ForEach (viewModel.model.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture { viewModel.choose(card) }
                    }
                }
                .foregroundColor(colorScheme)
            }
            
            Spacer()
            
            VStack {
                score
                newGameButton
                    .foregroundColor(.blue)
            }
            .font(.system(.title2))
        }
        .padding(.horizontal)
    }
    
    var score: some View {
        let score = viewModel.model.score
        return Text("\(score)")
            .padding()
            .foregroundColor(score == 0 ? .blue : score < 0 ? .red : .green)
    }
    
    var nameOfTheme: some View {
        Text(viewModel.themeName)
    }
    
    var colorScheme: Color {
        viewModel.getColorScheme()
    }
    
    var newGameButton: some View {
        Button {
            viewModel.startGame()
        } label: {
            Text("New Game")
        }
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle (cornerRadius: 20)

            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill()
                Text(card.content).font(.title)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
            .preferredColorScheme(.dark)
    }
}
