//
//  ExampleVC.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 26/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit
import RxSwift
import RxBiBinding
import RxDataSources

final class ExampleVC: ViewController {

    // MARK: - IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    private var viewModel: ExampleVM = ExampleVM()

    var dataSource: RxTableViewSectionedReloadDataSource<ItemSection> = {
        let dataSource = RxTableViewSectionedReloadDataSource<ItemSection>(
            configureCell: { dataSource, tableView, indexPath, item in
                let cell = tableView.dequeue(cell: ExampleCell.self, forIndexPath: indexPath)
                return cell
            }
        )
        return dataSource
    }()

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
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
    }

    private func configTableView() {
        tableView.register(ExampleCell.self)
    }
}

extension ExampleVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
