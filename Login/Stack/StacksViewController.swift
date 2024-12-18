//
//  StacksViewController.swift
//  Login
//
//  Created by parag on 16/12/24.
//

import UIKit

class StacksViewController: UIViewController {

    let VStack:UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 10;      
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let HStack:UIStackView = {
        let stack = UIStackView();
        stack.axis = .horizontal;
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(VStack);
        view.addSubview(HStack)
        let rect1 = rectViews();
        let rect2 = rectViews();
        let rect3 = rectViews();
        let rect4 = rectViews();
        VStack.addArrangedSubview(rect1)
        VStack.addArrangedSubview(rect2)
        
        
        rect1.backgroundColor = .red
        rect2.backgroundColor = .black
        rect3.backgroundColor = .orange
        rect4.backgroundColor = .gray
        HStack.addArrangedSubview(rect3)
        HStack.addArrangedSubview(VStack)
        HStack.addArrangedSubview(rect4)
        
        HStack.backgroundColor = .lightGray
//        HStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        HStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        HStack.heightAnchor.constraint(equalTo: view.heightAnchor,multiplier: 0.5).isActive = true
        HStack.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        HStack.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        HStack.layoutMargins = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        HStack.isLayoutMarginsRelativeArrangement = true
        HStack.alignment = .center // happnes on cross axis in this case y axis
        HStack.distribution = .equalSpacing//happens on main axis in
        
        
        }
    
 
    
    func rectViews() -> UIView {
        let rect1 = UIView();
        rect1.translatesAutoresizingMaskIntoConstraints = false
        
        rect1.widthAnchor.constraint(equalToConstant: 100).isActive = true;
        rect1.heightAnchor.constraint(equalToConstant: 100).isActive  = true;
        rect1.layer.cornerRadius = 30;
        return rect1
    }


}

//#Preview{
//    StacksViewController()
//}
