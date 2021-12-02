//
//  ViewController.swift
//  Macth
//
//  Created by Guest on 7/31/21.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var collectoinView: UICollectionView!
    
    var model = CardModel()
    var cardArray = [Card]()
    var timer: Timer?
    var miliseconds: Float = 50*1000
    var firstflepped: IndexPath?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectoinView.delegate = self
        collectoinView.dataSource = self
        
        cardArray = model.getCards()
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(timerF), userInfo: nil, repeats: true)
    }
    

// MARK: - UICollectionView Protocol Methods
    
    func  collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return cardArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCollectionViewCell
        
        let card = cardArray[indexPath.row]
        cell.setCard(card)
        
        
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if miliseconds <= 0{
            return
        }
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        let card = cardArray[indexPath.row]
        if card.isFlipped == false {
            cell.flip()
        card.isFlipped = true
            if firstflepped == nil{
                firstflepped = indexPath
            }
            
            else{
                
                checkMatch(indexPath)
        }
    }
}
// MARK: - Game Logic Methods

    func checkMatch(_ secondflepped: IndexPath){
        
        let cardOneCell = collectoinView.cellForItem(at: firstflepped!) as? CardCollectionViewCell
        
        let cardSecondCell = collectoinView.cellForItem(at: secondflepped) as? CardCollectionViewCell
        
        let cardOne = cardArray[firstflepped!.row]
        
        let cardTwo = cardArray[secondflepped.row]
        
        if cardOne.imagename == cardTwo.imagename {
            
            cardOne.isMached = true
            
            cardTwo.isMached = true
    
            cardOneCell?.remove()
            
            cardSecondCell?.remove()
            
            checkGameEnded()
        }
        
            else{
                
                cardOne.isFlipped = false
                
                cardTwo.isFlipped = false
                
                cardOneCell?.flipback()
                
                cardSecondCell?.flipback()
                
            }
        firstflepped = nil
    }

    // MARK: -Timer Methods
        @objc func timerF() {
            
            miliseconds -= 1
            
            let second = String(format: "%.2f", miliseconds/1000)
            
            timerLabel.text = "Time remaning:\(second)"
            
            if miliseconds <= 0 {
                
                timer?.invalidate()
                
                timerLabel.textColor = UIColor.red
                
                checkGameEnded()
        }
    


}
// var handleGameEnd(String, String) -> Void
    func checkGameEnded() {
        
        var isWon = true
        
        for card in cardArray {
            
            if    card.isMached == false{
                
            isWon = false
                
            break
        }
    }
        var title = ""
        var message = ""
        
        if isWon == true {
            if miliseconds > 0 {
                timer?.invalidate()
                
            }
             title = "Congratulation"
            message = "You WON!"
            
        }
        else {
            if miliseconds > 0 {
                return
            }
            
            title = "Game Over"
            message = "You Lost!"
        }
        
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let aleract = UIAlertAction(title: "OKEY", style: .default, handler: nil)
        alert.addAction(aleract)
        present(alert, animated: true, completion: nil)
}
}
