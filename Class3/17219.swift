/*
 17219 비밀번호 찾기
 그냥 단순한 dictionary 사용 문제
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
var dic = [String: String]()
for _ in 0..<nm[0] {
    let line = readLine()!.split(separator: " ").map { String($0) }
    dic.updateValue(line[1], forKey: line[0])
}

for _ in 0..<nm[1] {
    print(dic[readLine()!]!)
}
