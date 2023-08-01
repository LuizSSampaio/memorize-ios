//
//  ContentView.swift
//  Memorize
//
//  Created by Luiz Henrique Silva Sampaio on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    @State var numberOfCards = 6
    let emojis = [ "🛤", "🔴", "💺", "🈺", "♿️", "📢", "🐁", "🐻", "🌷", "💁", "6️⃣", "🚗", "🕟", "👈", "🚀", "📕" ]
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 64.0))]) {
                    ForEach(emojis[0..<numberOfCards], id: \.self, content: { emoji in
                        CardView(content: emoji)
                    })
                }.foregroundColor(.orange)
            }
            
            Spacer()
            
            HStack {
                remove
                
                Spacer()
                
                shuffle
                
                Spacer()
                
                add
            }
            .font(.title)
            .padding(.horizontal, 16.0)
        }
        .padding(.horizontal, 24.0)
        .padding(.top, 24.0)
    }
    
    var remove: some View {
        Button {
            if numberOfCards > 1 {
                numberOfCards -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
        }.padding(8)
    }
    
    var shuffle: some View {
        Button("Shuffle") {
            print("Shuffle")
        }.padding(8)
    }
    
    var add: some View {
        Button {
            if numberOfCards < emojis.count {
                numberOfCards += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }.padding(8)
    }
        
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 8.0)
            let shapeFilled = shape.fill()
            
            if isFaceUp {
                shapeFilled
                    .foregroundColor(.white)
             
                shape
                    .strokeBorder(lineWidth: 3.0)
                
                Text(content)
                    .font(.largeTitle)
            } else {
                shapeFilled
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
        .aspectRatio(2/3, contentMode: .fit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
