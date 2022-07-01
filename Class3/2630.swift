/*
 2630 색종이 만들기
 지난번에 풀었던 1780(종이의 개수) 문제가 3^N이었다면
 이건 단순히 2^N 꼴로 바뀐 것이다
 지난번 1780문제에서 행렬을 가만히 놔두고
 인덱스로만 작업하는 것이 편하다는 교훈을 얻어서 금방 풀었다.
 */

let n = Int(readLine()!)!
var matrix = [[Int]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map{ Int(String($0))! }
    matrix.append(line)
}
var whiteCount = 0
var blueCount = 0
func isAllSame(row: Int, col: Int, size: Int) -> Bool {
    let firstNumber = matrix[row][col]
    for i in row..<row+size {
        for j in col..<col+size {
            if matrix[i][j] != firstNumber {
                return false
            }
        }
    }
    return true
}
func cut(row: Int, col: Int, size: Int) {
    let firstNumber = matrix[row][col]
    if isAllSame(row: row, col: col, size: size) {
        if firstNumber == 0 {
            whiteCount += 1
        } else {
            blueCount += 1
        }
    } else {
        for i in 0..<2 {
            for j in 0..<2 {
                cut(row: row+i*size/2, col: col+j*size/2, size: size/2)
            }
        }
    }
}
cut(row: 0, col: 0, size: n)
print(whiteCount)
print(blueCount)
