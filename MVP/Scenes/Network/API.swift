import Foundation

struct API: APIType {

    func getStatus(completion: @escaping (String?) -> Void) {
        
        let status = Bool.random()
        
        DispatchQueue.main.async(deadline: .now() + 2) {
            completion(status ? "Tudo certo por aqui" : nil)
        }
    }
}

protocol APIType {
    func getStatus(completion: @escaping (String?) -> Void)
}
