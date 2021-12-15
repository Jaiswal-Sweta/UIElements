//
//  ProfileViewController.swift
//  Assignment6
//
//  Created by DCS on 13/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let toolbar:UIToolbar = {
        let tool = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let galary = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action:#selector(handlegalary))
        
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handlegalary))
        tool.items=[space,galary,camera]
        return tool
    }()
    
    
    @objc func handlegalary()
    {
        print("compose called")
        imagepick.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagepick,animated: true)
        }
        
    }
    @objc func handlecamera()
    {
        print("camera called")
        
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            imagepick.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagepick,animated: true)
            }
        }
        else
        {
            print("Camera Not Available")
        }
        
    }
    
    
    private let myactivityindicatorview:UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        
        return activity
    }()
    
    private let dpImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        //imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "dp")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.white.cgColor
        imgview.layer.borderWidth = 10
        imgview.tintColor = .white
        return imgview
    }()

    private let imagepick:UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.allowsEditing = true
        return ip
    }()
    
    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Know Your Zodiac"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .blue
        return label
    }()
    
    //Name
    private let ImageLabel : UILabel = {
        let label = UILabel()
        label.text = "Select Your Profile Photo"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .orange
        return label
    }()
    
    private let ThemeLabel : UILabel = {
        let label = UILabel()
        label.text = "Change Theme"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        label.textAlignment = .center
        label.backgroundColor = .clear
        return label
    }()
    
    private let NextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next...", for: .normal)
        button.titleLabel?.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        button.addTarget(self, action: #selector(OnNextClicked), for: .touchUpInside)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitleColor(.black, for: .normal)
        button.setTitleShadowColor(.blue, for: .normal)
        return button
    }()
    
    private let switch1:UISwitch = {
        let sw=UISwitch()
        sw.addTarget(self, action: #selector(HandleSwitch), for: .valueChanged)
        return sw
        
    }()
  
    
    private let PageControl : UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 2
        pg.backgroundColor = UIColor.black
        pg.currentPage = 0
        pg.tintColor = UIColor.blue
        pg.layer.cornerRadius = 30
        pg.layer.borderColor = UIColor.blue.cgColor
        pg.layer.borderWidth = 2
        pg.addTarget(self, action: #selector(onPageChange), for: .valueChanged)
        return pg
    }()
    
    @objc public func onPageChange()
    {
        print(PageControl.currentPage)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        UIView.animate(withDuration: 10.0,animations: {
//
//
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "profile_bg")!)

        view.addSubview(toolbar)
        view.addSubview(dpImageView)
        view.addSubview(TitleLabel)
        view.addSubview(NextButton)
        view.addSubview(ThemeLabel)
        view.addSubview(switch1)
        view.addSubview(PageControl)
        view.addSubview(ImageLabel)
        imagepick.delegate = self
        
    }
    
    override func viewDidLayoutSubviews() {
        
        //let toolbarheight:CGFloat=view.safeAreaInsets.top + 40.0
        toolbar.frame = CGRect(x : 0,y : 60,width : view.frame.size.width ,height : 40)
        dpImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 170, width: 200, height: 200)
        TitleLabel.frame = CGRect(x: 10, y: 120, width: view.frame.size.width, height: 50)
        ImageLabel.frame = CGRect(x: 80, y: 390, width: view.frame.size.width-150, height: 50)
        NextButton.frame = CGRect(x: 75, y: 470, width: view.frame.size.width-150, height: 50)
        ThemeLabel.frame = CGRect(x: 30, y: 530, width: view.frame.size.width-150, height: 50)
        switch1.frame = CGRect(x: 250, y: 540, width: view.frame.size.width, height: 30)
        PageControl.frame = CGRect(x: 20, y: 600, width: view.frame.size.width-40, height: 50)
    }
    
    @objc func OnNextClicked()
    {
        
        let r = RegisterViewController()
        navigationController?.pushViewController(r, animated: true)
        //present(r,animated: false)
    }
    
    @objc func HandleSwitch()
    {
        print(switch1.isOn)
        
        if switch1.isOn {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "rateus")!)
        }
        else
        {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "profile_bg")!)
        }
    }
    
}

extension ProfileViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImg = info[.editedImage] as? UIImage{
            dpImageView.image = selectedImg
        }
        picker.dismiss(animated: true)
    }
}
