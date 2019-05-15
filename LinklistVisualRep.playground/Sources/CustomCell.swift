import UIKit

public class CustomCell: UICollectionViewCell{
  
  public var dataButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = .orange
    button.titleLabel?.font = UIFont(name: "Chalkduster", size: 12)
    return button
  }()
  
  public var lineView: UIView = {
    let view = UIView()
    view.backgroundColor = .orange
    return view
  }()
  
  public var chevron: UIImageView = {
    let iv = UIImageView()
    iv.image = UIImage(named: "chevron-28")
    return iv
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = #colorLiteral(red: 0.6565030217, green: 0.9184930921, blue: 1, alpha: 1)
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    setupButton()
    setupChevron()
    setupLineView()
  }
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  private func setupButton() {
    addSubview(dataButton)
    dataButton.translatesAutoresizingMaskIntoConstraints = false
    dataButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    dataButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    dataButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    dataButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    dataButton.layer.cornerRadius = dataButton.bounds.width / 2.0
    dataButton.layer.masksToBounds = true
  }
  private func setupChevron() {
    addSubview(chevron)
    chevron.translatesAutoresizingMaskIntoConstraints = false
    chevron.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    chevron.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
  }
  private func setupLineView() {
    addSubview(lineView)
    lineView.translatesAutoresizingMaskIntoConstraints = false
    lineView.leadingAnchor.constraint(equalTo: dataButton.trailingAnchor).isActive = true
    lineView.heightAnchor.constraint(equalToConstant: 2).isActive = true
    lineView.trailingAnchor.constraint(equalTo: chevron.leadingAnchor).isActive = true
    lineView.centerYAnchor.constraint(equalTo: dataButton.centerYAnchor).isActive = true
  }
}
