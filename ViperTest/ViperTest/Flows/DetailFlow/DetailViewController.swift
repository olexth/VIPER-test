//
//  DetailViewController.swift
//  ViperTest
//
//  Created by Alex Golub on 10/28/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol DetailViewControllerInput: DetailPresenterOutput {
}

protocol DetailViewControllerOutput {
}

class DetailViewController: UIViewController, DetailViewControllerInput {
    var output: DetailViewControllerOutput!
    var router: DetailRouter!

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    var event: Event? {
        didSet {
            configureView()
        }
    }

    // MARK: Object lifecycle

    override func awakeFromNib() {
        super.awakeFromNib()
        ViperConfigurator.configure(viewController: self,
            interactorType: DetailInteractor.self,
            presenterType: DetailPresenter.self,
            routerType: DetailRouter.self)
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    // MARK: Display logic

    func configureView() {
        if let detail = event {
            if let label = detailDescriptionLabel {
                label.text = detail.timestamp!.description
            }
        }
    }
}

extension DetailViewController: ViperViewController {
    func setOutput(output: ViperInteractor){
        self.output = output as! DetailViewControllerOutput
    }

    func setRouter(router: ViperRouter) {
        self.router = router as! DetailRouter
    }
}
