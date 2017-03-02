//
//  ViewController.swift
//  BarbellCounter
//
//  Created by juan daccarett on 12/26/16.
//  Copyright © 2016 juan daccarett. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITextFieldDelegate {
    
    //Label For INPUT OF WEIGHT
    @IBOutlet weak var outputLbl: UITextField!
    
    //Labels for amount of plates
    @IBOutlet weak var fortyFivesLbl: UILabel!
    @IBOutlet weak var thirtyFivesLbl: UILabel!
    @IBOutlet weak var twentyFiveLbl: UILabel!
    @IBOutlet weak var tensLbl: UILabel!
    @IBOutlet weak var fivesLbl: UILabel!
    @IBOutlet weak var twoPointFiveLbl: UILabel!
    
    //Label For Barbell Stepper
    @IBOutlet weak var adjustBarbellWeight: UIStepper!
    //Label For Barbell Weight
    @IBOutlet weak var barbellWeightLbl: UILabel!
    

    
    var btnSound : AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    self.outputLbl.delegate = self
    
    // BUTTON SOUND
    let path = Bundle.main.path(forResource: "btn", ofType: "mp3")
    let soundURL = URL(fileURLWithPath: path!)
    
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
            
        } catch let err as NSError {
            print(err.debugDescription)
        }
    
    }
    
    
    
    // ACTION WHEN START BUTTON PRESSED
    @IBAction func buttonPressed(sender: UIButton){
        
        //Button Sound effect
        playSound()
        
        //variables
        let weight_Entered:Int = (outputLbl.text! as NSString).integerValue
        var weight_Remaining : Double?
        var temp = 0
        let weight_Barbell:Int = (barbellWeightLbl.text! as NSString).integerValue

        
///////////////////////////////////////////////////////////////////////
//                           Caculating 45s                          //
///////////////////////////////////////////////////////////////////////
        
        weight_Remaining = Double(weight_Entered) - Double(weight_Barbell)
        
        
        
        // DEALING WITH 45's Plate
        if Double(weight_Remaining!) >= 45 {
            
        // Calculates numbers of 45 plates and assigns it to temp
        temp = Int(weight_Remaining! / 45)
            
        //check if the quotient of the dividen is even or odd
            if temp % 2 == 0 {
                
                let amountOf_FortyFives = temp
                
                // Retrieve the remainder of Weights Needed after 45s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 45)
                
                //Display label unhide if needed
                fortyFivesLbl.isHidden = false
                fortyFivesLbl.text = String(amountOf_FortyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
        
            
            else if temp > 2 { //uneven amount of plates but at least three
                
                temp = temp - (temp % 2)
                let amountOf_FortyFives = temp
                
                // Retrieve the remainder of Weights Needed after 45s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 45)
                
                //Display label unhide if needed
                fortyFivesLbl.isHidden = false
                fortyFivesLbl.text = String(amountOf_FortyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0

            }
            
        

        }
        
        
///////////////////////////////////////////////////////////////////////
//                           Caculating 35s                          //
///////////////////////////////////////////////////////////////////////

       if weight_Remaining! >= 35{
            
            // Calculates numbers of 35 plates and assigns it to temp
            temp = Int((weight_Remaining! / 35))
            
            //check if the quotient of the dividen is even or odd
            if temp % 2 == 0 {
                
                let amountOf_ThirtyFives = temp
                
                // Retrieve the remainder of Weights Needed after 35s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 35)
                
                //Display label unhide if needed
                thirtyFivesLbl.isHidden = false
                thirtyFivesLbl.text = String(amountOf_ThirtyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
                
                
            else if temp > 2 { //uneven amount of plates but at least three
                
                temp = temp - (temp % 2)
                let amountOf_ThirtyFives = temp
                
                // Retrieve the remainder of Weights Needed after 35s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 35)
                
                //Display label unhide if needed
                thirtyFivesLbl.isHidden = false
                thirtyFivesLbl.text = String(amountOf_ThirtyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
            
        }
///////////////////////////////////////////////////////////////////////
//                           Caculating 25s                          //
///////////////////////////////////////////////////////////////////////
        
        if (weight_Remaining! >= 25){
            
            // Calculates numbers of 25 plates and assigns it to temp
            temp = Int(weight_Remaining! / 25)
            
            //check if the quotient of the dividen is even or odd
            if temp % 2 == 0 {
                
                let amountOf_TwentyFives = temp
                
                // Retrieve the remainder of Weights Needed after 25s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 25)
                
                //Display label unhide if needed
                twentyFiveLbl.isHidden = false
                twentyFiveLbl.text = String(amountOf_TwentyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
                
                
            else if temp > 2 { //uneven amount of plates but at least three
                
                temp = temp - (temp % 2)
                let amountOf_TwentyFives = temp
                
                // Retrieve the remainder of Weights Needed after 25s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 25)
                
                //Display label unhide if needed
                twentyFiveLbl.isHidden = false
                twentyFiveLbl.text = String(amountOf_TwentyFives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
            
        }
///////////////////////////////////////////////////////////////////////
//                           Caculating 10s                          //
///////////////////////////////////////////////////////////////////////
        
        if (weight_Remaining! >= 10) {
            
            // Calculates numbers of 10s plates and assigns it to temp

            temp = Int(weight_Remaining! / 10)
            
            
            //check if the quotient of the dividen is even or odd
            if temp % 2 == 0 {
                
                let amountOf_Tens = temp
                
                //Retrieve the remainder of Weights Needed after 10s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 10)
                
                //Display label unhide if needed
                tensLbl.isHidden = false
                tensLbl.text = String(amountOf_Tens) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
                
                
            else if temp > 2 { //uneven amount of plates but at least three

                temp = temp - (temp % 2)
                let amountOf_Tens = temp
                
                // Retrieve the remainder of Weights Needed after 10s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 10)
                
                //Display label unhide if needed
                tensLbl.isHidden = false
                tensLbl.text = String(amountOf_Tens) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }

            
        }
///////////////////////////////////////////////////////////////////////
//                           Caculating 5s                          //
///////////////////////////////////////////////////////////////////////

        if (weight_Remaining! >= 5){
            
            
            // Calculates numbers of 5s plates and assigns it to temp
            temp = Int(weight_Remaining! / 5)
    
        
            //check if the quotient of the dividen is even or odd
            if temp % 2 == 0 {
                
                let amountOf_Fives = temp
                
                //Retrieve the remainder of Weights Needed after 5s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 5)

                //Display label unhide if needed
                fivesLbl.isHidden = false
                fivesLbl.text = String(amountOf_Fives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
                
                
            else if temp > 2 { //uneven amount of plates but at least three
                
                temp = temp - (temp % 2)
                let amountOf_Fives = temp
                
                // Retrieve the remainder of Weights Needed after 35s are assigned
                weight_Remaining = Double(weight_Remaining!) - Double(temp * 5)
                
                //Display label unhide if needed
                fivesLbl.isHidden = false
                fivesLbl.text = String(amountOf_Fives) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
            
        }

///////////////////////////////////////////////////////////////////////
//                           Caculating 2.5s                          //
///////////////////////////////////////////////////////////////////////

        if (weight_Remaining! >= 2.5){
            
            // Calculates numbers of 5s plates and assigns it to temp
            var tempFloat:Double = (Double(weight_Remaining!) / 2.5)

            //check if the quotient of the dividen is even or odd
            if tempFloat.truncatingRemainder(dividingBy: 2) == 0 {
                
                let amountOf_TwoPointFives = tempFloat
                
                //Retrieve the remainder of Weights Needed after 5s are assigned
                weight_Remaining = Double(weight_Entered) - (tempFloat * Double(2.5))
                
                //Display label unhide if needed
                twoPointFiveLbl.isHidden = false
                twoPointFiveLbl.text = String(Int(amountOf_TwoPointFives)) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
                
                
            else if tempFloat > 2 { //uneven amount of plates but at least three
                
                tempFloat = tempFloat - 1
                
                let amountOf_TwoPointFives = tempFloat
                
                // Retrieve the remainder of Weights Needed after 35s are assigned
                weight_Remaining = Double(weight_Entered) - (tempFloat * Double(2.5))
                
                //Display label unhide if needed
                twoPointFiveLbl.isHidden = false
                twoPointFiveLbl.text = String(Int(amountOf_TwoPointFives)) + " Plates / Each Side"
                
                //restore temp
                temp = 0
            }
            
        }
    

    }
    
   
    
///////////////////////////////////////////////////////////////////////
//                             FUNCTION                              //
//                   Button Pressed Sound Effect                     //
///////////////////////////////////////////////////////////////////////
    func playSound() {
        if btnSound.isPlaying{
            btnSound.stop()
        }
        
        btnSound.play()
    }

///////////////////////////////////////////////////////////////////////
//                             FUNCTION                              //
//                   Clear Button Pressed (clear UI)                 //
///////////////////////////////////////////////////////////////////////
    @IBAction func clearBtnPressed(sender: UIButton){
        playSound()
        
        //Clear The Barbell Weights Amount in UI and hide label
        fortyFivesLbl.text = String(0)
        fortyFivesLbl.isHidden = true
        thirtyFivesLbl.text = String(0)
        thirtyFivesLbl.isHidden = true
        twentyFiveLbl.text = String(0)
        twentyFiveLbl.isHidden = true
        tensLbl.text = String(0)
        tensLbl.isHidden = true
        fivesLbl.text = String(0)
        fivesLbl.isHidden = true
        twoPointFiveLbl.text = String(0)
        twoPointFiveLbl.isHidden = true
        
        outputLbl.text = nil
        outputLbl.placeholder = "Enter New Amount"
        
    }
    

///////////////////////////////////////////////////////////////////////
//                             FUNCTION                              //
//                   Adjust Barbell Weight (UISTEPPER)               //
///////////////////////////////////////////////////////////////////////
    @IBAction func setBarbellWeightStepper(_ sender: UIStepper) {
        barbellWeightLbl.text = String(sender.value)
    }


    // Hide keyboard when user touches outside the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Presses return key hide keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return (true)
    }
    
    
    
}



