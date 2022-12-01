import Foundation

@testable import MVP

class NetworkMock: NetworkType {
    
    var returnedResult: Result<String, MVP.CustomError> = .success("Mock result")
    
    private(set) var fetchStatusCallCount = 0
    func fetchStatus(completion: @escaping (Result<String, MVP.CustomError>) -> Void) {
        fetchStatusCallCount += 1
        completion(returnedResult)
    }
}
