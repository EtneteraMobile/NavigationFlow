//

import Foundation


public class NavigationStore {

    private var navigations: [Navigation] = []

    public init() {}

    public func add(_ navigation: Navigation) {
        navigations.append(navigation)
        navigations.enumerated().forEach {
            print("==- navigation \($0 + 1) \($1)")
        }
    }

    public func rootNavigation() -> Navigation? {
        navigations.first
    }

    public func lastNavigation() -> Navigation? {
        navigations.last
    }

    public var parent: Navigation? {
        guard navigations.count >= 2 else {
            return nil
        }
        print("==- COUNT \(navigations.count), parent is on index \(navigations.count - 2)")
        return navigations[navigations.count - 2]
    }

    public func removeAfter(_ navigation: Navigation) {

    }
}
