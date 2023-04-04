//
//  UITableView.swift
//  Macmeter
//
//  Created by Muhammad Salman Zafar on 1/29/22.
//

import UIKit

public extension UITableView {

    func registerNib(cell: ReusableCell.Type, in bundle: Bundle? = nil) {
        register(UINib(nibName: cell.ReuseId, bundle: bundle), forCellReuseIdentifier: cell.ReuseId)
    }

    func registerCells(cells: [ReusableCell.Type], in bundle: Bundle? = nil) {

        cells.forEach { registerNib(cell: $0) }
    }

    func dequeueReusableCell<T: ReusableCell>(forIndexPath indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.ReuseId, for: indexPath ) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.ReuseId)")
        }
        return cell
    }
}
