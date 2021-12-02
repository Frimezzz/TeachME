//
//  CardModel.swift
//  Macth
//
//  Created by Guest on 7/31/21.
//

import Foundation

class CardModel {
    
    func getCards() -> [Card] {
        
         var generatedArray = [Int]()
        
        var generatedCardsAraay = [Card]()
        
        while generatedArray.count < 6 {
            
            let randomNumber = arc4random_uniform(9) + 1
            
            if generatedArray.contains(Int(randomNumber)) == false {
                
                generatedArray.append(Int(randomNumber))
                
            print(randomNumber)
            
        
            
            let cardOne = Card ()
            cardOne.imagename = "card\(randomNumber)"
            
            generatedCardsAraay.append(cardOne)
            
            let cardTwo = Card()
            cardTwo.imagename = "card\(randomNumber)"
            
            generatedCardsAraay.append(cardTwo )
        }
       

}
        return generatedCardsAraay
    }
    
}
