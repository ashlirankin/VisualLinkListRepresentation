# Visual LinkList Representation

## Why?

Data Structures can be daunting. Sometimes reading the lines of code is not enough to understand the concept. If you are a visual learner like me, having a visual aid can really cement a concept. I created this small project to help individuals like me who need visual aids to hit the concept home. 

## How?

The node class was implemented. It was then used to create the abstract LinkedList Data Structure with the append and remove last methods. Once the LinkedList was created two buttons were made, these buttons which trigger animations on the collection view cell. Combined these small parts stimulates the adding and removing nodes from the linked list. 

## Why I am Proud

I am proud of this project because I was able to combine the concepts of data structures and iOS architecture into a clean visual representation of LinkedList. Creating this project was rewarding because it allowed me to push myself further to create a product that would be of use to individuals other than me. In the further i want to build on this project and create other visual representations of data structures such as, Stacks, Queues, Binary Search Trees etc. 
Moreover, I am proud of this project because I am passionate about helping other and making a meaningful impact in the live of the youth. It is my hope that this project aids persons who are interested in becoming developers or even youth students have a clear visualisation of data structures.

## Node Implementation

A node is an abstract data type which contains a value and a pointer to another node. 

```swift
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
  
   public var isEmpty: Bool {
    return head == nil
  }
}
```
## Linkedlist Implementation

A LinkedList is an abstract data structure which is comprised of a head and a tail. The head and tail are nodes and they are optional since they can be nil.

```swift
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
```
## The append Implementation

The append method adds a node to the tail of the LinkedList.

```swift
  public func append(_ value: T) {
    let newNode = Node(value: value)
    if let lastNode = tail {
      lastNode.next = newNode
    } else {
      head = newNode
    }
    tail = newNode
  }
```
## The removeLast Implementation

This method removes the node from the tail of the LinkedList

```swift 
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
```
## Finding the node at a specific index

This method finds a node at a specific index of the LinkedList

```swift
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
```

## Subscripting LinkedList

Subscripting was inpelemented to aid in displaying the titleLabels for the buttons in the collection view

```swift
  public subscript(index: Int) -> T {
    let node = theNode(atIndex: index)
    return node.value
  }
 ```
## Demonstration

![gif](https://github.com/Ashlirankin18/VisualLinkListRepresentation/blob/master/anotherLinklistgif.gif)
