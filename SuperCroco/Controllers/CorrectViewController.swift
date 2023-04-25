//
//  CorrectViewController.swift
//  CrocoGame
//
//  Created by Александр Вихарев on 19.04.2023.
//
import UIKit

class CorrectViewController: UIViewController {
    
    var teams: (firstTeam: Team, secondTeam: Team)?
    var isFirstTeam = false
    var gameVC = GameViewController()
    
    lazy var imageBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.clipsToBounds = true
        return image
    }()
    
    
//MARK: Top View
    
    let verStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 4
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.1
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var teamLogo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "persons")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var personTeamLabel: UILabel = {
        let label = UILabel()
        label.text = "Ковбои"
        label.numberOfLines = 1
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var pointLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.textColor = .black
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 40, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Очки"
        label.textColor = .black
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    
    //MARK: Central View
    
    let verStackCentr: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 10
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    
    var greenView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "CustomGreen")
        view.layer.cornerRadius = 20
       
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleMessage: UILabel = {
        let label = UILabel()
        label.text = "Поздравляем"
        label.textColor = .black
        label.font = .systemFont(ofSize: 48, weight: .bold)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var youGetLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы получаете"
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageStar: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "star")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    var imageOnePoint: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "one")
        
        image.contentMode = .left
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    
    var titleUnderStart: UILabel = {
        let label = UILabel()
        label.text = "ОЧКИ"
        label.textColor = .yellow
        label.font = .systemFont(ofSize: 13, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var nextStepLabel: UILabel = {
        let label = UILabel()
        label.text = "Следующий ход - \"Стройняшки\""
        label.textColor = .black
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: Button
    
    lazy var buttonNextStep: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Передать ход", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(nextStepButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		navigationItem.setHidesBackButton(true, animated: true)
        setupHierarchy()
        setConstrains()
        setTeamData()
        
    }
    
    func setTeamData() {
        guard let teams = teams else { return }
        if isFirstTeam {
            personTeamLabel.text = teams.firstTeam.name
            teamLogo.image = UIImage(named: (teams.firstTeam.avatar))
            pointLabel.text = "\(teams.firstTeam.score)"
            nextStepLabel.text = "Следующий ход - \(teams.secondTeam.name)"
        } else {
            personTeamLabel.text = teams.secondTeam.name
            teamLogo.image = UIImage(named: (teams.secondTeam.avatar))
            pointLabel.text = "\(teams.secondTeam.score)"
            nextStepLabel.text = "Следующий ход - \(teams.firstTeam.name)"
        }
    }
    
    
    //MARK: buttonTapped
    @objc func nextStepButtonTapped(_ sender: UIButton) {
		if let navigator = navigationController {
			navigator.popViewController(animated: false)
		}
    }

    //MARK: setupHierarchy
    
    func setupHierarchy() {
        view.addSubview(imageBackground)
        
        view.addSubview(whiteView)
        view.addSubview(teamLogo)
        view.addSubview(personTeamLabel)
        view.addSubview(verStack)
        verStack.addArrangedSubview(pointLabel)
        verStack.addArrangedSubview(scoreLabel)
        
        view.addSubview(greenView)
        view.addSubview(verStackCentr)
        view.addSubview(buttonNextStep)
        view.addSubview(imageOnePoint)
    
        verStackCentr.addArrangedSubview(titleMessage)
        verStackCentr.addArrangedSubview(youGetLabel)
        verStackCentr.addArrangedSubview(imageStar)
        verStackCentr.addArrangedSubview(titleUnderStart)
        verStackCentr.addArrangedSubview(nextStepLabel)

    }
    
    
    //MARK: setConstrains
    
    func setConstrains() {
        
        NSLayoutConstraint.activate([
            
  
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
            whiteView.heightAnchor.constraint(equalToConstant: 96),
            whiteView.topAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor, constant: -20),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            
            teamLogo.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            teamLogo.leadingAnchor.constraint(equalTo: whiteView.leadingAnchor, constant: 15),
            teamLogo.heightAnchor.constraint(equalToConstant: 56),
            teamLogo.widthAnchor.constraint(equalToConstant: 56),
            
            
            personTeamLabel.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            personTeamLabel.leadingAnchor.constraint(equalTo: teamLogo.trailingAnchor, constant: 34),
            
            
            verStack.centerYAnchor.constraint(equalTo: whiteView.centerYAnchor),
            verStack.trailingAnchor.constraint(equalTo: whiteView.trailingAnchor, constant: -16),
            
            
            greenView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greenView.heightAnchor.constraint(equalToConstant: 351),
           
            greenView.topAnchor.constraint(lessThanOrEqualTo: whiteView.bottomAnchor,constant: 80 ),
           
            greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),

            
            verStackCentr.centerXAnchor.constraint(equalTo: greenView.centerXAnchor),
            verStackCentr.centerYAnchor.constraint(equalTo: greenView.centerYAnchor),
            
            
            imageOnePoint.centerXAnchor.constraint(equalTo: view.centerXAnchor ),
            imageOnePoint.centerYAnchor.constraint(equalTo: imageStar.centerYAnchor ),
            imageOnePoint.widthAnchor.constraint(equalToConstant: 30),
            
            
            buttonNextStep.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonNextStep.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonNextStep.heightAnchor.constraint(equalToConstant: 60),
            buttonNextStep.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonNextStep.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46)
            
        ])
        
    }
    
}
