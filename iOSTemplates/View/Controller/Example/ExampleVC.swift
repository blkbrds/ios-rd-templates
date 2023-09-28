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
    private var viewModel: ExampleVM = ExampleVM()

    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Override functions
    override func setupUI() {
        super.setupUI()
        title = "Example"
    }

    // MARK: - Private functions
}

// MARK: - UITableViewDelegate
extension ExampleVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
