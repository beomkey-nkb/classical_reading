//
//  NotiController.swift
//  
//
//  Created by 남기범 on 27/04/2019.
//

import UIKit

class NotiController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
}
