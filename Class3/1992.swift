/*
 1992 쿼드트리
 이번에도 간단하게 matrix를 분석해서 재귀적으로 작업해주면 되는 문제이다.
 여전히 핵심은 괜히 행렬 여러개로 쪼개지 말고 그냥 있는거 냅두고 index로 size랑 같이 써가며 접근하는것
 비슷한 유형의 문제가 이 구간에 참 많은듯
 */

let n = Int(readLine()!)!
var matrix = [[Int]]()
var answer = ""
for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    matrix.append(line)
}

func isAllSame(row: Int, col: Int, size: Int) -> Bool {
    let rowEnd = row + size - 1
    let colEnd = col + size - 1
    let number = matrix[row][col]
    for i in row...rowEnd {
        for j in col...colEnd {
            if matrix[i][j] != number {
                return false
            }
        }
    }

    return true
}

func divide(row: Int, col: Int, size: Int) {
    if isAllSame(row: row, col: col, size: size) {
        answer += String(matrix[row][col])
    } else {
        answer += "("
        divide(row: row, col: col, size: size/2)
        divide(row: row, col: col + size/2, size: size/2)
        divide(row: row + size/2, col: col, size: size/2)
        divide(row: row + size/2, col: col + size/2, size: size/2)
        answer += ")"
    }
}

divide(row: 0, col: 0, size: n)

print(answer)
