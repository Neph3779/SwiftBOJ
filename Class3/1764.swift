/*
 1764 듣보잡
 set으로 해결할 수 있는 간단한 문제이다.
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var nonHeard = Set<String>()
var nonSeen = Set<String>()

for _ in 0..<n {
    nonHeard.update(with: readLine()!)
}

for _ in 0..<m {
    nonSeen.update(with: readLine()!)
}

let answerSet = nonHeard.intersection(nonSeen)
let answer = answerSet.sorted()
print(answer.count)
for answer in answer {
    print(answer)
}

