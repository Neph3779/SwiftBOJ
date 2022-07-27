/*
 11286 절댓값 힙
 그냥 최소힙에 절댓값만 씌워준 버전이다.
 */
var answer = [Int]()
class Heap {
    var heap = [Int]()

    func push(x: Int) { // 맨 마지막에 넣고 부모와 비교하면서 자리를 바꿔준다
        heap.append(x)

        var index = heap.count - 1

        while abs(heap[(index-1)/2]) > abs(heap[index])
                || (abs(heap[(index-1)/2]) == abs(heap[index])
                    && heap[(index-1)/2] > heap[index]) {
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

                var minChildIndex = -1
                if abs(heap[index*2+1]) == abs(heap[index*2+2]) {
                    minChildIndex = heap[index*2+1] < heap[index*2+2] ? index*2+1 : index*2+2
                } else {
                    minChildIndex = abs(heap[index*2+1]) < abs(heap[index*2+2]) ? index*2+1 : index*2+2
                }

                if abs(heap[minChildIndex]) < abs(heap[index]) || (
                    abs(heap[minChildIndex]) == abs(heap[index])
                    && heap[minChildIndex] < heap[index]
                ) {
                    heap.swapAt(index, minChildIndex)
                    index = minChildIndex
                } else {
                    break
                }

            } else if heap.count - 1 >= index * 2 + 1 { // 한쪽만 있는 경우
                if abs(heap[index]) > abs(heap[index*2+1]) || (
                    abs(heap[index]) == abs(heap[index*2+1])
                    && heap[index] > heap[index*2+1]
                ) {
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
    if temp != 0 {
        heap.push(x: temp)
    } else {
        heap.pop()
    }
}

for answer in answer {
    print(answer)
}
