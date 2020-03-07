//
//  Hangman.swift
//  Hangman
//
//  Created by Jackson Chui on 2/20/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation
import AVFoundation

class Hangman {
    var player: AVAudioPlayer?
    var timeGuessedWrong = 0
    var characterGuesses = Set<String>()
    var wordLabelText = ""
    var displayLabelText = ""
    var wordLength = 0
    var lastGuessed = ""
    var correctGuess = 0
    var wordDic: [String:String] = [:]
    var wwdcArray:[String]!
    
    init() {
    if let URL = Bundle.main.url(forResource: "wordlist", withExtension: "plist") {
            if let englishFromPlist = NSDictionary(contentsOf: URL) as? [String:String] {
                self.wordDic = englishFromPlist
                }
        }
        self.wwdcArray = Array(self.wordDic.keys.map{$0})
        let randPhrase = randomPhrase()
        self.wordLabelText = randPhrase[0]
        self.displayLabelText = randPhrase[1]
        
    }
    // MARK: - Your Code Here
    func randomPhrase() -> [String] {
        var displayPhrase: String = ""
        let randomInt = Int.random(in: 0..<self.wwdcArray.count)
        let phrase = self.wwdcArray[randomInt]
        for s in phrase {
            if s != " " {
                displayPhrase.append("_")
                self.wordLength += 1
            } else {
                displayPhrase.append(" ")
            }
        }
        return [phrase, displayPhrase]
    }
    func updateLabels(){
        if !self.characterGuesses.contains(self.lastGuessed) {
            self.characterGuesses.insert(self.lastGuessed)
            var newStringToDisplay = ""
            for i in 0..<self.wordLabelText.count {
                let originalStrIndex = self.wordLabelText.index(self.wordLabelText.startIndex, offsetBy: i)
                let dispStrIndex = self.displayLabelText.index(self.displayLabelText.startIndex, offsetBy: i)
                let orgChar = self.wordLabelText[originalStrIndex]
                let dispChar = self.displayLabelText[dispStrIndex]
                if self.lastGuessed == String(orgChar).lowercased() {
                    newStringToDisplay.append(orgChar)
                    self.correctGuess += 1
                    self.characterGuesses.insert(String(orgChar).lowercased())
                } else {
                    newStringToDisplay.append(dispChar)
                }
            }
            
            if !self.wordLabelText.lowercased().contains(self.lastGuessed) {
                self.timeGuessedWrong += 1
            }
            self.displayLabelText = newStringToDisplay
        }
    }
    func checkLoseStatus() -> Bool{
        if self.timeGuessedWrong >= 6 {
            return true
        }
        return false
    }
    
    func checkWinStatus() -> Bool {
        var win = false
        if !checkLoseStatus() {
            for s in self.displayLabelText {
                if s == "_" {
                    return win
                }
            }
            win = true
        }
        return win
    }
    
    func playsound() {
        let url = Bundle.main.url(forResource: self.wordDic[self.wordLabelText], withExtension: "mp3")!
        do {
            player = try AVAudioPlayer(contentsOf: url)
            guard let player = player else { return }
            player.prepareToPlay()
            player.play()

        } catch let error as NSError {
            print(error.description)
        }
    }
}

