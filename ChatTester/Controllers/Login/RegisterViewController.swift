//
//  RegisterViewController.swift
//  ChatTester
//
//  Created by admin on 17.02.2023.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        return scrollView
    }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "person-icon")
        imageView.tintColor = .orange
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let emailField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.placeholder = "Email"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.7))
        return field
    }()
    
    private let firstNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.placeholder = "First Name"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.7))
        return field
    }()
    
    private let lastNameField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .continue
        field.placeholder = "Last Name"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.7))
        return field
    }()
    
    private let passwordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.placeholder = "Password"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.7))
        field.isSecureTextEntry = true
        return field
    }()
    
    private let repeatPasswordField: UITextField = {
        let field = UITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.returnKeyType = .done
        field.placeholder = "Repeat password"
        field.layer.cornerRadius = 12
        field.layer.borderWidth = 1
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        field.leftViewMode = .always
        field.backgroundColor = UIColor(cgColor: CGColor(red: 1, green: 1, blue: 1, alpha: 0.7))
        field.isSecureTextEntry = true
        return field
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = .orange
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(view.endEditing)))
        view.addSubview(scrollView)
        emailField.delegate = self
        passwordField.delegate = self
        scrollView .addSubview(imageView)
        scrollView.addSubview(firstNameField)
        scrollView.addSubview(lastNameField)
        scrollView.addSubview(emailField)
        scrollView.addSubview(passwordField)
        scrollView.addSubview(repeatPasswordField)
        scrollView.addSubview(loginButton)
        loginButton.addTarget(self, action: #selector(loginButtonTaped), for: .touchUpInside)
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didImageTaped)))
        imageView.isUserInteractionEnabled = true
        scrollView.isUserInteractionEnabled = true
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = view.bounds
        let size = scrollView.width/3
        imageView.frame = CGRect(x: (scrollView.width-size)/2,
                                 y: 30,
                                 width: size,
                                 height: size)
        emailField.frame = CGRect(x: 30,
                                  y: imageView.bottom+30,
                                  width: scrollView.width-60,
                                  height: 52)
        firstNameField.frame = CGRect(x: 30,
                                     y: emailField.bottom+30,
                                     width: scrollView.width-60,
                                     height: 52)
        lastNameField.frame = CGRect(x: 30,
                                     y: firstNameField.bottom+30,
                                     width: scrollView.width-60,
                                     height: 52)
        passwordField.frame = CGRect(x: 30,
                                     y: lastNameField.bottom+30,
                                     width: scrollView.width-60,
                                     height: 52)
        repeatPasswordField.frame = CGRect(x: 30,
                                     y: passwordField.bottom+30,
                                     width: scrollView.width-60,
                                     height: 52)
        loginButton.frame = CGRect(x: 30,
                                     y: repeatPasswordField.bottom+30,
                                     width: scrollView.width-60,
                                     height: 52)
        
        imageView.layer.cornerRadius = imageView.frame.width/2
        var totalHeight: CGFloat = 0

            for subview in scrollView.subviews {
                totalHeight += subview.height
                if let nextSubview = subview.superview?.subviews.first(where: { $0.top > subview.top + subview.height }) {
                    let distance = nextSubview.top - (subview.top + subview.height)
                    totalHeight += distance
                }
            }

            scrollView.contentSize = CGSize(width: scrollView.frame.width, height: totalHeight)
    }
    
    
    @objc private func didImageTaped(){
        presentPhotoActionSheet()
    }
    
    @objc private func loginButtonTaped(){
        guard let firstName = firstNameField.text, let email = emailField.text, let password = passwordField.text, let repeatedPassword = repeatPasswordField.text, !email.isEmpty, !firstName.isEmpty, !password.isEmpty, !repeatedPassword.isEmpty else {
            alertUserLoginError()
             return
        }
        
        guard email.isValidEmail else {
            alertWrongEmailError()
            return
        }
        
        guard password.count >= 6 else {
            alertSmallPasswordError()
            return
        }
        
        guard password.count <= 16 else {
            alertLongPasswordError()
            return
        }
        
        guard password == repeatedPassword else {
            alertRepeatedPasswordError()
            return
        }
        
        //FireBase log in
    }
    
    func alertWrongEmailError(){
        let alert = UIAlertController(title: "Hey!",
                                      message: "Wrong email!",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    
    func alertUserLoginError(){
        let alert = UIAlertController(title: "Oh no :(",
                                      message: "Please enter all information correct",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    func alertSmallPasswordError(){
        let alert = UIAlertController(title: "Hey!",
                                      message: "Password must be minimum 6 characters length",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    func alertLongPasswordError(){
        let alert = UIAlertController(title: "Hey!",
                                      message: "Password maximum length is 16",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
    func alertRepeatedPasswordError(){
        let alert = UIAlertController(title: "Oops!",
                                      message: "Passwords do not match",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default))
        present(alert, animated: true)
    }
    
}

extension RegisterViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailField {
            passwordField.becomeFirstResponder()
        } else {
            view.endEditing(true)
            loginButtonTaped()
        }
        return true
    }
    
}

extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "How do you like to take a picture?",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            print("Take Photo")
            self.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose from Library", style: .default, handler: { _ in
            print("Library")
            self.presentLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        present(actionSheet, animated: true)
    }
    
    func presentCamera(){
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        vc.showsCameraControls = true
        present(vc, animated: true)
    }
    
    func presentLibrary(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        self.imageView.image = image
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
