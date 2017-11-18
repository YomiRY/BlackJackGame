//
//  Presenter.swift
//  PokerGame
//
//  Created by yomi on 2017/11/17.
//  Copyright © 2017年 yomi. All rights reserved.
//

import Foundation

class BlackJackPresenter: NSObject {
    
    let mBoard:Board?
    let mViewController:ViewControllerProtocol?
    
    init(viewController:ViewControllerProtocol) {
        self.mBoard = Board()
        self.mViewController = viewController
    }
    
    func onBtnGetNextClick() -> Void {
        if !((self.mBoard?.isNextMyCardAvailable())!) {
            return
        }
        
        let myNextCardIndex = self.mBoard?.getNextMyCardIndex()
        let myNextCard = self.mBoard?.getNextMyCard()
        
        if let card = myNextCard {
            self.mViewController?.showMyCardFront(myCardIndex:myNextCardIndex!, myCard: card)
        }
    }
    
    func onBtnFinishGetClick() -> Void {
        repeat {
            let anotherNextCardIndex = self.mBoard?.getNextAnotherCardIndex()
            let anotherNextCard = self.mBoard?.getNextAnotherCard()
            
            if let card = anotherNextCard {
                self.mViewController?.showAnotherCardFront(anotherCardIndex: anotherNextCardIndex!, anotherCard: card)
            }
        } while ((self.mBoard?.isNextAnotherCardAvailable())!)
    }
    
    func onBtnRetryClick() -> Void {
        self.mBoard?.reset()
        self.mViewController?.resetUI()
        
    }
    
}
