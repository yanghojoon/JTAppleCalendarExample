//
//  ViewController.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/21.
//

import UIKit

import SnapKit

final class ViewController: UIViewController {
    private let basicCalendarButton: UIButton = {
        let button = UIButton()
        
        var buttonConfiguration = UIButton.Configuration.bordered()
        
        buttonConfiguration.background.backgroundColor = .systemGray6
        buttonConfiguration.baseForegroundColor = .black
        
        buttonConfiguration.title = "기본 달력"
        
        let handler: UIButton.ConfigurationUpdateHandler = { button in
            switch button.state {
            case .highlighted:
                button.configuration?.background.backgroundColor = .systemGray4
            default:
                button.configuration?.background.backgroundColor = .systemGray6
            }
        }

        button.configuration = buttonConfiguration
        button.configurationUpdateHandler = handler
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        render()
        setAttributes()
    }

    private func render() {
        view.addSubview(basicCalendarButton)

        basicCalendarButton.snp.makeConstraints {
            $0.top.equalToSuperview().inset(150)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }

    private func setAttributes() {
        basicCalendarButton.addTarget(self, action: #selector(tapBasicCalendarButton), for: .touchUpInside)
    }

    @objc
    private func tapBasicCalendarButton() {
        let basicCalendarViewController = BasicCalendarViewController()

        navigationController?.pushViewController(basicCalendarViewController, animated: true)
    }
}

