//
//  FirstViewController.swift
//  TrustPay
//
//  Created by zerolive on 2017. 1. 15..
//  Copyright © 2017년 Leonardo204. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var HomeImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HomeImageView.image = UIImage(named: "iu_headphone.png")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

