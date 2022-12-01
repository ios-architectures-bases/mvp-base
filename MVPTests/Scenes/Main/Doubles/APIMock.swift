import Foundation

@testable import MVP

class APIMock: APIType {
    
    var returnedString: String?

    func getStatus(completion: @escaping (String?) -> Void) {
        completion(returnedString)
    }
}
