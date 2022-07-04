/*
 18870 좌표 압축
 N의 범위가 1e6이므로
 O(nlogn)에 풀어야하는 문제라 판단했다.
 sorting에 nlogn이 들었고 나머지 부분은 n의 시간이 걸리게 구현했다.
 단순히 set에다 원소를 넣어서 rank(나보다 작은 숫자가 몇개인지 알기 위해)를 구하고
 그것을 바탕으로 조작해주었다.
 */

struct Coordinate {
    let number: Int
    let order: Int
    var rank: Int
}

let n = Int(readLine()!)!
var order = 0
var nonOverlapNumbers = Set<Int>()
var coordinates = readLine()!
    .split(separator: " ")
    .map { val -> Coordinate in
        order += 1
        nonOverlapNumbers.update(with: Int(String(val))!)
        return Coordinate(number: Int(String(val))!, order: order, rank: -1)
    }

coordinates.sort {
    return $0.number > $1.number
}
let numbers = nonOverlapNumbers.sorted()

var index = 0
var rank = numbers.count
coordinates[index].rank = rank
outer: while index < coordinates.count - 1 {
    while coordinates[index].number == coordinates[index+1].number {
        coordinates[index+1].rank = rank
        index += 1
        if index == coordinates.count - 1 {
            break outer
        }
    }
    rank -= 1
    coordinates[index+1].rank = rank
    index += 1
}

coordinates.sort {
    return $0.order < $1.order
}
coordinates.forEach {
    print($0.rank-1, terminator: " ")
}

print()
