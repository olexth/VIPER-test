//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___InteractorInput: ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput {
}

protocol ___FILEBASENAMEASIDENTIFIER___InteractorOutput {
}

final class ___FILEBASENAMEASIDENTIFIER___Interactor: ___FILEBASENAMEASIDENTIFIER___InteractorInput {
    var output: ___FILEBASENAMEASIDENTIFIER___InteractorOutput!
    
    // MARK: Business logic
    
}

extension ___FILEBASENAMEASIDENTIFIER___Interactor: ViperInteractor {
    convenience init(withOutput: ViperPresenter) {
        self.init()
        self.output = withOutput as! ___FILEBASENAMEASIDENTIFIER___InteractorOutput
    }
}
