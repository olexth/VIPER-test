//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___RouterInput {}

final class ___FILEBASENAMEASIDENTIFIER___Router: ___FILEBASENAMEASIDENTIFIER___RouterInput {
    weak var viewController: ___FILEBASENAMEASIDENTIFIER___ViewController!

    // MARK: Navigation

    // MARK: Communication

    func passDataToNextScene(segue: UIStoryboardSegue) {}
}

extension ___FILEBASENAMEASIDENTIFIER___Router: ViperRouter {
    convenience init(withViewController controller: ViperViewController) {
        self.init()
        self.viewController = controller as! ___FILEBASENAMEASIDENTIFIER___ViewController
    }
}
