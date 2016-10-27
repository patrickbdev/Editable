//
//  Editable.swift
//  EditableExample
//
//  Created by Patrick on 27/10/16.
//  Copyright © 2016 Patrick. All rights reserved.
//

import Foundation
import UIKit
import ActionKit
import RxCocoa
import RxSwift

public protocol Editable {
    func save()             /// Called when save tapped
    func cancel()           /// Called when cancel tapped
    func edit(made: Bool)   /// Displays the Save and Cancel buttons if an edit has been made
}

public extension Reactive where Base: Editable & AnyObject {
    /// Bindable sink for `edit(made: Bool)`.
    public var editMade: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { editable, editMade in
            editable.edit(made: editMade)
        }
    }
}


public extension Editable where Self: UIViewController {
    func edit(made: Bool) {
        if made {
            let saveButton = UIBarButtonItem(title: "Save") { [weak self] in self?.save() }
            let cancelButton = UIBarButtonItem(title: "Cancel") { [weak self] in self?.cancel() }
            let animated = navigationItem.leftBarButtonItems?.isEmpty ?? true
            navigationItem.setLeftBarButtonItems([saveButton, cancelButton], animated: animated)
        } else {
            navigationItem.setLeftBarButtonItems(nil, animated: true)
        }
    }
}


