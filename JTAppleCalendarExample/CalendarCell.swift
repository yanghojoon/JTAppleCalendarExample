//
//  CalendarCell.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/22.
//

import UIKit

import SnapKit
import Then
import JTAppleCalendar

final class CalendarCell: JTACDayCell {
    private let dayLabel = UILabel().then {
        $0.textAlignment = .left
        $0.textColor = .black

        $0.font = .systemFont(ofSize: 10)
    }

    private let divider = UIView().then {
        $0.backgroundColor = .systemGray4
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        render()
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func render() {
        contentView.addSubview(dayLabel)
        contentView.addSubview(divider)

        dayLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().inset(4)
        }

        divider.snp.makeConstraints {
            $0.top.equalTo(dayLabel.snp.bottom).offset(2)
            $0.trailing.leading.equalToSuperview().inset(2)
            $0.height.equalTo(1)
        }
    }

    func configure(state: CellState) {
        dayLabel.text = state.text

        switch state.day {
        case .sunday:
            dayLabel.textColor = .red
        case .saturday:
            dayLabel.textColor = .blue
        default:
            dayLabel.textColor = .black
        }
    }
}
