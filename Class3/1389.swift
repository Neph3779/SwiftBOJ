/*
 거쳐가는 단계를 세어주면 된다.
 다익스트라의 반복이 아닌 플로이드 와샬을 이용해야 했던 문제이다
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var graph = Array.init(repeating: Array.init(repeating: 0, count: 0), count: n)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[temp[0]-1].append(temp[1]-1)
    graph[temp[1]-1].append(temp[0]-1)
}

var kbNum = Array.init(repeating: Array.init(repeating: 5500, count: n), count: n)

for i in 0..<graph.count {
    kbNum[i][i] = 0
    for j in 0..<graph[i].count {
        kbNum[i][graph[i][j]] = 1
    }
}

for way in 0..<n {
    for start in 0..<n { // 도착지
        for dest in 0..<n { // 거쳐갈 곳
            if kbNum[start][dest] > kbNum[start][way] + kbNum[way][dest] {
                kbNum[start][dest] = kbNum[start][way] + kbNum[way][dest]
            }
        }
    }
}

let kbNumSum = kbNum.map {
    $0.reduce(into: 0) {
        $0 += $1
    }
}
var min = 5500
var answer = -1
for i in 0..<n {
    if kbNumSum[i] < min {
        min = kbNumSum[i]
        answer = i
    }
}
print(answer+1)
