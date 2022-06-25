/*
 이 문제의 경우에는 어떻게 풀어야 할지 감이 오질 않아
 블로그를 참고해서 실마리를 얻고 나머지를 작성해보았다.
 핵심은 재귀를 어찌됐던 활용하되
 현재 몇사분면에 위치한지를 재귀적으로 파악하는 것
 (다음위치를 모든 경우의 수를 따져가며 파악하는 것은 불가)

 현재 어떤 사분면에 위치한지를 파악하고
 그 사분면 내에서 또 쭉쭉 어떤 사분면에 위치한지를 파악하면서
 offset을 더해주면 된다.

 예를 들어 62를 찾아가려면
 처음에 4사분면에 가야므로
 4*4*3을 해서 48을 더해주고 (2사분면은 offset * 0 1사분면은 offset * 1 .. 4사분면은 offset*3)
 48에서는 다시 4사분면에 가므로
 2*2*3을 하여 12를 더해주고
 마지막으로 3사분면에 가므로
 1*1*2를 하여 2를 더해주면 된다.
 */
let nrc = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = nrc[0]
let r = nrc[1]
let c = nrc[2]
let numbersPerLine = 1 << n // 한 줄의 숫자 개수
var answer = 0

func whichQuadrant(startr: Int, startc: Int, line: Int) {
    if line == 1 { return }
    let middler = startr + line/2
    let middlec = startc + line/2
    let offset = (line/2) * (line/2)

    if r < middler && c >= middlec { // 1
        answer += offset * 1
        whichQuadrant(startr: middler - line/2, startc: middlec, line: line/2)
    } else if r < middler && c < middlec { // 2
        whichQuadrant(startr: middler - line/2, startc: middlec - line/2, line: line/2)
    } else if r >= middler && c < middlec { // 3
        answer += offset * 2
        whichQuadrant(startr: middler, startc: middlec - line/2, line: line/2)
    } else { // 4
        answer += offset * 3
        whichQuadrant(startr: middler, startc: middlec, line: line/2)
    }

}

whichQuadrant(startr: 0, startc: 0, line: numbersPerLine)
print(answer)

