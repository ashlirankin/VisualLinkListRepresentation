import Foundation

public class Node<T: Equatable>: CustomStringConvertible, Equatable {
  public var value: T
  public var next: Node?
  
  public var description: String {
    guard let next = next else { return "\(value) -> nil" }
    return "\(value) -> \(next)"
  }
  
  public static func ==(lhs: Node, rhs: Node) -> Bool {
    return
      lhs.value == rhs.value &&
        lhs.next == rhs.next
  }
  
  init(value: T) {
    self.value = value
  }
}

