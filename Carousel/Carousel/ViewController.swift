//
//  ViewController.swift
//  Carousel
//
//  Created by viramesh on 2/11/15.
//  Copyright (c) 2015 vbits. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var imageTile1: UIImageView!
    @IBOutlet weak var imageTile2: UIImageView!
    @IBOutlet weak var imageTile3: UIImageView!
    @IBOutlet weak var imageTile4: UIImageView!
    @IBOutlet weak var imageTile5: UIImageView!
    @IBOutlet weak var imageTile6: UIImageView!
    
    var yOffsets : [Float] = [-265, -240, -415, -408, -500, -500]
    var xOffsets : [Float] = [-70, 35, 20, 70, -120, -85]
    var scales : [Float] = [1, 1.65, 1.7, 1.6, 1.65, 1.65]
    var rotations: [Float] = [-10, -10, 10, 10, 10, -10]
    var imageTiles: [UIImageView] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginScrollView.contentSize = loginImageView.frame.size
        loginScrollView.delegate = self
        
        imageTiles = [imageTile1, imageTile2, imageTile3, imageTile4, imageTile5, imageTile6]
        for (i,imageTile) in enumerate(imageTiles) {
            
            var tx = convertValue(0, 0, 568, xOffsets[i], 0)
            var ty = convertValue(0, 0, 568, yOffsets[i], 0)
            var ts = convertValue(0, 0, 568, scales[i], 1)
            var tr = convertValue(0, 0, 568, rotations[i], 0)
            
            imageTile.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            imageTile.transform = CGAffineTransformScale(imageTile.transform, CGFloat(ts), CGFloat(ts))
            imageTile.transform = CGAffineTransformRotate(imageTile.transform, CGFloat(Double(tr) * M_PI / 180))
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        var offset = Float(scrollView.contentOffset.y)
        
        for (i,imageTile) in enumerate(imageTiles) {
            
            var tx = convertValue(offset, 0, 568, xOffsets[i], 0)
            var ty = convertValue(offset, 0, 568, yOffsets[i], 0)
            var ts = convertValue(offset, 0, 568, scales[i], 1)
            var tr = convertValue(offset, 0, 568, rotations[i], 0)
            
            imageTile.transform = CGAffineTransformMakeTranslation(CGFloat(tx), CGFloat(ty))
            imageTile.transform = CGAffineTransformScale(imageTile.transform, CGFloat(ts), CGFloat(ts))
            imageTile.transform = CGAffineTransformRotate(imageTile.transform, CGFloat(Double(tr) * M_PI / 180))
        }
        
        
        
    }

}

