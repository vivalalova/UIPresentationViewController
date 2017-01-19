//
//  ViewController.swift
//  PresentationViewController
//
//  Created by Lova on 2017/1/17.
//  Copyright © 2017年 Lova. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.performSegue(withIdentifier: "gg", sender: nil)
    }
}

