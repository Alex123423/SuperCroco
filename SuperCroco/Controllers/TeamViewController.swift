//
//  TeamViewController.swift
//  CrocoGame
//
//  Created by Келлер Дмитрий on 18.04.2023.
//


import UIKit

class TeamViewController: UIViewController {
    
    // MARK: - UI elements
	
	var mainLabel: UILabel = {
		let label = UILabel()
		label.text = "Кто играет?"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
    
    lazy var cowboyView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cowboyImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "persons")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var cowboyLabel: UILabel = {
        let label = UILabel()
        label.text = "Ковбои"
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cowboyStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 2.0
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    lazy var  slenderView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var slenderImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "food")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    var slenderLabel: UILabel = {
        let label = UILabel()
        label.text = "Cтройняшки"
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let slenderStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 2.0
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    lazy var gamerReadyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Игроки готовы", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        button.addTarget(self, action: #selector(navigationStartButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backButton = UIImage(systemName: "chevron.backward")
        navigationController?.navigationBar.backIndicatorImage = backButton
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
        navigationController?.navigationBar.backItem?.title = ""
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = backBarButton
        
		
//        navigationController?.navigationBar.prefersLargeTitles = true
        view.setupBackgroundColor()
        setupHierarchy()
        setConstrains()
      //  randomTeam()
    }
    
    @objc func goToCategoryViewController() {
//        let categoryVC = CategoryViewController()
//        navigationController.pushViewController(categoryVC, animated: true)
        let categoryViewController = CategoryViewController()
        let navigationController = UINavigationController(rootViewController: categoryViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    
    //MARK: - Private Methods
    
//    private func randomTeam () {
//        let teamsDict = Team.getTeams()
//
//        cowboyLabel.text = teamsDict.firstTeam.name
//        cowboyImageView.image = UIImage(named: teamsDict.firstTeam.avatar)
//        slenderLabel.text = teamsDict.secondTeam.name
//        slenderImageView.image = UIImage(named: teamsDict.secondTeam.avatar)
//    }
    
	@objc func navigationStartButtonPressed() {
		let viewController = CategoryViewController()
		if let navigator = navigationController {
			navigator.pushViewController(viewController, animated: false)
		}
	}
        
    
    private func setupHierarchy() {
        
		view.addSubview(mainLabel)
        view.addSubview(cowboyView)
        view.addSubview(cowboyImageView)
        view.addSubview(cowboyLabel)
        view.addSubview(cowboyStack)
        
        view.addSubview(slenderView)
        view.addSubview(slenderImageView)
        view.addSubview(slenderLabel)
        view.addSubview(slenderStack)
        
        view.addSubview(gamerReadyButton)
    }
    
    //MARK: - Constrains
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
			
			mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            cowboyView.topAnchor.constraint(equalTo: view.topAnchor, constant: 116),
            cowboyView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            cowboyView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            cowboyView.heightAnchor.constraint(equalToConstant: 96),
            
            cowboyImageView.centerYAnchor.constraint(equalTo: cowboyView.centerYAnchor),
            cowboyImageView.leadingAnchor.constraint(equalTo: cowboyView.leadingAnchor, constant: 15),
            cowboyImageView.heightAnchor.constraint(equalToConstant: 56),
            cowboyImageView.widthAnchor.constraint(equalToConstant: 56),
            
            cowboyLabel.centerYAnchor.constraint(equalTo: cowboyImageView.centerYAnchor),
            cowboyLabel.leadingAnchor.constraint(equalTo: cowboyImageView.trailingAnchor, constant: 34),
            
            cowboyStack.centerYAnchor.constraint(equalTo: cowboyView.centerYAnchor),
            cowboyStack.trailingAnchor.constraint(equalTo: cowboyView.trailingAnchor, constant: -16),
            
            
            slenderView.topAnchor.constraint(equalTo: cowboyView.bottomAnchor, constant: 16),
            slenderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            slenderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            slenderView.heightAnchor.constraint(equalToConstant: 96),
            
            slenderImageView.centerYAnchor.constraint(equalTo: slenderView.centerYAnchor),
            slenderImageView.leadingAnchor.constraint(equalTo: slenderView.leadingAnchor, constant: 15),
            slenderImageView.heightAnchor.constraint(equalToConstant: 56),
            slenderImageView.widthAnchor.constraint(equalToConstant: 56),
            
            slenderLabel.centerYAnchor.constraint(equalTo: slenderImageView.centerYAnchor),
            slenderLabel.leadingAnchor.constraint(equalTo: slenderImageView.trailingAnchor, constant: 34),
            
            slenderStack.centerYAnchor.constraint(equalTo: slenderImageView.centerYAnchor),
            slenderStack.trailingAnchor.constraint(equalTo: slenderImageView.trailingAnchor, constant: -16),
            
            gamerReadyButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46),
            gamerReadyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 14),
            gamerReadyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -14),
            gamerReadyButton.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        // MARK: - Navigation
        
//        let viewController = UIViewController()
//        let navigationController = UINavigationController(rootViewController: viewController)
//        navigationController.navigationBar.prefersLargeTitles = true
//        navigationController.modalPresentationStyle = .fullScreen
//        present(navigationController, animated: true, completion: nil)
//
        }
    }

