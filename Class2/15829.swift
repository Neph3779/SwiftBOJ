/*
 간단한 해시함수 문제이다
 어디서 mod 연산을 써야 최대한 오버플로우가 안날지를 잘 생각했어야 했다.
 */
import Foundation
let n = readLine()
let m = 1234567891
var hashVal:CLongLong = 0
var str = Array(readLine()!)
func hash(string: [String.Element]) {
    let length = string.count
    for i in 0..<length {
        var temp = Int(str[i].asciiValue!) - 96
        for _ in 0..<i {
            temp *= 31
            temp %= m
        }
        hashVal += Int64(temp)
    }
    hashVal = hashVal % Int64(m)
}
hash(string: str)
print(hashVal)
