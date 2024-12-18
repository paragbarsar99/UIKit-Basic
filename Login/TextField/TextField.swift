//
//  TextField.swift
//  Login
//
//  Created by parag on 17/12/24.
//

import UIKit
import Toast_Swift
class TextFieldViewController: UIViewController {
 
    var loginCreads = ["email":"","password":""];
    func inputRightIcon( textField:UITextField) -> UIButton {
        
        let iconButton = UIButton()
        let imgConfig = UIImage.SymbolConfiguration(pointSize:14,weight: .regular)
        let imageSource = UIImage(systemName: "eye" ,withConfiguration:imgConfig)
        var buttonConfig  = UIButton.Configuration.plain()
        buttonConfig.contentInsets  = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)
        iconButton.setImage(imageSource, for: .normal)
        iconButton.configuration = buttonConfig
        iconButton.addAction(UIAction {_ in
            self.tooglePasswordSecure(for:textField , where:iconButton)
        }, for: .touchUpInside)
        return iconButton
    }
    
    func tooglePasswordSecure(for textField:UITextField, where button:UIButton){
    
        textField.isSecureTextEntry.toggle()
      
        let imgConfig = UIImage.SymbolConfiguration(pointSize:14,weight: .regular)
        let imageSource = UIImage(systemName: textField.isSecureTextEntry ? "eye" :"lock" ,withConfiguration:imgConfig)
        button.setImage(imageSource , for: .normal)
    }
    
    let VStack:UIStackView = {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 20;      
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    
    lazy var onLogin:UIButton = {
        let b = UIButton();
        var config  =  UIButton.Configuration.filled()
        config.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16)
        config.cornerStyle = .dynamic
        b.setTitle("Login", for: .normal)
        b.backgroundColor = .systemBlue;
        b.setTitleColor(.white, for: .normal)
        b.layer.cornerRadius = 8
        b.translatesAutoresizingMaskIntoConstraints = false
        b.configuration = config

         b.addAction(UIAction {_ in
             self.onHandleLogin()
         }, for: .touchUpInside)
        return b
    }()
    
    func onHandleLogin() {
        if(loginCreads["email"] == "" || loginCreads["email"] == nil){
            showToastAlert(title: "Error", message: "Please fill the email address")
            return;
        }
        if(loginCreads["password"] == nil || loginCreads["password"] == ""){
            showToastAlert(title: "Error", message: "Please fill the password")
            return
        }
        showToastAlert(title: "Sucess", message: "Login Sucessfull")
        
   }
    
    func showToastAlert(title:String, message:String) {
        
        self.view.makeToast(message)
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            alert.dismiss(animated: true, completion: nil)
//        }
//        present(alert, animated: true,completion: nil)
    }
    
    func InputField(placeHolder:String,_ onTextChange:@escaping (String) -> Void) -> UITextField {
        let field = UITextField()
        field.placeholder = placeHolder;
        field.rightView = inputRightIcon(textField: field)
        field.rightViewMode = .always
        field.borderStyle = .roundedRect;
        field.translatesAutoresizingMaskIntoConstraints = false
        field.heightAnchor.constraint(equalToConstant: 40).isActive = true
        field.addAction(UIAction {_ in
            onTextChange(field.text ?? "")
        }, for: .editingChanged)
        field.delegate = self
        return field
    }
    
    func onChangeInput(type:String, _ value:String) -> Void{
//        print(type,value)
        loginCreads.updateValue(value, forKey: type)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let email = InputField(placeHolder: "Enter Email"){value in
        self.onChangeInput(type:"email",value)}
        let password = InputField(placeHolder: "Enter password"){value in
            self.onChangeInput(type:"password",value)
        }
        
        view.addSubview(VStack)
        email.isSecureTextEntry = false;
        email.rightView = nil
        email.keyboardType = .emailAddress
        VStack.addArrangedSubview(email);
        VStack.addArrangedSubview(password);
        VStack.addArrangedSubview(onLogin)
        VStack.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor ,constant: 120).isActive = true;
        VStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        VStack.widthAnchor.constraint(equalToConstant: view.frame.width-20).isActive = true
//        showNameBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -100).isActive = true
//        showNameBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
}

extension TextFieldViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}


//#Preview{
//    TextFieldViewController()
//}
