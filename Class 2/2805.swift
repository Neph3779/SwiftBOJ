/*
 나무의 수(N)는 1e6 길이(M)는 2e9까지가 범위인 문제이다.
 이진탐색으로 O(NlogM)에 해결할 수 있을 것 같다.

 가끔 이진탐색시에 mid의 값이 (left + right) / 2 인지
 여기에 +1 한건지가 헷갈릴땐
 left 30 right 31 같은 1 차이나는 상황일때 (30이 정답인 경우)
 를 만족해야함을 생각하자
 */
var arr = [Int]()
let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = nm[1]
let treeHeights = readLine()!.split(separator: " ").map { Int(String($0))! }



func totalTreeLength(cutHeight: Int) -> Int {
    var sum = 0
    for height in treeHeights {
        if height > cutHeight {
            sum += (height - cutHeight)
        }
    }
    return sum
}

var temp = 0
var answer = 0
var left = 0
var right = 2000000000
while true {
    let mid = (left + right) / 2
    let totalLength = totalTreeLength(cutHeight: mid)
    if totalLength > m {
        if temp == mid {
            answer = mid
            break
        }
        temp = mid
        left = mid + 1
    } else if totalLength == m {
        answer = mid
        break
    } else {
        right = mid - 1
    }
}

print(answer)
