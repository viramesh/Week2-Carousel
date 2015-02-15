//
//  WelcomeViewController.swift
//  Carousel
//
//  Created by viramesh on 2/13/15.
//  Copyright (c) 2015 vbits. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var welcomeScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var spinBtnImage: UIImageView!
    @IBOutlet weak var spinBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        welcomeScrollView.contentSize = CGSize(width: 1280,height: 568)
        
        welcomeScrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 320))
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        
        if(page == 3) {
            self.spinBtn.hidden = false
            UIView.animateWithDuration(0.4, animations: {
                self.spinBtnImage.alpha = 1
            })
        }
        
        else {
            self.spinBtn.hidden = true
            UIView.animateWithDuration(0.4, animations: {
                self.spinBtnImage.alpha = 0
            })
        
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
