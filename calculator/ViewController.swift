//
//  ViewController.swift
//  calculator
//
//  Created by Fayez Ahmed on 4/1/17.
//  Copyright © 2017 fizzrecords. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    var screen_num:Double = 0;
    var previous:Double = 0;
    var math_done = false;
    var equal_pressed = false
    var operator_pressed:String = ""
    var operator_twice_pressed_check = 0
    
    
    @IBAction func numbers(_ sender: UIButton) {
        
        if math_done == true{
            if operator_twice_pressed_check > 1 {
                previous = Double(label.text!)!
            }
            label.text = String(sender.tag-1);
            screen_num = Double(label.text!)!;
            math_done = false;
        }
        else{
            if equal_pressed == true{
                label.text = ""
                equal_pressed = false
            }
            label.text = label.text! + String(sender.tag-1)
            screen_num = Double(label.text!)!
        }
    }
  
    @IBAction func operators(_ sender: UIButton) {
        if label.text != "" && sender.tag != 11 && sender.tag != 16{
            equal_pressed = false
            if operator_twice_pressed_check <= 0 {
            previous = Double(label.text!)!
            }
            else{
                //do nothing
            }

            if sender.tag == 12{
                //divide
                //label.text = "div"
                if(operator_pressed == "M"){
                    label.text = String(previous * screen_num)
                }
                else if(operator_pressed == "A"){
                    label.text = String(previous + screen_num)
                }
                else if(operator_pressed == "S"){
                    label.text = String(previous - screen_num)
                }
                else if operator_twice_pressed_check > 0 && previous != 0{
                    label.text = String(previous / screen_num)
                }
                operator_pressed = "D"
            }
            if sender.tag == 13{
                //multipy
                //label.text = "mult"
                if(operator_pressed == "S"){
                    label.text = String(previous + screen_num)
                }
                else if(operator_pressed == "D"){
                    label.text = String(previous / screen_num)
                }
                else if(operator_pressed == "S"){
                    label.text = String(previous - screen_num)
                }
                else if operator_twice_pressed_check > 0 && previous != 0{
                    label.text = String(previous * screen_num)
                }
                operator_pressed = "M"
            }
            if sender.tag == 14{
                //subtract
                //label.text = "sub"
                if(operator_pressed == "M"){
                    label.text = String(previous * screen_num)
                }
                else if(operator_pressed == "D"){
                    label.text = String(previous / screen_num)
                }
                else if(operator_pressed == "A"){
                    label.text = String(previous + screen_num)
                    
                }
                else if operator_twice_pressed_check > 0 && previous != 0{
                    label.text = String(previous - screen_num)
                }
                operator_pressed = "S"
            }
            if sender.tag == 15{
                //add
                //label.text = "add"
                if(operator_pressed == "M"){
                    label.text = String(previous * screen_num)
                }
                else if(operator_pressed == "D"){
                    label.text = String(previous / screen_num)
                }
                else if(operator_pressed == "S"){
                    label.text = String(previous - screen_num)
                    
                }
                else if operator_twice_pressed_check > 0 && previous != 0{
                        label.text = String(previous + screen_num)

                }
                operator_pressed = "A"
            }
            math_done = true;
            operator_twice_pressed_check = operator_twice_pressed_check + 1

        }
        if sender.tag == 11 {
            label.text = ""
            screen_num = 0;
            previous = 0;
            math_done = false;
            equal_pressed = false
            operator_pressed = ""
            operator_twice_pressed_check = 0

        }
        if sender.tag == 16 {
            equal_pressed = true
            operator_twice_pressed_check = 0
            if math_done == true{
                //do nothing
            }
            else if previous == 0{
                //do nothing
            }
            else{
                if(operator_pressed == "D"){
                    label.text = String(previous / screen_num)
                }
                if(operator_pressed == "M"){
                    label.text = String(screen_num * previous)
                }
                if(operator_pressed == "S"){
                    label.text = String(previous - screen_num)
                }
                if(operator_pressed == "A"){
                    label.text = String(screen_num + previous)
                }
                operator_pressed = ""
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

