/*
 9461 파도반 수열
 그냥 DP인듯? (맞았다)
 1 1 1 2 2 3 4 5 7 9

 dp(n) + dp(n+1) =  dp(n+3)
 */

var dp = Array.init(repeating: 0, count: 100000)

dp[0] = 1
dp[1] = 1
dp[2] = 1
func dp(_ x: Int) -> Int {
    if x < 0 {
        return 0
    }
    if dp[x] != 0 {
        return dp[x]
    } else {
        dp[x] = dp(x-2) + dp(x-3)
        return dp[x]
    }
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let x = Int(readLine()!)!
    print(dp(x-1))
}
