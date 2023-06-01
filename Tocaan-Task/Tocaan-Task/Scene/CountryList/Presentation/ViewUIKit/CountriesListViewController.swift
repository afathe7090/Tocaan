//
//  CountriesListViewController.swift
//  Tocaan-Task
//
//  Created by Ahmed Fathy on 01/06/2023.
//

import UIKit
import Combine

class CountriesListViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Proberties
    var viewModel: CountriesListViewModel!
    private var anyCancellable = Set<AnyCancellable>()
    
    // MARK: - Init
    convenience init(viewModel: CountriesListViewModel) {
        self.init()
        self.viewModel = viewModel
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        reloadBindingTable()
    }
    
    // MARK: - Configuration
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.sectionHeaderTopPadding = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.regNib(cell: TitleCountriesCell.self)
    }
    
    // MARK: - Helper Functions
    private func reloadBindingTable() {
        viewModel.bindPublisher.dispatchOnMainQueue()
            .sink { [weak self] bind in
                switch bind {
                case .reloadAll: self?.tableView.reloadData()
                case .reloadSection(let index):
                    self?.tableView.reloadSections(IndexSet(integer: index), with: .none)
                }
            }.store(in: &anyCancellable)
    }
}
