//
//  ViewController.swift
//  FractionCalc
//
//  Created by FPrimeC on 2021-12-21.
//

import UIKit

class ViewController: UIViewController {

    var leftSideNumStr = ""
    var rightSideNumStr = ""
    var workingOn = WorkingOn.leftSide
    var operation : Character?
    var displayTextString = ""
    
    @IBOutlet weak var calctextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func numberKeyPressed(_ sender: UIButton) {
        switch sender.tag {
        case 0...9:
            print("\(sender.tag)")
            if workingOn == .leftSide {
                leftSideNumStr.append("\(sender.tag)")
                calctextView.text = leftSideNumStr
            }
            else {
                rightSideNumStr.append("\(sender.tag)")
                calctextView.text = rightSideNumStr
            }
        case 10:
            print(".")
            if workingOn == .leftSide {
                if leftSideNumStr.contains(".") {
                } else {
                    leftSideNumStr.append(".")
                    calctextView.text = leftSideNumStr
                }
            }
            else {
                if rightSideNumStr.contains(".") {
                } else {
                    rightSideNumStr.append(".")
                    calctextView.text = rightSideNumStr
                }
            }

        default:
            break
        }
    }
    
    @IBAction func discardNumberPressed(_ sender: UIButton) {
        if workingOn == .leftSide {
            leftSideNumStr = String(leftSideNumStr.dropLast())
            calctextView.text = leftSideNumStr
        } else {
            rightSideNumStr = String(rightSideNumStr.dropLast())
            calctextView.text = rightSideNumStr
        }
    }
    
    @IBAction func operationBtnPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            operation = "+"
        case 2:
            operation = "-"
        case 3:
            operation = "*"
        case 4:
            operation = "/"
        default:
            break
        }
    }
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func positiveNegativeBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func equalSignPressed(_ sender: UIButton) {
    }
    
}


extension String {
    var floatValue: Float {
        return (self as NSString).floatValue
    }
}

extension String {
    var intValue: Int {
        return (self as NSString).integerValue
    }
}

enum WorkingOn {
    case leftSide
    case rightSide
}
