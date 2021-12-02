//
//  CardCollectionViewCell.swift
//  Macth
//
//  Created by Guest on 7/31/21.
//

import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var frontimageview: UIImageView!
    
    @IBOutlet weak var backimageview: UIImageView!
    
    var card: Card?
    
    func setCard (_ card:Card) {
        
        self.card = card
        
        frontimageview.image = UIImage(named: card.imagename)
    }
    
    
    func flip(){
        UIView.transition(from: backimageview, to: frontimageview, duration: 0.5, options: [.transitionFlipFromLeft,.showHideTransitionViews], completion: nil)
    }
    
    
    
    func flipback()  {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            UIView.transition(from: self.frontimageview, to:self.backimageview , duration: 0.1 , options: [.transitionFlipFromRight, .showHideTransitionViews], completion: nil)
            
        }
        
    }
    
    func remove (){
        backimageview.alpha = 0
        
        UIImageView.animate(withDuration: 0.4, delay: 0.6, options: .curveEaseOut, animations:{
            
            self.frontimageview.alpha = 0
            
        }, completion: nil)
            
        }

        
    }


