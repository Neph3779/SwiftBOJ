/*
 17626 Four Squares
 우선 n의 최대가 5만이다
 5만은 1000의 제곱보다 작으므로 dp 배열은 1000 이하로 잡아도 된다
 n이 주어졌을때 n보다 작거나 같은 제곱을 찾아가다가
 작은걸 찾으면 그만큼 빼주고 다시 뺀 나머지 값을 찾아가면 될듯

 예를 들면 27이 주어졌을때
 작거나 같은 제곱의 최대는 25이므로
 나머지는 2가 남고
 여기서 또 1이 그거이므로
 1을 또 빼고.. 아무튼 이런식으로 깎아나가면 될듯

 + 단순히 제일 큰 제곱수를 빼면 안되는 문제였다
 입력값이 x라 가정하면
 x보다 작은 임의의 제곱수 N + dp[x-N]
 의 최솟값을 구해야하는 문제였다.
 */

var dp = Array.init(repeating: 654321, count: 1000001)
var square = Array.init(repeating: 0, count: 1000)
for i in 0..<1000 {
    square[i] = i*i
}

for i in 1...1000 {
    dp[i*i] = 1
}

func dp(_ x: Int) -> Int {
    if dp[x] != 654321 {
        return dp[x]
    } else {
        var index = 1
        var min = 654321
        while x >= square[index + 1] {
            index += 1
        }

        while index > 0 {
            if min > dp(x-square[index]) + 1 {
                min = dp[x-square[index]] + 1
            }
            index -= 1
        }

        dp[x] = min

        return dp[x]
    }
}

var n = Int(readLine()!)!
print(dp(n))

