//
//  ViewController.swift
//  OngkirCheckerProject
//
//  Created by Bill Tanthowi Jauhari on 22/02/20.
//  Copyright © 2020 TechnologueID. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var form: OngkirView!
    var router: Router =  Router()
    var provinceModel: ProvinceModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        form  = OngkirView(frame: CGRect(x: 0, y: 80, width: view.frame.width, height: view.frame.height/2))
        
        view.addSubview(form)
        
    }

}


