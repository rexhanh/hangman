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
    @IBOutlet weak var engGameImageView: UIImageView!
    // MARK: Class var
    var hangman = Hangman()
    var endGameString = ""
    var unitQuote = ""
    var endGameImage: UIImage!
    override func viewDidLoad() {
        super.viewDidLoad()
        endGameLabel.text = endGameString
        unitQuoteLabel.text = unitQuote
        // Do any additional setup after loading the view.
        self.hangman.playsound()
        self.engGameImageView.image = endGameImage
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
