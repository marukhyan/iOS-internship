import Foundation

class NumbersGenerator {
    func printData() {
        DispatchQueue.global().async {
            for i in 0...9 {
                print(i)
            }
        }
        
        DispatchQueue.global().async {
            for i in 10...99 {
                print(i)
            }
        }
        
        DispatchQueue.global().async {
            for i in 100...999 {
                print(i)
            }
        }
    }
}

var generator = NumbersGenerator()
generator.printData()
_ = readLine()
