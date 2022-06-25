/*
 N의 범위가 5000까지이기 때문에 무식한 방법으로 돌려도
 경우의 수가 1000 * 대략 2000 밑 이라 1초안에 충분하다.

 */

let n = Int(readLine()!)!
var max5 = n / 5
var max3 = n / 3

var answer = -1
var min = Int.max
for i in 0...max5 {
    for j in 0...max3 {
        if 5 * i + 3 * j == n
            && min > i + j {
            min = i + j
        }
    }
}
answer = min == Int.max ? -1 : min
print(answer)
