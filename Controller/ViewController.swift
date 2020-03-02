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
//    var timeGuessed = 0
//    var characterGuesses = Set<String>()
//    var wordLabelText = ""
//    var displayLabelText = ""
//    var wordLength = 0
//    var lastGuessed = ""
    // MARK: - IBActions
    @IBAction func buttonPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            hangman.lastGuessed = "q"
        case 1:
            hangman.lastGuessed = "w"
        case 2:
            hangman.lastGuessed = "e"
        case 3:
            hangman.lastGuessed = "r"
        case 4:
            hangman.lastGuessed = "t"
        case 5:
            hangman.lastGuessed = "y"
        case 6:
            hangman.lastGuessed = "u"
        case 7:
            hangman.lastGuessed = "i"
        case 8:
            hangman.lastGuessed = "o"
        case 9:
            hangman.lastGuessed = "p"
        case 10:
            hangman.lastGuessed = "a"
        case 11:
            hangman.lastGuessed = "s"
        case 12:
            hangman.lastGuessed = "d"
        case 13:
            hangman.lastGuessed = "f"
        case 14:
            hangman.lastGuessed = "g"
        case 15:
            hangman.lastGuessed = "h"
        case 16:
            hangman.lastGuessed = "j"
        case 17:
            hangman.lastGuessed = "k"
        case 18:
            hangman.lastGuessed = "l"
        case 19:
            hangman.lastGuessed = "z"
        case 20:
            hangman.lastGuessed = "x"
        case 21:
            hangman.lastGuessed = "c"
        case 22:
            hangman.lastGuessed = "v"
        case 23:
            hangman.lastGuessed = "b"
        case 24:
            hangman.lastGuessed = "n"
        case 25:
            hangman.lastGuessed = "m"
        default:
            hangman.lastGuessed = ""
        }
        if !hangman.checkLoseStatus() {
            playTurn()
        } else {
            endGame()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        firstLoadPhrase()
        loadGuessLabel()
        hangmanImage.image = UIImage(named: "hangman\(hangman.timeGuessedWrong + 1)")
    }
    
    // MARK: - Class Methods
    
    private func reset() -> Void { return }
    
    private func playTurn() -> Void {
        updateLabels()
        updateImage()
        
    }
    
    private func endGame() -> Void {
        if hangman.checkWinStatus() {
            //need to implement
        }
        
    }
    
    private func updateLabels() {
        hangman.updateLabels()
        loadPhrase()
        loadGuessLabel()
    }
    
    private func firstLoadPhrase() {
        let randomPhraseArr = hangman.randomPhrase()
        hangman.wordLabelText = randomPhraseArr[0]
        hangman.displayLabelText = randomPhraseArr[1]
        wordLabel.text = hangman.wordLabelText
        displayLabel.attributedText = NSAttributedString(string: hangman.displayLabelText, attributes: [NSAttributedString.Key.kern: 5.0])
        hangman.wordLength = hangman.wordLabelText.count
    }
    /*
        Load the phrase with spacing constrains
     */
    private func loadPhrase() {
        displayLabel.attributedText = NSAttributedString(string: hangman.displayLabelText, attributes: [NSAttributedString.Key.kern: 5.0])
    }
    
    /*
        Load the phrase for how many time guessed wrong
     */
    private func loadGuessLabel() {
        timeGuessedLabel.text = "You have guessed wrong \(hangman.timeGuessedWrong) time(s)"
    }
    /*
        Update the Image
     */
    private func updateImage() {
        let imageName = "hangman\(hangman.timeGuessedWrong + 1)"
        self.hangmanImage.image = UIImage(named: imageName)
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
