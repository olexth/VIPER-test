//
//  ___FILENAME___
//  ___PROJECTNAME___
//
//  Created by ___FULLUSERNAME___ on ___DATE___.
//  Copyright (c) ___YEAR___ ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol ___FILEBASENAMEASIDENTIFIER___ViewControllerInput: ___FILEBASENAMEASIDENTIFIER___PresenterOutput {
    
}

protocol ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput {
    
}

class ___FILEBASENAMEASIDENTIFIER___ViewController: UIViewController, ___FILEBASENAMEASIDENTIFIER___ViewControllerInput {
    var output: ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput!
    var router: ___FILEBASENAMEASIDENTIFIER___Router!
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ViperConfigurator.configure(self,
            interactorType: ___FILEBASENAMEASIDENTIFIER___Interactor.self,
            presenterType: ___FILEBASENAMEASIDENTIFIER___Presenter.self,
            routerType: ___FILEBASENAMEASIDENTIFIER___Router.self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Event handling
    
    // MARK: Display logic
    
}

extension ___FILEBASENAMEASIDENTIFIER___ViewController: ViperViewController {
    func setOutput(output: ViperInteractor){
        self.output = output as! ___FILEBASENAMEASIDENTIFIER___ViewControllerOutput
    }

    func setRouter(router: ViperRouter) {
        self.router = router as! ___FILEBASENAMEASIDENTIFIER___Router
    }
}
