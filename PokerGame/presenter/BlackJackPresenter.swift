//
//  Presenter.swift
//  PokerGame
//
//  Created by yomi on 2017/11/17.
//  Copyright © 2017年 yomi. All rights reserved.
//

import Foundation

class BlackJackPresenter: NSObject {
    
    let mBoard:Board
    let mViewController:ViewControllerProtocol
    
    init(viewController:ViewControllerProtocol) {
        self.mBoard = Board()
        self.mViewController = viewController
    }
    
    func onBtnGetNextClick() -> Void {
    }
    
    func onBtnFinishGetClick() -> Void {
        
    }
    
}
