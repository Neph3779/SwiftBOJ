/*
 2667 단지번호 붙이기
 누가봐도 BFS로 푸세요~ 문제이다.
 그나마 지금까지 풀던 문제랑 다른점은 연결리스트 꼴이 아닌
 행렬꼴로 자료가 주어진 것.
 마지막에 오름차순으로 정렬해주는 부분을 빠트렸었다.(문제를 끝까지 잘 읽자..)
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

func bfs(x: Int, y: Int) {
    var queue = Queue<(x: Int, y: Int)>()
    queue.push(x: (x, y))
    let dx = [0,0,-1,1]
    let dy = [-1,1,0,0]
    visited[y][x] = true
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            if let pop = queue.pop() {
                village[number] += 1
                for i in 0..<4 {
                    let nextX = pop.x + dx[i]
                    let nextY = pop.y + dy[i]
                    if nextX >= 0 && nextY >= 0 && nextX < n && nextY < n
                        && visited[nextY][nextX] == false && matrix[nextY][nextX] == 1 {
                        visited[nextY][nextX] = true
                        queue.push(x: (nextX, nextY))
                    }
                }
            }
        }
    }
}

let n = Int(readLine()!)!
var matrix = [[Int]]()
var visited = Array.init(repeating: Array.init(repeating: false, count: n), count: n)
for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    matrix.append(line)
}
var village = Array.init(repeating: 0, count: n*n)
var number = 0

for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == false && matrix[i][j] == 1 {
            number += 1
            bfs(x: j, y: i)
        }
    }
}

let answer = village.filter { $0 != 0 }.sorted {
    $0 < $1
}
print(answer.count)
for villageNumber in answer {
    print(villageNumber)
}
