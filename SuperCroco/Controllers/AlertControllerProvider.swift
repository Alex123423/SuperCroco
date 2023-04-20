//
//  AlertControllerProvider.swift
//  SuperCroco
//
//  Created by Tatiana Zudina on 20.04.2023.
//


import Foundation
import UIKit

class AlertControllerProvider {
	
	static let shared = AlertControllerProvider()
	
	init() {}
	
	func showAlert(on viewController: UIViewController, title: String?, message: String?, preferredStyle: UIAlertController.Style = .alert, actions: [UIAlertAction] = [], completion: (() -> Void)? = nil) {
		
		let alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
		
		if actions.isEmpty {
			let yesAction = UIAlertAction(title: "Да", style:.destructive, handler:  {_ in (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeViewController(
				viewController: TeamViewController(),
				animated: true,
				animationOptions: .transitionFlipFromBottom
			)})
			let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
			alertController.addAction(yesAction)
			alertController.addAction(cancelAction)
		} else {
			for action in actions {
				alertController.addAction(action)
			}
		}
		
		viewController.present(alertController, animated: true, completion: completion)
	}
}
