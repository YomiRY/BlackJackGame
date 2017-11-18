//
//  ViewControllerProtocol.swift
//  PokerGame
//
//  Created by yomi on 2017/11/18.
//  Copyright © 2017年 yomi. All rights reserved.
//

import Foundation

protocol ViewControllerProtocol {
    func showWinner(gameStatus:GameStatus) -> Void
    func resetUI() -> Void
    func showMyCardFront(myCardIndex:Int, myCard:Card) -> Void
    func showAnotherCardFront(anotherCardIndex:Int, anotherCard:Card) -> Void
    
}
