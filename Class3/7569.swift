/*
 7569 토마토
 저번에 풀었던 문제가 그냥 3차원 배열로만 바뀌었다.
 조금 더 복잡해지긴 했다.
 지난번에는 배열 다 순회하면서 0있는지 검사했던 것 같은데 (이렇게 해도 시간초과 안났던 것 같음)
 이번에는 그러면 시간초과 나길래 처음에 0개수 세준 다음에 0 없어질때마다 count 하나씩 줄이면서
 count 0 되면 끝인거로 바꿔줬다
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

let nmh = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmh[0]
let m = nmh[1]
let h = nmh[2]

var threeDimensionArr = [[[Int]]]()
for _ in 0..<h {
    var twoDimensionArr = [[Int]]()
    for _ in 0..<m {
        twoDimensionArr.append(readLine()!
            .split(separator: " ")
            .map { Int(String($0))! })
    }
    threeDimensionArr.append(twoDimensionArr)
}

var visited = Array.init(
    repeating: Array.init(
        repeating: Array.init(repeating: false, count: n), count: m
    ),
    count: h)

var day = 0
var queue = Queue<(i: Int, j: Int, k: Int)>()

// 위 북 남 서 동 아래
let di = [-1, 0, 0, 0, 0, 1] // z축
let dj = [0, -1, 1, 0, 0, 0] //
let dk = [0, 0, 0, -1, 1, 0] //

var totalZeroCount = 0

for i in 0..<h {
    for j in 0..<m {
        for k in 0..<n {
            if threeDimensionArr[i][j][k] == 1 {
                queue.push(x: (i,j,k))
            } else if threeDimensionArr[i][j][k] == 0 {
                totalZeroCount += 1
            }
        }
    }
}

func answer() {
    while true {
        for _ in 0..<queue.count {
            let pop = queue.pop()!
            for i in 0..<6 {
                let nexti = pop.i + di[i]
                let nextj = pop.j + dj[i]
                let nextk = pop.k + dk[i]
                if nexti < h && nextj < m && nextk < n && nexti >= 0 && nextj >= 0 && nextk >= 0 {
                    if threeDimensionArr[nexti][nextj][nextk] == 0 {
                        threeDimensionArr[nexti][nextj][nextk] = 1
                        totalZeroCount -= 1
                        queue.push(x: (nexti,nextj,nextk))
                    }
                }

            }
        }

        day += 1
        if day > n*m*h {
            print(-1)
            return
        }

        if totalZeroCount == 0 {
            break
        }
    }
    print(day)
}

if totalZeroCount != 0{
    answer()
} else {
    print(0)
}

