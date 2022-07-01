/*
 2606 바이러스
 기존의 틀렸던 방식 :
 그래프를 만든뒤 부모를 찾아가는 방식으로 만드려 했었다
 하지만 부모를 매번 타고타고 찾아가는 것, 어떤 간선이 추가되었을때
 관련된 모든 노드들의 부모를 갱신해주는 것이 너무 어려웠다

 해결한 방식:
 이 문제의 목표는 "1과 연결되어있는 노드들을 찾는것" 이므로
 플로이드 와샬을 통해 1이 갈 수 있는 모든 노드들의 최단거리(거리를 굳이 구할 필요는 없지만)
 를 구한다면 연결된 노드들의 수를 알 수 있었다.
 */

let n = Int(readLine()!)!
var matrix = Array.init(repeating: Array.init(repeating: 12345678, count: n), count: n)
for i in 0..<n {
    for j in 0..<n {
        if i == j {
            matrix[i][j] = 0
        }
    }
}
let m = Int(readLine()!)!
for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let src = temp[0]-1
    let dest = temp[1]-1
    matrix[src][dest] = 1
    matrix[dest][src] = 1
}

for way in 0..<n {
    for start in 0..<n {
        for arrive in 0..<n {
            if matrix[start][arrive] > matrix[start][way] + matrix[way][arrive] {
                matrix[start][arrive] = matrix[start][way] + matrix[way][arrive]
            }
        }
    }
}
var count = 0
for i in 1..<n {
    if matrix[0][i] != 12345678 {
        count += 1
    }
}
print(count)
