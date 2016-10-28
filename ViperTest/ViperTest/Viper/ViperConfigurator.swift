//
//  ViperConfigurator.swift
//  ViperTest
//
//  Created by Alex Golub on 10/28/16.
//  Copyright © 2016 Alex Golub. All rights reserved.
//

import UIKit

struct ViperConfigurator {
    // MARK: Configuration
    static func configure<V: ViperViewController, I: ViperInteractor, P: ViperPresenter, R: ViperRouter>(
        viewController: V,
        interactorType: I.Type,
        presenterType: P.Type,
        routerType: R.Type) {
        let router = R(withViewController: viewController)
        let presenter = P(withOutput: viewController)
        let interactor = I(withOutput: presenter)
        viewController.setOutput(output: interactor)
        viewController.setRouter(router: router)
    }
}

protocol ViperViewController: class {
    func setOutput(output: ViperInteractor)
    func setRouter(router: ViperRouter)
}

protocol ViperInteractor {
    init(withOutput: ViperPresenter)
}

protocol ViperPresenter {
    init(withOutput: ViperViewController)
}

protocol ViperRouter {
    init(withViewController controller: ViperViewController)
}

protocol Router {
    func passDataToNextScene(segue: UIStoryboardSegue)
    func passDataToNextScene(segue: UIStoryboardSegue, sender: AnyObject?)
}
