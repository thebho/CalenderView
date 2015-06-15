//
//  CalenderMonthViewController.swift
//  Theater Simulation
//
//  Created by Brian Hoehne on 4/4/15.
//  Copyright (c) 2015 BHD. All rights reserved.
//

import UIKit

extension NSDate {
    func dayInFuture (day: Int = 0, week: Int = 0, month: Int = 0, year: Int = 0) -> NSDate?{
        let calender = NSCalendar.currentCalendar()
        var dateCopy = self
        let components = NSDateComponents()
        let weekToDay = week * 7
        components.day = day + weekToDay
        components.month = month
        components.year = year
        return calender.dateByAddingComponents(components, toDate: dateCopy, options: nil)!
        
    }

    
    func dateFormatted() -> String {
        var newDateFormatter = NSDateFormatter()
        newDateFormatter.dateFormat = "MMMM YYYY"
        return newDateFormatter.stringFromDate(self)
    }
    
    func dayFormatted() -> String {
        var newDateFormatter = NSDateFormatter()
        newDateFormatter.dateFormat = "d"
        return newDateFormatter.stringFromDate(self)
    }
    
    func firstOfMonth () -> (NSDate) {
        let calender = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
        let firstDay = calender.components(flags, fromDate: self)
        firstDay.day = 1
        let returnDate = calender.dateFromComponents(firstDay)!
        let com = calender.components(.WeekdayCalendarUnit, fromDate: returnDate)
        return returnDate
    }
    
    func monthInfo() -> (firstDayOfTheWeekIndex: Int, numberOfMonthDays: Int) {
        let calender = NSCalendar.currentCalendar()
        let components = NSDateComponents()
        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
        let firstDay = calender.components(flags, fromDate: self)
        firstDay.day = 1
        let returnDate = calender.dateFromComponents(firstDay)!
        let com = calender.components(.WeekdayCalendarUnit, fromDate: returnDate)
        let firstDayOfTheWeek = com.weekday
        let monthComponents = NSDateComponents()
        components.month = 1
        var numOfDays = calender.dateByAddingComponents(components, toDate: self, options: nil)!
        let lastDay = calender.components(flags, fromDate: numOfDays)
        lastDay.day = 0
        numOfDays = calender.dateFromComponents(lastDay)!
        let monComp = calender.components(.DayCalendarUnit, fromDate: numOfDays)
        let returnDays = monComp.day
        
        return (firstDayOfTheWeek,returnDays)
        
    }

}
//class DateTest{
//    var currentDate: NSDate?
//
//    func getNextJanuary () -> NSDate{
//        var dateCopy = currentDate
//        let calender = NSCalendar.currentCalendar()
//        let components = NSDateComponents()
//        components.year = 1
//        dateCopy = calender.dateByAddingComponents(components, toDate: dateCopy!, options: nil)!
//        let flags: NSCalendarUnit = .DayCalendarUnit | .MonthCalendarUnit | .YearCalendarUnit
//        let janFirst = calender.components(flags, fromDate: dateCopy!)
//        janFirst.day = 1
//        janFirst.month = 1
//        dateCopy = calender.dateFromComponents(janFirst)!
//
//        return dateCopy!
//
//    }

class CalendarDayView: UIView {
    var date: NSDate?
}

class CalendarMonthViewController: UIViewController {
    
    var startingDay: NSDate?
    var dayViewArray = [CalendarDayView]()
    var dayCellsActive: Bool = false
    var datesPlaced = false
    var numberActive = false
    
    @IBOutlet weak var monthHeader: UILabel!
    @IBOutlet weak var day1: CalendarDayView!
    @IBOutlet weak var day2: CalendarDayView!
    @IBOutlet weak var day3: CalendarDayView!
    @IBOutlet weak var day4: CalendarDayView!
    @IBOutlet weak var day5: CalendarDayView!
    @IBOutlet weak var day6: CalendarDayView!
    @IBOutlet weak var day7: CalendarDayView!
    @IBOutlet weak var day8: CalendarDayView!
    @IBOutlet weak var day9: CalendarDayView!
    @IBOutlet weak var day10: CalendarDayView!
    @IBOutlet weak var day11: CalendarDayView!
    @IBOutlet weak var day12: CalendarDayView!
    @IBOutlet weak var day13: CalendarDayView!
    @IBOutlet weak var day14: CalendarDayView!
    @IBOutlet weak var day15: CalendarDayView!
    @IBOutlet weak var day16: CalendarDayView!
    @IBOutlet weak var day17: CalendarDayView!
    @IBOutlet weak var day18: CalendarDayView!
    @IBOutlet weak var day19: CalendarDayView!
    @IBOutlet weak var day20: CalendarDayView!
    @IBOutlet weak var day21: CalendarDayView!
    @IBOutlet weak var day22: CalendarDayView!
    @IBOutlet weak var day23: CalendarDayView!
    @IBOutlet weak var day24: CalendarDayView!
    @IBOutlet weak var day25: CalendarDayView!
    @IBOutlet weak var day26: CalendarDayView!
    @IBOutlet weak var day27: CalendarDayView!
    @IBOutlet weak var day28: CalendarDayView!
    @IBOutlet weak var day29: CalendarDayView!
    @IBOutlet weak var day30: CalendarDayView!
    @IBOutlet weak var day31: CalendarDayView!
    @IBOutlet weak var day32: CalendarDayView!
    @IBOutlet weak var day33: CalendarDayView!
    @IBOutlet weak var day34: CalendarDayView!
    @IBOutlet weak var day35: CalendarDayView!
    @IBOutlet weak var day36: CalendarDayView!
    @IBOutlet weak var day37: CalendarDayView!
    @IBOutlet weak var day38: CalendarDayView!
    @IBOutlet weak var day39: CalendarDayView!
    @IBOutlet weak var day40: CalendarDayView!
    @IBOutlet weak var day41: CalendarDayView!
    @IBOutlet weak var day42: CalendarDayView!
    @IBOutlet weak var swipeGesture: UISwipeGestureRecognizer!
    
