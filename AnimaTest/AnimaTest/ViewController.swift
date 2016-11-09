//
//  ViewController.swift
//  AnimaTest
//
//  Created by Denny on 9/11/2016.
//  Copyright © 2016年 Denny. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func move(_ sender: Any) {
        // moveImageView()
        UIView.performWithoutAnimation {
            moveImageView()
        }
    }
    func moveImageView() {
        topConstraint.constant = 100
        UIView.animate(withDuration: 3, animations: view.layoutIfNeeded)
    }
    
    @IBOutlet weak var topConstraint: NSLayoutConstraint!

    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentAnimator()
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissAnimator()
    }
    
    @IBAction func exit(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func show(_ sender: Any) {
        let controller = self.storyboard?.instantiateViewController(withIdentifier: "RabbitController")
        controller?.transitioningDelegate = self
        self.present(controller!, animated: true, completion: nil)
    }
}

class PresentAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        containerView.addSubview(toView)
        
        toView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        
        
        UIView.animate(withDuration: 3, animations: {
            
            toView.transform = CGAffineTransform.identity
            
        }) { (_) in
            transitionContext.completeTransition(
                !transitionContext.transitionWasCancelled
            )
        }
        
        
    }
}

class DismissAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView
        
        let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)!
        
        let toView = transitionContext.view(forKey: UITransitionContextViewKey.to)!
        
        containerView.insertSubview(toView, belowSubview: fromView)
        
        UIView.animate(withDuration: 1.5, delay: 0.0,
                       usingSpringWithDamping: 0.5, initialSpringVelocity: 0,
                       options: [], animations: {
                        fromView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                        
        }, completion: nil)
        
        UIView.animate(withDuration: 1.5, delay: 1.5, options: [], animations: {
            
            fromView.center.x += containerView.frame.size.width
            
        }, completion: {_ in
            
            //3) complete the transition
            
            transitionContext.completeTransition(
                !transitionContext.transitionWasCancelled
            )
            
        })
        
        let background = UIView(frame: containerView.bounds)
        background.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
        containerView.insertSubview(background, belowSubview: fromView)
        
        UIView.animate(withDuration: 1, delay: 0.0, options: [], animations: {
            background.alpha = 0
        }, completion: {_ in
            background.removeFromSuperview()
        })
        
    }
    
}

