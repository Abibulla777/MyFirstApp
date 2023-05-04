//
//  TikTakTokViewController.swift
//  MyFirstApp
//
//  Created by abibulla on 25.03.2023.
//

import UIKit

class TikTakTokViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameover.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var gameover: UIImageView!
    @IBOutlet weak var winner: UILabel!
    @IBAction func restart(_ sender: UIButton) {
        for i in 0...8 {
            flipButtons[i].isEnabled = true
            flipButtons[i].setTitle("", for: .normal)
        }
        winner.text = ""
        player = 0
        gameover.isHidden = true
    }
    
    @IBOutlet var flipButtons: [UIButton]!
    @IBOutlet weak var flipButton: UIButton!
    
    var winnerArray = [[0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [2, 4, 6]]
    var player = 0
    @IBAction func clickButton(_ sender: UIButton) {
        player += 1
        if player % 2 == 0 {
            sender.setTitle("⭕️", for: .normal)
            sender.isEnabled = false
        } else {
            sender.setTitle("❌", for: .normal)
            sender.isEnabled = false
    
        }
        //второй вариант игры крестики - нолики
        var xArray: [Int] = []
        var oArray: [Int] = []
        for i in 0...8 {
            if flipButtons[i].title(for: .normal) == "❌" {
                xArray.append(i)
            }
            if flipButtons[i].title(for: .normal) == "⭕️" {
                oArray.append(i)
            }
        }
        for i in 0...7  {
            if xArray.contains(winnerArray[i][0]) && xArray.contains(winnerArray[i][1]) && xArray.contains(winnerArray[i][2]) {
                winner.text = "Winner is ❌"
                gameover.isHidden = false
                for j in 0...8 {
                    flipButtons[j].isEnabled = false
                    
                }
            }
                    if oArray.contains(winnerArray[i][0]) && oArray.contains(winnerArray[i][1]) && oArray.contains(winnerArray[i][2]) {
                        winner.text = "Winner is ⭕️"
                        gameover.isHidden = false
                        for j in 0...8 {
                            flipButtons[j].isEnabled = false
                        }
                    }
                }
                // первый вариант игры крестики - нолики
                //        if flipButtons[0].title(for: .normal) == flipButtons[3].title(for: .normal) && flipButtons[3].title(for: .normal) == flipButtons[6].title(for: .normal) && flipButtons[0].title(for: .normal) != nil && flipButtons[0].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[0].title(for: .normal)!
                //        }
                //        if flipButtons[1].title(for: .normal) == flipButtons[4].title(for: .normal) && flipButtons[4].title(for: .normal) == flipButtons[7].title(for: .normal) && flipButtons[1].title(for: .normal) != nil && flipButtons[1].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[1].title(for: .normal)!
                //        }
                //        if flipButtons[2].title(for: .normal) == flipButtons[5].title(for: .normal) && flipButtons[5].title(for: .normal) == flipButtons[8].title(for: .normal) && flipButtons[2].title(for: .normal) != nil && flipButtons[2].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[2].title(for: .normal)!
                //        }
                //        if flipButtons[0].title(for: .normal) == flipButtons[1].title(for: .normal) && flipButtons[1].title(for: .normal) == flipButtons[2].title(for: .normal) && flipButtons[0].title(for: .normal) != nil && flipButtons[0].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[0].title(for: .normal)!
                //        }
                //        if flipButtons[3].title(for: .normal) == flipButtons[4].title(for: .normal) && flipButtons[4].title(for: .normal) == flipButtons[5].title(for: .normal) && flipButtons[3].title(for: .normal) != nil && flipButtons[3].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[3].title(for: .normal)!
                //        }
                //        if flipButtons[6].title(for: .normal) == flipButtons[7].title(for: .normal) && flipButtons[7].title(for: .normal) == flipButtons[8].title(for: .normal) && flipButtons[6].title(for: .normal) != nil && flipButtons[6].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[6].title(for: .normal)!
                //        }
                //        if flipButtons[0].title(for: .normal) == flipButtons[4].title(for: .normal) && flipButtons[4].title(for: .normal) == flipButtons[8].title(for: .normal) && flipButtons[0].title(for: .normal) != nil && flipButtons[0].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[0].title(for: .normal)!
                //        }
                //        if flipButtons[2].title(for: .normal) == flipButtons[4].title(for: .normal) && flipButtons[4].title(for: .normal) == flipButtons[6].title(for: .normal) && flipButtons[2].title(for: .normal) != nil && flipButtons[2].title(for: .normal) != "" {
                //            winner.text = "Winner is" + flipButtons[2].title(for: .normal)!
                //        }
                //                }
                
                /*
                 // MARK: - Navigation
                 
                 // In a storyboard-based application, you will often want to do a little preparation before navigation
                 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                 // Get the new view controller using segue.destination.
                 // Pass the selected object to the new view controller.
                 }
                 */
            }
        }