    @IBAction func changeMonth(sender: UISwipeGestureRecognizer) {
        var newDay: NSDate?
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            newDay = startingDay!.dayInFuture(day: 0, week: 0, month: 1, year: 0)
        case UISwipeGestureRecognizerDirection.Right:
            newDay = startingDay!.dayInFuture(day: 0, week: 0, month: -1, year: 0)
        default:
            break
        }
        startingDay = newDay!.firstOfMonth()
        refreshCalender()
    }
    
    @IBAction func Tap(sender: UITapGestureRecognizer) {
        if let view = sender.view as? CalendarDayView {
            if let date = view.date {
                println(date.dayFormatted())
            }else{
                println("Empty Date cell")
            }
        }
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startingDay = NSDate().firstOfMonth()
        dayViewArray.append(day1)
        dayViewArray.append(day2)
        dayViewArray.append(day3)
        dayViewArray.append(day4)
        dayViewArray.append(day5)
        dayViewArray.append(day6)
        dayViewArray.append(day7)
        dayViewArray.append(day8)
        dayViewArray.append(day9)
        dayViewArray.append(day10)
        dayViewArray.append(day11)
        dayViewArray.append(day12)
        dayViewArray.append(day13)
        dayViewArray.append(day14)
        dayViewArray.append(day15)
        dayViewArray.append(day16)
        dayViewArray.append(day17)
        dayViewArray.append(day18)
        dayViewArray.append(day19)
        dayViewArray.append(day20)
        dayViewArray.append(day21)
        dayViewArray.append(day22)
        dayViewArray.append(day23)
        dayViewArray.append(day24)
        dayViewArray.append(day25)
        dayViewArray.append(day26)
        dayViewArray.append(day27)
        dayViewArray.append(day28)
        dayViewArray.append(day29)
        dayViewArray.append(day30)
        dayViewArray.append(day31)
        dayViewArray.append(day32)
        dayViewArray.append(day33)
        dayViewArray.append(day34)
        dayViewArray.append(day35)
        dayViewArray.append(day36)
        dayViewArray.append(day37)
        dayViewArray.append(day38)
        dayViewArray.append(day39)
        dayViewArray.append(day40)
        dayViewArray.append(day41)
        dayViewArray.append(day42)

        for view in dayViewArray {
            var touch = UITapGestureRecognizer(target:self, action:"Tap:")
            view.addGestureRecognizer(touch)
        }

        var swipeRight = UISwipeGestureRecognizer(target: self, action: "changeMonth:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        var swipeLeft = UISwipeGestureRecognizer(target: self, action: "changeMonth:")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    override func viewDidLayoutSubviews() {
        refreshCalender()

    }
    
    func dayViewInfo (index: Int) -> (day: String, color: UIColor) {
        if dayCellsActive {
            return ("\(index)", UIColor.whiteColor())
        } else {
          return ("",UIColor(white: 1, alpha: 0))
        }
    }
    

    func refreshCalender () {
        for i in 0..<dayViewArray.count {
            for view in dayViewArray[i].subviews {
                view.removeFromSuperview()
            }
            dayViewArray[i].alpha = 0.3
            
        }
        
        var currentDay = startingDay
        let monthInfo = currentDay!.monthInfo()
        var firstDay = monthInfo.firstDayOfTheWeekIndex
        var numberOfDays = monthInfo.numberOfMonthDays
        var startingIndex = firstDay - 1
        monthHeader.text = currentDay!.dateFormatted()
        for i in startingIndex...numberOfDays + startingIndex-1{
            let frame = dayViewArray[i].frame
            var label = UILabel(frame: CGRectMake(0,0,frame.width-4,30))
            label.textAlignment = NSTextAlignment.Right
            label.text = currentDay!.dayFormatted()
            dayViewArray[i].date = currentDay!
            dayViewArray[i].addSubview(label)
            dayViewArray[i].alpha = 1
            
            currentDay = currentDay!.dayInFuture(day: 1)

        }
        datesPlaced = true
    }
    
    

}
