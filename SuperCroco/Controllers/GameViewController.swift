//
//  GameViewController.swift
//  CrocoGame
//
//  Created by Александр Вихарев on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    let hobbieArray = ["Походы", "Кулинария", "Живопись", "Медитация", "Чтение", "Бег", "Йога", "Медитация", "Видеоигры", "Садоводство", "Вязание", "Плавание", "Сон", "Прогулки", "Стендап", "Фотография", "Оригами", "Паркур", "Гребля", "Стрельба"]
    
    let foodArray = ["Пицца", "Суши", "Стейк", "Паста", "Бургер", "Салат", "Рыба", "Мороженое", "Макароны", "Суп", "Картошка фри", "Первое блюдо", "Омлет", "Киндер-сюрприз", "Пирожок", "Торт", "Шаурма", "Хот-дог", "Сироп", "Сок"]
    
    let personsArray = ["Человек-паук", "Гарри Поттер", "Дэдпул", "Халк", "Лара Крофт", "Том Круз", "Джонни Депп", "Криштиану Роналду", "Месси", "Леонардо Ди Каприо", "Брюс Уиллис","Скарлетт Йоханссон", "Дженнифер Энистон", "Джеки Чан","Жан-Клод Вандамм", "Мерлин Монро", "Одри Хепберн", "Кэрри Брэдшоу", "Том Харди", "Джон Сноу"]
    
    let animalsArray = ["Кошка", "Собака", "Крокодил", "Слон", "Тигр", "Кенгуру", "Пингвин", "Обезьяна", "Кит", "Волк", "Жираф", "Леопард", "Бегемот", "Белка", "Бобёр", "Буйвол", "Верблюд", "Гепард", "Выдра", "Горилла"]
    
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
        subStack.spacing = 8
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
        label.font = .systemFont(ofSize: 48)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let conditionsLabel: UILabel = {
        let label = UILabel()
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
		
		navigationItem.setHidesBackButton(true, animated: true)
        
        timerStarting()
        setupHierarchy()
        setConstrains()
        conditionsLabel.text = arrayConditions.randomElement()
        
        wordsLabel.text = animalsArray.randomElement()
        conditionsLabel.text = arrayConditions.randomElement()
        
    }
    
    @objc func correctButtonTapped(_ sender: UIButton) {
        
        Scores.buttonTapsCount += 1
        
        if Scores.buttonTapsCount == 10 {
            navigationController?.pushViewController(GameResultViewController(), animated: true)
        } else {
            Scores.score += 1
            if let navigator = navigationController {
                navigator.pushViewController(CorrectViewController(), animated: false)
            }
        }
        
    }
    
    @objc func wrongButtonTapped(_ sender: UIButton) {
        
        Scores.buttonTapsCount += 1
        
        if Scores.buttonTapsCount == 10 {
            navigationController?.pushViewController(GameResultViewController(), animated: true)
        } else {
            if let navigator = navigationController {
                navigator.pushViewController(WrongViewController(), animated: false)
            }
            
        }
        
    }
    
    @objc func resetButtonTapped(_ sender: UIButton) {
        if let navigator = navigationController {
            navigator.pushViewController(MainViewController(), animated: false)
            Scores.score = 0
            Scores.buttonTapsCount = 0
        }
        
    }
    
    func setupHierarchy(){
        
        view.addSubview(imageBackground)
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
            verStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            verStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 116),
            verStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -116),
            
            verStackTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            verStack.bottomAnchor.constraint(lessThanOrEqualTo: verStackTitle.topAnchor,constant: -10),
            
            verStackTitle.bottomAnchor.constraint(greaterThanOrEqualTo: verStackButton.topAnchor,constant: -200),
            
            
            verStackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54),
            verStackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54),
            verStackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            verStackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonCorrect.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonCorrect.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonViolation.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonViolation.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            buttonReset.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12),
            buttonReset.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            
            buttonCorrect.heightAnchor.constraint(equalToConstant: 60),
            buttonViolation.heightAnchor.constraint(equalToConstant: 60),
            buttonReset.heightAnchor.constraint(equalToConstant: 60)
            
            
            
        ])
        
    }
    
    func timerStarting(){
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
                self.counter -= 1
                
                self.timerLabel.text = "00:\(String(format: "%02d", self.counter))"
 
                if self.counter <= 0 {
                    self.timer?.invalidate()
                    
            }
        })
        
    }
    
}





