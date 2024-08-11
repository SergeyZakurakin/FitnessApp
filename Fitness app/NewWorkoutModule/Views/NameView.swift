//
//  NameView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/8/24.
//

import UIKit

final class NameView: UIView {
    
    //MARK: - UI
    private let nameLabel = UILabel(text: "Name")
    
    private let nameTextField: UITextField = {
        let element = UITextField()
        element.backgroundColor = .specialBrown
        element.borderStyle = .none
        element.layer.cornerRadius = 10
        element.textColor = .specialGray
        element.font = .robotoBold20()
            // add empty View to move text
        element.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        // present empty View
        element.leftViewMode = .always
        element.clearButtonMode = .always
        element.returnKeyType = .done
        
        element.translatesAutoresizingMaskIntoConstraints = false
        return element
    }()
    
    
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(nameLabel)
        addSubview(nameTextField)
        
    }
    
    public func getNameFromTextField() -> String {
        guard let text = nameTextField.text else { return ""}
        return text
    }

}

//MARK: - setup Constraints
extension NameView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            nameLabel.heightAnchor.constraint(equalToConstant: 16),
            
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            nameTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor),

        
        ])
    }
}
