//
//  ButtonPractice.swift
//  Login
//
//  Created by parag on 15/12/24.
//

import UIKit

class ButtonPractice:UIViewController{
    let lable:UILabel = {
        let l = UILabel();
        l.text = "Hide Me!"
        l.font = .systemFont(ofSize: 22);
        l.textColor = .black;
        l.textAlignment = .center;
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    lazy var showNameBtn:UIButton = {
        let b = UIButton();
        var config  =  UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.cornerStyle = .dynamic
        b.setTitle("Show Lable", for: .normal)
        b.backgroundColor = .systemBlue;
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 20
        
        b.translatesAutoresizingMaskIntoConstraints = false
        b.configuration = config

        b.addTarget(self, action: #selector(onToogleLable), for: .touchUpInside)
        return b
    }()
    
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        view.addSubview(showNameBtn);
        view.addSubview(lable)
        
        lable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        lable.centerYAnchor.constraint(equalTo: showNameBtn.topAnchor,constant: -30).isActive = true;
        showNameBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        showNameBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
     
    }
    
    
    @objc func onToogleLable(){
        lable.isHidden.toggle()
        showNameBtn.setTitle(lable.isHidden ? "Show Lable" : "Hide Lable", for: .normal)
    }
}


#Preview{
    ButtonPractice()
}

