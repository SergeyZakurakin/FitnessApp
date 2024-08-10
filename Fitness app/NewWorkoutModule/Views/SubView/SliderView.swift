//
//  SliderView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/9/24.
//

import UIKit

final class SliderView: UIView {
    
    private let nameLabel = UILabel(
        text: "Name",
        font: .robotoMedium18(),
        textColor: .specialGray
    )
    
    private let numberLabel = UILabel(
        text: "0",
        font: .robotoMedium24(),
        textColor: .specialGray
    )
    
    private lazy var slider = GreenSlider()
    
    private var mainStackView = UIStackView()
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    convenience init(name: String, maxValue: Float) {
        self.init(frame: .zero)
        
        nameLabel.text = name
        slider.maximumValue = maxValue
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        
        let labelsStackView = UIStackView(
            arrangedSubviews: [nameLabel, numberLabel],
            axis: .horizontal,
            spacing: 10
        )
        labelsStackView.distribution = .equalSpacing
        
        mainStackView = UIStackView(
            arrangedSubviews: [labelsStackView, slider],
            axis: .vertical,
            spacing: 10
        )
        addSubview(mainStackView)
    }
}

extension SliderView {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
