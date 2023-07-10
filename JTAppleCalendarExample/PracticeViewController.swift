//
//  PracticeViewController.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/23.
//

import Foundation

import UIKit

import SnapKit
import JTAppleCalendar

final class PracticeViewController: UIViewController {
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 4

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false

        return collectionView
    }()

    private let colorSet: [UIColor] = [.black, .red, .orange, .blue]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        setAttributes()
    }

    private func render() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(150)
        }
    }

    private func setAttributes() {
        view.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PracticeCell.self, forCellWithReuseIdentifier: "PracticeCell")
    }
}

extension PracticeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colorSet.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PracticeCell", for: indexPath)
        cell.backgroundColor = colorSet[indexPath.item]

        return cell
    }
}

final class PracticeCell: UICollectionViewCell {
    
}
