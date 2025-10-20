//
//  CardView.swift
//  FlashcardStarter
//
//  Created by Joshua Mburu on 10/15/25.
//

import SwiftUI
// Card data model
struct Card: Equatable {
    let question: String
    let answer: String
    
    static let mockedCards = [
        Card(question: "Located at the southern end of Puget Sound, what is the capitol of Washington?", answer: "Olympia"),
        Card(question: "Which city serves as the capital of Texas?", answer: "Austin"),
        Card(question: "What is the capital of New York?", answer: "Albany"),
        Card(question: "Which city is the capital of Florida?", answer: "Tallahassee"),
        Card(question: "What is the capital of Colorado?", answer: "Denver")
    ]
}
struct CardView: View {
    let card: Card
    @State private var isShowingQuestion = true
    @State private var offset: CGSize = .zero
    
    private let swipeThreshold: Double = 200  // Add this
    
    var onSwipedLeft: (() -> Void)?  // Add this
    var onSwipedRight: (() -> Void)?  // Add this
    
    var body: some View {
        ZStack {
            // Back-most card background (for color change effect)
            ZStack {
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(offset.width < 0 ? .red : .green)
                
                RoundedRectangle(cornerRadius: 25.0)
                    .fill(isShowingQuestion ? Color.blue.gradient : Color.indigo.gradient)
                    .shadow(color: .black, radius: 4, x: -2, y: 2)
                    .opacity(1 - abs(offset.width) / swipeThreshold)
            }
            
            VStack(spacing: 20) {
                Text(isShowingQuestion ? "Question" : "Answer")
                    .bold()
                
                Rectangle()
                    .frame(height: 1)
                
                Text(isShowingQuestion ? card.question : card.answer)
            }
            .font(.title)
            .foregroundStyle(.white)
            .padding()
        }
        .frame(width: 300, height: 500)
        .opacity(3 - abs(offset.width) / swipeThreshold * 3)  // Fade out effect
        .rotationEffect(.degrees(offset.width / 20.0))  // Rotation effect
        .offset(CGSize(width: offset.width, height: 0))  // Only move horizontally
        .onTapGesture {
            isShowingQuestion.toggle()
        }
        .gesture(DragGesture()
            .onChanged { gesture in
                let translation = gesture.translation
                print(translation)
                offset = translation
            }
            .onEnded { gesture in  // Add this entire onEnded block
                if gesture.translation.width > swipeThreshold {
                    print("👉 Swiped right")
                    onSwipedRight?()
                } else if gesture.translation.width < -swipeThreshold {
                    print("👈 Swiped left")
                    onSwipedLeft?()
                } else {
                    print("🚫 Swipe canceled")
                    withAnimation(.bouncy) {
                        offset = .zero
                    }
                }
            }
        )
    }
}
#Preview {
    CardView(card: Card(
        question: "Located at the southern end of Puget Sound, what is the capitol of Washington?",
        answer: "Olympia"))
}
