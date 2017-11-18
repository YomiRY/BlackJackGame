//
//  ViewController.swift
//  PokerGame
//
//  Created by yomi on 2017/11/14.
//  Copyright © 2017年 yomi. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController, ViewControllerProtocol{
    
    @IBOutlet var mMyCardArray: [UIImageView]!
    @IBOutlet var mAnotherCardArray: [UIImageView]!
    
    var mPokerBackImage:UIImage?
    var mPresenter:BlackJackPresenter?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mPresenter = BlackJackPresenter(viewController:self)
        self.mPokerBackImage = UIImage(named:"porkerBack")
        resetUI()
    }
    
    // MARK: - onBtnGetNextClick:IBAction
    @IBAction func onBtnGetNextClick(_ sender: Any) {
        mPresenter?.onBtnGetNextClick()
    }
    
    // MARK: - onBtnFinishGetClick:IBAction
    @IBAction func onBtnFinishGetClick(_ sender: Any) {
        mPresenter?.onBtnFinishGetClick()
    }
    
    // MARK: - onBtnRetryClick:IBAction
    @IBAction func onBtnRetryClick(_ sender: Any) {
        mPresenter?.onBtnRetryClick()
    }
    

    // MARK: - showWinner:ViewControllerProtocol
    func showWinner(gameStatus: GameStatus) {
        
    }
    
    // MARK: - showMyCardFront:ViewControllerProtocol
    func showMyCardFront(myCardIndex: Int, myCard:Card) {
        self.mMyCardArray[myCardIndex].image = UIImage(named: myCard.mImgName)
        let currentCard = self.mMyCardArray[myCardIndex]
        let nextCardIndex = myCardIndex + 1
        
        if nextCardIndex < self.mMyCardArray.count {
            let nextCard = self.mMyCardArray[nextCardIndex]
            nextCard.isHidden = false
        }
        currentCard.isHidden = false
        currentCard.image = UIImage(named: myCard.mImgName)
    }
    
    // MARK: - showAnotherCardFront:ViewControllerProtocol
    func showAnotherCardFront(anotherCardIndex: Int, anotherCard: Card) {
        self.mAnotherCardArray[anotherCardIndex].image = UIImage(named: anotherCard.mImgName)
        let currentCard = self.mAnotherCardArray[anotherCardIndex]
        let nextCardIndex = anotherCardIndex + 1
        
        if nextCardIndex < self.mAnotherCardArray.count {
            let nextCard = self.mAnotherCardArray[nextCardIndex]
            nextCard.isHidden = false
        }
        currentCard.isHidden = false
        currentCard.image = UIImage(named: anotherCard.mImgName)
    }
    
    // MARK: - resetUI:ViewControllerProtocol
    func resetUI() {
        for i in stride(from: 0, to: mMyCardArray.count, by: 1) {
            self.mMyCardArray[i].isHidden = (i != 0)
            self.mAnotherCardArray[i].isHidden = (i != 0)
            self.mMyCardArray[i].image = mPokerBackImage
            self.mAnotherCardArray[i].image = mPokerBackImage
        }
    }
}

