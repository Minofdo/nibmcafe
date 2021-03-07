//
//  SignUpViewController.swift
//  nibmcafe
//
//  Created by Mino Fdo on 2021-03-07.
//

import UIKit
import FirebaseAuth
import Firebase
import Firestore

class SignUpViewController: UIViewController {
    
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        //hide the error label
        errorLabel.alpha = 0
        
        //style the elements
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
        
    }
    
    //Check the fields and validate that the data is correct. If everything is correct, this method returns nil. Otherwise, it returns the error message.
    func validateFields() -> String? {
       
        //check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {

            return "Please fill in all fields."
            
        }
    
        // Check if the password secure
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
            
        }
        
        return nil
        
    }
    

    @IBAction func signUpTapped(_ sender: Any) {
        
        //validate the fields
        let error = validateFields()
        
        if error != nil {
            //There's  something wrong with the fields, show error message
            showError(message: error!)
        }
        else {
        
            // Create the user
            Auth.auth().createUser(withEmail: "", password: "") { (result, err) in
                
                //check for errors
                if err != nil {
                    
                    //There was an error creating the user
                    self.showError(message: "Error creating user")
                }
                else {
                    
                    //User was created successfully, now store the first name and last name
            
                    let db = Firestore.firestore()
                }
                
            }
            
            // Transition to the home screen
    }
}
    
    func showError( message:String) {
    
        errorLabel.text = message
        errorLabel.alpha = 1
        
    }
    
}
