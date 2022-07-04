/*
 7576 토마토
 토마토가 담긴 행렬의 인덱스를 담은 배열을 만들어서
 거기에 매번 추가하는 방식으로 해볼까 했다

 현재 코드로는 시간초과 
 */
import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }

        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }


    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }

        return str
    }
}

struct Index {
    let i: Int
    let j: Int
}
let fileIO = FileIO()

let n = fileIO.readInt()
let m = fileIO.readInt()
var matrix = Array.init(repeating: Array.init(repeating: 0, count: n), count: m)
var yesterdayDone = [Index]()
var todayDone = [Index]()
for i in 0..<m {
    for j in 0..<n {
        let number = fileIO.readInt()
        if number == 1 {
            yesterdayDone.append(Index(i: i, j: j))
        }
        matrix[i][j] = number
    }
}

var tempMatrix = matrix

func answer() {
    var dayCount = 0
    while true {
        let todayMatrix = tempMatrix
        var didNewTomatoDone = false

        for index in 0..<yesterdayDone.count {
            let i = yesterdayDone[index].i
            let j = yesterdayDone[index].j
            if todayMatrix[i][j] == 1 {
                let nextIUp = i - 1
                let nextJUp = j

                let nextIDown = i + 1
                let nextJDown = j

                let nextILeft = i
                let nextJLeft = j - 1

                let nextIRight = i
                let nextJRight = j + 1

                if nextIUp >= 0 && tempMatrix[nextIUp][nextJUp] == 0 {
                    tempMatrix[nextIUp][nextJUp] = 1
                    todayDone.append(Index(i: nextIUp, j: nextJUp))
                    didNewTomatoDone = true
                }

                if nextIDown < m && tempMatrix[nextIDown][nextJDown] == 0 {
                    tempMatrix[nextIDown][nextJDown] = 1
                    todayDone.append(Index(i: nextIDown, j: nextJDown))
                    didNewTomatoDone = true
                }

                if nextJLeft >= 0 && tempMatrix[nextILeft][nextJLeft] == 0 {
                    tempMatrix[nextILeft][nextJLeft] = 1
                    todayDone.append(Index(i: nextILeft, j: nextJLeft))
                    didNewTomatoDone = true
                }

                if nextJRight < n && tempMatrix[nextIRight][nextJRight] == 0 {
                    tempMatrix[nextIRight][nextJRight] = 1
                    todayDone.append(Index(i: nextIRight, j: nextJRight))
                    didNewTomatoDone = true
                }

            }
        }

        if didNewTomatoDone == false {
            break
        }

        dayCount += 1
        yesterdayDone = todayDone
        todayDone = []
        if dayCount > n * m {
            print(-1)
            return
        }
    }

    print(dayCount)
}

answer()
