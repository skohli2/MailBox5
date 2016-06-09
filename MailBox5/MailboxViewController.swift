//
//  MailboxViewController.swift
//  MailBox5
//
//  Created by Sumit Kohli on 6/8/16.
//  Copyright © 2016 Sumit Kohli. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var archiveImageView: UIImageView!
    @IBOutlet weak var listImageView: UIImageView!
    @IBOutlet weak var rescheduleImageView: UIImageView!

    @IBOutlet weak var listPageView: UIImageView!
    @IBOutlet weak var reschedulePageView: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var deleteImageView: UIImageView!
    @IBOutlet weak var singleMsgImageView: UIImageView!
    @IBOutlet weak var feedImageView: UIImageView!
    
    var singleMsgOriginalCenter: CGPoint!
    var archiveOriginalCenter: CGPoint!
    var rescheduleOriginalCenter: CGPoint!
    var deleteOriginalCenter: CGPoint!
    var listOriginalCenter: CGPoint!
    var singleMsgOffset: CGFloat!
    var singleMsgLeft: CGPoint!
    var singleMsgRight: CGPoint!
   
    override func viewDidLoad() {
        super.viewDidLoad()
       singleMsgOffset = 300
        singleMsgRight = singleMsgImageView.center
        singleMsgLeft = CGPoint(x: singleMsgImageView.center.x - singleMsgOffset ,y: singleMsgImageView.center.y)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        scrollView.contentSize = feedImageView.image!.size
        
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func didPanGesture(sender: UIPanGestureRecognizer) {
        var translation = sender.translationInView(view)
        //print("translation \(translation)")
        
        if sender.state ==
            UIGestureRecognizerState.Began {
            singleMsgOriginalCenter = singleMsgImageView.center
            
            
        } else if sender.state ==
            UIGestureRecognizerState.Changed {
            
            singleMsgImageView.center = CGPoint (x: singleMsgOriginalCenter.x + translation.x, y: singleMsgOriginalCenter.y)
            print ("MSG Center \(singleMsgImageView.center)")
            
            
          // archiveImageView.center = CGPoint (x: archiveOriginalCenter.x + singleMsgImageView.center.x - 200 , y: archiveOriginalCenter.y)
           // deleteImageView.center = CGPoint (x: deleteOriginalCenter.x + singleMsgImageView.center.x - 200 , y: deleteOriginalCenter.y)
            //rescheduleImageView.center = CGPoint (x: rescheduleOriginalCenter.x + singleMsgImageView.center.x - 120 , y: rescheduleOriginalCenter.y)
            //listImageView.center = CGPoint (x: listOriginalCenter.x + singleMsgImageView.center.x - 130, y: listOriginalCenter.y)
        
            if singleMsgImageView.center.x < view.frame.size.width - 400 {
                
                backView.backgroundColor = UIColor (red: 204/255, green: 102/255, blue: 0/255, alpha: 1)
                rescheduleImageView.alpha = 0.0
                listImageView.alpha = 1.0
                self.archiveImageView.alpha = 0.0
                self.deleteImageView.alpha = 0.0
                
            } else if singleMsgImageView.center.x < view.frame.size.width - 160 {
                backView.backgroundColor = UIColor (red: 235/255, green: 235/255, blue: 16/255, alpha: 1)
                rescheduleImageView.alpha = 1.0
                listImageView.alpha = 0.0
                self.archiveImageView.alpha = 0.0
                self.deleteImageView.alpha = 0.0
            } else if singleMsgImageView.center.x > view.frame.size.width + 80 {
                self.backView.backgroundColor = UIColor.redColor()
                rescheduleImageView.alpha = 0.0
                listImageView.alpha = 0.0
                self.archiveImageView.alpha = 0.0
                self.deleteImageView.alpha = 1.0
            } else if singleMsgImageView.center.x > view.frame.size.width - 150 {
                backView.backgroundColor = UIColor.greenColor()
                rescheduleImageView.alpha = 0.0
                listImageView.alpha = 0.0
                archiveImageView.alpha = 1.0
                deleteImageView.alpha = 0.0
            
            }else{
                backView.backgroundColor = UIColor.grayColor()
                rescheduleImageView.alpha = 1.0
                listImageView.alpha = 0.0
            }
            
        } else if sender.state ==
            UIGestureRecognizerState.Ended {
            var velocity = sender.velocityInView(view)
            
            
            if velocity.x < 0{
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.singleMsgImageView.center = self.singleMsgLeft
                    self.reschedulePageView.alpha = 1.0
                    self.listPageView.alpha = 0.0
                })
            }
            
          // // else if velocity.x < view.frame.size.width - 160 {
            //    UIView.animateWithDuration(0.3, animations: { () -> Void in
              //      self.singleMsgImageView.center = self.singleMsgLeft
               // })
            // }
            else {
                UIView.animateWithDuration(0.3, animations: { () -> Void in
                    self.singleMsgImageView.center = self.singleMsgRight
                })
            }
            
        }
    }
    
        
    }
    




