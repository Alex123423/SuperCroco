//
//  CategoryViewController.swift
//  CrocoGame
//
//  Created by Келлер Дмитрий on 18.04.2023.
//

import UIKit

final class CategoryViewController: UIViewController {
	
	var mainLabel: UILabel = {
		let label = UILabel()
		label.text = "Категории"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
    
    lazy var animalButton: UIButton = {
        let button = UIButton()
        button.setTitle("Животные", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(named: "CustomPurple")
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(animalButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    lazy var animalImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "animals")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var foodButton: UIButton = {
        let button = UIButton()
        button.setTitle("Еда", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(named: "CustomYellow")
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(animalButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    lazy var foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "food")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        return imageView
    }()
    
    lazy var personButton: UIButton = {
        let button = UIButton()
        button.setTitle("Личности", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(named: "CustomBlue")
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(animalButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    lazy var personImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "persons")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        return imageView
    }()
    
    lazy var hobbyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Хобби", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        button.backgroundColor = UIColor(named: "CustomRed")
        button.titleLabel?.textAlignment = .center
        button.addTarget(self, action: #selector(animalButtonTapped), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 0
        button.layer.borderColor = UIColor.clear.cgColor
        return button
    }()
    
    lazy var hobbyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "hobbie")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .bottomLeft
        return imageView
    }()
    
    lazy var startGameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Начать игру", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        button.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupHierarchy()
        setConstrains()
        view.setupBackgroundColor()
//        title = "Категории"
//         navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    @objc func startButtonTapped(_ sender: UIButton) {
		if let navigator = navigationController {
			navigator.pushViewController(GameViewController(), animated: false)
		}
    }
    
    
    @objc func animalButtonTapped(_ sender: UIButton) {
        sender.layer.borderWidth = 5
        sender.layer.borderColor = UIColor.systemGreen.cgColor
        
    }
    
    private func setupHierarchy() {
		
		view.addSubview(mainLabel)
        
        view.addSubview(animalButton)
        view.addSubview(animalImageView)
        
        
        view.addSubview(foodButton)
        view.addSubview(foodImageView)
        
        view.addSubview(personButton)
        view.addSubview(personImageView)
        
        view.addSubview(hobbyButton)
        view.addSubview(hobbyImageView)
        
        view.addSubview(startGameButton)
        
    }
    
    //MARK: - Constrains
    private func setConstrains() {
        NSLayoutConstraint.activate([
			
			mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            animalButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            animalButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            animalButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            animalButton.heightAnchor.constraint(equalToConstant: 90),
            
            animalImageView.leadingAnchor.constraint(equalTo: animalButton.leadingAnchor, constant: 50),
            animalImageView.centerYAnchor.constraint(equalTo: animalButton.centerYAnchor),
            
            foodButton.topAnchor.constraint(equalTo: animalButton.bottomAnchor, constant: 12),
            foodButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            foodButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            foodButton.heightAnchor.constraint(equalToConstant: 90),
            
            foodImageView.leadingAnchor.constraint(equalTo: foodButton.leadingAnchor, constant: 50),
            foodImageView.centerYAnchor.constraint(equalTo: foodButton.centerYAnchor),
            
            personButton.topAnchor.constraint(equalTo: foodButton.bottomAnchor, constant: 12),
            personButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            personButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            personButton.heightAnchor.constraint(equalToConstant: 90),
            
            personImageView.leadingAnchor.constraint(equalTo: personButton.leadingAnchor, constant: 50),
            personImageView.centerYAnchor.constraint(equalTo: personButton.centerYAnchor),
            
            hobbyButton.topAnchor.constraint(equalTo: personButton.bottomAnchor, constant: 12),
            hobbyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            hobbyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            hobbyButton.heightAnchor.constraint(equalToConstant: 90),
            
            hobbyImageView.leadingAnchor.constraint(equalTo: hobbyButton.leadingAnchor, constant: 50),
            hobbyImageView.centerYAnchor.constraint(equalTo: hobbyButton.centerYAnchor),
            
            startGameButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46),
            startGameButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            startGameButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            startGameButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
    }
}
