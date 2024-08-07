//
//  CalendarCollectionView.swift
//  Fitness app
//
//  Created by Sergey Zakurakin on 8/7/24.
//

import UIKit
// зеленое вю
class CalendarCollectionView: UICollectionView {
    
    // рассположение и размер ячеек в колекции
    private let collectionLayout = UICollectionViewFlowLayout()
    
    // идентификатор (чтоб не ошибится с текстом)
    private let idCalendarCell = "idCalendarCell"
    
    //MARK: - Life Cycle
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: collectionLayout)
        
        setupLayout()
        configure()
        setDelegates()
        
        // рергистрация ячейки CalendarCollectionViewCell
        register(CalendarCollectionViewCell.self, forCellWithReuseIdentifier: idCalendarCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Set Delegates
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    //MARK: - Setup Layout
    private func setupLayout() {
        // настройка размеров ячеек в вью
        collectionLayout.minimumInteritemSpacing = 3 // рассаяние между ячейками
//        collectionLayout.scrollDirection = .horizontal - настройка скролл
    }
    
    //MARK: - setup Configuration
    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
}


//MARK: - UICollectionViewDataSource
extension CalendarCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    // кастим UICollectionViewCell до CalendarCollectionViewCell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: idCalendarCell, for: indexPath) as? CalendarCollectionViewCell else { return UICollectionViewCell()}
        
        
        
        return cell
    }
}
//MARK: - UICollectionViewDelegate
extension CalendarCollectionView: UICollectionViewDelegate {
    // метод когда тапаем на ячейку
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("tap collection item")
    }
    
    
}


//MARK: - UICollectionViewDelegateFlowLayout
extension CalendarCollectionView: UICollectionViewDelegateFlowLayout {
    // метод установки размеров и рассположения ячеек
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 8, height: collectionView.frame.height)
    }
}
