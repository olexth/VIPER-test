//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___PresenterInput: ___FILEBASENAMEASIDENTIFIER___InteractorOutput {
    
}

protocol ___FILEBASENAMEASIDENTIFIER___PresenterOutput: class {
    
}

final class ___FILEBASENAMEASIDENTIFIER___Presenter: ___FILEBASENAMEASIDENTIFIER___PresenterInput {
    weak var output: ___FILEBASENAMEASIDENTIFIER___PresenterOutput!
    
    // MARK: Presentation logic
}

extension ___FILEBASENAMEASIDENTIFIER___Presenter: ViperPresenter {
    convenience init(withOutput: ViperViewController) {
        self.init()
        self.output = withOutput as! ___FILEBASENAMEASIDENTIFIER___PresenterOutput
    }
}

