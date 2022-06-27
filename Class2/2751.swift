/*
 단순한 정렬문제이다. 크게 설명할 내용이 없을듯.
*/

var n = Int(readLine()!)!
var arr = Array(repeating: 0, count: n)
for i in 0..<n {
    arr[i] = Int(readLine()!)!
}
arr.sort()
for i in arr{
    print(i)
}
