//
//  ViewController.swift
//  MyFirstApp
//
//  Created by abibulla on 22.03.2023.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emodji1.shuffle()
        gameover.isHidden = true
    }
    
    @IBOutlet weak var gameover: UIImageView!
    @IBOutlet weak var score: UILabel!
    var scoreCounter = 0
    
    @IBAction func restart(_ sender: UIButton) {
        for i in 0...11 {
            flipButtons[i].backgroundColor = .black
            flipButtons[i].isEnabled = true
            flipButtons[i].setTitle("", for: .normal)
        }
        emodji1.shuffle()
        scoreCounter = 0
        score.text = "Score: 0"
        gameover.isHidden = true
    }
    
    var emodji1 = ["😇", "🤩", "🥳", "🥶", "😶‍🌫️", "🫡", "😇", "🤩", "🥳", "🥶", "😶‍🌫️", "🫡"]
    
    @IBOutlet var flipButtons: [UIButton]!
    
    @IBOutlet weak var flipButton1: UIButton!
    func flipButton(emodji: String, sender: UIButton) {
        if sender.backgroundColor == .black {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.01) {
                sender.backgroundColor = .orange
                sender.setTitle(emodji, for: .normal)
                sender.titleLabel?.bounds = CGRect(x: sender.bounds.origin.x - 10, y: sender.bounds.height - 10, width: sender.bounds.width + 20, height: 0)
            }
            
        }else {
            sender.backgroundColor = .black
            sender.setTitle("", for: .normal)
        }
    }
    
    @IBAction func Flip(_ sender: UIButton) {
        //        if flipButton1.backgroundColor == .black {
        //            flipButton1.backgroundColor = .orange
        //            flipButton1.setTitle("😎", for: .normal)
        //        }else {
        //            flipButton1.backgroundColor = .black
        //            flipButton1.setTitle("", for: .normal)
        //        }
        //    }
        let index = flipButtons.firstIndex(of: sender)!
        flipButton(emodji: emodji1[index], sender: sender)
        
        scoreCounter += 1
        score.text = "Score: \(scoreCounter)"
        if scoreCounter == 20 {
            for i in 0...11 {
                flipButtons[i].isEnabled = false
                flipButtons[i].backgroundColor = .clear
            }
            gameover.isHidden = false
        }
        var counter: [Int] = []
        for i in 0...flipButtons.count-1 {
            if flipButtons[i].backgroundColor == .orange {
                counter.append(i)
            }
        }
        if counter.count == 2 {
            if flipButtons[counter[0]].title(for: .normal) == flipButtons[counter[1]].title(for: .normal) {
                flipButtons[counter[0]].backgroundColor = .clear
                flipButtons[counter[1]].backgroundColor = .clear
                flipButtons[counter[0]].setTitle("", for: .normal)
                flipButtons[counter[1]].setTitle("", for: .normal)
                flipButtons[counter[0]].isEnabled = false
                flipButtons[counter[1]].isEnabled = false
            }
        } else if counter.count < 2 {
            //ничего не делаем, оставляем пустоту
        } else {
            for i in counter {
                if flipButtons[i] != sender {
                    flipButton(emodji: "", sender: flipButtons[i])
                }
            }
        }
    }
}

