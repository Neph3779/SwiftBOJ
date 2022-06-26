/*
 시간제한 2초에 N이 50만 M이 10 제한이므로
 모든 경우의 수를 계산해도 될 것이라 생각했다
 (브루트 포스)
 현재 100번에 위치하는것으로 시작

 남은 숫자들로 최대한 가까운 위치로 이동시킨 뒤
 + / - 버튼으로 이동해야 함

 남아있는 숫자들로 n자리수 (N이 최대 50만이니 최대 6자리 수)
 를 조합하는것으로 하였음
 */
func digit(x: Int) -> Int {
    if x == 0 {
        return 1
    }
    var count = 0
    var temp = x
    while temp != 0 {
        temp /= 10
        count += 1
    }
    return count
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var errors = [Int]()
if m > 0 {
    errors = readLine()!.split(separator: " ").map { Int(String($0))! }
}

var remote = [0,1,2,3,4,5,6,7,8,9]
var leftNums = [Int]()

for number in remote {
    if !errors.contains(number) {
        leftNums.append(number)
    }
}

var nArr = Array(String(n)).map { Int(String($0))! }
var answerArr = [Int]()

for number in 0..<nArr.count {
    var minDiff = 5000000
    var minDiffNum = -1
    for leftNum in 0..<leftNums.count {
        var temp = nArr[number]

        if number != 0 && temp == 0 {
            let ansDigit = answerArr.count
            let nDigit = nArr.count
            var tempAns = Int(answerArr.reduce(into: "") {
                $0 += String($1)
            })!
            var digitDiff = nDigit - ansDigit
            while digitDiff != 0 {
                tempAns *= 10
                digitDiff -= 1
            }

            if tempAns < n {
                temp = 10
            } else {
                temp = 0
            }
        }

        if abs(leftNums[leftNum]-temp) < minDiff {
            minDiff = abs(leftNums[leftNum]-temp)
            minDiffNum = leftNums[leftNum]
        }
    }
    answerArr.append(minDiffNum)
}


let answer = Int(answerArr.reduce(into: "") {
    $0 += String($1)
})!


if abs(n - answer) + digit(x: answer) > abs(n - 100) {
    print(abs(n-100))
} else {
    print(abs(n - answer) + digit(x: answer))
}
