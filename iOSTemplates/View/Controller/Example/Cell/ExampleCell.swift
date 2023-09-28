//
//  ExampleCell.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 29/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit

final class ExampleCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Properties
    var viewModel: ExampleCellVM? {
        didSet {
            updateView()
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Private functions
    private func updateView() {
        guard let viewModel = viewModel, let item = viewModel.item else { return }
        titleLabel.text = item.titleLabel
        avatarImageView.loadImage(urlString: item.avatarURL, completion: nil)
    }
}
