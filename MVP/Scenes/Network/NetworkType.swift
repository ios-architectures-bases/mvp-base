import Foundation

protocol NetworkType {
    func fetchStatus(completion: @escaping (Result<String, CustomError>) -> Void) 
}
