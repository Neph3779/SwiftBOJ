/*
 11430 경로찾기
 그냥 플로이드 와샬인듯? (맞았다)
 */

let n = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { value -> Int in
        let element = Int(String(value))!
        return element == 0 ? 10000 : element
    }
    matrix.append(line)
}

for way in 0..<n {
    for start in 0..<n {
        for dest in 0..<n {
            if matrix[start][dest] > matrix[start][way] + matrix[way][dest] {
                matrix[start][dest] = matrix[start][way] + matrix[way][dest]
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if j == n-1 {
            print(matrix[i][j] == 10000 ? 0 : 1, terminator: "")
        } else {
            print(matrix[i][j] == 10000 ? 0 : 1, terminator: " ")
        }
    }
    print()
}
