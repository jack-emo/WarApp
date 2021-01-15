//
//  ViewController.swift
//  emoJack_warAPP
//
//  Created by Period Two on 2018-11-06.
//  Copyright © 2018 Period Two. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // declaration of outlets
    @IBOutlet weak var playerOne: UIImageView!
    @IBOutlet weak var playerTwo: UIImageView!
    
    @IBOutlet weak var playerOneWarOne: UIImageView!
    @IBOutlet weak var playerOneWarTwo: UIImageView!
    
    @IBOutlet weak var playerOneWarThree: UIImageView!
   
    @IBOutlet weak var playerTwoWarOne: UIImageView!
    
    @IBOutlet weak var playerTwoWarTwo: UIImageView!
    
    @IBOutlet weak var playerTwoWarThree: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var playerOneCardLabel: UILabel!
    @IBOutlet weak var playerTwoCardLabel: UILabel!
    @IBOutlet weak var playerOneScoreLabel: UILabel!
    
    @IBOutlet weak var playerTwoScoreLabel: UILabel!
    //declaration of booleans
    var win = false
    var tie = false
    var lose = false
    //declaration of variables
    var randomNumber = 0
    var random = 0
    var playerOneScore: Int = 0
    var playerTwoScore: Int = 0
    var playerOneCardValue: Int = 0
    var playerTwoCardValue: Int = 0
    
    var upperLimit = 51
    var cardDeck: [UIImage: Int] = [:]
    //arrays
    var imageCards: [UIImage] = []
    var playerDeck: [UIImage] = []
    var currentCard = 0
    var currentCard2 = 0
    var P1W1 = 0
    var P1W2 = 0
    var P1W3 = 0
    var P2W1 = 0
    var P2W2 = 0
    var P2W3 = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "greenFeltBackground 2.jpg"))
        //shuffling all the cards when the app loads
        //the dictionary
        cardDeck = [#imageLiteral(resourceName: "2Clubs.png"):2,#imageLiteral(resourceName: "2Diamonds.png"):2,#imageLiteral(resourceName: "2Hearts.png"):2,#imageLiteral(resourceName: "2Spades.png"):2, #imageLiteral(resourceName: "3Clubs.png"):3, #imageLiteral(resourceName: "3Diamonds.png"):3, #imageLiteral(resourceName: "3Hearts.png"):3,#imageLiteral(resourceName: "3Spades.png") :3,#imageLiteral(resourceName: "4Clubs.png") :4, #imageLiteral(resourceName: "4Diamonds.png"):4,#imageLiteral(resourceName: "4Hearts.png") :4,#imageLiteral(resourceName: "4Spades.png") :4, #imageLiteral(resourceName: "5Clubs.png"):5,#imageLiteral(resourceName: "5Diamonds.png") :5, #imageLiteral(resourceName: "5Hearts.png"):5,#imageLiteral(resourceName: "5Spades.png") :5, #imageLiteral(resourceName: "6Clubs.png"):6, #imageLiteral(resourceName: "6Diamonds.png"):6, #imageLiteral(resourceName: "6Hearts.png"):6, #imageLiteral(resourceName: "6Spades.png"):6, #imageLiteral(resourceName: "7Clubs.png"):7,#imageLiteral(resourceName: "7Diamonds.png") :7, #imageLiteral(resourceName: "7Hearts.png"):7, #imageLiteral(resourceName: "7Spades.png"):7, #imageLiteral(resourceName: "8Clubs.png"):8, #imageLiteral(resourceName: "8Diamonds.png"):8, #imageLiteral(resourceName: "8Hearts.png"):8,#imageLiteral(resourceName: "8Spades.png") :8,#imageLiteral(resourceName: "9Clubs.png") :9, #imageLiteral(resourceName: "9Diamonds.png"):9,#imageLiteral(resourceName: "9Hearts.png") :9,#imageLiteral(resourceName: "9Spades.png") :9,#imageLiteral(resourceName: "10Clubs.png") :10, #imageLiteral(resourceName: "10Diamonds.png"):10,#imageLiteral(resourceName: "10Hearts.png") :10,#imageLiteral(resourceName: "10Spades.png") :10, #imageLiteral(resourceName: "JackClubs.png"):11, #imageLiteral(resourceName: "JackDiamonds.png"):11, #imageLiteral(resourceName: "JackHearts.png"):11, #imageLiteral(resourceName: "JackSpades.png"):11,#imageLiteral(resourceName: "QueenClubs.png") :12,#imageLiteral(resourceName: "QueenDiamonds.png") :12,#imageLiteral(resourceName: "QueenHearts.png") :12,#imageLiteral(resourceName: "QueenSpades.png") :12,#imageLiteral(resourceName: "KingClubs.png") :13,#imageLiteral(resourceName: "KingDiamonds.png") :13, #imageLiteral(resourceName: "KingHearts.png"):13,#imageLiteral(resourceName: "KingSpades.png") :13,#imageLiteral(resourceName: "AceClubs.png") :14,#imageLiteral(resourceName: "AceDiamonds.png") :14,#imageLiteral(resourceName: "AceHearts.png") :14,#imageLiteral(resourceName: "AceSpades.png") :14]
        imageCards = Array(cardDeck.keys)
        shuffle()
        
    }
    
    //this is my shuffle routine
    func shuffle () {
        for _ in 0...upperLimit{
            randomNumber = Int.random(in: 0...upperLimit)
            playerDeck.append(imageCards[randomNumber])
            imageCards.remove(at: randomNumber)
            upperLimit -= 1
        }
    }
    //the dealing of the cards when the play buton is pressed
    @IBAction func playButtonPressed(_ sender: Any) {
        //puts the cards onto the imageview
        playerOne.image = playerDeck[0]
        playerTwo.image = playerDeck[1]
        //removes the cards from the deck taht are on the imageview
        let firstCard = playerDeck.remove(at: 0)
        let secondCard = playerDeck.remove(at: 0)
        //the comparison of the two removed cards
        if let num1 = cardDeck.removeValue(forKey: firstCard){
            currentCard = num1
            playerOneCardLabel.text = String(currentCard)
        }
        if let num2 = cardDeck.removeValue(forKey: secondCard) {
            currentCard2 = num2
            playerTwoCardLabel.text = String(currentCard2)
        }
        //scoring system for the two cards
        if currentCard > currentCard2 {
            //hiding the war images because it inst a war
            playerOneWarOne.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarTwo.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarThree.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarOne.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarTwo.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarThree.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarOne.isHidden = true
            playerOneWarTwo.isHidden = true
            playerOneWarThree.isHidden = true
            playerTwoWarOne.isHidden = true
            playerTwoWarTwo.isHidden = true
            playerTwoWarThree.isHidden = true
            playerOneScore += 2
            playerOneScoreLabel.text = String(playerOneScore)
            //transitions
            UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        } else if currentCard2 > currentCard {
            //hiding the war because it isnt a war
            playerOneWarOne.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarTwo.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarThree.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarOne.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarTwo.image = #imageLiteral(resourceName: "CardBack")
            playerTwoWarThree.image = #imageLiteral(resourceName: "CardBack")
            playerOneWarOne.isHidden = true
            playerOneWarTwo.isHidden = true
            playerOneWarThree.isHidden = true
            playerTwoWarOne.isHidden = true
            playerTwoWarTwo.isHidden = true
            playerTwoWarThree.isHidden = true
            playerTwoScore += 2
            playerTwoScoreLabel.text = String(playerTwoScore)
            //transitions for cards
            UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        } else if currentCard == currentCard2 && playerDeck.count > 6 {
            //transitions for cards
            UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarThree, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarThree, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            //revealing the war images
            playerOneWarOne.isHidden = false
            playerOneWarTwo.isHidden = false
            playerOneWarThree.isHidden = false
            playerTwoWarOne.isHidden = false
            playerTwoWarTwo.isHidden = false
            playerTwoWarThree.isHidden = false
            
            playerOneWarOne.image = playerDeck[0]
            playerOneWarTwo.image = playerDeck[1]
            playerOneWarThree.image = playerDeck[2]
            playerTwoWarOne.image = playerDeck[3]
            playerTwoWarTwo.image = playerDeck[4]
            playerTwoWarThree.image = playerDeck[5]
            
            let player1War1Card = playerDeck.remove(at: 0)
            let player1War2Card = playerDeck.remove(at: 0)
            let player1War3Card = playerDeck.remove(at: 0)
            let player2War1Card = playerDeck.remove(at: 0)
            let player2War2Card = playerDeck.remove(at: 0)
            let player2War3Card = playerDeck.remove(at: 0)
            
            if let num3 = cardDeck.removeValue(forKey: player1War1Card) {
                P1W1 = num3
            }
            if let num4 = cardDeck.removeValue(forKey: player1War2Card) {
                P1W2 = num4
            }
            if let num5 = cardDeck.removeValue(forKey: player1War3Card) {
                P1W3 = num5
            }
            if let num6 = cardDeck.removeValue(forKey: player2War1Card) {
                P2W1 = num6
            }
            if let num7 = cardDeck.removeValue(forKey: player2War2Card) {
                P2W2 = num7
            }
            if let num8 = cardDeck.removeValue(forKey: player2War3Card) {
                P2W3 = num8
            }
            let totalWar1 = P1W1 + P1W2 + P1W3
            let totalWar2 = P2W1 + P2W2 + P2W3
            playerOneCardLabel.text = String(totalWar1)
            playerTwoCardLabel.text = String(totalWar2)
            //deciding who won the war
            if totalWar1 > totalWar2 {
                playerOneScore += 2
                playerOneScoreLabel.text = String(playerOneScore)
            } else if totalWar2 > totalWar1 {
                playerTwoScore += 2
                playerTwoScoreLabel.text = String(playerTwoScore)
            } else {
                playerOneScore += 0
                playerOneScoreLabel.text = String(playerOneScore)
                playerTwoScore += 0
                playerTwoScoreLabel.text = String(playerTwoScore)
            }
            
        } else if currentCard == currentCard2 && playerDeck.count <= 6 &&  playerDeck.count >= 4 {
            //transitions for the cards
            UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            //making all the war images false
            playerOneWarOne.isHidden = false
            playerOneWarTwo.isHidden = false
            playerTwoWarOne.isHidden = false
            playerTwoWarTwo.isHidden = false
            playerOneWarOne.image = playerDeck[0]
            playerOneWarTwo.image = playerDeck[1]
            playerTwoWarOne.image = playerDeck[2]
            playerTwoWarTwo.image = playerDeck[3]
            let player1War1CardV2 = playerDeck.remove(at: 0)
            let player1War2CardV2 = playerDeck.remove(at: 0)
            let player2War1CardV2 = playerDeck.remove(at: 0)
            let player2War2CardV2 = playerDeck.remove(at: 0)
            if let num9 = cardDeck.removeValue(forKey: player1War1CardV2) {
                P1W1 = num9
            }
            if let num10 = cardDeck.removeValue(forKey: player1War2CardV2) {
                P1W2 = num10
            }
            if let num11 = cardDeck.removeValue(forKey: player2War1CardV2) {
                P2W1 = num11
            }
            if let num12 = cardDeck.removeValue(forKey: player2War2CardV2) {
                P2W2 = num12
            }
            let totalWar1V2 = P1W1 + P1W2
            let totalWar2V2 = P2W1 + P2W2
            playerOneCardLabel.text = String(totalWar1V2)
            playerTwoCardLabel.text = String(totalWar2V2)
            //figuring out who won the war
            if totalWar1V2 > totalWar2V2 {
                playerOneScore += 2
                playerOneScoreLabel.text = String(playerOneScore)
            } else if totalWar2V2 > totalWar1V2 {
                playerTwoScore += 2
                playerTwoScoreLabel.text = String(playerTwoScore)
            } else {
                playerOneScore += 0
                playerOneScoreLabel.text = String(playerOneScore)
                playerTwoScore += 0
                playerTwoScoreLabel.text = String(playerTwoScore)
            }

            
        }
        else if currentCard == currentCard2 && playerDeck.count <= 3 &&  playerDeck.count >= 1 {
            //transitions
            UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerOneWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            UIView.transition(with: playerTwoWarOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
            //reevealing the war iamges
            playerOneWarOne.isHidden = false
             playerTwoWarOne.isHidden = false
            playerOneWarOne.image = playerDeck[0]
            playerTwoWarOne.image = playerDeck[1]
            let player1War1CardV3 = playerDeck.remove(at: 0)
            let player2War1CardV3 = playerDeck.remove(at: 0)
            if let num14 = cardDeck.removeValue(forKey: player1War1CardV3) {
                P1W1 = num14
            }
            if let num15 = cardDeck.removeValue(forKey: player2War1CardV3) {
                P2W1 = num15
            }
            let totalWar1V3 = P1W1
            let totalWar2V3 = P2W1
            playerOneCardLabel.text = String(totalWar1V3)
            playerTwoCardLabel.text = String(totalWar2V3)
            //deciding who won the war
            if totalWar1V3 > totalWar2V3 {
                playerOneScore += 2
                playerOneScoreLabel.text = String(playerOneScore)
            } else if totalWar2V3 > totalWar1V3 {
                playerTwoScore += 2
                playerTwoScoreLabel.text = String(playerTwoScore)
            } else {
                playerOneScore += 0
                playerOneScoreLabel.text = String(playerOneScore)
                playerTwoScore += 0
                playerTwoScoreLabel.text = String(playerTwoScore)
            }
        }
        else {
            print("error")
        }
        //this is what happens when the game is over
        if playerDeck.count == 0 {
            resetButton.isEnabled = true
            playButton.isEnabled = false
            //the alert when the game ends
            let alert = UIAlertController(title: "Game Over", message: "You finished the game. Player One had \(playerOneScore) points and player Two had \(playerTwoScore) points.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true)
        }
        
    }
    func reset() {
        //my reset function which will reset all the values to default when called out
        win = false
        tie = false
        lose = false
        randomNumber  = 0
        random = 0
        upperLimit = 51
        playerOneScore = 0
        playerTwoScore = 0
        playerOneCardValue  = 0
        playerTwoCardValue  = 0
        P1W1 = 0
        P1W2 = 0
        P1W3 = 0
        P2W1 = 0
        P2W2 = 0
        P2W3 = 0
        playerOneWarOne.image = #imageLiteral(resourceName: "CardBack")
        playerOneWarTwo.image = #imageLiteral(resourceName: "CardBack")
        playerOneWarThree.image = #imageLiteral(resourceName: "CardBack")
        playerTwoWarOne.image = #imageLiteral(resourceName: "CardBack")
        playerTwoWarTwo.image = #imageLiteral(resourceName: "CardBack")
        playerTwoWarThree.image = #imageLiteral(resourceName: "CardBack")
        playerOneWarOne.isHidden = true
        playerOneWarTwo.isHidden = true
        playerOneWarThree.isHidden = true
        playerTwoWarOne.isHidden = true
        playerTwoWarTwo.isHidden = true
        playerTwoWarThree.isHidden = true
        cardDeck = [#imageLiteral(resourceName: "2Clubs.png"):2,#imageLiteral(resourceName: "2Diamonds.png"):2,#imageLiteral(resourceName: "2Hearts.png"):2,#imageLiteral(resourceName: "2Spades.png"):2, #imageLiteral(resourceName: "3Clubs.png"):3, #imageLiteral(resourceName: "3Diamonds.png"):3, #imageLiteral(resourceName: "3Hearts.png"):3,#imageLiteral(resourceName: "3Spades.png") :3,#imageLiteral(resourceName: "4Clubs.png") :4, #imageLiteral(resourceName: "4Diamonds.png"):4,#imageLiteral(resourceName: "4Hearts.png") :4,#imageLiteral(resourceName: "4Spades.png") :4, #imageLiteral(resourceName: "5Clubs.png"):5,#imageLiteral(resourceName: "5Diamonds.png") :5, #imageLiteral(resourceName: "5Hearts.png"):5,#imageLiteral(resourceName: "5Spades.png") :5, #imageLiteral(resourceName: "6Clubs.png"):6, #imageLiteral(resourceName: "6Diamonds.png"):6, #imageLiteral(resourceName: "6Hearts.png"):6, #imageLiteral(resourceName: "6Spades.png"):6, #imageLiteral(resourceName: "7Clubs.png"):7,#imageLiteral(resourceName: "7Diamonds.png") :7, #imageLiteral(resourceName: "7Hearts.png"):7, #imageLiteral(resourceName: "7Spades.png"):7, #imageLiteral(resourceName: "8Clubs.png"):8, #imageLiteral(resourceName: "8Diamonds.png"):8, #imageLiteral(resourceName: "8Hearts.png"):8,#imageLiteral(resourceName: "8Spades.png") :8,#imageLiteral(resourceName: "9Clubs.png") :9, #imageLiteral(resourceName: "9Diamonds.png"):9,#imageLiteral(resourceName: "9Hearts.png") :9,#imageLiteral(resourceName: "9Spades.png") :9,#imageLiteral(resourceName: "10Clubs.png") :10, #imageLiteral(resourceName: "10Diamonds.png"):10,#imageLiteral(resourceName: "10Hearts.png") :10,#imageLiteral(resourceName: "10Spades.png") :10, #imageLiteral(resourceName: "JackClubs.png"):11, #imageLiteral(resourceName: "JackDiamonds.png"):11, #imageLiteral(resourceName: "JackHearts.png"):11, #imageLiteral(resourceName: "JackSpades.png"):11,#imageLiteral(resourceName: "QueenClubs.png") :12,#imageLiteral(resourceName: "QueenDiamonds.png") :12,#imageLiteral(resourceName: "QueenHearts.png") :12,#imageLiteral(resourceName: "QueenSpades.png") :12,#imageLiteral(resourceName: "KingClubs.png") :13,#imageLiteral(resourceName: "KingDiamonds.png") :13, #imageLiteral(resourceName: "KingHearts.png"):13,#imageLiteral(resourceName: "KingSpades.png") :13,#imageLiteral(resourceName: "AceClubs.png") :14,#imageLiteral(resourceName: "AceDiamonds.png") :14,#imageLiteral(resourceName: "AceHearts.png") :14,#imageLiteral(resourceName: "AceSpades.png") :14]
        playerDeck = []
        imageCards = Array(cardDeck.keys)
        resetButton.isEnabled = false
        playButton.isEnabled = true
        playerOneScoreLabel.text = "0"
        playerTwoScoreLabel.text = "0"
        playerTwoCardLabel.text = "0"
        playerOneCardLabel.text = "0"
        playerOne.image = #imageLiteral(resourceName: "CardBack")
        playerTwo.image = #imageLiteral(resourceName: "CardBack")
        shuffle()
        //transitions
        UIView.transition(with: playerOne, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
        UIView.transition(with: playerTwo, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
    }
    //the reset button resets all the values to 0
    @IBAction func resetButtonPressed(_ sender: Any) {
        reset()
    }
    
}

