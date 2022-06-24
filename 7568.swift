/*
 비교를 통해서 등수를 매기는 문제
 기준이 되는 숫자를 정해서
 첫 사람한테 그 숫자를 할당해주고
 뒤의 사람들이랑 비교해가는 형식으로 코드를 짜면 되지 않을까 싶다
 N이 50 이하이기 때문에 시간 제한은 아주 여유로운 편

 + 문제를 조금 잘못읽었는데
 w, h가 모두 커야 1등! 이 아니라
 나보다 w, h가 모두 큰 사람이 없다?
 그러면 내가 1등
 이런 논리였다.

 무리에서 1등을 뽑아서 answer라는 넣어주고 (원래 배열에선 삭제)
 넣어줄때 answer 배열을 순회하여 rank를 결정하도록 했다
 (나보다 큰 놈이 있으면 rank += 1) @@@ 여기가 핵심이다
 1등이 2명이어도 2등이 있을 수 있음

 개인적으로 그렇게 좋은 문제인지는 잘 모르겠다.
 */

struct Person {
    let weight: Int
    let height: Int
    var rank = 1
    var order: Int
}

let n = Int(readLine()!)!
var people = [Person]()

for i in 0..<n {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    people.append(Person(weight: temp[0], height: temp[1], order: i))
}

var answer = [Person]()
var index = 0

outer: while !people.isEmpty {
    var first = people[index]
    for person in people {
        if first.height < person.height
            && first.weight < person.weight { // 무리에서 1등이 아니라면
            index += 1
            continue outer
        }
    }

    // 무리에서 1등인 경우에는
    if answer.isEmpty {
        first.rank = 1
    } else {
        for ans in answer {
            if ans.weight > first.weight && ans.height > first.height {
                first.rank += 1
            }
        }
    }
    answer.append(first)
    people.remove(at: index)
    index = 0
}

answer.sort {
    $0.order < $1.order
}

for person in answer {
    print(person.rank, terminator: " ")
}

print()
