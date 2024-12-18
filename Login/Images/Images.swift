//
//  Images.swift
//  Login
//
//  Created by parag on 16/12/24.
//
import UIKit

class Images:UIViewController{
    
    var image = UIImageView()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.addSubview(image);
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.image = UIImage(systemName: "paperplane")
        image.widthAnchor.constraint(equalToConstant: 200).isActive = true;
        image.heightAnchor.constraint(equalToConstant: 200).isActive = true;
        
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    
    }
}


#Preview{
    Images()
}

