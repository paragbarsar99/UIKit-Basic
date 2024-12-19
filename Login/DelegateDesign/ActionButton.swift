//
//  ActionButton.swift
//  Login
//
//  Created by parag on 19/12/24.
//

import UIKit

protocol ActionButtonViewDelegate:AnyObject {
    func primaryActionButton()
    func secondaryActionButton()
}

class ActionButton: UIView {
    //retin cycle 
    weak var delegate:ActionButtonViewDelegate?
    
  lazy var primaryButton:UIButton = {
        let button = UIButton();
        var config = UIButton.Configuration.plain()
        button.setTitle("Primary Button", for: .normal);
        button.layer.cornerRadius = 8;
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue;
        button.translatesAutoresizingMaskIntoConstraints = false;

        button.addAction(UIAction {_ in self.handlePrimaryButtonTap()}, for: .touchUpInside)
        button.configuration = config
        return button;
    }()
    
   lazy var secondaryButton:UIButton = {
       let button = UIButton(type: .system);
        button.translatesAutoresizingMaskIntoConstraints = false;
          button.setTitle("Secondary Button", for: .normal);
        button.setTitleColor(.systemBlue, for: .normal)
        button.addAction(UIAction {_ in self.handleSecondaryButtonTap()}, for: .touchUpInside)
        return button;
    }()


    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryButton);
        addSubview(secondaryButton);
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
        primaryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true;
        primaryButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true;

        secondaryButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true;
        secondaryButton.centerYAnchor.constraint(equalTo: primaryButton.bottomAnchor,constant: 30).isActive = true;

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func handlePrimaryButtonTap(){
//         print("Debug: Primary button tap in view..")
        delegate?.primaryActionButton()
    }
    
    func handleSecondaryButtonTap(){
//         print("Debug: Secondary button tap in view..")
        delegate?.secondaryActionButton()
    }
    
    
}
