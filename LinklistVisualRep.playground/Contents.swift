import UIKit
import PlaygroundSupport

class ViewController: UIViewController {

  let buttonView = ButtonView(frame: CGRect(x: 90, y: 450, width: 200, height: 40))
  let linkedListCV = LinkedListCV(frame: CGRect(x: 0, y: 100, width: 376, height: 200))
  
  var linkList = LinkedList<Int>() {
    didSet {
     linkedListCV.collectionView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(linkedListCV)
    view.addSubview(buttonView)
    linkedListCV.collectionView.dataSource = self
    linkedListCV.collectionView.delegate = self
    setUpButtonAction()
  }
  
  func setUpButtonAction(){
    buttonView.appendButton.addTarget(self, action: #selector(appendButtonPressed), for: .touchUpInside)
    buttonView.removeLastButton.addTarget(self, action: #selector(removeLastButtonPressed), for: .touchUpInside)
  }
  
  @objc func appendButtonPressed(){
  linkList.append(Int.random(in: 0...100))
    UIView.animate(withDuration: 0.9, animations: {
      let indexPath = IndexPath(item: self.linkList.count - 1, section: 0)
      self.linkedListCV.collectionView.insertItems(at: [indexPath])
      self.linkedListCV.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
      guard let cell = self.linkedListCV.collectionView.cellForItem(at: indexPath) else {return}
      cell.layer.borderColor = UIColor.orange.cgColor
      cell.transform = CGAffineTransform(translationX: 8, y: -50)
    })
  }
  @objc func removeLastButtonPressed(){
    
    UIView.animate(withDuration: 0.9, animations: {
      self.linkList.removeLast()
      let indexPath = IndexPath(item: self.linkList.count , section: 0)
      guard let cell = self.linkedListCV.collectionView.cellForItem(at: indexPath) else {return}
      self.linkedListCV.collectionView.deleteItems(at: [indexPath])
      cell.transform = CGAffineTransform(translationX: 40, y: 140)
    }, completion: nil)
  }
}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return linkList.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = linkedListCV.collectionView.dequeueReusableCell(withReuseIdentifier: "NodeCell", for: indexPath) as! CustomCell
    cell.layer.cornerRadius = cell.bounds.width / 2.0
    cell.dataButton.setTitle("\(linkList[indexPath.row])", for: .normal)
    return cell
  }
}
let viewcontroller = ViewController()
PlaygroundPage.current.liveView = viewcontroller
