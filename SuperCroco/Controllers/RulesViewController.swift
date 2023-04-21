//
//  RulesViewController.swift
//  SuperCroco
//
//  Created by Alexey Davidenko on 19.04.2023.
//


import UIKit

class RulesViewController: UIViewController {
	
	private lazy var scrollView: UIScrollView = {
		let scrollView = UIScrollView()
		scrollView.contentSize = contentSize
		scrollView.translatesAutoresizingMaskIntoConstraints = false
		return scrollView
	}()
	
	private lazy var contentView: UIView = {
		let contentView = UIView()
		contentView.frame.size = contentSize
		contentView.translatesAutoresizingMaskIntoConstraints = false
		return contentView
	}()
	
	private var contentSize: CGSize {
		CGSize(width: view.frame.width, height: view.frame.height + 500)
	}
	
	var backgroundImage: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "background")
		image.translatesAutoresizingMaskIntoConstraints = false
		image.contentMode = .scaleAspectFill
		image.clipsToBounds = true
		return image
	}()
	
	var label: UILabel = {
		let label = UILabel()
		label.text = ""
		label.numberOfLines = 1
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	var rulesLabel: UILabel = {
		let label = UILabel()
		label.text = """
	 В игру играют командами из
	 двух или более человек.
	 
	 Задача каждого игрока команды -
	 объяснить слово,
	 
	 которое он видит на экране,
	 следуя условиям,
	 
	 которые дополнительно указаны
	 под загаданным словом.
	 
	 Чем больше слов отгадала команда,
	 тем больше она заработает баллов.
	 
	 Выигрывает команда,
	 набравшая больше всего баллов.
	 
	 На отгадывание слова дается
	 одна минуту. 
	 
	 При нарушении правил объяснения
	 слова, ход передается следующей
	 команде.
	 
	 ...
	 ...
	 """
		label.numberOfLines = 0
		label.textColor = .black
		label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
		label.translatesAutoresizingMaskIntoConstraints = false
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let backButton = UIImage(systemName: "chevron.backward")
		navigationController?.navigationBar.backIndicatorImage = backButton
		navigationController?.navigationBar.backIndicatorTransitionMaskImage = backButton
		navigationController?.navigationBar.backItem?.title = ""
		let backBarButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
		navigationItem.backBarButtonItem = backBarButton
        
        title = ""
		
		setupHierarchy()
		setConstrains()
	}
	
	
	func setupHierarchy() {
		view.addSubview(backgroundImage)
		view.addSubview(label)
		view.addSubview(scrollView)
		scrollView.addSubview(contentView)
		view.addSubview(rulesLabel)
	}
	
	//MARK: - Constrains
	func setConstrains() {
		
		NSLayoutConstraint.activate([
			
			backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
			label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			
			scrollView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
			scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
			contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
			contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
			contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
			
			rulesLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
			rulesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			rulesLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
			rulesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
			
		])
	}
}

