/*
 16928 뱀과 사다리 게임
 뒤로가는 행위가 있으므로 dp가 아닌 bfs로 풀어보자
 (dp로 절대 못푸는건 아니고 dp로 풀기 어렵다는 것 같다)
 여러 시행착오가 있었는데
 우선 정말 가끔 만나는 메모리 초과 -> visited 체크로 queue에 들어가는 수를 줄여서 해결했다.
 시작점(1)에 사다리가 있는 경우 -> 이걸 체크를 제대로 안해서 많이 틀렸다.
 */

import Foundation

struct Queue<T> {
    var enqueue = [T]()
    var dequeue = [T]()
    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }
    var count: Int {
        return enqueue.count + dequeue.count
    }

    mutating func push(x: T) {
        enqueue.append(x)
    }

    mutating func pop() -> T? {
        if dequeue.isEmpty {
            while !enqueue.isEmpty {
                dequeue.append(enqueue.removeLast())
            } // dequeue = enqueue.reversed(); enqueue.removeAll()과 같은 작업
        }
        return dequeue.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var special = Array.init(repeating: -1, count: 101)
var visited = Array.init(repeating: false, count: 101)
for _ in 0..<n+m {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    special[line[0]] = line[1]
}

func bfs(x: Int) {
    var queue = Queue<Int>()
    queue.push(x: x)
    visited[x] = true

    var dayCount = 0
outer: while true {
        for _ in 0..<queue.count {
            var popped = queue.pop()!

            if special[popped] != -1 {
                popped = special[popped]
            }

            for i in 1...6 {
                if popped + i == 100 {
                    dayCount += 1
                    break outer
                }
                if visited[popped + i] == false {
                    queue.push(x: popped + i)
                    visited[popped + i] = true
                }
            }
        }
    dayCount += 1
    }
    print(dayCount)
}

bfs(x: 1)
