//
//  ExampleVM.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 04/01/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import Foundation

final class ExampleVM {

    // MARK: - Properties
    private(set) var items: [Item] = [
        Item(id: 0,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 1"),
        Item(id: 1,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 2"),
        Item(id: 2,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 3"),
        Item(id: 3,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 4"),
        Item(id: 4,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 5"),
        Item(id: 5,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 6"),
        Item(id: 6,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 7"),
        Item(id: 7,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 8"),
        Item(id: 8,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 9"),
        Item(id: 9,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 10"),
        Item(id: 10,
             avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
             titleLabel: "Title 11")
    ]

    // MARK: - Public functions
    func viewModelForItem(at indexPath: IndexPath) -> ExampleCellVM? {
        let viewModel = ExampleCellVM(item: items[safe: indexPath.row])
        return viewModel
    }
}
