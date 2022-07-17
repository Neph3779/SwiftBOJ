/*
 5525 IOIOI
 옛날에 문자열 검색 알고리즘 공부했던 기억이 있는데
 그정도로 빡세게 풀어야할 것 같지는 않아서 적당히 구현으로 풀었다.

 String.Element를 담은 배열을 String으로 전환하는 테크닉을 배웠다.
 */

let n = Int(readLine()!)!
_ = readLine()
var word = readLine()!.map{ $0 }

var isLastWordWasI = false
var ioCount = 0
var answer = 0
var index = 0
var didIOCounted = false
while index < word.count - 2 {
    if String(word[index...index+2]) == "IOI" {
        ioCount += 1
        if ioCount == n {
            answer += 1
            ioCount -= 1
        }
        index += 2
    } else {
        ioCount = 0
        index += 1
    }
}
print(answer)
