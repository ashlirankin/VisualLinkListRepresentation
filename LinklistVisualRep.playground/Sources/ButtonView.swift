import UIKit

public class ButtonView:UIView {
 
  public let pushButton:UIButton =  {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 80))
    button.setTitle("Append", for: .normal)
    button.setTitleColor(.black, for: .normal)
    return button
  }()
  
 public let popButton:UIButton = {
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 90, height: 80))
  button.setTitle("Pop", for: .normal)
   button.setTitleColor(.black, for: .normal)
    return button
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(pushButton)
    addSubview(popButton)
    setupPopButton()
    setupPushButton()
  }
  public override func layoutSubviews() {
    super.layoutSubviews()
    popButton.layer.cornerRadius = 10
     popButton.layer.borderColor = #colorLiteral(red: 0.6870860457, green: 0.8867294192, blue: 1, alpha: 1).cgColor
    popButton.layer.borderWidth = 2
    pushButton.layer.cornerRadius = 10
    pushButton.layer.borderColor =  #colorLiteral(red: 0.6870860457, green: 0.8867294192, blue: 1, alpha: 1).cgColor
    pushButton.layer.borderWidth = 2
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func setupPushButton(){
    pushButton.translatesAutoresizingMaskIntoConstraints = false
    pushButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
    pushButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
      
  }
  
  func setupPopButton(){
    popButton.translatesAutoresizingMaskIntoConstraints = false
    popButton.leadingAnchor.constraint(equalTo: pushButton.trailingAnchor, constant: 10).isActive = true
    popButton.widthAnchor.constraint(equalToConstant: 90).isActive = true
  }
  
  
  
}

