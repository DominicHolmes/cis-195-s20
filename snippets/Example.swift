//
//  Example.swift
//
//  Created by Dominic Holmes on 2/7/20.
//  Copyright © 2020 Dominic Holmes. All rights reserved.
//

import UIKit


// MARK: - Protocol
// This protocol can be adopted by any object that wants Counter updates.
// If you want the protocol to be used as a "weak var", the ": class" part is required.
protocol CounterDelegate: class {
    func didUpdate(count: Int)
}




// MARK: - Model
// This model counts by 1. It notifies its delegate when the count changes.
class Counter {
    
    // "count" is private, so not visible outside of the class.
    private var count = 0
    
    // The delegate must be weak and set to nil. This is set to a value in the view controller.
    weak var delegate: CounterDelegate? = nil
    
    // The only exposed funtion. Count by 1, then notify the delegate.
    func increment() {
        count += 1
        delegate?.didUpdate(count: count)
    }
}




// MARK: - View Controller
class CoreViewController: UIViewController {
    
    let model = Counter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        model.increment()
    }
}

// This is an extension of CoreViewControllers, in which we conform to CounterDelegate.
// Extensions can also contain new methods. They are a useful way to seperate your code.
// I tend to put new protocol conformances in their own extension, like this:
extension CoreViewController: CounterDelegate {
    func didUpdate(count: Int) {
        print("Notified of new count: \(count)")
    }
}

