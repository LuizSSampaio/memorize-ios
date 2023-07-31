//
//  ContentView.swift
//  Memorize
//
//  Created by Luiz Henrique Silva Sampaio on 31/07/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                Text("🚀")
             
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(lineWidth: 2.0)
                    .foregroundColor(.orange)
            }
        }
        .padding(24.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
