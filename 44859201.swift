/*
 다음 지워야하는 인덱스 값이
 현재 총인원보다 크면
 이제 이월하는 시스템

 if 인덱스 > 총인원
    인덱스 % 총인원 한 값으로 가주면 됨

 예를 들어 현재 1245|7
 다음 이동할 index = 4 + 3 인데 총인원이 5명이므로
 7 % 5 = 2 이니
 index 2 - 1 자리에 가서 지워주면 된다.

 list의 원소의 pop은 시간복잡도가 O(N)이니
 이 코드의 시간복잡도는 O(N^2)이 된다.
 N의 범위가 1000 이하이므로 2초안에 해결할 수 있다고 판단하였음.
 */
import Foundation

let nk = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = nk[0]
let k = nk[1]
var arr = [Int]()
for i in 0..<n {
    arr.append(i+1)
}

var answer = "<"
var index = 0

while !arr.isEmpty {
    index += k-1
    // 첫 시도에서 이 부분을 <로 했었던 실수가 있었음. index범위를 꼼꼼히 확인하자.
    if arr.count <= index { index = index % arr.count }
    answer = answer + String(arr[index])
    if arr.count != 1 {
        answer = answer + ", "
    } else {
        answer = answer + ">"
    }
    arr.remove(at: index)
}
print(answer)
