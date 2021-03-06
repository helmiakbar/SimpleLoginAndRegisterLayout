//
//  ViewController.swift
//  DryCodeTest
//
//  Created by helmi akbar on 03/10/18.
//  Copyright © 2018 helmi akbar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordIcon: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailField.delegate = self
        self.passwordField.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //MARK: TextFieldDelagate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.emailField {
            self.userIcon.image = UIImage.init(named: "ic-user-active")
        } else if textField == self.passwordField {
            self.passwordIcon.image = UIImage.init(named: "ic-password-active")
        }
        self.animateTextField(textField: textField, up:true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.userIcon.image = UIImage.init(named: "ic-user-inactive")
        self.passwordIcon.image = UIImage.init(named: "ic-password-inactive")
        self.animateTextField(textField: textField, up:false)
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
    //MARK: - HideKeyboardWhenTapOutSide
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //MARK: - AnimateMoveViewWhenKeyboardShow
    func animateTextField(textField: UITextField, up: Bool) {
        let movementDistance:CGFloat = -130
        let movementDuration: Double = 0.3
        
        var movement:CGFloat = 0
        
        if up {
            movement = movementDistance
        } else {
            movement = -movementDistance
        }
        
        UIView.beginAnimations("animateTextField", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }
    
    //MARK: ButtonAction
    @IBAction func forgotPasswordBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "Forgot Password Pressed", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("You pressed OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "Login Pressed", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("You pressed OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func registerBtn(_ sender: Any) {
        self.performSegue(withIdentifier: "registerView", sender: nil)
    }
    
}

