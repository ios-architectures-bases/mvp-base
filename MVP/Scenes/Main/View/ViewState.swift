import Foundation

enum ViewState: Equatable {
    case ready(String)
    case error
    case loading
}
