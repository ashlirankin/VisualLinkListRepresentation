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

public class LinkedList<T: Equatable>: CustomStringConvertible {
  public var head: Node<T>?
  public var tail: Node<T>?
  
  public var description: String {
    guard let head = head else { return "empty list" }
    return "\(head)"
  }
  public init (){}
  
  public var first: Node<T>? {
    return head
  }
  
  public var last: Node<T>? {
    return tail
  }
  
  public var count: Int {
    if head == nil {
      return 0
    } else {
      var currentNode = head
      var x = 1
      while currentNode?.next != nil {
        currentNode = currentNode?.next
        x += 1
      }
      return x
    }
    
  }
  
  public func theNode(atIndex index: Int) -> Node<T> {
    if index == 0 {
      return head!
    } else {
      var node = head!.next
      for _ in 1..<index {
        node = node?.next
        if node == nil { 
          break
        }
      }
      return node!
    }
  }
  public subscript(index: Int) -> T {
    let node = theNode(atIndex: index)
    return node.value
  }
  public var isEmpty: Bool {
    return head == nil
  }
  
  public func append(_ value: T) {
    let newNode = Node(value: value)
    if let lastNode = tail {
      lastNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
  }
  
  public func removeLast() -> Node<T>?  {
    guard !isEmpty else { return nil }
    var removedNode: Node<T>?
    if head == tail {
      removedNode = head
      head = nil
      tail = nil
    }
    var currentNode = head
    while currentNode != nil {
      if currentNode?.next == tail {
        removedNode = currentNode?.next
        currentNode?.next = nil
        tail = currentNode
      }
      currentNode = currentNode?.next
    }
    return removedNode
  }
}
