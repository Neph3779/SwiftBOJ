
/*
 산술평균, 중앙값, 최빈값, 범위를 구하는 문제
 1. 산술평균
 N개의 수의 합을 N으로 나누는데
 단순히 N개의 수를 모두 합하면 N이 50만 이하라서 오버플로우가 생길 것
 숫자를 쭉 더하다가 N이 넘으면 count를 늘리고 N의 mod연산을 남기는 형식으로
 오버플로우를 방지하자
 O(N)으로 해결 가능.

 + 문제를 다시 읽으니 N은 절댓값 4000이하의 정수이다.
 따라서 음의 정수도 생각해야 하므로 8001개짜리 배열을 만들어서
 index 1자리를 -4000으로 생각하여 계산했다.
 2. 중앙값
 sorting은 O(NlogN)이고 50만이며 2초의 시간제한이니 충분할듯
 그리고 N은 홀수라는 조건이 있으니 2로 나누고 반올림하면 된다

 3. 최빈값
 가장 많이 나타나는 값을 구하면 되는데
 특이한 조건으로 "최빈값이 여러개면 두 번째로 작은 값을 출력" 이라는 조건이 있다.
 N개짜리 배열을 만들어서 올려주다가 값 최대인거 출력하면 될듯

 + 음수까지 포함해서 배열을 만들었으니 4000씩 빼주었다.

 4. 범위
 범위는 최댓값 최솟값의 차이인데 max, min 함수의 시간복잡도가 O(N)이니
 그냥 쓰면 될 듯하다.
 */

let n = Int(readLine()!)!
var arr = [Int]()
var count = 0
var sum = 0
var freq = Array.init(repeating: 0, count: 8001)

for _ in 0..<n {
    let temp = Int(readLine()!)!
    sum += temp
    if sum >= n {
        count = count + (sum / n)
        sum = sum % n
    } else if sum <= -n {
        count = count + (sum/n)
        sum = sum % n
    }
    arr.append(temp)
    freq[temp+4000] += 1
}

var arithMean = count
if sum > n/2 {
    arithMean += 1
} else if sum < -(n/2) {
    arithMean -= 1
}

arr.sort()
let median = arr[n/2]

var mode = -1
var maxFreq = -1
for i in freq {
    if i >= maxFreq {
        maxFreq = i
    }
}

var flag = 0
for i in freq.enumerated() {
    if i.element == maxFreq {
        if flag == 0 {
            flag = 1
            mode = i.offset - 4000
        } else {
            mode = i.offset - 4000
            break
        }
    }
}

let range = arr.max()! - arr.min()!

print(arithMean)
print(median)
print(mode)
print(range)

