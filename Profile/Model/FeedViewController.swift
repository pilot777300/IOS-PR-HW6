//
//  FeedViewController.swift
//  NavigTest
//
//  Created by Mac on 07.11.2022.
//

import UIKit

class FeedViewController: UIViewController {

    
   private lazy var checkGuessButton: UIButton = {
        let btn =  UIButton()
        btn.backgroundColor = .systemBlue
        btn.layer.cornerRadius = 12
        btn.setTitle("Проверить", for: .normal)
        btn.backgroundColor = .blue
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        btn.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
   private lazy var textfield: UITextField = {
        let txt = UITextField()
        txt.backgroundColor = .white
        txt.layer.cornerRadius = 12
        txt.placeholder = "Введите слово, которое я загадал"
        txt.translatesAutoresizingMaskIntoConstraints = false
        return txt
    }()
    
    private lazy var guessColor: UILabel = {
        let lbl = UILabel()
        lbl.backgroundColor = .systemGray5
        lbl.layer.cornerRadius = 30
        lbl.text = ""
        lbl.font = UIFont.boldSystemFont(ofSize: 40)
        lbl.textColor = .clear
        lbl.textAlignment = .center
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    func setConstraints() {
        let safeArea = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            textfield.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            textfield.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 200),
            textfield.widthAnchor.constraint(equalToConstant: 300),
            textfield.heightAnchor.constraint(equalToConstant: 50),
            
            checkGuessButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            checkGuessButton.topAnchor.constraint(equalTo: textfield.bottomAnchor, constant: 30),
            checkGuessButton.widthAnchor.constraint(equalToConstant: 300),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 50),
            
            guessColor.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 30),
            guessColor.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30),
            guessColor.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -30),
            guessColor.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        self.view.addSubview(checkGuessButton)
        self.view.addSubview(textfield)
        self.view.addSubview(guessColor)
        setConstraints()
        }
            
        @objc private func buttonAction() {
                let feedModel = FeedModel()
                let custom = CustomButton.init(buttonTitle: "ПРАВИЛЬНО!!!",
                                               buttonColor: .green,
                                               titleColor: .black)
               
                if textfield.text != nil && textfield.text == feedModel.secretWord  {
                    guessColor.backgroundColor = custom.buttonColor
                    guessColor.text = custom.buttonTitle
                    guessColor.textColor = custom.titleColor
                } else {
                    let custom = CustomButton.init(buttonTitle: "ОШИБКА",
                                                   buttonColor: .red,
                                                   titleColor: .black)
                        guessColor.backgroundColor = custom.buttonColor
                        guessColor.text = custom.buttonTitle
                        guessColor.textColor = custom.titleColor
                    }
                }
            }

    
    



