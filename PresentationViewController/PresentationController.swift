//
//  PresentationController.swift
//  PresentationViewController
//
//  Created by Lova on 2017/1/17.
//  Copyright © 2017年 Lova. All rights reserved.
//

import UIKit

class PresentationController: UIPresentationController {
    
    lazy var bgView: UIView = {
        var bgView = UIView(frame: UIApplication.shared.keyWindow!.frame)
        bgView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.4)
        bgView.isUserInteractionEnabled = true

        return bgView
    }()
    
    override func presentationTransitionWillBegin() {
        super.presentationTransitionWillBegin()
        
        self.containerView?.addSubview(self.bgView)
        self.containerView?.addSubview(self.presentedViewController.view)
    }

    //用來做換頁的view
    override var presentedView: UIView? {
        self.presentedViewController.view.layer.cornerRadius = 15
        return self.presentedViewController.view
    }

    override var shouldRemovePresentersView: Bool {
        return false
    }

    override func presentationTransitionDidEnd(_ completed: Bool) {
        super.presentationTransitionDidEnd(completed)
    }

    override func dismissalTransitionWillBegin() {
        super.dismissalTransitionWillBegin()
        
        self.presentingViewController.transitionCoordinator?.animate(alongsideTransition: { viewControllerTransitionCoordinatorContext in
            self.bgView.alpha = 0
            self.presentingViewController.view.transform = CGAffineTransform.identity
        }, completion: { viewControllerTransitionCoordinatorContext in
            //
        })
    }

    override func dismissalTransitionDidEnd(_ completed: Bool) {
        super.dismissalTransitionDidEnd(completed)
    }

    override var frameOfPresentedViewInContainerView: CGRect {
        let height: CGFloat = 120
        return CGRect(x: 0,
                      y: height,
                      width: (UIApplication.shared.keyWindow?.frame.size.width)!,
                      height: (UIApplication.shared.keyWindow?.frame.size.height)! - height)
    }
}
