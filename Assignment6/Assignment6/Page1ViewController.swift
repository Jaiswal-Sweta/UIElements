//
//  Page1ViewController.swift
//  Assignment6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Page1ViewController: UIViewController {

    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Know Your Zodiac"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 40)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .blue
        return label
    }()
    
    private let GetStartedButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get Started...", for: .normal)
        button.titleLabel?.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        button.addTarget(self, action: #selector(OnGetStartedClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(red: 0.22, green: 0.33, blue: 0.53, alpha: 1.0)
        button.layer.cornerRadius = 25
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "page1bg")!)
        
         view.addSubview(TitleLabel)
         view.addSubview(GetStartedButton)
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TitleLabel.frame = CGRect(x: 10, y: 80, width: view.frame.size.width, height: 50)
        GetStartedButton.frame = CGRect(x: 50, y: 580, width: view.frame.size.width-100, height: 50)
        
    }
    
    @objc func OnGetStartedClicked()
    {
        let r = ProfileViewController()
        navigationController?.pushViewController(r, animated: true)
        //present(r,animated: false)
    }

}
