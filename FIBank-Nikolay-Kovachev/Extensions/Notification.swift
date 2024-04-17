//
//  Notification.swift
//  FIBank-Nikolay-Kovachev
//
//  Created by KNG on 17.04.24.
//

import Foundation

extension NotificationCenter {
    func setObserver(_ observer: AnyObject, selector: Selector, name: NSNotification.Name, object: AnyObject?) {
        NotificationCenter.default.removeObserver(observer,
                                                  name: name,
                                                  object: object)
        NotificationCenter.default.addObserver(observer,
                                               selector: selector,
                                               name: name,
                                               object: object)
    }
}
