//
//  BasicCalendarViewController.swift
//  JTAppleCalendarExample
//
//  Created by 양호준 on 2023/06/22.
//

import UIKit

import SnapKit
import JTAppleCalendar

final class BasicCalendarViewController: UIViewController {
    private let yearAndMonthLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 25)
    }
    private let calendarView = JTACMonthView()

    override func viewDidLoad() {
        super.viewDidLoad()

        render()
        setAttributes()
    }

    private func render() {
        view.addSubview(yearAndMonthLabel)
        view.addSubview(calendarView)

        yearAndMonthLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(10)
            $0.trailing.equalToSuperview()
        }

        calendarView.snp.makeConstraints {
            $0.top.equalTo(yearAndMonthLabel.snp.bottom)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setAttributes() {
        setBasicAttributes()
        setCalendarAttributes()
    }

    private func setBasicAttributes() {
        view.backgroundColor = .white
        navigationItem.title = "기본 달력"
    }

    private func setCalendarAttributes() {
        calendarView.scrollDirection = .vertical
        calendarView.minimumLineSpacing = 0
        calendarView.minimumInteritemSpacing = 10
        calendarView.scrollingMode = .stopAtEachSection
        calendarView.showsVerticalScrollIndicator = false
        calendarView.showsHorizontalScrollIndicator = false

        calendarView.visibleDates { [weak self] dateSegmentInfo in
            guard let self = self else { return }

            let year = dateSegmentInfo.monthDates.last?.date.year ?? 0
            let month = dateSegmentInfo.monthDates.last?.date.month ?? 0

            if year == 0 || month == 0 {
                self.yearAndMonthLabel.text = "날짜 오류"
            }
            self.yearAndMonthLabel.text = "\(year)년 \(month)월"
        }

        calendarView.register(CalendarCell.self, forCellWithReuseIdentifier: "CalendarCell")

        calendarView.calendarDataSource = self
        calendarView.calendarDelegate = self

        calendarView.scrollToDate(Date(), animateScroll: false)
    }
}

extension BasicCalendarViewController: JTACMonthViewDataSource, JTACMonthViewDelegate {
    func calendar(
        _ calendar: JTAppleCalendar.JTACMonthView,
        willDisplay cell: JTAppleCalendar.JTACDayCell,
        forItemAt date: Date,
        cellState: JTAppleCalendar.CellState, indexPath: IndexPath
    ) { }

    func configureCalendar(
        _ calendar: JTAppleCalendar.JTACMonthView
    ) -> JTAppleCalendar.ConfigurationParameters {
        let startDate = Date().addingTimeInterval(-Date().timeIntervalSince1970)
            .formatted(dateFormat: "yyyy MM dd")
        let endDate = Date().addingTimeInterval(Date().timeIntervalSince1970)
            .formatted(dateFormat: "yyyy MM dd")

        let parameters = ConfigurationParameters(
            startDate: startDate ?? Date(),
            endDate: endDate ?? Date(),
            numberOfRows: 6,
            calendar: Calendar.autoupdatingCurrent,
            generateInDates: .forAllMonths,
            generateOutDates: .tillEndOfRow,
            firstDayOfWeek: .sunday
        )

        return parameters
    }

    func calendar(
        _ calendar: JTAppleCalendar.JTACMonthView,
        cellForItemAt date: Date,
        cellState: JTAppleCalendar.CellState,
        indexPath: IndexPath
    ) -> JTAppleCalendar.JTACDayCell {
        let cell = calendar.dequeueReusableJTAppleCell(
            withReuseIdentifier: "CalendarCell",
            for: indexPath
        ) as! CalendarCell

        if cellState.date.formatted(dateFormat: "yyyy MM dd") == Date().formatted(dateFormat: "yyyy MM dd") {
            cell.layer.borderColor = UIColor.systemOrange.cgColor
            cell.layer.borderWidth = 1
        } else {
            cell.layer.borderWidth = 0
        }

        cell.configure(state: cellState)

        return cell
    }

    func calendar(_ calendar: JTACMonthView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let year = visibleDates.monthDates.last?.date.year ?? 0
        let month = visibleDates.monthDates.last?.date.month ?? 0

        if year == 0 || month == 0 {
            self.yearAndMonthLabel.text = "날짜 오류"
        }
        self.yearAndMonthLabel.text = "\(year)년 \(month)월"
    }
}
