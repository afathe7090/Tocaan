//
//  CountriesListViewController+Extension.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import UIKit

// MARK: - Extensions
extension CountriesListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.cities.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.cities[section].count()
    }
    
    // MARK: - Cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeue(cell: TitleCountriesCell.self, indexPath: indexPath)
            cell.titleLabel.text = viewModel.cities[indexPath.section].title
            cell.imgExpandArrow.isHighlighted = viewModel.cities[indexPath.section].isExpandable ?? false
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.textLabel?.text = viewModel.cities[indexPath.section].states[indexPath.row - 1].title
            return cell
        }
    }
    // MARK: - Did select row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard indexPath.row == 0 else { return }
        viewModel.countries[0].cities[indexPath.section].toggle()
        tableView.reloadSections(IndexSet(integer: indexPath.section), with: .none)
    }
    
}
