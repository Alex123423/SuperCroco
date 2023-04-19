//
//  MainViewController.swift
//  CrocoGame
//
//  Created by Alexey Davidenko on 17.04.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    //UI elements
    let backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        return image
    }()
    
    let verStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 40.0
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    let crocoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bigCroc")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Старт игры", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 20.0, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var rulesButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правила игры", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        //button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let grassImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "grass")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let grassImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "grass")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstrains()
    }
    
    @objc func buttonPressed() {
       let viewController = RulesViewController()
       if let navigator = navigationController {
           navigator.pushViewController(viewController, animated: false)
       }
   }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender == startButton {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
                   viewController: GameResultViewController(),
                   animated: false,
                   animationOptions: .allowAnimatedContent
           )
        }
        if sender == rulesButton {
            (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
                   viewController: RulesViewController(),
                   animated: false,
                   animationOptions: .allowAnimatedContent
           )
        }
    }
    
    func setupHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(verStack)
        verStack.addArrangedSubview(crocoImage)
        verStack.addArrangedSubview(startButton)
        verStack.addArrangedSubview(rulesButton)
        view.addSubview(grassImage)
        view.addSubview(grassImage2)
    }
    
    //MARK: - Constrains
    func setConstrains() {
        
        NSLayoutConstraint.activate([
            
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            startButton.heightAnchor.constraint(equalToConstant: 80),
            startButton.widthAnchor.constraint(equalToConstant: 270),
            
            rulesButton.heightAnchor.constraint(equalToConstant: 60),
            rulesButton.widthAnchor.constraint(equalToConstant: 210),
            
            verStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            verStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            verStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            grassImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            grassImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImage.heightAnchor.constraint(equalToConstant: 70),
            grassImage.widthAnchor.constraint(equalToConstant: 95),
            
            grassImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            grassImage2.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            grassImage2.heightAnchor.constraint(equalToConstant: 70),
            grassImage2.widthAnchor.constraint(equalToConstant: 95)
        ])
    }
    
}
