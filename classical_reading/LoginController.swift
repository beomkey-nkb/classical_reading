//
//  LoginController.swift
//  classical_reading
//
//  Created by 남기범 on 25/03/2019.
//  Copyright © 2019 남기범. All rights reserved.
//

import UIKit
import TextFieldEffects

class LoginController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var sejongLogo: UIImageView!
    @IBOutlet weak var password: IsaoTextField!
    @IBOutlet weak var btn_box: UIButton!
    
    
    override var preferredStatusBarStyle:UIStatusBarStyle {
        return UIStatusBarStyle.lightContent //상태표시줄 색상 흰색
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        password.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)//키보드 화면 조정
        
        sejongLogo.layer.cornerRadius = sejongLogo.frame.height/2
        sejongLogo.layer.borderWidth = 1
        sejongLogo.layer.borderColor = UIColor.clear.cgColor
        sejongLogo.clipsToBounds = true//이미지 동그랗게
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if let userID = UserDefaults.standard.string(forKey: "id"){
            self.textField.text = userID
            self.password.text = UserDefaults.standard.string(forKey: "pw")!
            print(userID)
            performSegue(withIdentifier: "manualWind", sender: self)
        }
        
    }
    
    @objc func keyboardWillShow(_ sender:Notification){
        self.view.frame.origin.y = -150
    }
    
    @objc func keyboardWillHide(_ sender:Notification){
        self.view.frame.origin.y = 0
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        password.resignFirstResponder()
        return true
    }
    
    @IBAction func autoLoginAction(_ sender: Any) {
        // auto login 선택 여부
        if (btn_box.isSelected == true)
        {
            btn_box.isSelected = false;
        }
        else
        {
            btn_box.isSelected = true;
        }
    }
    
    
    @IBAction func login_Action(_ sender: Any) {
        
        if btn_box.isSelected == true{
            print("auto login")
            
            UserDefaults.standard.set(self.textField.text, forKey: "id")
            UserDefaults.standard.set(self.password.text, forKey: "pw")
        }
        
        performSegue(withIdentifier: "manualWind", sender: self)
    }
    
}
