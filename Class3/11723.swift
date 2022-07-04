/*
 11723 집합
 일반적인 set으로 풀 수 없어서
 비트마스킹으로 풀기로 했다 (X의 범위가 1이상 20이하라 가능)
 비트마스킹만으로는 또 시간초과가 나서 블로그를 뒤져보니
 다음과 같이 빠른 입출력 + string을 int으로 변환하여 사용
 등의 여러 방법을 통해서만 해결할 수 있었다.
 그냥 class 4부터는 이런 문제가 많이 없겠지만 혹시 있으면 그냥 풀이가 맞았는지만 확인하고
 넘어가야겠다.
 */
import Foundation
//원래는 Class 처리가 없으셨지만 내가 임시로 구현했다.
class FileIO {
    @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0

    @inline(__always) private func readByte() -> UInt8 {
        defer { byteIdx += 1 }
        return buffer.withUnsafeBufferPointer { $0[byteIdx] }
    }

    @inline(__always) func readInt() -> Int {
        var number = 0, byte = readByte(), isNegative = false
        while byte == 10 || byte == 32 { byte = readByte() }
        if byte == 45 { byte = readByte(); isNegative = true }
        while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
        return number * (isNegative ? -1 : 1)
    }

    @inline(__always) func readStringSum() -> Int {
        var byte = readByte()
        while byte == 10 || byte == 32 { byte = readByte() }
        var sum = Int(byte)
        while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
        return sum - Int(byte)
    }

    @inline(__always) private func write(_ output: String) {
        FileHandle.standardOutput.write(output.data(using: .utf8)!)
    }
}

var S = 0
let fileIO = FileIO()
let m = fileIO.readInt()
var result = ""
for _ in 0..<m {
    switch fileIO.readStringSum() {
    case 297:
        let number = fileIO.readInt()
        S = S | (1 << number)
    case 654:
        let number = fileIO.readInt()
        S = S & ~(1 << number)
    case 510:
        let number = fileIO.readInt()
        if S & (1 << number) != 0 {
            result.write(String(1) + "\n")
        } else {
            result.write(String(0) + "\n")
        }
    case 642:
        let number = fileIO.readInt()
        S = S ^ (1 << number)
    case 313:
        S = 1
        for _ in 1...20 {
            S = S << 1
            S += 1
        }
    case 559:
        S = 0
    default:
        break
    }
}

print(result)
