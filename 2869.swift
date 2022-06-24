/*
 abv의 최대가 1e9이고
 0.15초에 해결해야 한다
 시간제한을 보니 그냥 단순한 수식 계산문제일 확률이 높다
 */
let abv = readLine()!.split(separator: " ").map { Int(String($0))! }
let a = abv[0]
let b = abv[1]
let v = abv[2]

var upLengthPerDay = a - b
var needDay = (v-a) / upLengthPerDay
var leftDay = (v-a)%upLengthPerDay == 0 ? 1 : 2

print(needDay + leftDay)

