
/*
 고난이도 문제가 아니므로
 땅의 최소 높이 ~ 땅의 최대 높이
 전부 검사하는 방법으로 먼저 풀어보기로 했다.
 */

let nmb = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nmb[0]
let m = nmb[1]
let b = nmb[2]
var ground = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int(String($0))! }
    ground.append(line)
}

var max = 0
var min = Int(6.4e7)

for i in 0..<n {
    for j in 0..<m {
        if ground[i][j] > max {
            max = ground[i][j]
        }
        if ground[i][j] < min {
            min = ground[i][j]
        }
    }
}

var answerTime = Int.max
var answerHeight = -1

outer: for expectedHeight in min...max {
    var expectedGround = Array.init(repeating: Array.init(repeating: expectedHeight, count: m), count: n)
    var tempGround = ground
    var tempAnswerTime = 0
    var inventoryCount = b

    for i in 0..<n {
        for j in 0..<m {
            if tempGround[i][j] > expectedGround[i][j] {
                let needToDigCount = tempGround[i][j] - expectedGround[i][j]
                inventoryCount += needToDigCount
                tempAnswerTime += 2 * needToDigCount // 파는데 2초씩 걸림
            }
        }
    }

    for i in 0..<n {
        for j in 0..<m {
            if tempGround[i][j] < expectedGround[i][j] {
                let needToFillCount = expectedGround[i][j] - tempGround[i][j]
                if inventoryCount - needToFillCount < 0 { // 이 부분을 inventoryCount < 0이라고 썼었다.
                    continue outer                        // 만약 저렇게 쓴다면
                }
                inventoryCount -= needToFillCount // 여기서 인벤토리가 음수가 되는 케이스가 생기므로 안된다
                tempAnswerTime += needToFillCount // 쌓는데 1초씩 걸림
            }
        }
    }


    if tempAnswerTime <= answerTime {
        answerTime = tempAnswerTime
        answerHeight = expectedHeight
    }
}

print(String(answerTime) + " " + String(answerHeight))
