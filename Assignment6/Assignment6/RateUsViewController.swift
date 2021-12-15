//
//  RateUsViewController.swift
//  Assignment6
//
//  Created by DCS on 15/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RateUsViewController: UIViewController {
    
    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Rate Us"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let SubTitleLabel : UILabel = {
        let label = UILabel()
        label.text = "This App"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let myslider:UISlider = {
        let slider=UISlider()
        slider.minimumValue=0
        slider.maximumValue=5
        slider.addTarget(self, action: #selector(handleslider), for: .valueChanged)
        return slider
        
    }()
    
    
    private let RateUsValueLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rateus")!)
        //view.backgroundColor = .white
        view.addSubview(TitleLabel)
        view.addSubview(SubTitleLabel)
        view.addSubview(myslider)
        view.addSubview(RateUsValueLabel)
        
    }
    
    override func viewDidLayoutSubviews() {
        TitleLabel.frame = CGRect(x: 10, y: 120, width: view.frame.size.width, height: 50)
        SubTitleLabel.frame = CGRect(x: 10, y: 140, width: view.frame.size.width, height: 50)
        
        
        myslider.frame = CGRect(x: 20, y: 300, width: view.frame.size.width-40, height: 30)
        
        RateUsValueLabel.frame = CGRect(x: 10, y: 330, width: view.frame.size.width, height: 50)
    }
    

    @objc func handleslider()
    {
        var val : Float = 0.0;
        val = myslider.value
        RateUsValueLabel.text = String(round(val)) + " Stars"
    }
}
