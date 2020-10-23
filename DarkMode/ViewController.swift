//
//  ViewController.swift
//  DarkMode
//
//  Created by Dorukhan Uzun on 2020-10-22.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark{
            button.tintColor = UIColor.white
        }else{
            button.tintColor = UIColor.blue
        }
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark{
            button.tintColor = UIColor.white
        }else{
            button.tintColor = UIColor.blue
        }
    }
    
    
    @IBAction func signInButtonPressed(_ sender: UIButton) {
        let authContext = LAContext()
        
        var error: NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                if success == true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toViewController", sender: nil)
                    }
                }else{
                    DispatchQueue.main.async {
                        self.signInLabel.text = "Error!"
                    }
                }
            }
        }
    }
}

