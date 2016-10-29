//
//  DetailPresenter.swift
//  ViperTest
//
//  Created by Alex Golub on 10/28/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol DetailPresenterInput: DetailInteractorOutput {
}

protocol DetailPresenterOutput: class {
}

final class DetailPresenter: DetailPresenterInput {
    weak var output: DetailPresenterOutput!
    
    // MARK: Presentation logic
}

extension DetailPresenter: ViperPresenter {
    convenience init(withOutput: ViperViewController) {
        self.init()
        self.output = withOutput as! DetailPresenterOutput
    }
}

