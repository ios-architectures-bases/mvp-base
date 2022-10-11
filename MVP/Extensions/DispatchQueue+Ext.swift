import Foundation

protocol DispatchQueueType {
    func async( deadline: DispatchTime,
                execute work: @escaping () -> Void )
}

extension DispatchQueue: DispatchQueueType {
    func async(deadline: DispatchTime,
               execute work: @escaping () -> Void) {

        asyncAfter(deadline: deadline,
                   qos: .unspecified,
                   flags: [],
                   execute: work)
    }
}
