//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by parashar.r.adhikary on 03/04/2021.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String>

    var theme = themes.randomElement()!

    private static func createMemoryGame(theme: Theme) -> MemoryGame<String> {
        let emojis: Array<String> = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairOfCards: theme.noOfPairs ?? Int.random(in: 2...6)) { index in
            return emojis[index]
        }
    }



    init(){
        model =  EmojiMemoryGame.createMemoryGame(theme: theme)
    }

    // MARK:- Access to the model because its private var

    var cards: Array<MemoryGame<String>.Card> {
        model.cards

    }
    
    var score: Int {
        model.score

    }

    // MARK:- Intent

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }

    func newGame() {
        theme = themes.randomElement()!
        model =  EmojiMemoryGame.createMemoryGame(theme: theme)
    }
}
