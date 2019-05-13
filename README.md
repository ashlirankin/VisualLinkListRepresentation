# VisualLinkListRepresentation

Data Structures can be daunting. Sometimes reading the lines of code is not enough to understand the concept. If you are a visual learner like me, having a visual aid can really cement a concept. I created this small project to help individuals like me who need visual aids to hit the concept home. 

The node class was implemented. It was then used to create the abstract LinkedList Data Structure with the append and remove last methods. Once the linkedlist was created two buttons were made, these buttons which trigger animations on the collection view cell. Combined these small parts stimulates the adding and removing nodes from the linked list. 

## Node Implementation

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
}
```

# Demonstration

![gif](https://github.com/Ashlirankin18/VisualLinkListRepresentation/blob/master/LinkedList.gif)
