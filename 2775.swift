/*
 이상한 설정 붙여서 문제 만드는건 PS계에서 하나의 밈인듯 ㅋㅋ..

 (a,b) = (a-1,1) + ... + (a-1,b)
 라는 간단한 설정
 어디서 많이 본 느낌이다.
 일단 비어있는 곳은 없고

   0 1 2 3 (호) // 편의상 0 index로 작성
 0 1 2 3 4
 1 1 3 6 10
 2 1 4 10 20
 3 1 5 15 35
(층)

 이런 상황
 dp로 해결할 수 있겠다

 생각보다 시간을 오래 잡아먹었는데 점화식을 똑바로 안써서 헤맸다.
 초기값, 점화식을 검토하고 넘어가는 습관을 들여야겠다.
 */

var arr = Array.init(repeating: Array.init(repeating: 0, count: 16), count: 16)

for i in 0..<15 {
    arr[0][i] = i+1
    arr[i][0] = 1
}

func count(_ n: Int, _ k:Int) -> Int {

    if k<0 {
        return 0
    }
    if arr[n][k] != 0 {
        return arr[n][k]
    } else {
        arr[n][k] = count(n, k-1) + count(n-1, k
        )
        return arr[n][k]
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let n = Int(readLine()!)!
    let k = Int(readLine()!)!

    print(count(n,k-1))
}
