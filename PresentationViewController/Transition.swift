//
//  Transition.swift
//  PresentationViewController
//
//  Created by Lova on 2017/1/17.
//  Copyright © 2017年 Lova. All rights reserved.
//

import UIKit

class Transition: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = false
    var containerView: UIView?


    init(presenting: Bool) {
        super.init()
        self.isPresenting = presenting
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)
        let toController = transitionContext.viewController(forKey: .to)! as UIViewController
        let toView = transitionContext.view(forKey: .to)

        let fromFrame = CGRect(x: 0, y: 0, width: 20, height: 20)
        toView?.frame = fromFrame

        let toFrame = transitionContext.finalFrame(for: toController)
        
        if self.isPresenting {
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                toView?.frame = toFrame
            }, completion: { (success) in
                transitionContext.completeTransition(success)
            })
        } else {
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                fromView?.frame = fromFrame
            }, completion: { (success) in
                transitionContext.completeTransition(success)
            })
        }
    }
}
