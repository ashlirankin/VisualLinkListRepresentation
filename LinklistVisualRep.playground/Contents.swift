import UIKit
import PlaygroundSupport

/*:
 ## Visual Linked List
 */

/*:
 ## Implementation
 * generic can be used on any type
 */

class ViewController: UIViewController {
  public var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 100, height: 100)
    layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 30)
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.register(CustomCell.self, forCellWithReuseIdentifier: "NodeCell")
    return cv
  }()
  let buttonView = ButtonView(frame: CGRect(x: 90, y: 450, width: 200, height: 40))
  
  var linkList = LinkedList<Int>() {
    didSet {
      collectionView.reloadData()
    }
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(collectionView)
    view.addSubview(buttonView)
    collectionView.dataSource = self
    collectionView.delegate = self
    setUpButtonAction()
  }
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    collectionView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: 200)
    collectionView.center = view.center
  }
  func setUpButtonAction(){
    buttonView.pushButton.addTarget(self, action: #selector(pushButtonPressed), for: .touchUpInside)
    buttonView.popButton.addTarget(self, action: #selector(popButtonPressed), for: .touchUpInside)
  }
  
  @objc func pushButtonPressed(){
  linkList.append(Int.random(in: 0...100))
    let indexPath = IndexPath(item: linkList.count - 1, section: 0)
    collectionView.insertItems(at: [indexPath])
    collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
    guard let cell = collectionView.cellForItem(at: indexPath) else {return}
    cell.alpha = 0
    cell.layer.borderColor = UIColor.orange.cgColor
    UIView.animate(withDuration: 1.0, animations: {
      cell.transform = CGAffineTransform(translationX: 10, y: -51)
      cell.alpha = 1
    })
  }
  @objc func popButtonPressed(){
    UIView.animate(withDuration: 1.0, delay: 0.2, options: [.beginFromCurrentState], animations: {
      self.linkList.removeLast()
      let indexPath = IndexPath(item: self.linkList.count , section: 0)
      guard let cell = self.collectionView.cellForItem(at: indexPath) else {return}
     self.collectionView.deleteItems(at: [indexPath])
      cell.transform = CGAffineTransform(translationX: 40, y: 140)
      
    }, completion: nil)
  }
}
extension ViewController: UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return linkList.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NodeCell", for: indexPath) as! CustomCell
    cell.layer.cornerRadius = cell.bounds.width / 2.0
    cell.dataButton.setTitle("\(linkList[indexPath.row])", for: .normal)
    return cell
  }
  
}
let viewcontroller = ViewController()
PlaygroundPage.current.liveView = viewcontroller