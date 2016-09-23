//
//  ViewController.swift
//  ContainerView
//
//  Created by 李 宇亮 on 16/9/23.
//  Copyright © 2016年 NightWatcher. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var identifierView: NSLayoutConstraint!
    let offSet:CGFloat = ((UIScreen.mainScreen().bounds.width - 40)/3 + 10)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func button1(sender: UIButton) {
        switch sender.tag {
        case 100:
            UIView.animateWithDuration(0.5, animations: {
                self.identifierView.constant = 10
                self.scrollView.contentOffset = CGPointMake(0, 0)

            })
        case 101:
            UIView.animateWithDuration(0.5, animations: {
                self.identifierView.constant = 10 + self.offSet
                self.scrollView.contentOffset = CGPointMake(UIScreen.mainScreen().bounds.width, 0)
            })
        default:
            UIView.animateWithDuration(0.5, animations: {
                self.identifierView.constant = 10 + self.offSet * 2
                self.scrollView.contentOffset = CGPointMake(UIScreen.mainScreen().bounds.width * 2, 0)
            })
        }
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        if self.scrollView.contentOffset == CGPointMake(0, 0) {
            self.identifierView.constant = 10
        } else if self.scrollView.contentOffset == CGPointMake(UIScreen.mainScreen().bounds.width, 0) {
            self.identifierView.constant = 10 + self.offSet
        } else if self.scrollView.contentOffset == CGPointMake(UIScreen.mainScreen().bounds.width * 2, 0) {
            self.identifierView.constant = 10 + self.offSet * 2
        }

    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

