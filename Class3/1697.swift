/*
 1697 숨바꼭질
 냅색 문제와 같은 방식의 문제라 생각했다.

 예를 들어 동생의 위치를 K라 하고
 마지막 이동 전의 수빈이의 위치를 N이라 하면
 N + 마지막 이동 (+1 or -1 or *2)이 최적이기 위해서
 N까지 이동하는 최적의 방법을 찾으면 된다.
 dp[N] 에는 N까지 이동하는 최적의 경로를 담는 것이 핵심
 동생의 위치 < 수빈이의 위치
 일 수 있는데 이때는 무조건 -1를 반복하는게 빠르므로 예외처리 해주자

 + DP로는 풀면 안되는 문제였다
 DP는 DAG(Directed Acyclic Graph)에서만 사용할 수 있는 알고리즘이다.

 djm03178님의 답변
 Q. 이 문제는 DP로 풀 수 없나요?
 A. DP는 DAG에 대해서만 사용해야 합니다.
 이 문제처럼 정점의 방문 선후 관계가 명확하지 않은 경우에는 사이클에 의해 잘못된 답을 구할 수 있게 됩니다.

 Q. 싸이클이 생기는 경우에는 1e9를 반환하게 해서 예외처리 했는데도 안될까요?
 A. 이런 경우를 생각해 보세요. 답이 되는 경로를 찾으려면 a - b 순으로 거쳐가야만 되는 상황입니다.
 그런데 만약 dfs의 탐색 순서가 a를 방문하기 전에 b를 먼저 방문했다고 칩시다
 (실제로 시작점으로부터 a를 안 거치고 b에 도달하는 경로는 매우 멀다고 가정).
 그러면 b에서 a를 방문한 뒤에, a에서 다시 b로 가는 경로를 탐색해야 하는데,
 현재 경로에서는 이미 b를 한 번 거쳤기 때문에 엉뚱한 값이 반환되어
 "a에서 도착점까지 가는 최적의 경로는 b를 거쳐가는 것이다"라는 정보를 얻을 수 없게 됩니다.
 이후에는 a의 dp값이 이미 결정되었기 때문에 b를 안 거치고 a를 먼저 방문하는 경로를 탐색하더라도
 이후 b를 거쳐가는 경로를 고려할 수 없게 됩니다.

 BFS로 다시 풀어보자
 BFS로 풀기 위해 이전에 사용했던 덱을 가져왔다.
 removeFirst의 시간복잡도가 O(N)이라 반드시 필요.
 복습할 가치가 있는 문제인 것 같다.
 */

class Deque {
    var start = 500000 // 첫 자리의 index 값
    var last = 500001 // 마지막 자리의 index 값
    var deque = Array.init(repeating: -1, count: 10000000)

    func push_front(x: Int) {
        if isEmpty() {
            deque[start] = x
        } else {
            start -= 1
            deque[start] = x
        }
    }

    func push_back(x: Int) {
        if isEmpty() {
            deque[last-1] = x
        } else {
            last += 1
            deque[last-1] = x
        }
    }

    func pop_front() -> Int {
        if isEmpty() {
            return -1
        } else {
            let temp = deque[start]
            deque[start] = -1

            if isEmpty() {
                start += 1
                last += 1
            } else {
                start += 1
            }

            return temp
        }
    }

    func front() -> Int {
        return deque[start]
    }

    func back() -> Int {
        return deque[last-1]
    }

    func isEmpty() -> Bool {
        return last-start == 1 && deque[start] == -1
    }
}

let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]

class Node {
    var count = 0
    var number = 0
    init(count: Int = 0 , number: Int = 0) {
        self.count = count
        self.number = number
    }
}

class NodeList {
    var nodes = [Node]()
    var count = 300000
    init(nodes: [Node] = [], count: Int = 0) {
        self.nodes = nodes
        self.count = count
    }
}

var graph = Array.init(repeating: NodeList(), count: 300000)

func bfs(x: Int) {
    let queue = Deque()
    queue.push_back(x: x)
    var visited = Array.init(repeating: false, count: 300000)

    while !queue.isEmpty() {
        let nodeNumber = queue.pop_front()
        visited[nodeNumber] = true

// 이 부분을 사용하게 되면 정답이 아닌데도 먼저 return이 되는 케이스가 존재
//        if nodeNumber == k {
//            print(graph[nodeNumber].count)
//            return
//        }

        graph[nodeNumber].nodes.forEach {
            if $0.number >= 0  {
                if visited[$0.number] == false {
                    graph[$0.number].count = min(graph[nodeNumber].count + 1, graph[$0.number].count)
                    queue.push_back(x: $0.number)
                }
            }
        }
    }
}

if n > k { // 수빈이가 동생보다 앞에 위치할 경우 예외처리
    print(n-k)
} else {
    for i in 0...k+1 { // n이 아닌 0부터 시작해야 하는 이유: 뒤로 갔다가 2배씩 하는게 빠른 케이스처럼 예외가 존재해서
        let nodeList = NodeList(nodes: [
            Node(count: 300000, number: i+1),
            Node(count: 300000, number: i-1),
            Node(count: 300000, number: i*2)
        ], count: 300000)
        graph[i] = nodeList
    }

    graph[n].count = 0
    bfs(x: n)
    print(graph[k].count)
}

/* 실패했던 첫 시도
let nk = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nk[0]
let k = nk[1]
var dpArr = Array.init(repeating: 200000, count: 300000) // 목표는 dp[|n-k|]를 찾는것
let distance = k-n
dpArr[n] = 0

if distance > 0 {
    for i in n+1...k*2 {
        if i % 2 == 0 {
            dpArr[i] = min(dpArr[i-1], dpArr[i+1], dpArr[i/2]) + 1
        } else {
            dpArr[i] = min(dpArr[i-1], dpArr[i+1]) + 1
        }

        if dpArr[i-1] > dpArr[i] + 1 {
            dpArr[i-1] = dpArr[i] + 1
        }
    }
}


var answer = distance < 0 ? -distance : dpArr[distance]

print(answer)
*/
