/*
 다음 지워야하는 인덱스 값이
 현재 총인원보다 크거나 같으면 index % 총인원의 자리의 값을 지워주면 되는 구조
 (총인원이 n일때 arr[n]에 접근할 수 없는 것에 유의)

 if 인덱스 >= 총인원
    인덱스 % 총인원의 값을 지운다.
 else 
    인덱스의 값을 지운다.

 7 3 입력의 예시에서 3번째로 원소를 지우는 상황을 생각해보면 다음과 같다.
 12457, 지워야할 index = 4 + 2 
 총인원이 5명이므로
 6 % 5 = 1 이니
 1번 원소인 2를 지워주면 된다.

 list의 원소의 pop은 시간복잡도가 O(N)이니
 이 코드의 시간복잡도는 O(N^2)이 된다. (모든 원소가 pop 되어야 종료되므로 O(N)이 N번 실행됨)
 N의 범위가 1000 이하이므로 2초안에 해결할 수 있다고 판단하였다.
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
