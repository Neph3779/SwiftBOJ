/*
 9375 패션왕 신해빈
 입력값으로 의상의 종류의 수(n)가 주어지면
 nCk (k = 1...n) 의 값을 구하는 문제
 nCk = n-1Ck + n-1Ck-1을 이용해 조합 개수 구하는 함수를 만들면 될듯

 뭔가 복잡할땐 여집합, count 안함도 하나의 element로 취급
 등을 떠올리자
 */

var combArr = Array.init(repeating: Array.init(repeating: 0, count: 50), count: 50)
for i in 1..<50 {
    combArr[i][i] = 1
    combArr[i][0] = 1
}
func combination(n: Int, k: Int) -> Int {
    if combArr[n][k] == 0 {
        return combination(n: n-1, k: k) + combination(n: n-1, k: k-1)
    } else {
        return combArr[n][k]
    }
}

let t = Int(readLine()!)!

for _ in 0..<t {
    let total = Int(readLine()!)!
    var clothKind = [String: Int]()
    for _ in 0..<total {
        let line = readLine()!.split(separator: " ").map { String($0) }
        if let number = clothKind[line[1]] {
            clothKind.updateValue(number + 1, forKey: line[1])
        } else {
            clothKind.updateValue(1, forKey: line[1])
        }
    }

    // 총 옷 종류가 3종류라면
    // 1개씩 입는 경우, 2개씩 입는 경우, 3개씩 입는 경우가 있음
    // 너무 복잡한 것 같아서 블로그를 조금 봤는데
    // "옷을 안입는 경우"도 있다는걸로 카운트하면 아주 쉬워질 것 같음
    // 그냥 무조건 옷의 종류만큼 고르는데 각 옷 종류에는 "안입음" 이라는 옷도 있는거로 간주

    var answer = 1
    for cloth in clothKind {
        answer *= combination(n: cloth.value + 1, k: 1)
    }


    print(answer-1)
}
