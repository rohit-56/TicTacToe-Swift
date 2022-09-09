//
//  ViewController.swift
//  TicTacToe
//
//  Created by Rohit Sharma on 08/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    enum Turn{
        case zero
        case cross
    }
    @IBOutlet weak var labelOfTurn: UILabel!
    
    @IBOutlet weak var a1: UIButton!
    @IBOutlet weak var a2: UIButton!
    @IBOutlet weak var a3: UIButton!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var c1: UIButton!
    @IBOutlet weak var c2: UIButton!
    @IBOutlet weak var c3: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initializeBoard()
    }
    
    var firstTurn = Turn.cross
    var currentTurn = Turn.cross
    var board:[UIButton] = []
    var zero = "0"
    var cross = "X"
 
    func initializeBoard(){
        board.append(a1)
        board.append(a2)
        board.append(a3)
        board.append(b1)
        board.append(b2)
        board.append(b3)
        board.append(c1)
        board.append(c2)
        board.append(c3)
        
    }
    
    @IBAction func UIButton(_ sender: UIButton) {
        addToBoard(sender)
        
        if(isBoardFull()){
            resultAlert(title : "Draw")
        }
    }
    
    func resultAlert(title : String){
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: {(_) in self.resetBoard()}))
        self.present(ac, animated: true)
    }
    
    func resetBoard(){
        for button in board{
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
        
        if(firstTurn == Turn.cross){
            firstTurn = Turn.zero
            labelOfTurn.text = zero
        }
        else{
            firstTurn = Turn.cross
            labelOfTurn.text = cross
        }
        
        currentTurn = firstTurn
    }
    
    func isBoardFull() -> Bool{
        for button in board
        {
            if button.title(for: .normal) == nil
            {
                return false
            }
        }
        return true
    }
    
    func addToBoard(_ sender: UIButton){
        if(sender.title(for: .normal) == nil){
            if(currentTurn == Turn.cross){
                sender.setTitle(cross, for: .normal)
                currentTurn = Turn.zero
                labelOfTurn.text = zero
            }
            else if(currentTurn == Turn.zero){
                sender.setTitle(zero, for: .normal)
                currentTurn = Turn.cross
                labelOfTurn.text = cross
            }
            sender.isEnabled = false
        }
    }
}

