//
//  ExampleVM.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 29/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import RxDataSources
import RxSwift

final class ExampleVM {

//    private(set) var items = Observable.just([SectionModel(model: "Section 1",
//                                                           items: [Item(id: 0,
//                                                                        avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
//                                                                        titleLabel: "Title 1"),
//                                                                   Item(id: 1,
//                                                                        avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
//                                                                        titleLabel: "Title 2")]),
//                                              SectionModel(model: "Section 2",
//                                                           items: [Item(id: 2,
//                                                                        avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
//                                                                        titleLabel: "Title 3"),
//                                                                   Item(id: 3,
//                                                                        avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
//                                                                        titleLabel: "Title 4")])
//    ])

    private(set) var items: [ItemSection] = [ItemSection(header: "Section 1",
                                                         items: [Item(id: 0,
                                                                      avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
                                                                      titleLabel: "Title 1"),
                                                                 Item(id: 1,
                                                                      avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
                                                                      titleLabel: "Title 2")]),
                                             ItemSection(header: "Section 2",
                                                         items: [Item(id: 2,
                                                                      avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
                                                                      titleLabel: "Title 3"),
                                                                 Item(id: 3,
                                                                      avatarURL: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9r3ogaSmpwNYSaEKRifVaHjwmYsKSW7fC6Q&usqp=CAU",
                                                                      titleLabel: "Title 4")])
    ]
}

struct ItemSection {

    var header: String
    var items: [Item]
}

extension ItemSection: SectionModelType {

    init(original: ItemSection, items: [Item]) {
        self = original
        self.items = items
    }
}
