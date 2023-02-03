//
//  UIImageViewExt.swift
//  iOSTemplates
//
//  Created by Khoa Vo T.A. VN.Danang on 16/01/2023.
//  Copyright © 2023 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

import UIKit
import SDWebImage

extension UIImageView {

    typealias Completion = (UIImage?) -> Void

    func cancelCurrentImageLoad() {
        sd_cancelCurrentImageLoad()
    }

    func setImage(urlString: String?, placeholder: UIImage?, completion: Completion? = nil) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            image = placeholder
            completion?(nil)
            return
        }
        sd_setImage(with: url,
                    placeholderImage: placeholder,
                    options: [.continueInBackground, .allowInvalidSSLCertificates],
                    progress: nil) { [weak self] (image, _, _, _) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                this.image = image == nil ? placeholder : image
                completion?(image)
            }
        }
    }

    func downloadImage(urlString: String?, placeholder: UIImage?, setImageWhen: ((String) -> Bool)? = nil) {
        guard let urlString = urlString,
              let url = URL(string: urlString) else {
            image = placeholder
            return
        }
        sd_setImage(with: url,
                    placeholderImage: placeholder,
                    options: [.continueInBackground, .allowInvalidSSLCertificates],
                    progress: nil) { [weak self] (image, _, _, _) in
            guard let this = self else { return }
            DispatchQueue.main.async {
                if let setImageWhen = setImageWhen {
                    if setImageWhen(urlString) {
                        this.image = image
                    } else {
                        this.image = placeholder
                    }
                } else {
                    this.image = image
                }
            }
        }
    }

    func loadImage(urlString: String?, completion: Completion?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        SDWebImageManager.shared.loadImage(with: url, options: .highPriority, progress: nil) { (image, _, _, _, finished, _) in
            if finished {
                self.image = image
                completion?(image)
            }
        }
    }
}
