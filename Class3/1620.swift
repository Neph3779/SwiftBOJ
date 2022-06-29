/*
 클릭하자마자 웃음벨 ㅋㅋㅋ
 평소에는 백준 문제에 잡소리 적은 부분 절대 안읽는데
 이건 다 읽었다
 포켓몬 9세대의 성공을 기원하는 마음으로 문제를 풀어보자

 N(포켓몬의 수)가 10만 이하이다.
 M(질문의 수)도 10만 이하이다.
 시간제한이 2초라 O(NM)으로 풀어도 될것이라 생각했다.
 근데 시간초과가 떠서 딕셔너리(해시)를 사용해서 통과했다. (다행히 빠른 입출력을 가져올 필요는 없었던..)
 */

let nm = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nm[0]
let m = nm[1]

var pokemonName: [String: Int] = [:]
var pokemonNum: [Int: String] = [:]
for i in 0..<n {
    let name = readLine()!
    pokemonName.updateValue(i, forKey: name)
    pokemonNum.updateValue(name, forKey: i)
}

for _ in 0..<m {
    let problem = readLine()!
    if let problem = Int(problem) {
        print(pokemonNum[problem-1]!)
    } else {
        print(pokemonName[problem]! + 1)
    }
}
