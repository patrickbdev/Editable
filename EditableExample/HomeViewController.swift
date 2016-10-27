//
//  HomeViewController.swift
//  EditableExample
//
//  Created by Patrick on 27/10/16.
//  Copyright © 2016 Patrick. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        title = "Home"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.navigationController?.pushViewController(ViewController(), animated: true)
        }
    }
}
