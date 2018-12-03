//
//  ActionViewController.swift
//  ViewControllerAnimations
//
//  Created by Karthi on 20/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

import UIKit

class ActionViewController: UIViewController {
    static var dismissPressed: Bool = false
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion:nil)
        ActionViewController.dismissPressed = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        ActionViewController.dismissPressed = false

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
