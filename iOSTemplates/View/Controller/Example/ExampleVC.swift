//
//  ExampleVC.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 04/01/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit

final class ExampleVC: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var playButton: UIButton!

    // MARK: - Properties
    var viewModel: ExampleVM?

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        performGetListPokemons()
    }

    // MARK: - Override functions
    override func setupUI() {
        super.setupUI()
        title = "Example"
        configTableView()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExampleCell.self)
    }

    private func performGetListPokemons() {
        guard let viewModel = viewModel else { return }
        viewModel.performGetListPokemons { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                print("\(error.localizedDescription)")
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ExampleVC: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: ExampleCell.self, forIndexPath: indexPath)
        if let viewModel = viewModel {
            cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        }
        return cell
    }
}

// MARK: - UITableViewDelegate
extension ExampleVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath: \(indexPath.row)")
    }
}
