//
//  ContentView.swift
//  FlashcardStarter
//
//  Created by Joshua Mburu on 10/15/25.
//

import SwiftUI

struct ContentView: View {
    @State private var cards: [Card] = Card.mockedCards
    @State private var cardsToPractice: [Card] = []  // Add this
    @State private var cardsMemorized: [Card] = []   // Add this
    @State private var deckId: Int = 0  // Add this for bug fix
    
    var body: some View {
        // Card deck
        ZStack {
            // Reset buttons
            VStack {
                Button("Reset") {
                    cards = cardsToPractice + cardsMemorized
                    cardsToPractice = []
                    cardsMemorized = []
                    deckId += 1  // Force refresh
                }
                .disabled(cardsToPractice.isEmpty && cardsMemorized.isEmpty)
                
                Button("More Practice") {
                    cards = cardsToPractice
                    cardsToPractice = []
                    deckId += 1  // Force refresh
                }
                .disabled(cardsToPractice.isEmpty)
            }
            
            // Cards
            ForEach(0..<cards.count, id: \.self) { index in
                CardView(
                    card: cards[index],
                    onSwipedLeft: {
                        let removedCard = cards.remove(at: index)
                        cardsToPractice.append(removedCard)  // Add to practice pile
                    },
                    onSwipedRight: {
                        let removedCard = cards.remove(at: index)
                        cardsMemorized.append(removedCard)  // Add to memorized pile
                    }
                )
                .rotationEffect(.degrees(Double(cards.count - 1 - index) * -5))
            }
        }
        .animation(.bouncy, value: cards)
        .id(deckId)  // Add this to force refresh
    }
}
#Preview {
    ContentView()
}
