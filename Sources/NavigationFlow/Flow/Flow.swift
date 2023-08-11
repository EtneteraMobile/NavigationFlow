//
import SwiftUI

public protocol Flow {
    var navigation: Navigation { get }
    func view() -> AnyView
}
