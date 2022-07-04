/*
 7576 토마토
 index만을 사용하는 Queue가 너무 사용하기 어려워서
 BFS로 접근하기보단 깡 구현으로 풀려했었는데 시간초과가 해결되지 않았다
 블로그를 참조하던 중 이중스택으로 큐를 구현할 수 있다는 것을 다시 떠올리게 되어서
 이중스택큐를 활용해 BFS를 쓰니 문제가 해결되었다.

 하룻밤을 count하는 부분에서 현재 queue의 원소 수만큼을 반복하고
 이때만 count를 증가시켜주었는데 이 부분의 구현 방법이 생각나지 않았던 기억이 난다.
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

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let X = nm[0]
let Y = nm[1]
var matrix = [[Int]]()
var todayDone = [Int]()
var queue = Queue<(i: Int, j: Int)>()
let dx = [0, 0, -1, 1] // 상하좌우
let dy = [-1, 1, 0, 0] // 상하좌우

for y in 0..<Y {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    matrix.append(line)
    for x in 0..<X {
        if line[x] == 1 {
            queue.push(x: (i: y, j: x))
        }
    }
}

func addNeighbors(x: Int, y: Int) {
    for i in 0..<4 {
        let nextX = x + dx[i]
        let nextY = y + dy[i]

        if nextX >= 0 && nextX < X
            && nextY >= 0 && nextY < Y
            && matrix[nextY][nextX] == 0 {
            matrix[nextY][nextX] = 1
            queue.push(x: (i: nextY, j: nextX))
        }
    }
}

func answer() {
    var dayCount = 0
    while true {
        for _ in 0..<queue.count {
            guard let next = queue.pop() else {
                return
            }
            addNeighbors(x: next.j, y: next.i)
        }

        if queue.isEmpty { break }
        dayCount += 1
    }

    for i in 0..<Y {
        for j in 0..<X {
            if matrix[i][j] == 0 {
                dayCount = -1
                break
            }
        }
    }

    print(dayCount)
}

answer()

