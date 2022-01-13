//
//  ContentView.swift
//  Memorize
//
//  Created by Sankarshana V on 2022/01/12.
//

import SwiftUI

struct ContentView: View {
    let themes = [
        ["😀", "😃", "😄", "😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪"],
        ["👋", "🤚", "🖐", "✋", "🖖", "👌", "🤌", "🤏", "✌️", "🤞", "🤟", "🤘", "🤙", "👈", "👉"],
        ["🚂", "✈️", "🚗", "🚓", "🚡", "🚚", "🚎", "🚑", "⛵️",
                          "🚇", "🛵", "🛬", "🛫", "🛺", "🛰"]
    ]
    
    @State var themeIndex = 0
    @State var emojiCount = 8
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))]) {
                    let theme = themes[themeIndex].shuffled()
                    
                    ForEach (theme[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
          
            Spacer()
            
            HStack {
                vehiclesTheme
                facesTheme
                handsTheme
            }
        }
        .padding(.horizontal)
    }
    
    func setRandomInteger(in theme: Int) {
        emojiCount = Int.random(in: 4..<theme)
    }
    
    var vehiclesTheme: some View {
        returnThemeLabel(of: "Vehicles", index: 2, image: "car")
    }
    
    var facesTheme: some View {
        returnThemeLabel(of: "Faces", index: 0, image: "face.smiling")
    }
    
    var handsTheme: some View {
        returnThemeLabel(of: "Hands", index: 1, image: "hand.raised")
    }
    
    func returnThemeLabel(of: String, index: Int, image: String) -> some View {
        Button {
            themeIndex = index
            setRandomInteger(in: themes[themeIndex].count)
        } label: {
            VStack {
                Image(systemName: image)
                    .font(.largeTitle)
                Text(of)
                    .font(.subheadline)
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle (cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
