//
//  CommunityViewController.swift
//  HabitBuilder
//
//  Created by Rustem Manafov on 09.12.22.
//

import UIKit

class CommunityViewController: MainVC {
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var hourView: UIView!
    @IBOutlet weak var minuteView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    @IBOutlet weak var middleView: UIView!
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var firstLine: UIView!
    @IBOutlet weak var secondLine: UIView!
    @IBOutlet weak var thirdLine: UIView!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondViewLabel: UILabel!
    @IBOutlet weak var thirdLabel: UILabel!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var thirdImage: UIImageView!
    
    @IBOutlet weak var firstPopularView: UIView!
    @IBOutlet weak var firstPlanLabel: UILabel!
    @IBOutlet weak var firstPriceLabel: UILabel!
    @IBOutlet weak var firstLineView: UIView!
    @IBOutlet weak var monthlyLabel: UILabel!
    
    @IBOutlet weak var secondPopularView: UIView!
    @IBOutlet weak var secondMidPopView: UIView!
    @IBOutlet weak var secondHeadLabel: UILabel!
    @IBOutlet weak var secondPriceLabel: UILabel!
    @IBOutlet weak var secondPlanLabel: UILabel!
    @IBOutlet weak var secondLineView: UIView!
    @IBOutlet weak var yearlyButtonLabel: UILabel!
    
    @IBOutlet weak var thirdPopularView: UIView!
    @IBOutlet weak var thirdPriceLabel: UILabel!
    @IBOutlet weak var thirdPlanLabel: UILabel!
    @IBOutlet weak var thirdLineView: UIView!
    @IBOutlet weak var lifetimeButtonLabel: UILabel!
    
    @IBOutlet weak var firstButtonOutlet: UIButton!
    @IBOutlet weak var secondButtonOutlet: UIButton!
    @IBOutlet weak var thirdButtonOutlet: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var timer: Timer!
    
    let futureDate = "31/12/2022-21:00:00"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerView.layer.cornerRadius = 12
        headerImage.layer.cornerRadius = 12
        hourView.layer.cornerRadius = 12
        minuteView.layer.cornerRadius = 12
        secondView.layer.cornerRadius = 12
        
