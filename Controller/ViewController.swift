//
//  HangmanViewController
//  Hangman
//
//  Created by iOS Decal on Feb 11 2020.
//  Copyright © 2020 iosdecal. All rights reserved.
//

import UIKit

class HangmanViewController: UIViewController {

    // MARK: - Instances: Models
    var hangman = Hangman()
    
    // MARK: - IBOutlets
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var timeGuessedLabel: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    
    // MARK: - Class Props/Vars
    var timeGuessed = 0
    var characterGuesses = Set<String>()
    var wordLabelText = ""
    var displayLabelText = ""
    var wordLength = 0
    var lastGuessed = ""
    
    // MARK: - IBActions
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.lastGuessed = "q"
        case 1:
            self.lastGuessed = "w"
        case 2:
            self.lastGuessed = "e"
        case 3:
            self.lastGuessed = "r"
        case 4:
            self.lastGuessed = "t"
        case 5:
            self.lastGuessed = "y"
        case 6:
            self.lastGuessed = "u"
        case 7:
            self.lastGuessed = "i"
        case 8:
            self.lastGuessed = "o"
        case 9:
            self.lastGuessed = "p"
        case 10:
            self.lastGuessed = "a"
        case 11:
            self.lastGuessed = "s"
        case 12:
            self.lastGuessed = "d"
        case 13:
            self.lastGuessed = "f"
        case 14:
            self.lastGuessed = "g"
        case 15:
            self.lastGuessed = "h"
        case 16:
            self.lastGuessed = "j"
        case 17:
            self.lastGuessed = "k"
        case 18:
            self.lastGuessed = "l"
        case 19:
            self.lastGuessed = "z"
        case 20:
            self.lastGuessed = "x"
        case 21:
            self.lastGuessed = "c"
        case 22:
            self.lastGuessed = "v"
        case 23:
            self.lastGuessed = "b"
        case 24:
            self.lastGuessed = "n"
        case 25:
            self.lastGuessed = "m"
        default:
            self.lastGuessed = ""
        }
        
        playTurn()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstLoadPhrase()
        loadGuessLabel()
        hangmanImage.image = UIImage(named: "hangman\(self.timeGuessed + 1)")
    }
    
    // MARK: - Class Methods
    
    private func reset() -> Void { return }
    private func playTurn() -> Void {
        updateLabels()
        return }
    private func endGame() -> Void { return }
    
    private func updateLabels() {
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
                    self.characterGuesses.insert(String(orgChar).lowercased())
                } else {
                    newStringToDisplay.append(dispChar)
                }
            }
            
            if !self.wordLabelText.lowercased().contains(self.lastGuessed) {
                self.timeGuessed += 1
            }
            print(self.characterGuesses)
            self.displayLabelText = newStringToDisplay
            loadPhrase()
            loadGuessLabel()
        }
    }
    
    
    private func firstLoadPhrase() {
        let randomPhraseArr = hangman.randomPhrase()
        self.wordLabelText = randomPhraseArr[0]
        self.displayLabelText = randomPhraseArr[1]
        wordLabel.text = self.wordLabelText
        displayLabel.attributedText = NSAttributedString(string: displayLabelText, attributes: [NSAttributedString.Key.kern: 5.0])
        self.wordLength = self.wordLabelText.count
    }
    
    private func loadPhrase() {
         displayLabel.attributedText = NSAttributedString(string: displayLabelText, attributes: [NSAttributedString.Key.kern: 5.0])
    }
    
    private func loadGuessLabel() {
        timeGuessedLabel.text = "You have guessed wrong \(self.timeGuessed) time(s)"
    }
    
    // Optional Example Code, but might be useful...
    
    
    /* PREPARING AND PRESENTING A SEGUE (TRANSITION)
     ... { _ in
         // Segue to the high score screen
         CATransaction.setCompletionBlock({
             self.performSegue(withIdentifier: "ExampleSegue", sender: nil)
         })
     }
     
    self.present(endGameAlert, animated: true, completion: nil)
     
     
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // 1. Get the new view controller using segue.destination.
        // 2. Pass the selected object to the new view controller.
        if let dest = segue.destination as? EndGameViewController {
            dest.userScore = counter
        }
    */
    
}
