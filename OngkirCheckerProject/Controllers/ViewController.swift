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
    
    let mainView: UIScrollView = {
        let ui = UIScrollView()
        
        ui.translatesAutoresizingMaskIntoConstraints = false
        ui.isScrollEnabled = true
        
        return ui
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "Check Ongkir"
        view.backgroundColor = .white
        
        form  = OngkirView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        
        view.addSubview(mainView)
        
        mainView.addSubview(form)
        
        setupView()
        
    }
    
    private func setupView()
    {
        mainView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        mainView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        mainView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

}