        percentLabel.textColor = UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00)
        percentLabel.font = UIFont(name: "Manrope-Bold", size: 20)
        
        descriptionLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.5)
        percentLabel.font = UIFont(name: "Manrope-Medium", size: 12)
        
        hourView.backgroundColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.1)
        minuteView.backgroundColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.1)
        secondView.backgroundColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.1)
        
        hourLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        minuteLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        secondViewLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        
        middleView.layer.cornerRadius = 12
        
        firstLine.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        secondLine.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        thirdLine.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        
        firstImage.layer.cornerRadius = 11
        secondImage.layer.cornerRadius = 11
        thirdImage.layer.cornerRadius = 11
        
        headerLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        firstLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        secondViewLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        thirdLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        
        firstPopularView.layer.cornerRadius = 12
        firstLineView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        firstPriceLabel.textColor = UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00)
        firstPlanLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.5)
        monthlyLabel.tintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        
        secondPopularView.layer.cornerRadius = 12
        
        // make cornerRadius just top side first methods
        
        // secondMidPopView.clipsToBounds = true
        // secondMidPopView.layer.cornerRadius = 12
        // secondMidPopView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        secondLineView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        secondPriceLabel.textColor = UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00)
        secondPlanLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.5)
        yearlyButtonLabel.tintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        
        thirdPopularView.layer.cornerRadius = 12
        thirdLineView.backgroundColor = UIColor(red: 1.00, green: 0.95, blue: 0.91, alpha: 1.00)
        thirdPriceLabel.textColor = UIColor(red: 0.99, green: 0.65, blue: 0.35, alpha: 1.00)
        thirdPlanLabel.textColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 0.5)
        lifetimeButtonLabel.tintColor = UIColor(red: 0.34, green: 0.20, blue: 0.33, alpha: 1.00)
        
        firstButtonOutlet.setTitle("", for: .normal)
        secondButtonOutlet.setTitle("", for: .normal)
        thirdButtonOutlet.setTitle("", for: .normal)
        
        //  timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateDate), userInfo: nil, repeats: true)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        secondMidPopView.roundCorners(corners: [.topLeft, .topRight], radius: 12)
    }
    
    func secondsToHoursMinutesSeconds(_ seconds: Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    @objc func updateDate() {
        let now = Date()
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "dd/MM/yyyy-HH:mm:ss"
        
        let nowStr = formatter.string(from: now)
        
        let futureDateDate: Date = formatter.date(from: futureDate)!
        
        let difference = futureDateDate - now
        let diiferenceSeperated = secondsToHoursMinutesSeconds(Int(difference))
                
        hourLabel.text = diiferenceSeperated.0.beautifyDigit()
        minuteLabel.text = diiferenceSeperated.1.beautifyDigit()
        secondLabel.text = diiferenceSeperated.2.beautifyDigit()
        
        if nowStr == futureDate {
            print("Shukur, bu gunu de gorduk")
            timer.invalidate()
        }
    }
    
    /*
     @objc func updateTime() {
     let date = Date()
     let userCalendar = Calendar.current
     let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
     let currentDate = userCalendar.date(from: components)!
     
     var dateComponents = DateComponents()
     dateComponents.year = 2023
     dateComponents.month = 01
     dateComponents.day = 01
     dateComponents.hour = 00
     dateComponents.minute = 00
     dateComponents.second = 00
     dateComponents.timeZone = .current
     
     let eventDate = userCalendar.date(from: dateComponents)!
     
     let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
     
     hourLabel.text = "\(timeLeft.hour!)"
     minuteLabel.text = "\(timeLeft.minute!)"
     secondLabel.text = "\(timeLeft.second!)"
     
     endEvent(currentdate: currentDate, eventdate: eventDate)
     }
     
     func endEvent(currentdate: Date, eventdate: Date) {
     if currentdate >= eventdate {
     percentLabel.text = "Happy New Year!"
     timer.invalidate()
     }
     }
     */
    
    @IBAction func idenfifywhichpressed(sender: UIButton) {
        
        switch sender.tag {
        case 100:
            print("first")
            firstPopularView.dropShadow()
            secondPopularView.layer.shadowOpacity = 0
            thirdPopularView.layer.shadowOpacity = 0


            firstPopularView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            secondPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
            thirdPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
        case 101:
            print("second")
            secondPopularView.dropShadow()
            firstPopularView.layer.shadowOpacity = 0
            thirdPopularView.layer.shadowOpacity = 0


            secondPopularView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            firstPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
            thirdPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
        case 102:
            print("third")
            thirdPopularView.dropShadow()
            firstPopularView.layer.shadowOpacity = 0
            secondPopularView.layer.shadowOpacity = 0


            thirdPopularView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
            firstPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
            secondPopularView.transform = CGAffineTransform(scaleX: 1, y: 1)
        default:
            print("default")
        }
    }
}

extension Date {
    func get(_ type: Calendar.Component)-> String {
        let calendar = Calendar.current
        let t = calendar.component(type, from: self)
        return (t < 10 ? "0\(t)" : t.description)
    }
    
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}

extension UIView {
    // make cornerRadius just top side second methods
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func dropShadow() {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        layer.shouldRasterize = true
    }
}

//extension String {
//    func PadLeft( totalWidth: Int, byString: String) -> String {
//        let toPad = totalWidth - self.count
//        if toPad < 1 {
//            return self
//        }
//
//        return "".padding(toLength: toPad, withPad: byString, startingAt: 0) + self
//    }
//}

extension Int {
    func beautifyDigit() -> String {
        if self < 0 {
            if self > -10 {
                return "-0\(self * -1)"
            } else {
                return "\(self)"
            }
        } else {
            if self < 10 {
                return "0\(self)"
            } else {
                return "\(self)"
            }
        }
    }
}
