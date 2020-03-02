//
//  Hangman.swift
//  Hangman
//
//  Created by Jackson Chui on 2/20/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import Foundation

class Hangman {
    var timeGuessedWrong = 0
    var characterGuesses = Set<String>()
    var wordLabelText = ""
    var displayLabelText = ""
    var wordLength = 0
    var lastGuessed = ""
    var correctGuess = 0
    let wwdcArray:[String] = [
        "Good morning",
        "We have developers here",
        "June Fourth",
        "World Wide Developers Conference",
        "San Jose Convention Center",
        "App Store turns ten",
        "This is mind blowing",
        "This is beyond remarkable",
        "the power of code",
        "Everyone Can Code",
        "changing the world",
        "Today is all about software",
        "Craig Federighi",
        "Hair Force One",
        "tens of millions of students",
        "Swift on the App Store",
        "fastest growing programming language",
        "Swift Playgrounds",
        "group of creators",
        "The App Store",
        "Your creativity and hard work",
        "Tim Cook",
        "Split View",
        "Drag and Drop",
        "Slide Over",
        "ARKit",
        "Find My",
        "iMessage",
        "Airpods Pro",
        "Voice Memos",
        "Apple News",
        "Do Not Disturb",
        "Apple Park",
        "Apple Watch Series",
        "Siri Shortcuts",
        "macOS Mojave",
        "macOS Catalina",
        "macOS High Sierra",
        "AMD Vega Pro",
        "Macbook Pro",
        "Core ML",
        "iMac Pro"
    ]
    
    // MARK: - Your Code Here
    func randomPhrase() -> [String] {
        var displayPhrase: String = ""
        let randomInt = Int.random(in: 0..<self.wwdcArray.count)
        let phrase = self.wwdcArray[randomInt]
        for s in phrase {
            if s != " " {
                displayPhrase.append("_")
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
        if self.correctGuess == self.wordLength {
            return true
        }
        return false
    }
    
}

