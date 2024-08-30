//
//  OnBoardingViewController.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/30/24.
//

import UIKit

struct OnBoardingModel {
    let topLabel: String
    let bottomLabel: String
    let image: UIImage
}

class OnBoardingViewController: UIViewController {
    
    private lazy var nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.layer.cornerRadius = 25
        button.setTitle("NEXT", for: .normal)
        button.titleLabel?.font = .robotoBold20()
        button.tintColor = .specialGreen
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.transform = CGAffineTransform.init(scaleX: 1.5, y: 1.5)
        pageControl.isEnabled = false
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        return pageControl
    }()

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.isScrollEnabled = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let idOnBoardingCell = "idOnBoardingCell"
    
    private var onboardingArray: [OnBoardingModel] = []
    
    private var collectionItem = 0
  
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        setDelegates()
    }
    
    
    //MARK: - Setup Views
    private func setupViews() {
        view.backgroundColor = .specialGreen
        
        view.addSubview(nextButton)
        view.addSubview(pageControl)
        view.addSubview(collectionView)
        collectionView.register(OnBoardingCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        guard let firstImage = UIImage(named: "OnBoarding1"),
              let secondImage = UIImage(named: "OnBoarding2"),
              let thirdImage = UIImage(named: "OnBoarding3") else { return }
        
        let firstScreen = OnBoardingModel(topLabel: "Have a good health", bottomLabel: "Take care of your health every day.", image: firstImage)
        
        let secondScreen = OnBoardingModel(topLabel: "Be stronger", bottomLabel: "An active body is a healthy mind.", image: secondImage)
        
        let thirdScreen = OnBoardingModel(topLabel: "Bad body shape", bottomLabel: "Proper nutrition is the key to longevity", image: thirdImage)
        
        onboardingArray = [firstScreen, secondScreen, thirdScreen]
    }
    
    private func setDelegates() {
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    @objc private func nextButtonTapped() {
        if collectionItem == 1 {
            nextButton.setTitle("START", for: .normal)
        }
        
        if collectionItem == 2 {
            saveUserDefaults()
            dismiss(animated: true)
        } else {
            collectionItem += 1
            let index: IndexPath = [0, collectionItem]
            collectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            pageControl.currentPage = collectionItem
        }
    }
    
    private func saveUserDefaults() {
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "OnBoardingWasViewed")
    }
    
}
//MARK: - UICollectionViewDataSource
extension OnBoardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! OnBoardingCollectionViewCell
        let model = onboardingArray[indexPath.item]
        cell.cellConfigure(model: model)
        
        
        return cell
    }
}
//MARK: - UICollectionViewFlowLayout
extension OnBoardingViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.frame.width, height: collectionView.frame.height)
    }
}


//MARK: - Setup Constraints
extension OnBoardingViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
                nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                nextButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                nextButton.heightAnchor.constraint(equalToConstant: 50),

                pageControl.bottomAnchor.constraint(equalTo: nextButton.topAnchor, constant: -20),
                pageControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                pageControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                pageControl.heightAnchor.constraint(equalToConstant: 30),

                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: -20)
            ])
        
        
    }
}
