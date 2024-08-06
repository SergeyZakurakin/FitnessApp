//
//  MainViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/5/24.
//

import UIKit

final class MainViewController: UIViewController {

    private let userImageImageView: UIImageView = {
        let element = UIImageView()
        element.backgroundColor = #colorLiteral(red: 0.8044065833, green: 0.8044064641, blue: 0.8044064641, alpha: 1)  // #colorLiteral()
        element.layer.borderColor = UIColor.white.cgColor
        element.layer.borderWidth = 5
        
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    //MARK: - Life Cycle
    override func viewDidLayoutSubviews() {
        userImageImageView.layer.cornerRadius = userImageImageView.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.9294117647, blue: 0.8862745098, alpha: 1)
        setupViews()
        setupConstraints()
    }

    
    private func setupViews() {
        view.addSubview(userImageImageView)
    }

}

extension MainViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
        
            userImageImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            userImageImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            userImageImageView.heightAnchor.constraint(equalToConstant: 100),
            userImageImageView.widthAnchor.constraint(equalToConstant: 100),
        
        ])
        
        
        
    }
    
    
    
    
}
