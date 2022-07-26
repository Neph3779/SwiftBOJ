/*
 11659 구간 합 구하기 4
 그냥 dp문제인 것 같다. (맞았다)
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let numbers = readLine()!.split(separator: " ").map { Int(String($0))! }
var dp = [0] + numbers
for i in 1..<dp.count {
    dp[i] = dp[i-1] + dp[i]
}
for _ in 0..<nm[1] {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    print(dp[line[1]] - dp[line[0]-1])
}
