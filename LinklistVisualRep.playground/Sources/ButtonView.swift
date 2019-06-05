import UIKit

public class ButtonView:UIView {
  public let appendButton:UIButton =  {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 120, height: 80))
    button.titleLabel?.numberOfLines = 0
    button.setTitleColor(.black, for: .normal)
    button.setTitle("Append", for: .normal)
     button.titleLabel?.font = UIFont(name: "Chalkduster", size: 12)
    button.setTitleColor(.orange, for: .normal)
    return button
  }()
  
 public let removeLastButton:UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 180, height: 80))
   button.titleLabel?.adjustsFontSizeToFitWidth = true
  button.setTitle("RemoveLast", for: .normal)
  button.titleLabel?.numberOfLines = 0
  button.titleLabel?.font = UIFont(name: "Chalkduster", size: 12)
  button.setTitleColor(.orange, for: .normal)
    return button
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(appendButton)
    addSubview(removeLastButton)
    setupRemoveLastButton()
    setupAppendButton()
  }
  
  public override func layoutSubviews() {
    super.layoutSubviews()
    setupButtons()
  }
  
  private func setupButtons(){
    removeLastButton.layer.cornerRadius = 10
    removeLastButton.layer.borderColor = #colorLiteral(red: 0.6870860457, green: 0.8867294192, blue: 1, alpha: 1).cgColor
    removeLastButton.layer.borderWidth = 2
    appendButton.layer.cornerRadius = 10
    appendButton.layer.borderColor =  #colorLiteral(red: 0.6870860457, green: 0.8867294192, blue: 1, alpha: 1).cgColor
    appendButton.layer.borderWidth = 2
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setupAppendButton(){
    appendButton.translatesAutoresizingMaskIntoConstraints = false
    appendButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
    appendButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
  }
  
  private func setupRemoveLastButton(){
    removeLastButton.translatesAutoresizingMaskIntoConstraints = false
    removeLastButton.leadingAnchor.constraint(equalTo: appendButton.trailingAnchor, constant: 10).isActive = true
    removeLastButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
  }
}
