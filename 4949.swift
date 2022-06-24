
/*
 스택을 활용해 해결하는 문제이다
 stack 클래스랑 에러 객체를 만들어줬다

 ([)] 는 잘못된 괄호열이라고 한다
 이 부분을 놓쳤었다. (이건 문제 조건에 없는 것 같은데..)
 */
enum stackError: Error {
    case nothingToPop
    case differentChar
}
class Stack {
    var stack = [String]()
    func push(x: String) {
        stack.append(x)
    }
    func pop(x: String) throws {
        if stack.isEmpty {
            throw stackError.nothingToPop
        } else if stack.last! != x {
            throw stackError.differentChar
        } else {
            stack.removeLast()
        }
    }
    var isEmpty: Bool {
        return stack.isEmpty
    }
}

outer: while true {
    let line = Array(readLine()!)
    let stack = Stack()
    if line.isEmpty {
        print("yes")
        continue
    }
    if line.count == 1 && line.first! == "." {
        break
    }

    for char in line {
        switch char {
        case "(":
            stack.push(x: "(")
        case ")":
            do {
                try stack.pop(x: "(")
            } catch {
                print("no")
                continue outer
            }
        case "[":
            stack.push(x: "[")
        case "]":
            do {
                try stack.pop(x: "[")
            } catch {
                print("no")
                continue outer
            }
        default:
            break
        }
    }

    if !stack.isEmpty {
        print("no")
    } else {
        print("yes")
    }
}
