/*
 DFS와 BFS를 동시에 묻는 문제이다
 DispatchQueue를 한번 활용해보았다. (근데 이건 메모리 초과가 나오네요)
 */

import Dispatch

let nmv = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]
var graph = Array.init(repeating: Array.init(repeating: 0, count: 0), count: n)
var visitedForDFS = Array.init(repeating: false, count: n)
var visitedForBFS = Array.init(repeating: false, count: n)

for _ in 0..<m {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[temp[0]-1].append(temp[1]-1)
    graph[temp[1]-1].append(temp[0]-1)
}

for i in 0..<graph.count {
    graph[i].sort()
}


var dfsAnswer = [Int]()
func DFS(x: Int) {
    visitedForDFS[x] = true
    dfsAnswer.append(x)

    graph[x].forEach {
        let nextVisit = $0
        if visitedForDFS[$0] == false {
            DFS(x: nextVisit)
        }
    }
}


var queue = [Int]()
var bfsAnswer = [Int]()
func BFS(x: Int) {
    queue.append(x)
    visitedForBFS[x] = true
    bfsAnswer.append(x)

    while !queue.isEmpty {
        let nextNode = queue.removeFirst()
        graph[nextNode].forEach {
            if visitedForBFS[$0] == false {
                queue.append($0)
                visitedForBFS[$0] = true
                bfsAnswer.append($0)
            }
        }
    }

}


DFS(x: v-1)
BFS(x: v-1)

print(dfsAnswer.map { String($0+1) }.joined(separator: " "))

print(bfsAnswer.map { String($0+1) }.joined(separator: " "))


/* Dispatch Queue를 사용한 버전 (백준에 제출하면 메모리 초과 뜸)

let serialQueue = DispatchQueue(label: "serialQueue") // attributes 프로퍼티를 default 값인 []로 두면 serialQueue가 만들어진다.

// DFS, BFS는 순서에 상관없이 동시에 수행되어도 괜찮다.
serialQueue.async {
    DFS(x: v-1)
    BFS(x: v-1)
}

// DFS와 BFS가 실행된 이후에! (serialQueue에 넣어준 이후)
// print문이 순서에 맞게! 실행되어야 하므로 (sync의 이유)

// Q. 그럼 그냥 serialQueue에 안넣어주면 안되나요?
// A. 그러면 print문들이 DFS BFS가 완료되기 전에 호출되므로 안돼요
serialQueue.sync {
    print(dfsAnswer.map { String($0+1) }.joined(separator: " "))
    print(bfsAnswer.map { String($0+1) }.joined(separator: " "))
}

*/
