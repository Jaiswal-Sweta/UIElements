//
//  HomeViewController.swift
//  Assignment6
//
//  Created by DCS on 14/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Your Zodiac Signs"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .blue
        return label
    }()

    private let progressView: UIProgressView = {
        let progressview = UIProgressView()
        progressview.setProgress(0.0, animated: true)
        progressview.progressImage = UIImage(contentsOfFile: "dp")
        return progressview
    }()
    
    private let myActivityIndicatorView:UIActivityIndicatorView = {
        let act = UIActivityIndicatorView()
        act.color = .blue
        return act
    }()

    private let DisplayLabel : UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 25)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        label.numberOfLines = 10
        return label
    }()
    
    private let zodiacImageView:UIImageView = {
        let imgview = UIImageView()
        imgview.contentMode = .scaleAspectFill
        imgview.backgroundColor = .gray
        imgview.image = UIImage(named: "zodiac")
        imgview.layer.cornerRadius = 100
        imgview.clipsToBounds = true
        imgview.layer.borderColor = UIColor.white.cgColor
        imgview.layer.borderWidth = 10
        imgview.tintColor = .white
        return imgview
    }()
    
    private let tabbar:UITabBar = {
        let toolb = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let item2 = UITabBarItem(tabBarSystemItem: .search, tag: 2)
        let item3 = UITabBarItem(tabBarSystemItem: .downloads, tag: 3)
        
        toolb.items=[item1,item2,item3]
        return toolb
    }()
    
    private let RateUsButton : UIButton = {
        let button = UIButton()
        button.setTitle("Rate Us", for: .normal)
        button.titleLabel?.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        button.addTarget(self, action: #selector(OnRateUsClicked), for: .touchUpInside)
        button.backgroundColor = .green
        button.layer.cornerRadius = 15
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 2.0){
            self.progressView.setProgress(2.0, animated: true)
        }
        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            self.progressView.isHidden = true
            self.view.addSubview(self.DisplayLabel)
            self.view.addSubview(self.zodiacImageView)
            self.view.addSubview(self.TitleLabel)
            self.view.addSubview(self.tabbar)
            self.view.addSubview(self.RateUsButton)
           
        }
        DispatchQueue.main.async {
            self.myActivityIndicatorView.isHidden = !self.myActivityIndicatorView.isHidden
            self.myActivityIndicatorView.isHidden ? self.myActivityIndicatorView.stopAnimating() : self.myActivityIndicatorView.startAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      self.view.backgroundColor = UIColor(patternImage: UIImage(named: "register_bg")!)
       view.addSubview(progressView)
        myActivityIndicatorView.center = view.center
        myActivityIndicatorView.hidesWhenStopped = false
        myActivityIndicatorView.startAnimating()
       
        
        view.addSubview(myActivityIndicatorView)

    }
    
    override func viewDidLayoutSubviews() {
       super.viewDidLayoutSubviews()
        TitleLabel.frame = CGRect(x:10, y: 80, width: view.frame.size.width, height: 50)
        RateUsButton.frame = CGRect(x: 290, y: 585, width: 100, height: 30)
        
        progressView.frame = CGRect(x:20, y: (view.frame.size.height/2)+100, width: view.frame.size.width-40, height: 50)
        DisplayLabel.frame = CGRect(x: 10, y: 5, width: view.frame.size.width-40, height: 500)
        zodiacImageView.frame = CGRect(x: (view.frame.size.width/2)-100, y: 380, width: 200, height: 200)
        
        
        
        let tabbarheight:CGFloat=view.safeAreaInsets.bottom + 50.0
        tabbar.frame = CGRect(x : 0,y : view.frame.size.height - tabbarheight,width : view.frame.size.width ,height : tabbarheight )
    }

    public func getData(name: String,birthdate: Date, month: String){
      
       let r=["Aquarius","Pisces","Aries","Taurus","Gemini","Cancer","Leo","Virgo","Libra","Scorpio","Sagittarius","Capricorn"]
       
       var zodiac = "";
       for i in 1...13
       {
            if(Int(month) == i)
            {
                zodiac = r[i-1]
                zodiacImageView.image = UIImage(named: zodiac)
            }
       }
        
        DisplayLabel.text =
        """
        Hello \(name),
        According to
        Your Personal Detail
        And
        Birthdate :
        (\(birthdate))
        Your Zodiac Sign
        is
        \(zodiac).
        """
    }
    
    @objc func OnRateUsClicked()
    {
        let r = RateUsViewController()
        navigationController?.pushViewController(r, animated: true)
        //present(r,animated: false)
    }
}
