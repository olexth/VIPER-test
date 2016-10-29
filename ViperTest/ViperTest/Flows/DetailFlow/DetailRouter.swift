//
//  DetailRouter.swift
//  ViperTest
//
//  Created by Alex Golub on 10/28/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol DetailRouterInput {
}

final class DetailRouter {
    weak var viewController: DetailViewController!
}

extension DetailRouter: ViperRouter {
    convenience init(withViewController controller: ViperViewController) {
        self.init()
        self.viewController = controller as! DetailViewController
    }
}
