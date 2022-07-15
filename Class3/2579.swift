/*
 2579 계단 오르기
 dp[x][i]를 만들어서
 i는 현재 쌓인 계단의 스택 (0은 존재 불가, 1아니면 2)
 x는 현재 계단 위치로 표현했다.
 뭔가 문제의 조건이 엉성한 느낌이 드는... (첫 계단부터 2칸 점프가 가능하단건지 아닌건지 헷갈렸다)
 */

let n = Int(readLine()!)!
var stairs = [Int]()
for _ in 0..<n {
    stairs.append(Int(readLine()!)!)
}
var dp = Array.init(repeating: Array.init(repeating: 0, count: 3), count: n)
func answer() {
    dp[0][1] = stairs[0]
    if n == 1 {
        print(stairs[0])
        return
    }
    dp[1][2] = stairs[0] + stairs[1]
    dp[1][1] = stairs[1]
    for i in 2..<n {
        dp[i][1] = stairs[i] + max(dp[i-2][1], dp[i-2][2])
        dp[i][2] = stairs[i] + dp[i-1][1]
    }


    print(dp.last!.max()!)
}



answer()
