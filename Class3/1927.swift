/*
 1927 최소 힙
 min heap을 구하는 문제이다
 heap 자료구조를 복습하는 느낌의 문제

 일줄 알았는데
 자식노드 중에서 "더 작은" 값으로 바꿔줘야 하는 사실을 간과해서
 시간을 한참 썼다..
 나름 좋은 경험 한듯..
 */
var answer = [Int]()
class Heap {
    var heap = [Int]()

    func push(x: Int) { // 맨 마지막에 넣고 부모와 비교하면서 자리를 바꿔준다
        heap.append(x)

        var index = heap.count - 1
        
        while heap[(index-1)/2] > heap[index] {
            heap.swapAt(index, (index-1)/2) // 만약 부모가 더 크다면 swap
            index = (index-1) / 2
        }
    }

    func pop() { // 0번 index를 pop, 그 뒤에 제일 마지막 애를 0에 넣고 비교하며 순서 맞추기
        if heap.count == 0 {
            answer.append(0)
            return
        } else {
            answer.append(heap[0])
        }

        if heap.count == 1 {
            heap.removeLast()
            return
        }

        let last = heap.removeLast()
        heap[0] = last

        var index = 0
        while true {
            if heap.count - 1 >= index * 2 + 2 { // 자식 둘다 있는 경우
                let minChildIndex = heap[index*2+1] < heap[index*2+2] ? index*2+1 : index*2+2

                if heap[minChildIndex] < heap[index] {
                    heap.swapAt(index, minChildIndex)
                    index = minChildIndex
                } else {
                    break
                }

            } else if heap.count - 1 >= index * 2 + 1 { // 한쪽만 있는 경우
                if heap[index] > heap[index*2+1] {
                    heap.swapAt(index, index*2+1)
                    index = index*2+1
                } else {
                    break
                }
            } else {
                break
            }
        }
    }
}

let heap = Heap()
let n = Int(readLine()!)!

for _ in 0..<n {
    let temp = Int(readLine()!)!
    if temp > 0 {
        heap.push(x: temp)
    } else {
        heap.pop()
    }
}

for answer in answer {
    print(answer)
}
