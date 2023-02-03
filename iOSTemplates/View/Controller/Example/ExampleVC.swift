//
//  ExampleVC.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 04/01/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit
import RxSwift
import RxBiBinding
import RxDataSources

final class ExampleVC: ViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var playButton: UIButton!

    // MARK: - Properties

    private var viewModel: ExampleVM = ExampleVM()

    var dataSource: RxTableViewSectionedReloadDataSource<ItemSection> = {
        let dataSource = RxTableViewSectionedReloadDataSource<ItemSection>(
            configureCell: { _, tableView, indexPath, item in
                let cell = tableView.dequeue(cell: ExampleCell.self, forIndexPath: indexPath)
                cell.viewModel = ExampleCellVM(item: item)
                return cell
            }
        )
        return dataSource
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Override functions

    override func setupUI() {
        super.setupUI()
        title = "Example"
        configTableView()

    }

    override func binding() {
        super.binding()
        Observable.just(viewModel.items)
            .bind(to: tableView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
    }

    override func bindingButtonAction() {
        super.bindingButtonAction()
        playButton.rx.tap
            .subscribe({ [weak self] _ in
                guard let this = self else { return }
                this.tableView.reloadData()
            })
            .disposed(by: disposeBag)
    }

    // MARK: - Private functions

    private func configTableView() {
        tableView.register(ExampleCell.self)
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}

// MARK: - UITableViewDelegate

extension ExampleVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
