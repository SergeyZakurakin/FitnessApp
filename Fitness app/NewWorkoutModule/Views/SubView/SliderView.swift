//
//  SliderView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/9/24.
//

import UIKit

protocol SliderViewProtocol: AnyObject {
    func changeValue(type: SliderTypes, value: Int)
}

final class SliderView: UIView {
    
    weak var delegate: SliderViewProtocol?
    
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
    
    
    //MARK: - Private properties
    private var sliderType: SliderTypes?
    
    //MARK: - Public properties
    public var isActive: Bool = true {
        didSet {
            if isActive == true {
                nameLabel.alpha = 1
                numberLabel.alpha = 1
                slider.alpha = 1
            } else {
                nameLabel.alpha = 0.5
                numberLabel.alpha = 0.5
                slider.alpha = 0.5
                slider.value = 0
                numberLabel.text = "0"
            }
        }
    }
    
    //MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    convenience init(name: String, maxValue: Float, type: SliderTypes) {
        self.init(frame: .zero)
        
        nameLabel.text = name
        slider.maximumValue = maxValue
        sliderType = type
        
        setupView()
        setupConstraints()
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
        
        slider.addTarget(self, action: #selector(sliderChanged), for: .valueChanged)
    }
    
    @objc private func sliderChanged() {
        let intValueSlider = Int(slider.value)
        numberLabel.text = sliderType == .timer ? intValueSlider.getTimeFromSeconds() : "\(intValueSlider)"
        guard let type = sliderType else { return }
        delegate?.changeValue(type: type, value: intValueSlider)
    }
    
    //MARK: - Public Methods
    public func resetValues() {
        numberLabel.text = "0"
        slider.value = 0
        isActive = true
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
