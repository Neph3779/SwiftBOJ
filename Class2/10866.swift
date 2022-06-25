
/*
 단순한 stack + queue의 짬뽕형 Deque
 swift 라이브러리에서 아직 지원을 안하기 때문에
 index를 활용하여 만들기로 하였다.

 예를 들어 1234567에서 pop_front를 실행하면
 index(커서의 역할)값을 단순히 1 증가시켜 2부터 가르키도록 하는 것.
 배열의 크기를 입력값에 맞게 적당히 잡아주면 된다.

 간단해보이지만 은근 신경쓸 부분이 많았고
 이 문제에 무려 40분을 썼다
 원형큐와 이러한 커서를 움직이는 덱 구현에 좀 익숙해질 필요가 있을듯.
 */

var start = 20000 // 첫 자리의 index 값
var last = 20001 // 마지막 자리의 index 값
var deque = Array.init(repeating: -1, count: 40000) // 입력이 만개 까지 들어오므로 배열은 4만개로 잡아주었다. 메모리 제약이 256MB나 되므로 넉넉히 잡았음.

func print_start_back() {
    print("start: \(start) back: \(last)")
}

func push_front(x: Int) {
    if isEmpty() {
        deque[start] = x
    } else {
        start -= 1
        deque[start] = x
    }
}

func push_back(x: Int) {
    if isEmpty() {
        deque[last-1] = x
    } else {
        last += 1
        deque[last-1] = x
    }
}

func pop_front() {
    if isEmpty() {
        print("-1")
    } else {
        print(deque[start])
        deque[start] = -1


        if isEmpty() {
            start += 1
            last += 1
        } else {
            start += 1
        }
    }
}

func pop_back()  {
    if isEmpty() {
        print("-1")
    } else {
        print(deque[last-1])
        deque[last-1] = -1


        if isEmpty() {
            last -= 1
            start -= 1
        } else {
            last -= 1
        }
    }
}

func size() {
    if isEmpty() {
        print("0")
    } else {
        print(last - start)
    }

}

func empty() {
    let result = last - start == 1 && deque[start] == -1 ? 1 : 0
    print(result)
}

func front() {
    print(deque[start])
}

func back() {
    print(deque[last-1])
}

func isEmpty() -> Bool {
    return last-start == 1 && deque[start] == -1
}

let n = Int(readLine()!)!
for _ in 0..<n {
    let command = readLine()!.split(separator: " ").map { String($0) }

    switch command.first! {
    case "push_front":
        push_front(x: Int(command[1])!)
    case "push_back":
        push_back(x: Int(command[1])!)
    case "pop_front":
        pop_front()
    case "pop_back":
        pop_back()
    case "size":
        size()
    case "empty":
        empty()
    case "front":
        front()
    case "back":
        back()
    default:
        break
    }
}
