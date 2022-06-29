/*
 1780 종이의 개수
 N*N크기의 행렬 (N은 3^k꼴)
 이 행렬을 9등분할 때 반드시 3^(k-1) * 3^(k-1)로 쪼개질까? 를 먼저 생각해보았다
 (만약 이 가정이 맞으면 문제풀기가 수월해지므로)

 9*9를 예시로 보면
 쪼개진 행렬의 크기는 9여야 한다.
 우선 1*9 9개 or 9*1 9개도 가능하고
 위에서 생각했던 3*3 9개도 가능하다
 이 외에는 방법이 없는 것 같다.
 자를때 어떤 결정을 하면서 자를 필요가 없으므로
 그냥 재귀로 답을 구하면 될 것이라 생각했다.

 + 너무 오래걸려서 안되겠다 싶어서 블로그를 참조했는데
 나의 생각은 정말로 행렬 9개를 매번 만들어주자 였는데
 그냥 주어진 하나의 행렬을 index를 잘 쪼개면서 개수를 세주는게 훨씬 편했다.

 숫자 계산이 좀만 들어가도 참 못푸는 것 같다..
 */

typealias matrix = [[Int]]
var onlyZero = 0
var onlyOne = 0
var onlyMinusOne = 0

func isSame(rowStart: Int, colStart: Int, rowEnd: Int, colEnd: Int) -> Bool {
    for i in rowStart..<rowEnd {
        for j in colStart..<colEnd {
            if startMatrix[i][j] != startMatrix[rowStart][colStart] {
                return false
            }
        }
    }
    return true
}

func cut(rowStart: Int, colStart: Int, rowEnd: Int, colEnd: Int) {
    if isSame(rowStart: rowStart, colStart: colStart, rowEnd: rowEnd, colEnd: colEnd) {
        if startMatrix[rowStart][colStart] == -1 {
            onlyMinusOne += 1
        } else if startMatrix[rowStart][colStart] == 0 {
            onlyZero += 1
        } else {
            onlyOne += 1
        }
    } else {
        let rowLength = rowEnd - rowStart + 1// 9 일땐 0 3 6, 2 5 8 3일땐 0 1 2
        let colLength = colEnd - colStart + 1// 9 일땐 0 3 6, 3일땐 0 1

        for i in 0..<3 {
            for j in 0..<3 {
                let nextRowStart = rowStart + rowLength / 3 * i
                let nextColStart = colStart + colLength / 3 * j
                let nextRowEnd = nextRowStart + rowLength / 3
                let nextColEnd = nextColStart + colLength / 3
                cut(rowStart: nextRowStart,
                    colStart: nextColStart,
                    rowEnd: nextRowEnd,
                    colEnd: nextColEnd)
            }
        }
    }
}

let n = Int(readLine()!)!
var startMatrix = Array.init(repeating: Array.init(repeating: 0, count: n), count: n)
for i in 0..<n {
    startMatrix[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
}

cut(rowStart: 0, colStart: 0, rowEnd: n, colEnd: n)

print(onlyMinusOne)
print(onlyZero)
print(onlyOne)
