//
//  Board.swift
//  PokerGame
//
//  Created by yomi on 2017/11/17.
//  Copyright © 2017年 yomi. All rights reserved.
//

import Foundation
import GameplayKit

class Board: NSObject {
    
    private static let MAX_PLAYER_CARD_COUNT = 5
    
    private let mAllCardArray:[Card]
    private let mRandomNumber : GKShuffledDistribution?
    private var mSelectedMyCardIndexArray:[Int]
    private var mSelectedBankerCardIndexArray:[Int]
    
    override init() {
        mSelectedMyCardIndexArray = [Int]()
        mSelectedBankerCardIndexArray = [Int]()
        mAllCardArray = [
            Card(mCardNum:1, mImgName:"card_AC"),
            Card(mCardNum:1, mImgName:"card_AD"),
            Card(mCardNum:1, mImgName:"card_AH"),
            Card(mCardNum:1, mImgName:"card_AS"),
            Card(mCardNum:2, mImgName:"card_2C"),
            Card(mCardNum:2, mImgName:"card_2D"),
            Card(mCardNum:2, mImgName:"card_2H"),
            Card(mCardNum:2, mImgName:"card_2S"),
            Card(mCardNum:3, mImgName:"card_3C"),
            Card(mCardNum:3, mImgName:"card_3D"),
            Card(mCardNum:3, mImgName:"card_3H"),
            Card(mCardNum:3, mImgName:"card_3S"),
            Card(mCardNum:4, mImgName:"card_4C"),
            Card(mCardNum:4, mImgName:"card_4D"),
            Card(mCardNum:4, mImgName:"card_4H"),
            Card(mCardNum:4, mImgName:"card_4S"),
            Card(mCardNum:5, mImgName:"card_5C"),
            Card(mCardNum:5, mImgName:"card_5D"),
            Card(mCardNum:5, mImgName:"card_5H"),
            Card(mCardNum:5, mImgName:"card_5S"),
            Card(mCardNum:6, mImgName:"card_6C"),
            Card(mCardNum:6, mImgName:"card_6D"),
            Card(mCardNum:6, mImgName:"card_6H"),
            Card(mCardNum:6, mImgName:"card_6S"),
            Card(mCardNum:7, mImgName:"card_7C"),
            Card(mCardNum:7, mImgName:"card_7D"),
            Card(mCardNum:7, mImgName:"card_7H"),
            Card(mCardNum:7, mImgName:"card_7S"),
            Card(mCardNum:8, mImgName:"card_8C"),
            Card(mCardNum:8, mImgName:"card_8D"),
            Card(mCardNum:8, mImgName:"card_8H"),
            Card(mCardNum:8, mImgName:"card_8S"),
            Card(mCardNum:9, mImgName:"card_9C"),
            Card(mCardNum:9, mImgName:"card_9D"),
            Card(mCardNum:9, mImgName:"card_9H"),
            Card(mCardNum:9, mImgName:"card_9S"),
            Card(mCardNum:10, mImgName:"card_TC"),
            Card(mCardNum:10, mImgName:"card_TD"),
            Card(mCardNum:10, mImgName:"card_TH"),
            Card(mCardNum:10, mImgName:"card_TS"),
            Card(mCardNum:10, mImgName:"card_JC"),
            Card(mCardNum:10, mImgName:"card_JD"),
            Card(mCardNum:10, mImgName:"card_JH"),
            Card(mCardNum:10, mImgName:"card_JS"),
            Card(mCardNum:10, mImgName:"card_QC"),
            Card(mCardNum:10, mImgName:"card_QD"),
            Card(mCardNum:10, mImgName:"card_QH"),
            Card(mCardNum:10, mImgName:"card_QS"),
            Card(mCardNum:10, mImgName:"card_KC"),
            Card(mCardNum:10, mImgName:"card_KD"),
            Card(mCardNum:10, mImgName:"card_KH"),
            Card(mCardNum:10, mImgName:"card_KS")]
        mRandomNumber = GKShuffledDistribution(lowestValue: 0, highestValue: mAllCardArray.count - 1)
    }
    
    func getGameStatus() -> GameStatus? {
        return nil
    }
    
    func getNextMyCard() -> Card? {
        var nextMyCardIndex:Int
        repeat {
            // Get the new card index not used
            nextMyCardIndex = (mRandomNumber?.nextInt())!
        } while self.mSelectedMyCardIndexArray.contains(nextMyCardIndex)
        
        self.mSelectedMyCardIndexArray.append(nextMyCardIndex)
        
        return self.mAllCardArray[nextMyCardIndex]
    }
    
    func getNextMyCardIndex() -> Int {
        return self.mSelectedMyCardIndexArray.count
    }
    
    func isNextMyCardAvailable() -> Bool {
        return self.mSelectedMyCardIndexArray.count < Board.MAX_PLAYER_CARD_COUNT
    }
    
    func getBankerNextCard() -> Card? {
        var nextBankerCardIndex:Int
        repeat {
            // Get the new card index not used
            nextBankerCardIndex = (mRandomNumber?.nextInt())!
        } while self.mSelectedMyCardIndexArray.contains(nextBankerCardIndex) || self.mSelectedBankerCardIndexArray.contains(nextBankerCardIndex)
        
        self.mSelectedBankerCardIndexArray.append(nextBankerCardIndex)
        
        return self.mAllCardArray[nextBankerCardIndex]
    }
    
    func getBankerNextCardIndex() -> Int {
        return self.mSelectedBankerCardIndexArray.count
    }
    
    func isBankerNextCardAvailable() -> Bool {
        return self.mSelectedBankerCardIndexArray.count < Board.MAX_PLAYER_CARD_COUNT
    }
    
    func reset() {
        self.mSelectedMyCardIndexArray.removeAll()
        self.mSelectedBankerCardIndexArray.removeAll()
    }
    
}
