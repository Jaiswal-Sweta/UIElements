//
//  RegisterViewController.swift
//  Assignment6
//
//  Created by DCS on 10/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    private let TitleLabel : UILabel = {
        let label = UILabel()
        label.text = "Fill Your Details"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 30)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    //Name
    private let NameLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    private let NameTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Enter Your Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    //Gender
    private let GenderLabel : UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let GenderSegment : UISegmentedControl = {
        let sg = UISegmentedControl()
        sg.insertSegment(withTitle: "MALE", at: 1, animated: false)
        sg.insertSegment(withTitle: "FEMALE", at: 2, animated: false)
        sg.insertSegment(withTitle: "OTHER", at: 3, animated: false)
        sg.selectedSegmentIndex = 1
        sg.layer.borderColor = UIColor.white.cgColor
        sg.setTitleTextAttributes([NSAttributedString.Key.foregroundColor : UIColor.white], for: .normal)
        sg.tintColor = .white
        return sg
    }()
    
    //Birthdate
    private let BirthDateLabel : UILabel = {
        let label = UILabel()
        label.text = "BirthDate"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let BirthDatePicker : UIDatePicker = {
        let db = UIDatePicker()
        db.timeZone = NSTimeZone.local
        db.datePickerMode = UIDatePicker.Mode.date
        db.layer.borderWidth = 1
        db.layer.borderColor = UIColor.white.cgColor
        db.tintColor = .black
        db.backgroundColor = .white
        db.setValue(UIColor.black, forKey: "textColor")
        let date = Date()
        db.setDate(date, animated: false)
        return db
    }()
    
    //BirthCity
    private let BirthCityLabel : UILabel = {
        let label = UILabel()
        label.text = "Birth City"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let CityPickerView : UIPickerView = {
        let pickerview = UIPickerView()
        pickerview.setValue(UIColor.black, forKeyPath: "textColor")
        pickerview.backgroundColor = .white
        pickerview.tintColor = .black
        return pickerview
        }()
    
    private let City = ["Surat","Pune","Jaipur","Mumbai","Lucknow"]
    
    
    //BirthTime
    private let BirthTimeLabel : UILabel = {
        let label = UILabel()
        label.text = "Birth Time"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.shadowColor = .yellow
        return label
    }()
    
    private let HourTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Hour", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let HourStepper : UIStepper = {
        let st = UIStepper()
        st.autorepeat = true
        st.isContinuous = true
        st.addTarget(self, action: #selector(handleHourStepper), for: .valueChanged)
        st.minimumValue = 0
        st.maximumValue = 24
        st.wraps = true
        st.layer.borderWidth = 3
        st.layer.borderColor = UIColor.white.cgColor
        st.tintColor = .white
        return st
    }()
    
    private let MintueTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Mintue", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let MintueStepper : UIStepper = {
        let st = UIStepper()
        st.autorepeat = true
        st.isContinuous = true
        st.addTarget(self, action: #selector(handleMintueStepper), for: .valueChanged)
        st.minimumValue = 0
        st.maximumValue = 60
        st.wraps = true
        st.layer.borderWidth = 3
        st.layer.borderColor = UIColor.white.cgColor
        st.tintColor = .white
        return st
    }()
    
    private let SecondTextfield: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder =
            NSAttributedString(string: "Second", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        textField.font = UIFont(name: "HoeflerText-BlackItalic", size: 15)
        textField.text = ""
        textField.textColor = .white
        textField.textAlignment = .center
        textField.backgroundColor = .clear
        textField.layer.borderWidth = 2
        textField.layer.borderColor = UIColor.white.cgColor
        //textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let SecondStepper : UIStepper = {
        let st = UIStepper()
        st.autorepeat = true
        st.isContinuous = true
        st.addTarget(self, action: #selector(handleSecondStepper), for: .valueChanged)
        st.minimumValue = 0
        st.maximumValue = 60
        st.wraps = true
        st.layer.borderWidth = 3
        st.layer.borderColor = UIColor.white.cgColor
        st.tintColor = .white
        return st
    }()
    
    //Button
    private let ShowButton : UIButton = {
        let button = UIButton()
        button.setTitle("See Your Zodiac", for: .normal)
        button.addTarget(self, action: #selector(OnShowClicked), for: .touchUpInside)
        button.backgroundColor = UIColor(cgColor: UIColor.white.cgColor)
        button.layer.cornerRadius = 20
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let PageControl : UIPageControl = {
        let pg = UIPageControl()
        pg.numberOfPages = 2
        pg.backgroundColor = UIColor.black
        pg.currentPage = 1
        pg.tintColor = UIColor.blue
        pg.layer.cornerRadius = 30
        pg.layer.borderColor = UIColor.blue.cgColor
        pg.layer.borderWidth = 5
        pg.addTarget(self, action: #selector(onPageChange), for: .valueChanged)
        return pg
    }()
    
    @objc public func onPageChange()
    {
        print(PageControl.currentPage)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "register_bg")!)
        view.addSubview(TitleLabel)
        
        view.addSubview(NameLabel)
        view.addSubview(NameTextfield)
        
        view.addSubview(GenderLabel)
        view.addSubview(GenderSegment)
        
        view.addSubview(BirthDateLabel)
        view.addSubview(BirthDatePicker)
        
        view.addSubview(BirthCityLabel)
        view.addSubview(CityPickerView)
        CityPickerView.delegate = self
        CityPickerView.dataSource = self
        
        
        view.addSubview(BirthTimeLabel)
        view.addSubview(HourTextfield)
        view.addSubview(HourStepper)
        view.addSubview(MintueTextfield)
        view.addSubview(MintueStepper)
        view.addSubview(SecondTextfield)
        view.addSubview(SecondStepper)
        
        view.addSubview(ShowButton)
        view.addSubview(PageControl)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        TitleLabel.frame = CGRect(x: 10, y: 20, width: view.frame.size.width, height: 50)
        
        NameLabel.frame = CGRect(x: 10, y: 100, width: 100, height: 30)
        NameTextfield.frame = CGRect(x: 120, y: 100, width: 240, height: 30)
        
        GenderLabel.frame = CGRect(x: 10, y: 150, width: 100, height: 30)
        GenderSegment.frame = CGRect(x: 120, y: 150, width: 240, height: 30)
        
        BirthDateLabel.frame = CGRect(x: 10, y: 200, width: 100, height: 30)
        BirthDatePicker.frame = CGRect(x: 120, y: 200, width: 240, height: 40)
        
        BirthCityLabel.frame = CGRect(x: 10, y: 250, width: 100, height: 30)
        CityPickerView.frame = CGRect(x: 120, y: 250, width: 240, height: 80)
        
        BirthTimeLabel.frame = CGRect(x: 10, y: 340, width: 100, height: 30)
        HourTextfield.frame = CGRect(x: 120, y: 340, width: 145, height: 29)
        HourStepper.frame = CGRect(x: 265, y: 340, width: 50, height: 30)
        MintueTextfield.frame = CGRect(x: 120, y: 370, width: 145, height: 29)
        MintueStepper.frame = CGRect(x: 265, y: 370, width: 50, height: 30)
        SecondTextfield.frame = CGRect(x: 120, y: 400, width: 145, height: 29)
        SecondStepper.frame = CGRect(x: 265, y: 400, width: 50, height: 30)
        
        
        ShowButton.frame = CGRect(x: 50, y: 450, width: 300, height: 50)
        
        PageControl.frame = CGRect(x: 20, y: 600, width: view.frame.size.width-40, height: 50)
    }
    
    
}
extension RegisterViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return City.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return City[row]
    }
    
}

extension RegisterViewController{
    
    @objc func handleHourStepper(){
        HourTextfield.text = HourStepper.value.description
    }
    
    @objc func handleMintueStepper(){
        MintueTextfield.text = MintueStepper.value.description
    }
    
    @objc func handleSecondStepper(){
        SecondTextfield.text = SecondStepper.value.description
    }
    
    @objc func OnShowClicked(){
        var monthString = ""
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day,.month,.year], from: self.BirthDatePicker.date)
    
        if let month = components.month {
            monthString = String(month)
        }
        let r = HomeViewController()
        r.getData(name: NameTextfield.text!, birthdate: BirthDatePicker.date ,month: monthString)
        navigationController?.pushViewController(r, animated: true)
    }
}
