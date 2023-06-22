//
//  BasicCalendarViewController.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/22.
//

import UIKit

final class BasicCalendarViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setAttributes()
    }

    private func setAttributes() {
        view.backgroundColor = .white
        navigationItem.title = "기본 달력"
    }
}
