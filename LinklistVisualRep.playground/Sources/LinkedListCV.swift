import UIKit

open class LinkedListCV:UIView {
  
  public var titleLabel:UILabel = {
    let label = UILabel(frame: CGRect.zero)
    label.backgroundColor = .white
    label.font = UIFont(name: "Chalkduster", size: 40)
    label.textColor = .orange
    label.text = "Linked List"
    label.textAlignment = .center
    return label
  }()
  
  public var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 100, height: 100)
    layout.sectionInset = UIEdgeInsets(top: 30, left: 50, bottom: 0, right: 50)
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.backgroundColor = .white
    cv.register(CustomCell.self, forCellWithReuseIdentifier: "NodeCell")
    return cv
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setupTitleLabel()
    addSubview(collectionView)
  }
  
 public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    collectionView.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 200)
    collectionView.center = center
    titleLabel.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 54)
    
  }
  
  func setupTitleLabel(){
   addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
      titleLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
          titleLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
  
}
