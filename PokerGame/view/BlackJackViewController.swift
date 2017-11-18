//
//  ViewController.swift
//  PokerGame
//
//  Created by yomi on 2017/11/14.
//  Copyright © 2017年 yomi. All rights reserved.
//

import UIKit

class BlackJackViewController: UIViewController, ViewControllerProtocol{
    
    @IBOutlet weak var mBtnGetNextCard: UIButton!
    @IBOutlet weak var mBtnFinishGet: UIButton!
    @IBOutlet weak var mBtnRetry: UIButton!
    @IBOutlet var mMyCardArray: [UIImageView]!
    @IBOutlet var mBankerCardArray: [UIImageView]!
    
    var mPokerBackImage:UIImage?
    var mPresenter:BlackJackPresenter?
    
    // MARK: - Life Cycle and other functions
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mPresenter = BlackJackPresenter(viewController:self)
        self.mPokerBackImage = UIImage(named:"porkerBack")
        
        self.resetUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        showAlertDialog(title: "21點遊戲說明", content: "\n1.點擊\"Get Next\"按鈕要牌，最多要五張\n2.點擊\"Finish Get\"按鈕停止要牌，輪到莊家要牌\n3.要牌過程中，若點數和超過21點則莊家贏\n4.其餘勝負責依據點數大小比較，其次為要了5張牌且未爆來決定", confirmTitle: "Dismiss", align: .left);
    }
    
    func showAlertDialog(title:String, content:String, confirmTitle:String, align:NSTextAlignment) {
        let alertController = UIAlertController(title: title, message: content, preferredStyle: .alert)
        
        let paraStyle = NSMutableParagraphStyle()
        paraStyle.alignment = align
        let styleContentStr = NSMutableAttributedString(string: content, attributes: [NSAttributedStringKey.paragraphStyle: paraStyle])
        
        alertController.setValue(styleContentStr, forKey: "attributedMessage")
        alertController.addAction(UIAlertAction(title: confirmTitle, style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - IBAction functions
    @IBAction func onBtnGetNextClick(_ sender: Any) {
        self.mPresenter?.onBtnGetNextClick()
    }
    
    @IBAction func onBtnFinishGetClick(_ sender: Any) {
        self.mBtnFinishGet.isEnabled = false
        self.mBtnFinishGet.backgroundColor = UIColor.gray
        self.mBtnGetNextCard.isEnabled = false
        self.mBtnGetNextCard.backgroundColor = UIColor.gray
        self.mPresenter?.onBtnFinishGetClick()
    }
    
    @IBAction func onBtnRetryClick(_ sender: Any) {
        self.mPresenter?.onBtnRetryClick()
    }
    
    
    // MARK: - ViewControllerProtocol Implementation
    func showWinner(gameStatus: GameStatus) {
        print("Game Status = \(gameStatus)")
        var dialogMsg = ""
        
        switch(gameStatus) {
        case .BANKER_CARD_PLAYER_WIN:
            dialogMsg = " Banker Win ! "
        case .MY_CARD_PLAYER_WIN:
            dialogMsg = " You Win ! "
        case .GAME_TIE:
            dialogMsg = " Game Tie ! "
        }
        
        showAlertDialog(title: "BlackJack Game", content: dialogMsg, confirmTitle: "Dismiss", align: .center);
    }
    
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
    
    func showBankerCardFront(bankerCardIndex: Int, bankerCard: Card) {
        self.mBankerCardArray[bankerCardIndex].image = UIImage(named: bankerCard.mImgName)
        let currentCard = self.mBankerCardArray[bankerCardIndex]
        
        currentCard.isHidden = false
        currentCard.image = UIImage(named: bankerCard.mImgName)
    }
    
    func resetUI() {
        self.mBtnGetNextCard.isEnabled = true
        self.mBtnGetNextCard.backgroundColor = UIColor(red: CGFloat(98/255.0), green: CGFloat(29/255.0), blue: CGFloat(209/255.0), alpha: CGFloat(1))
        self.mBtnFinishGet.isEnabled = true
        self.mBtnFinishGet.backgroundColor = UIColor(red: CGFloat(1), green: CGFloat(128/255.0), blue: CGFloat(0), alpha: CGFloat(1))
        for i in stride(from: 0, to: mMyCardArray.count, by: 1) {
            self.mMyCardArray[i].isHidden = (i != 0)
            self.mBankerCardArray[i].isHidden = (i != 0)
            self.mMyCardArray[i].image = mPokerBackImage
            self.mBankerCardArray[i].image = mPokerBackImage
        }
    }
}

