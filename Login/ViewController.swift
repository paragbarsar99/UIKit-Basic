//
//  ViewController.swift
//  Login
//
//  Created by parag on 13/12/24.
//

import UIKit

class ViewController: UIViewController {
    
    var HelloWordActionButton:UIButton = {
        
        let button = UIButton(type:.system)
        button.translatesAutoresizingMaskIntoConstraints = false;
        button.setTitle("hello World button", for: .normal)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 8
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 10, bottom: 5, right: 10)
        button.setTitleColor(.black,for:.normal)
        button.setTitleColor(.black,for:.normal)
        return button
    }()
    

    var HelloworldLable:UILabel =  {
        let textLable = UILabel()
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.text = "This is hello world label"
            return textLable
    }() 
    
    var subHelloworldLable:UILabel =  {
        let textLable = UILabel()
        textLable.translatesAutoresizingMaskIntoConstraints = false
        textLable.text = "This is sub hello world label"
            return textLable
    }()
// 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(HelloWordActionButton)
        view.addSubview(subHelloworldLable)
        view.addSubview(HelloworldLable)
        HelloWordActionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true;
        HelloWordActionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        HelloworldLable.centerYAnchor.constraint(equalTo: HelloWordActionButton.bottomAnchor,constant: 14).isActive = true;
        HelloworldLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
       
        subHelloworldLable.centerYAnchor.constraint(equalTo: HelloworldLable.bottomAnchor,constant: 14).isActive = true;
        subHelloworldLable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
  
}
