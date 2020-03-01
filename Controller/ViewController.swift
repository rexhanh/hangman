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
    // MARK: - IBActions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadPhrase()
        loadLabels()
        hangmanImage.image = UIImage(named: "hangman1")
    }
    
    // MARK: - Class Methods
    
    private func reset() -> Void { return }
    private func playTurn() -> Void { return }
    private func endGame() -> Void { return }

    
    private func loadPhrase() {
        let randomPhraseArr = hangman.randomPhrase()
        self.wordLabelText = randomPhraseArr[0]
        self.displayLabelText = randomPhraseArr[1]
        wordLabel.text = self.wordLabelText
        displayLabel.text = displayLabelText
        self.wordLength = self.wordLabelText.count
    }
    
    private func loadLabels() {
        timeGuessedLabel.text = "You have guessed \(self.timeGuessed) time(s)"
    }
    
    func updateDisplayPhrase() {
        
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
