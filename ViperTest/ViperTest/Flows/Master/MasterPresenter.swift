//
//  MasterPresenter.swift
//  ViperTest
//
//  Created by Alex Golub on 10/29/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol MasterPresenterInput: MasterInteractorOutput {
    
}

protocol MasterPresenterOutput: class {
    
}

final class MasterPresenter: MasterPresenterInput {
    weak var output: MasterPresenterOutput!
    
    // MARK: Presentation logic
}

extension MasterPresenter: ViperPresenter {
    convenience init(withOutput: ViperViewController) {
        self.init()
        self.output = withOutput as! MasterPresenterOutput
    }
}

