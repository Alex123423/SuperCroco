//
//  GameViewController.swift
//  CrocoGame
//
//  Created by Александр Вихарев on 17.04.2023.
//

import UIKit

class GameViewController: UIViewController {
    
    var teams: (firstTeam: Team, secondTeam: Team)?
    var array: [String] = []
    var isFirstTeam = false
    var buttonTapsCount = 0
    var audio = AudioPlayer()


    let arrayConditions = [
        "Объясни с помощью слов",
        "Объясни с помощью жестов",
        "Объясни с помощью рисунка",
        "Объясняй со злостью",
        "Объясняй с помощью мимики",
        "Объясняй вульгарно",
        "Объясняй сексуально"
    ]
    
    var timer = Timer()
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
        label.font = .systemFont(ofSize: 44)
        label.backgroundColor = .clear
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let wordsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 38)
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
        
        setupHierarchy()
        setConstrains()
        
        wordsLabel.text = array.randomElement()
        conditionsLabel.text = arrayConditions.randomElement()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        wordsLabel.text = array.randomElement()
        conditionsLabel.text = arrayConditions.randomElement()
        createTimer()
        counter = 60
        timerLabel.text = "01:00"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        timer.invalidate()
    }
    
    @objc func correctButtonTapped(_ sender: UIButton) {
        isFirstTeam.toggle()
        audio.playSound(sound: "correct")
        timer.invalidate()
        
        if buttonTapsCount == 3 {
            if isFirstTeam {
                teams?.firstTeam.score += 1
            } else {
                teams?.secondTeam.score += 1
            }
            let gameResultVC = GameResultViewController()
            gameResultVC.teams = teams
            navigationController?.pushViewController(gameResultVC, animated: true)
        } else {
            buttonTapsCount += 1
            if isFirstTeam {
                teams?.firstTeam.score += 1
            } else {
                teams?.secondTeam.score += 1
            }
            if let navigator = navigationController {
                let correctVC = CorrectViewController()
                correctVC.teams = teams
                correctVC.isFirstTeam = isFirstTeam
                navigator.pushViewController(correctVC, animated: false)
            }
        }
    }
    
    @objc func wrongButtonTapped(_ sender: UIButton) {
        isFirstTeam.toggle()
        audio.playSound(sound: "wrong")
        timer.invalidate()
        
        if buttonTapsCount == 3 {
            let gameResultVC = GameResultViewController()
            gameResultVC.teams = teams
            navigationController?.pushViewController(gameResultVC, animated: true)
        } else {
            buttonTapsCount += 1
            if let navigator = navigationController {
                let wrongVC = WrongViewController()
                wrongVC.teams = teams
                wrongVC.isFirstTeam = isFirstTeam
                navigator.pushViewController(wrongVC, animated: false)
            }
        }
    }
    
    @objc func resetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        
        AlertControllerProvider.shared.showAlert(on: self, title: "Сбросить игру?", message: "Вы хотите сбросить вашу игру и вернуться в главное меню?", navigationController: navigationController)
          
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
    
//    func timerStarting(){
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
//            self.counter -= 1
//            self.timerLabel.text = "00:\(String(format: "%02d", self.counter))"
//            print(self.counter)
//
//            if self.counter == 10 {
//                self.audio.playSound(sound: "10-1")
//
//            } else if self.counter == 0 {
//                self.timer.invalidate()
//            }
//        })
//    }
    
//    func stopTimer() {
//        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
//            if self.timerLabel.text != "00:00" {
//               // self.timerLabel.text -= 0.01
//            } else {
//               // self.present(alertTimeIsOut, animated: true)
//                timer.invalidate()
//            }
//        }
//    }
    
    private func createTimer() {
        timerLabel.text = "01:00"
        counter = 60
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }

    @objc
    private func timerAction() {
        counter -= 1
        print(counter)
        let totalTimeforGame = timeStringFor(seconds: counter)
        timerLabel.text = "\(totalTimeforGame)"
        if counter == 0 {
            timer.invalidate()
            let wrongVC = WrongViewController()
            show(wrongVC, sender: self)
        }
    }

    func timeStringFor(seconds : Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour]
        formatter.zeroFormattingBehavior = .pad
        let output = formatter.string(from: TimeInterval(seconds))!
        return seconds < 3600 ? output.substring(from: output.range(of: ":")!.upperBound) : output
    }
}
