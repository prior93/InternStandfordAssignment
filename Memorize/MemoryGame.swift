//
//  MemoryGame.swift
//  Memorize
//
//  Created by parashar.r.adhikary on 03/04/2021.
//

import Foundation

struct MemoryGame<CardContent> where CardContent:Equatable {
    private (set) var cards:Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int?{
        get{ cards.indices.filter { cards[$0].isFaceUp }.only }
        set{
            for index in cards.indices{
               
                    cards[index].isFaceUp = index == newValue
                
            }
            
        }
        
        
    }
    
    
    mutating  func choose(card:Card){
        print("card Chosen:\(card)")
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = true
            } else{
                
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
            self.cards[chosenIndex].isFaceUp = true
            
        }
    }
    
    init(numberOfPairOfCards:Int,cardContentFactory:(Int)-> CardContent) {
        cards = Array<Card>()
        for pairIndex in  0..<numberOfPairOfCards{
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
            
        }
    }

    var score = 0
    
    struct Card:Identifiable {
        var isFaceUp: Bool  = false
        var isMatched: Bool = false
        var content: CardContent
        var id:Int
        var flipped: Int = 0
    }
    
    
    
    mutating func chooses(card: Card){
        print("card Chosen:\(card)")
        if let chosenIndex:Int = cards.firstIndex(matching: card),!cards[chosenIndex].isFaceUp,!cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard{
                cards[chosenIndex].flipped += 1
                cards[potentialMatchIndex].flipped += 1
                if cards[chosenIndex].content == cards[potentialMatchIndex].content{
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                    
                }else if cards[chosenIndex].flipped > 1 || cards[potentialMatchIndex].flipped > 1 {
                    score -= 1
                    
                }

                   
            }else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
    }

}
