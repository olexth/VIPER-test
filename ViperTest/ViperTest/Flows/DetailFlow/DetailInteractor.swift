//
//  DetailInteractor.swift
//  ViperTest
//
//  Created by Alex Golub on 10/28/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol DetailInteractorInput: DetailViewControllerOutput {
}

protocol DetailInteractorOutput {
}

final class DetailInteractor: DetailInteractorInput {
    var output: DetailInteractorOutput!

    // MARK: Business logic
}

extension DetailInteractor: ViperInteractor {
    convenience init(withOutput: ViperPresenter) {
        self.init()
        self.output = withOutput as! DetailInteractorOutput
    }
}
