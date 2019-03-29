//
//  ViewController.swift
//  FunWorld
//
//  Created by Prachi Thakkar on 29/03/19.
//  Copyright © 2019 Prachi Thakkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var text:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showAlert(_ sender: Any) {
        let alertController = UIAlertController(title: "Fun World!", message:
            "Hello, there...!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

