/*
 2178 미로 탐색
 간단한 BFS로 풀 수 있었다.
 마지막에 숫자가 자꾸 안맞아서 문제 조건을 다시 보니
 마지막 칸도 하나 세어주어야 하는 문제였다.
 */

struct Queue<T> {
    var enqueue = [T]()
    var dequeue = [T]()

    var isEmpty: Bool {
        return enqueue.isEmpty && dequeue.isEmpty
    }

    var count: Int {
        return enqueue.count + dequeue.count
    }

    mutating func push(_ x: T) {
        enqueue.append(x)
    }

    mutating func pop() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        return dequeue.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]
var maze = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    maze.append(line)
}
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
var answer = 0
func bfs(x: Int, y: Int) {
    var queue = Queue<(Int, Int)>()
    queue.push((x, y))
    maze[y][x] = 0

    while true {
        for _ in 0..<queue.count {
            guard let popElement = queue.pop() else { return }
            for i in 0..<4 {
                let nextX = popElement.0 + dx[i]
                let nextY = popElement.1 + dy[i]
                if nextX == nm[1]-1 && nextY == nm[0]-1 {
                    answer += 1
                    return
                }
                if nextX < nm[1] && nextY < nm[0] && nextX >= 0 && nextY >= 0 {
                    if maze[nextY][nextX] == 1 {
                        queue.push((nextX, nextY))
                        maze[nextY][nextX] = 0
                    }
                }
            }
        }
        answer += 1
    }
}

bfs(x: 0, y: 0)
print(answer+1)
