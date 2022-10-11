import Foundation

@testable import MVP

class DispatchQueueMock: DispatchQueueType {
    
    private(set) var asyncCallCount = 0
    func async(deadline: DispatchTime,
               execute work: @escaping () -> Void) {
        asyncCallCount += 1
        work()
    }
}
