/*
 보자마자 드는 생각은
 N이 1e9이니 무조건 O(N)에 해야겠구나
 그림을 자세히 봤더니 알게되었는데
 1이면 1
 2 ~ 7 이면 2
 8 ~ 19(8+12-1)면 3이다.
 즉 어떤 수가 주어졌을때
 1 + 6 + 12 + ...
 이거중 몇번째 덧셈의 범위에 해당하는지만 파악하면 됨
 */

var start = 1
var count = 1
var n = Int(readLine()!)!
while true {
    if n > start {
        start = start + count*6
        count += 1
    } else {
        print(count)
        break
    }
}
