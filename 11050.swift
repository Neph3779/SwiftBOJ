/*
 이항계수를 구하는 문제이다.
 단순히 팩토리얼로 계산하여도 이 문제에서는 N이 1이상 10 이하이기 때문에
 타임아웃의 우려가 없지만 DP를 사용하여 해결하였다.

 nCk = nCk-1 + n-1Ck-1의 성질을 이용하면 해결할 수 있다.
 bottom up과 top down 중 top down을 사용해보았다.

  ** 해결하지 않은 문제 **
 overflow 발생시의 문제는 해결하지 않았다
 만약 overflow를 해결하고 싶다면
 int를 사용하는 것이 아닌 string을 사용하여
 string의 원소 하나하나에 숫자를 담는 방법이 있다.
 위 문제는 알고리즘 수업시간에 과제로 다루었으므로 구현은 생략했다.
 */

var arr = Array.init(repeating: Array.init(repeating: -1, count: 100),
                     count: 100) // 문제에서 주어진 N의 범위에 따라 적절히 잡으면 될듯함.

func coef(n: Int, k: Int) -> Int {
    if n < k {
        return 0
    }
    if k == 0 {
        return 1
    }
    if arr[n][k] == -1 {
        arr[n-1][k-1] = coef(n: n-1, k: k-1)
        arr[n-1][k] = coef(n: n-1, k: k)
        return arr[n-1][k-1] + arr[n-1][k]
    } else {
        return arr[n][k]
    }
}


let nk = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nk[0]
let k = nk[1]

print(coef(n: n, k: k))
