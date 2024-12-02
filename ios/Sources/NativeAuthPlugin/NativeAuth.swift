import Foundation

@objc public class NativeAuth: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
