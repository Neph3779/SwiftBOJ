/*
 11724 연결 요소의 개수
 문제의 키포인트는 홀로있는 엣지들도 하나의 요소로 취급해서 세어주어야 했다는 것이다.
 처음에는 유니온파인드로 접근했었는데 시간초과가 났고(부모를 찾는 과정이 너무 길었던것으로 추측)
 dfs로 바꿔주니 잘 동작하였다.

 문제를 계속 풀면서 느끼는건
 주어진 자료 자체를 뜯어고치려 하지 말고
 그 자료를 바탕으로 탐색하는 것이 훨씬 효율이 좋다고 느껴진다(웬만한 문제에서는)
 행렬이 주어졌을때 그 행렬을 뜯어서 새로운 행렬 여러개를 만드는 것보다 그 행렬 내에서
 인덱싱을 통해 자료들을 재귀적으로 호출해 사용하는 것이 더 편하며
 이번문제의 경우에도 주어진 자료들을 (간선) 가지고 새로운 무언가를 만드려 하지 말고
 그래프는 그래프대로 만들어주고 그 그래프를 bfs, dfs로 탐색하는 것이 더 편하다
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var graph = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let src = temp[0] - 1
    let dst = temp[1] - 1
    graph[src].append(dst)
    graph[dst].append(src)
}

var visited = Array.init(repeating: false, count: n)
var parents = (0...n).map { $0 }

func dfs(x: Int, parent: Int) {
    for i in 0..<graph[x].count {
        if visited[graph[x][i]] == false {
            visited[graph[x][i]] = true
            parents[graph[x][i]] = parent
            dfs(x: graph[x][i], parent: parent)
        }
    }
}

for i in 0..<n {
    if visited[i] == false {
        dfs(x: i, parent: i)
    }
}

var answer = 0
for i in 0..<n {
    if parents[i] == i {
        answer += 1
    }
}
print(answer)
