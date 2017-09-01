//
//  LCViewController.swift
//  TransitionAnimation
//
//  Created by 呆仔～林枫 on 2017/8/31.
//  Copyright © 2017年 Lin_Crazy. All rights reserved.
//

import UIKit

class LCViewController: UIViewController,UIViewControllerTransitioningDelegate {

    let dismissAnimator = DismissAnimatior()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.transitioningDelegate = self
        dismiss(animated: true, completion: nil)
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        return dismissAnimator
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
