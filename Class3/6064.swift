/*
 6064 카잉 달력
 M = 10 N = 12를 예시로 들어보면 (최대 공약수 2, 최소 공배수 60)
 1,1 2,2 3,3 4,4 ... 10,10 // 여기는 0 차이 1,11 2,12 // 여기는 10 차이
 3,1 4,2 5,3 ... 10,8 // 여기는 2 차이 1,9 2,10 3,11 4,12 // 여기는 8 차이
 5,1 6,2 .. // 여기는 4 차이
 그냥 브루트 포스 같기도 하고.. 일단 제출해보자
 역시나 타임아웃

 1,1 ... 11,11 1,12 2,13
 3,1 ... 11,9 1,10

 0,0 1,1 ... 10,10 0,11 1,12
 2,0 3,1 ... 10,8 0,9 1,10 2,11 3,12
 4,0
 if a == b
 else if a > b
   ( (a-b) / gcd ) * n + b
 else
 ((m - (b-a)) / gcd ) * n + b

 이렇게 시도해봤는데 실패

 도저히 안되겠어서 그냥 블로그를 봤다
 대체 수학문제 잘푸려면 어떻게 해야될지를 모르겠다.. 그냥 재능인가
 */

let t = Int(readLine()!)!
outer: for _ in 0..<t {
    let mnxy = readLine()!.split(separator: " ").map { Int(String($0))! }
    var m = mnxy[0]
    var n = mnxy[1]
    var x = mnxy[2]
    var y = mnxy[3]
    while x <= n*m {
        if x % n == y % n {
            print(x)
            continue outer
        }
        x += m
    }
    print(-1)
}
