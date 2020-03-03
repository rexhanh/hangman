//
//  EndGameViewController.swift
//  Hangman
//
//  Created by Yuanrong Han on 3/1/20.
//  Copyright © 2020 Tim's Apples. All rights reserved.
//

import UIKit

class EndGameViewController: UIViewController {

    // MARK: IBOutlet
    @IBOutlet weak var endGameLabel: UILabel!
    @IBOutlet weak var unitQuoteLabel: UILabel!
    // MARK: Class var
    var hangman = Hangman(2)
    var endGameString = ""
    var unitQuote = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        endGameLabel.text = endGameString
        unitQuoteLabel.text = unitQuote
        // Do any additional setup after loading the view.
        self.hangman.playsound()
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
