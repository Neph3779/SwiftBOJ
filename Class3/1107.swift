/*
 시간제한 2초에 N이 50만 M이 10 제한이므로
 모든 경우의 수를 계산해도 될 것이라 생각했다
 (브루트 포스)
 현재 100번에 위치하는것으로 시작

 남은 숫자들로 최대한 가까운 위치로 이동시킨 뒤
 + / - 버튼으로 이동해야 함

 남아있는 숫자들로 n자리수 (N이 최대 50만이니 최대 6자리 수)
 를 조합하는것으로 하였음

 + 중복순열을 구하는게 너무나 어렵기에
 시간제한을 활용해 그냥 6중 for문을 작성하였음
 코드는 더럽지만.. 못푸는것보단 낫지 뭐..
 추후에 조합관련 코드에 대해 공부해야겠다
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

var minDiff = 50000000
var minDiffNumber = -1


for i1 in 0...9 {
    var num1 = 0
    var num2 = 0
    var num3 = 0
    var num4 = 0
    var num5 = 0
    var num6 = 0

    if !leftNums.contains(i1) {
        num1 = 0
    } else {
        num1 = i1
    }
    for i2 in 0...9 {
        if !leftNums.contains(i2) {
            if num1 == 0 {
                num2 = 0
            } else {
                continue
            }
        } else {
            num2 = i2
        }
        for i3 in 0...9 {
            if !leftNums.contains(i3) {
                if num1 == 0 && num2 == 0 {
                    num3 = 0
                } else {
                    continue
                }
            } else {
                num3 = i3
            }
            for i4 in 0...9 {
                if !leftNums.contains(i4) {
                    if num1 == 0 && num2 == 0 && num3 == 0{
                        num4 = 0
                    } else {
                        continue
                    }
                } else {
                    num4 = i4
                }
                for i5 in 0...9 {
                    if !leftNums.contains(i5) {
                        if num1 == 0 && num2 == 0 && num3 == 0 && num4 == 0 {
                            num5 = 0
                        } else {
                            continue
                        }
                    } else {
                        num5 = i5
                    }
                    for i6 in 0...9 {
                        if !leftNums.contains(i6) {
                            continue
                        } else {
                            num6 = i6
                        }
                        let num = 100000*num1
                        + 10000*num2
                        + 1000*num3
                        + 100*num4
                        + 10*num5
                        + num6

                        if abs(n - num) < minDiff {
                            minDiff = abs(n-num)
                            minDiffNumber = num
                        }
                    }
                }
            }
        }
    }
}

if digit(x: minDiffNumber) + abs(minDiffNumber - n) < abs(100 - n) && minDiffNumber != -1 {
    print(digit(x: minDiffNumber) + abs(minDiffNumber - n))
} else {
    print(abs(100-n))
}
