import UIKit

// 1번
// 1. "최종 결제 금액: (최종 결제 금액)원"과 같이 출력되도록 작성해주세요!
//func calculateTotalPrice(Price: Int, Tip: Int) {
//    var TotalPrice = Price + Tip
//    return print("최종 결제 금액: \(TotalPrice)원")
//}
//
//calculateTotalPrice(Price: 10000, Tip: 2000)

// 2. "덥다", "춥다", "적당하다"와 같이 출력되도록 작성해주세요!
//func checkTemperature(Temperature: Int) {
//    if Temperature > 30 {
//        print("덥다")
//    } else if Temperature < 10 {
//        print("춥다")
//    } else {
//        print("적당하다")
//    }
//}
//
//checkTemperature(Temperature: 9)

// 3. "(여행지)에서의 총 여행 예산은 (총 예산)원입니다."와 같이 출력되도록 작성해주세요!
//func printTravelBudget(cityname: String, dates: Int, money: Int){
//    return print("\(cityname)에서의 총 여행 예산은 \(dates * money)원입니다.")
//}
//
//printTravelBudget(cityname: "오사카", dates: 2, money: 200000)

// 4. "오늘 날짜: 2024-09-19"와 같이 오늘 날짜가 "yyyy-MM-dd" 형식으로 출력되도록 작성해주세요!

//func getCurrentDate() -> String {
//    let formatter = DateFormatter()
//    formatter.dateFormat = "yyyy-MM-dd"
//    return formatter.string(from: Date())
//}
//
//print(getCurrentDate())

//2번 문제
// 1. Int 변수를 파라미터로 받는 addValue 클로저를 선언하고 출력해주세요! 값은 임의로 넣어주세요.
//let addValue = { (num: Int) -> Int in
//    var sum: Int = 0
//    for i in 1...num {
//        sum += i
//    }
//    return sum
//}

//print(addValue(10))

// 2. 1번에서 선언한 addValue 클로저를 $를 이용해 경량화 시킨 코드를 아래 넣어주세요!
//let addValue = {
//    var sum: Int = 0
//    for i in 1...$0 {
//        sum += i
//    }
//    return sum
//}
//
//print(addValue(10))

//3번 문제
//class BankAccount {
//    var accountNumber: String
//    var balance: Double
//    
//    init(accountNumber: String, initialBalance: Double) {
//        self.accountNumber = accountNumber
//        if initialBalance < 0 {
//            self.balance = 0
//        } else {
//            self.balance = initialBalance
//        }
//    }
//    
//    func deposit(amount: Double) {
//        balance += amount
//        return print("입금된 금액: \(amount), 현재 잔액: \(balance)")
//    }
//    
//    func withdraw(amount: Double) {
//        if amount > balance {
//            return print("Insufficient funds, 현재 잔액: \(balance)")
//        } else {
//            balance -= amount
//            return print("출금된 금액: \(amount), 현재 잔액: \(balance)")
//        }
//    }
//}
///* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */
//
//let account = BankAccount(accountNumber: "123-456", initialBalance: 100.0)
//
//account.deposit(amount: 50.0) // 출력: "Deposited 50.0. Current balance: 150.0"
//account.withdraw(amount: 30.0) // 출력: "Withdrew 30.0. Current balance: 120.0"
//account.withdraw(amount: 200.0) // 출력: "Insufficient funds. Current balance: 120.0"

//4번 문제
//struct Car {
//    var make: String
//    var model: String
//    var year: Int
//    var mileage: Double
//    var isRunning: Bool
//    
//    init(make: String, model: String, year: Int, mileage: Double, isRunning: Bool) {
//        self.make = make
//        self.model = model
//        self.year = year
//        self.mileage = mileage
//        self.isRunning = isRunning
//    }
//    
//    mutating func start() {
//        if isRunning == true {
//            print("차 이미 시동 중")
//        } else {
//            isRunning = true
//            print("차 시동 걸림")
//        }
//    }
//    
//    mutating func stop() {
//        if isRunning == false {
//            print("차 이미 꺼짐")
//        } else {
//            isRunning = false
//            print("차 시동 꺼짐")
//        }
//    }
//    
//    mutating func drive(distance: Double) {
//        if isRunning == false {
//            print("이동 불가능. 차 시동 꺼짐")
//        } else {
//            mileage += distance
//            print("이동 거리: \(distance), 현재 mileage: \(mileage)")
//        }
//    }
//}

/* 코드 시나리오, 위 클래스 구현 후 실행 시켜주세요! */

//var myCar = Car(make: "한국", model: "KIA", year: 2024, mileage: 15000.0, isRunning: false)
//
//myCar.start() // 출력: "차 시동 걸림."
//myCar.drive(distance: 100) // 출력: "이동거리 100 km. 현재 mileage: 15100 km"
//myCar.stop() // 출력: "차 시동 꺼짐."
//myCar.drive(distance: 50) // 출력: "이동 불가능. 차 시동 꺼짐."
//myCar.start() // 출력: "차 시동 켜짐"
//myCar.start() // 출력: "차 이미 시동 중."

