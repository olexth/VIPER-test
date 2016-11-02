//
//  MasterRouter.swift
//  ViperTest
//
//  Created by Alex Golub on 10/29/16.
//  Copyright (c) 2016 Alex Golub. All rights reserved.
//

import UIKit

protocol MasterRouterInput {
    
}

final class MasterRouter {
    weak var viewController: MasterViewController!
    
    // MARK: Navigation
    
    // MARK: Communication
    
    func passDataToNextScene(segue: UIStoryboardSegue) {
        
    }
}

extension MasterRouter: ViperRouter {
    convenience init(withViewController controller: ViperViewController) {
        self.init()
        self.viewController = controller as! MasterViewController
    }
}
