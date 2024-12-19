//
//  ScrollViewController.swift
//  Login
//
//  Created by parag on 18/12/24.
//

import UIKit

class ScrollViewController: UIViewController {

    private let ITEMSIZE = 100;
    private let TOTALITEM = 20
    
    var ScrollView = UIScrollView()
    
    let VStack:UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 12;
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    func rectViews() -> UIView {
        let rect1 = UIView();
        rect1.translatesAutoresizingMaskIntoConstraints = false
        rect1.heightAnchor.constraint(equalToConstant: 100).isActive  = true;
        rect1.layer.cornerRadius = 8;
        rect1.backgroundColor = .lightGray
        return rect1
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(ScrollView)
         
        for _ in 1 ..< TOTALITEM{
            var rect = rectViews()
            rect.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
            VStack.addArrangedSubview(rect)
        }
       
        
        ScrollView.addSubview(VStack)
        
        ScrollView.translatesAutoresizingMaskIntoConstraints = false;
        
        ScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        ScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        ScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        ScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        ScrollView.showsVerticalScrollIndicator = false
        VStack.centerXAnchor.constraint(equalTo: ScrollView.centerXAnchor).isActive = true
       
        ScrollView.contentSize.height = CGFloat(ITEMSIZE * TOTALITEM) + 64;
    }

}

//#Preview{
//    ScrollViewController()
//}
