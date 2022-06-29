/*
 첫 생각은
 "-가 나오면 그 뒤의 모든 +를 먼저 계산한뒤 -를 붙여주기"
 였다. 시간복잡도상으로도 큰 문제가 없는 접근방식이다.
 문자열을 분할하는 방법에 대해 복습하는 기회가 되었다. (components, split의 차이 등)
 */
import Foundation

let query = readLine()!
let numArr = query.components(separatedBy: ["+", "-"])
var plusMinusArr = [String]()

query.forEach {
    if Int(String($0)) == nil {
        plusMinusArr.append(String($0))
    }
}

var arr = [String]()

for i in 0..<numArr.count {
    if i == 0 {
        arr.append(numArr[i])
    } else {
        arr.append(plusMinusArr[i-1] + numArr[i])
    }
}

var sum = 0
var minusFlag = false

for element in arr {
    if let intVal = Int(element) {
        if intVal < 0 {
            minusFlag = true
        }
        if minusFlag == true && intVal > 0 {
            sum -= intVal
        } else {
            sum += intVal
        }
    }
}

print(sum)
