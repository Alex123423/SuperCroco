//
//  GameViewController.swift
//  CrocoGame
//
//  Created by Александр Вихарев on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    
    let arrayWords = ["автомобиль", "банан", "велосипед", "гитара", "дом", "ежик", "жираф", "зонт", "ишак", "компьютер", "лампа", "медведь", "ноутбук", "облако", "пингвин", "ракета", "солнце", "телефон", "улитка", "фламинго", "холодильник", "цветок", "шарик", "электроника", "юла", "яблоко"]
    
    
    let arrayConditions = [
        "Объясни с помощью слов",
        "Объясни с помощью жестов",
        "Объясни с помощью рисунка",
        "Объясняй со злостью",
        "Объясняй с помощью мимики",
        "Объясняй вульгарно",
        "Объясняй сексуально"
    ]
    
    var timer: Timer?
    var counter = 60
    

    let verStack: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 30
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    
    let verStackTitle: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 20
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    
    let verStackButton: UIStackView = {
        let subStack = UIStackView()
        subStack.axis = .vertical
        subStack.alignment = .center
        subStack.distribution = .equalSpacing
        subStack.spacing = 11
        subStack.translatesAutoresizingMaskIntoConstraints = false
        return subStack
    }()
    
    
    
    let imageBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    
    let imageLitleCrocodile: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "littleCroc")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    let timerLabel: UILabel = {
        let label = UILabel()
        label.text = "01:00"
        label.font = .systemFont(ofSize: 48)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let wordsLabel: UILabel = {
        let label = UILabel()
        label.text = "Картошка"
        label.font = .systemFont(ofSize: 48)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let conditionsLabel: UILabel = {
        let label = UILabel()
        label.text = "объясни с помощью жестов"
        label.font = .systemFont(ofSize: 20)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    lazy var buttonCorrect: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Правильно", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGreen")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var buttonViolation: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Нарушил правила", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomRed")
        button.layer.cornerRadius = 15
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 3
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .medium)
        button.addTarget(self, action: #selector(wrongButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    lazy var buttonReset: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Сброс", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "CustomGray")
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 17.0, weight: .regular)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.3
        button.layer.shadowOffset = CGSize(width: 2, height: 3)
        button.layer.shadowRadius = 3
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerStarting()
        setupHierarchy()
        setConstrains()
        
        
    }
    
    @objc func correctButtonTapped(_ sender: UIButton) {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
            viewController: CorrectViewController(),
            animated: false,
            animationOptions: .allowAnimatedContent
        )
    }
    
    @objc func wrongButtonTapped(_ sender: UIButton) {
        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
            viewController: WrongViewController(),
            animated: false,
            animationOptions: .allowAnimatedContent
        )
    }
    
    @objc func resetButtonTapped(_ sender: UIButton) {
        //меняется лейбл слова и лейбл способa отгадать слово
        //таймер продолжает отсчет
    }
    
    func setupHierarchy(){
        
        view.addSubview(imageBackground)
        view.addSubview(wordsLabel)
        view.addSubview(verStackButton)
        view.addSubview(verStackTitle)
        view.addSubview(verStack)
        
        verStack.addArrangedSubview(imageLitleCrocodile)
        verStack.addArrangedSubview(timerLabel)
        
        verStackTitle.addArrangedSubview(wordsLabel)
        verStackTitle.addArrangedSubview(conditionsLabel)
        
        verStackButton.addArrangedSubview(buttonCorrect)
        verStackButton.addArrangedSubview(buttonViolation)
        verStackButton.addArrangedSubview(buttonReset)
        
        
    }
    
    
    func setConstrains(){
        
        NSLayoutConstraint.activate([
            
            imageBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            imageBackground.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageBackground.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            
            verStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            verStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 116),
            verStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -116),
            
            
            buttonCorrect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonCorrect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonViolation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonViolation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonReset.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonReset.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            
            buttonCorrect.heightAnchor.constraint(equalToConstant: 60),
            buttonViolation.heightAnchor.constraint(equalToConstant: 60),
            buttonReset.heightAnchor.constraint(equalToConstant: 60),
            
            
            verStackTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            verStackTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            verStackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            verStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            verStackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            verStackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        
    }
    
    func timerStarting(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            self.counter -= 1
            self.timerLabel.text = "00:\(String(self.counter))"
            
            if self.counter <= 0 {
                self.timer?.invalidate()
                
            }
        })
        
    }
    
}





