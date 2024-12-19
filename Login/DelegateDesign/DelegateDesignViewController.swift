//
//  DelegateDesignViewController.swift
//  Login
//
//  Created by parag on 19/12/24.
//

import UIKit

class DelegateDesignViewController: UIViewController {

    let actionButton = ActionButton();
    
    var lable:UILabel = UILabel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(actionButton);
        view.addSubview(lable)
        view.backgroundColor = .systemGroupedBackground
        actionButton.widthAnchor.constraint(equalToConstant: 300).isActive = true;
        actionButton.heightAnchor.constraint(equalToConstant: 300).isActive = true;
        actionButton.layer.shadowColor = UIColor.black.cgColor
        actionButton.translatesAutoresizingMaskIntoConstraints = false;
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        actionButton.delegate = self
        
        lable.translatesAutoresizingMaskIntoConstraints = false;
        lable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true;
        lable.centerYAnchor.constraint(equalTo: actionButton.bottomAnchor,constant: 28).isActive = true
        lable.text = "Primary button Tapped"
    }
    

}


extension DelegateDesignViewController:ActionButtonViewDelegate{
    func primaryActionButton() {
//        print("Debug: Primary button tap in viewController..")
        lable.isHidden.toggle()
    }
    
    func secondaryActionButton() {
//        print("Debug: Secondary button tap in viewController..")
    }

}

#Preview{
    DelegateDesignViewController()
}
