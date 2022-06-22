

/*
 단순히 N개의 (x,y)가 주어졌을때
 x를 비교해보고 이것이 같다면 y의 값을 비교해서 정렬하는 문제
 */

struct Coordinate {
    let x: Int
    let y: Int
}

let n = Int(String(readLine()!))!
var arr = [Coordinate]()
for _ in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    arr.append(Coordinate(x: temp[0], y: temp[1]))
}

arr.sort {
    if $0.x == $1.x {
        return $0.y < $1.y
    } else {
        return $0.x < $1.x
    }
}

for element in arr {
    let temp = String(element.x) + " " + String(element.y)
    print(temp)
}
