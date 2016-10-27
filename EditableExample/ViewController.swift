//
//  ViewController.swift
//  EditableExample
//
//  Created by Patrick on 27/10/16.
//  Copyright © 2016 Patrick. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ViewController: UIViewController {

    fileprivate let disposeBag = DisposeBag()
    fileprivate let textField = UITextField(frame: .zero)
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Settings"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter some text"
        textField.textAlignment = .center
//        textField.delegate = self
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            textField.heightAnchor.constraint(equalToConstant: 50),
            textField.widthAnchor.constraint(equalToConstant: 200),
            ])
        
        textField.rx.text.map { !($0?.isEmpty ?? false) }.bindTo(rx.editMade).addDisposableTo(disposeBag)
        
    }
}

extension ViewController: Editable {
    func save() {
        _ = navigationController?.popViewController(animated: true)
    }
    
    func cancel() {
        textField.text = nil
        edit(made: false)
    }
}

//extension ViewController: UITextFieldDelegate {
//    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
//        edit(made: !text.isEmpty)
//        return true
//    }
//}
