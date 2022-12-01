import Foundation

class Network {
    private let APIService: APIType

    init(APIService: APIType = API()) {
        self.APIService = APIService
    }
}

extension Network: NetworkType {

    func fetchStatus(completion: @escaping (Result<String, CustomError>) -> Void) {

        APIService.getStatus { text in
            if let text {
                completion(.success(text))
                return
            }
            completion(.failure(.networkError))
        }
    }
}

