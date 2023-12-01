//
//  AppDelegate.swift
//
//  Created by Khoa Vo T.A. VN.Danang on 23/12/2022.
//  Copyright © 2022 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import IQKeyboardManagerSwift
import UIKit

let iqKeyboard = IQKeyboardManager.shared

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configIQKeyBoardManager()
        return true
    }

    private func configIQKeyBoardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
