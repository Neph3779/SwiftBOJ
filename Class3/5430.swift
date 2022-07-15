/*
 5430 AC
 역시 할일이 없을땐 언어 만들기지...
 처음엔 단순 구현문제라 생각했는데 좀 머리를 써야하는 모양이다
 이 문제는 "삽입"하는 기능이 없는 언어이다
 따라서 그냥 배열에서 indexing으로 처리하는게 맞지 않을까 하는 생각이 들었다.

 + 자꾸 33%에서 틀렸습니다가 뜨길래 하다하다 공식 테케를 다운받아서 돌려봤다
 근데도 못찾겠어서 빠른 입출력 적용을 안해줬더니 (입출력 때문에 시간초과 뜬다 생각했어서 빠른 입출력 가져와서 썼었다)
 멀쩡히 통과...
 아마 버퍼 크기가 정해져있는데 그게 터져버려서 뭔가 에러가 났던게 아닐까 싶다
 (swift에서 그냥 readline할때는 안생기는 뭔가가 발생한듯)
 */
import Foundation

let t = Int(readLine()!)!
outer: for _ in 0..<t {
    let commands = readLine()!.map { String($0) }
    let arrCount = Int(readLine()!)!
    var arr = readLine()!.components(separatedBy: ["[", ",", "]"]).map { Int(String($0)) }.compactMap { $0 }
    var isReversed = false
    var isDeleted = arr.map { _ in return false }
    var start = 0
    var end = arr.count - 1
    var count = arr.count

    for command in commands {
        if command == "R" {
            isReversed.toggle()
        } else if command == "D" {
            if count == 0 {
                print("error")
                continue outer
            }
            if isReversed {
                isDeleted[end] = true
                end -= 1
                count -= 1
            } else {
                isDeleted[start] = true
                start += 1
                count -= 1
            }
        }
    }

    if isReversed {
        arr.reverse()
        isDeleted.reverse()
    }
    var answer = [Int]()

    for i in 0..<arr.count {
        if isDeleted[i] == false {
            answer.append(arr[i])
        }
    }

    printArr(arr: answer)
}

func printArr(arr: [Int]) {
    print("[", terminator: "")
    if arr.count == 0 {
        print("]")
        return
    }
    for i in 0..<arr.count {
        if i == arr.count - 1 {
            print(arr[i], terminator: "")
            print("]")
        } else {
            print(arr[i], terminator: "")
            print(",", terminator: "")
        }
    }
}
