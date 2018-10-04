//
//  RegisterViewController.swift
//  DryCodeTest
//
//  Created by helmi akbar on 04/10/18.
//  Copyright © 2018 helmi akbar. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var userIcon: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var emailIcon: UIImageView!
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordIcon: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var phoneIcon: UIImageView!
    @IBOutlet weak var phoneField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.delegate = self
        self.emailField.delegate = self
        self.passwordField.delegate = self
        self.phoneField.delegate = self
    }
    
    //MARK: - TextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.nameField {
            self.userIcon.image = UIImage.init(named: "ic-user-active")
        } else if textField == self.emailField {
            self.emailIcon.image = UIImage.init(named: "ic-mail-active")
        } else if textField == self.passwordField {
            self.passwordIcon.image = UIImage.init(named: "ic-password-active")
        } else if textField == self.phoneField {
            self.phoneIcon.image = UIImage.init(named: "ic-phone-active")
        }
        self.animateTextField(textField: textField, up:true)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.userIcon.image = UIImage.init(named: "ic-user-inactive")
        self.emailIcon.image = UIImage.init(named: "ic-mail-inactive")
        self.passwordIcon.image = UIImage.init(named: "ic-password-inactive")
        self.phoneIcon.image = UIImage.init(named: "ic-phone-inactive")
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
    
    //MARK: - ButtonAction
    @IBAction func registerBtn(_ sender: Any) {
        let alertController = UIAlertController(title: "", message: "Register Pressed", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            (result : UIAlertAction) -> Void in
            print("You pressed OK")
        }
        alertController.addAction(okAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
