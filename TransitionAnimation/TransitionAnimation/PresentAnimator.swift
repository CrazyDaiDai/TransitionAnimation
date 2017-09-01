//
//  AnimatedTransitioning.swift
//  TransitionAnimation
//
//  Created by 呆仔～林枫 on 2017/8/31.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit
import Foundation

class PresentAnimator: NSObject,UIViewControllerAnimatedTransitioning {
    
    var lTransitionContext : UIViewControllerContextTransitioning?
    let duration = 0.5 //动画的时间
    var originFrame : CGRect? //Cell的frame
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        /// 返回动画时间
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containView = transitionContext.containerView
//        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        let finalFram = toView?.frame
        let xScale = (originFrame?.size.width)!/(toView?.frame.size.width)!
        let yScale = (originFrame?.size.height)!/(toView?.frame.size.height)!
        
        toView?.transform = CGAffineTransform.init(scaleX: xScale, y: yScale)
        toView?.center = CGPoint.init(x: (originFrame?.midX)!, y: (originFrame?.midY)!)
        
        containView.addSubview(toView!)

        UIView.animate(withDuration: duration, animations: {
            toView?.center = CGPoint.init(x: (finalFram?.midX)!, y: (finalFram?.midY)!)
            toView?.transform = CGAffineTransform.identity
        }) { (finished) in
            transitionContext.completeTransition(true)
        }

    }

}

class DismissAnimatior: NSObject,UIViewControllerAnimatedTransitioning {
    
    let duration = 0.5
    var originFrame : CGRect!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containView = transitionContext.containerView
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        let xScale = originFrame.size.width/(toView?.frame.size.width)!
        let yScale = originFrame.size.height/(toView?.frame.size.height)!
        
        containView.addSubview(toView!)
        containView.bringSubview(toFront: fromView!)
        
        UIView.animate(withDuration: duration, animations: { 
            fromView?.center = CGPoint.init(x: self.originFrame.midX, y: self.originFrame.midY)
            fromView?.transform = CGAffineTransform.init(scaleX: xScale, y: yScale)
        }) { (finished) in
            transitionContext.completeTransition(true)
        }
        
        
    }
}
