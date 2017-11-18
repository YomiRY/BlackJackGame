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
        if !((self.mBoard?.isMyNextCardAvailable())!) {
            return
        }
        
        let myNextCardIndex = self.mBoard?.getMyNextCardIndex()
        let myNextCard = self.mBoard?.getNextMyCard()
        if let card = myNextCard {
            let gameStatus = (self.mBoard?.getGameStatus())!
            self.mViewController?.showMyCardFront(myCardIndex:myNextCardIndex!, myCard: card)
            
            if gameStatus == GameStatus.BANKER_CARD_PLAYER_WIN {
                self.mViewController?.showWinner(gameStatus: GameStatus.BANKER_CARD_PLAYER_WIN)
            }
        }
    }
    
    func onBtnFinishGetClick() -> Void {
        var gameStatus:GameStatus? = nil
        repeat {
            let bankerNextCardIndex = self.mBoard?.getBankerNextCardIndex()
            let bankerNextCard = self.mBoard?.getBankerNextCard()
            
            self.mViewController?.showBankerCardFront(bankerCardIndex: bankerNextCardIndex!, bankerCard: bankerNextCard!)
            gameStatus = self.mBoard?.getGameStatus()
        } while ((self.mBoard?.isBankerNextCardAvailable())! && gameStatus == GameStatus.MY_CARD_PLAYER_WIN) && !(self.mBoard?.isBankerTotalPointOver())!
        self.mViewController?.showWinner(gameStatus: (gameStatus)!)
    }
    
    func onBtnRetryClick() -> Void {
        self.mBoard?.reset()
        self.mViewController?.resetUI()
    }
    
}
