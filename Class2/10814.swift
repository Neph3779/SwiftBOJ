/*
 그냥 단순한 sorting 문제
 swift에서 어떠한 방식으로 sorting해줄지 정확히 알지 못하므로
 가입한 순서라는 order 프로퍼티를 따로 만들어서 정확히 해주었음
 */

struct Member {
    let age: Int
    let name: String
    let order: Int
}

var members = [Member]()
let n = Int(readLine()!)!
for i in 0..<n {
    let temp = readLine()!.split(separator: " ").map { String($0) }
    members.append(Member(age: Int(temp[0])!, name: temp[1], order: i))
}

members.sort {
    if $0.age == $1.age {
        return $0.order < $1.order
    } else {
        return $0.age < $1.age
    }
}

for i in 0..<n {
    print(String(members[i].age) + " " + members[i].name)
}
