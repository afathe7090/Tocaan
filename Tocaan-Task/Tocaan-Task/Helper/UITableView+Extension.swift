//
//  UITableView+Extension.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import UIKit

extension UITableView {
    func dequeue<T: UITableViewCell>(cell: T.Type, indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: String(describing: cell.self), for: indexPath) as! T
    }
    
    func regNib<T: UITableViewCell>(cell: T.Type) {
        register(UINib(nibName: String(describing: cell.self), bundle: nil), forCellReuseIdentifier: String(describing: cell.self))
    }
}
