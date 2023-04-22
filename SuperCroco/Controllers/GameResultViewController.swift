//
//  GameResultViewController.swift
//  SuperCroco
//
//  Created by Tatiana Zudina on 19.04.2023.
//

import UIKit

class GameResultViewController: UIViewController {
	
	var backgroundImage: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "background")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		return image
	}()
	
	var mainLabel: UILabel = {
		let label = UILabel()
		label.text = "Результаты"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 32, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	//MARK: - First View
	
	var firstView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var firstViewTeamLogo: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "persons")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		return image
	}()
	
	var firstViewTeamLabel: UILabel = {
		let label = UILabel()
		label.text = "Ковбои"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let firstViewVerticalStack: UIStackView = {
		let subStack = UIStackView()
		subStack.axis = .vertical
		subStack.alignment = .center
		subStack.distribution = .equalSpacing
		subStack.spacing = 2.0
		subStack.translatesAutoresizingMaskIntoConstraints = false
		return subStack
	}()
	
	var firstViewPointLabel: UILabel = {
		let label = UILabel()
		label.text = "5"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var firstViewScoreLabel: UILabel = {
		let label = UILabel()
		label.text = "Очки"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	//MARK: - Second View
	
	var secondView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var secondViewTeamLogo: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "food")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		return image
	}()
	
	var secondViewTeamLabel: UILabel = {
		let label = UILabel()
		label.text = "Стройняшки"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let secondViewVerticalStack: UIStackView = {
		let subStack = UIStackView()
		subStack.axis = .vertical
		subStack.alignment = .center
		subStack.distribution = .equalSpacing
		subStack.spacing = 2.0
		subStack.translatesAutoresizingMaskIntoConstraints = false
		return subStack
	}()
	
	var secondViewPointLabel: UILabel = {
		let label = UILabel()
		label.text = "4"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var secondViewScoreLabel: UILabel = {
		let label = UILabel()
		label.text = "Очки"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	//MARK: - Third View
	
	
	var thirdView: UIView = {
		let view = UIView()
		view.backgroundColor = .white
		view.layer.cornerRadius = 10
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var thirdViewTeamLogo: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "hobbie")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFit
		image.clipsToBounds = true
		return image
	}()
	
	var thirdViewTeamLabel: UILabel = {
		let label = UILabel()
		label.text = "Красотки"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	let thirdViewVerticalStack: UIStackView = {
		let subStack = UIStackView()
		subStack.axis = .vertical
		subStack.alignment = .center
		subStack.distribution = .equalSpacing
		subStack.spacing = 2.0
		subStack.translatesAutoresizingMaskIntoConstraints = false
		return subStack
	}()
	
	var thirdViewPointLabel: UILabel = {
		let label = UILabel()
		label.text = "3"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var thirdViewScoreLabel: UILabel = {
		let label = UILabel()
		label.text = "Очки"
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	
	var startOverButton: UIButton = {
		let button = UIButton(type: .system)
		button.setTitle("Начать сначала", for: .normal)
		button.setTitleColor(.white, for: .normal)
		button.backgroundColor = UIColor(named: "CustomGreen")
		button.layer.cornerRadius = 10
		button.titleLabel?.font = .systemFont(ofSize: 17, weight: .medium)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.setHidesBackButton(true, animated: true)
		
		setupHierarchy()
		setConstrains()
	}
	
	@objc func buttonTapped(_ sender: UIButton) {
		AlertControllerProvider.shared.showAlert(on: self, title: "Сбросить игру?", message: "Вы хотите сбросить вашу игру и вернуться в главное меню?", navigationController: navigationController)
	}
	
	func setupHierarchy() {
		view.addSubview(backgroundImage)
		view.addSubview(mainLabel)
		
		view.addSubview(firstView)
		view.addSubview(firstViewTeamLogo)
		view.addSubview(firstViewTeamLabel)
		view.addSubview(firstViewVerticalStack)
		firstViewVerticalStack.addArrangedSubview(firstViewPointLabel)
		firstViewVerticalStack.addArrangedSubview(firstViewScoreLabel)
		
		view.addSubview(secondView)
		view.addSubview(secondViewTeamLogo)
		view.addSubview(secondViewTeamLabel)
		view.addSubview(secondViewVerticalStack)
		secondViewVerticalStack.addArrangedSubview(secondViewPointLabel)
		secondViewVerticalStack.addArrangedSubview(secondViewScoreLabel)
		
		view.addSubview(thirdView)
		view.addSubview(thirdViewTeamLogo)
		view.addSubview(thirdViewTeamLabel)
		view.addSubview(thirdViewVerticalStack)
		thirdViewVerticalStack.addArrangedSubview(thirdViewPointLabel)
		thirdViewVerticalStack.addArrangedSubview(thirdViewScoreLabel)
		
		view.addSubview(startOverButton)
		
	}
	
	//MARK: - Constrains
	func setConstrains() {
		
		NSLayoutConstraint.activate([
			
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			mainLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
			mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			firstView.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: 76),
			firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			firstView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			firstView.heightAnchor.constraint(equalToConstant: 96),
			
			firstViewTeamLogo.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
			firstViewTeamLogo.leadingAnchor.constraint(equalTo: firstView.leadingAnchor, constant: 15),
			firstViewTeamLogo.heightAnchor.constraint(equalToConstant: 56),
			firstViewTeamLogo.widthAnchor.constraint(equalToConstant: 56),
			
			firstViewTeamLabel.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
			firstViewTeamLabel.leadingAnchor.constraint(equalTo: firstViewTeamLogo.trailingAnchor, constant: 34),
			
			firstViewVerticalStack.centerYAnchor.constraint(equalTo: firstView.centerYAnchor),
			firstViewVerticalStack.trailingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: -16),
			
			secondView.topAnchor.constraint(equalTo: firstView.topAnchor, constant: 120),
			secondView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			secondView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			secondView.heightAnchor.constraint(equalToConstant: 96),
			
			secondViewTeamLogo.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
			secondViewTeamLogo.leadingAnchor.constraint(equalTo: secondView.leadingAnchor, constant: 15),
			secondViewTeamLogo.heightAnchor.constraint(equalToConstant: 56),
			secondViewTeamLogo.widthAnchor.constraint(equalToConstant: 56),
			
			secondViewTeamLabel.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
			secondViewTeamLabel.leadingAnchor.constraint(equalTo: secondViewTeamLogo.trailingAnchor, constant: 34),
			
			secondViewVerticalStack.centerYAnchor.constraint(equalTo: secondView.centerYAnchor),
			secondViewVerticalStack.trailingAnchor.constraint(equalTo: secondView.trailingAnchor, constant: -16),
			
			thirdView.topAnchor.constraint(equalTo: secondView.topAnchor, constant: 120),
			thirdView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			thirdView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			thirdView.heightAnchor.constraint(equalToConstant: 96),
			
			thirdViewTeamLogo.centerYAnchor.constraint(equalTo: thirdView.centerYAnchor),
			thirdViewTeamLogo.leadingAnchor.constraint(equalTo: thirdView.leadingAnchor, constant: 15),
			thirdViewTeamLogo.heightAnchor.constraint(equalToConstant: 56),
			thirdViewTeamLogo.widthAnchor.constraint(equalToConstant: 56),
			
			thirdViewTeamLabel.centerYAnchor.constraint(equalTo: thirdView.centerYAnchor),
			thirdViewTeamLabel.leadingAnchor.constraint(equalTo: thirdViewTeamLogo.trailingAnchor, constant: 34),
			
			thirdViewVerticalStack.centerYAnchor.constraint(equalTo: thirdView.centerYAnchor),
			thirdViewVerticalStack.trailingAnchor.constraint(equalTo: thirdView.trailingAnchor, constant: -16),
			
			startOverButton.heightAnchor.constraint(equalToConstant: 60),
			startOverButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
			startOverButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
			startOverButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -45)
			
		])
	}
	
}

