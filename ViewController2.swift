//
//  ViewController2.swift
//  game
//
//  Created by admin on 13.12.16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    let pers1i: UIImage = UIImage(named: "p1.png")!
    let pers1v: UIImageView = UIImageView()
    
    let pers2i: UIImage = UIImage (named: "p2.png")!
    let pers2v: UIImageView = UIImageView ()
    func pers1_view(){
        
        pers1v.image = pers1i
        pers1v.frame.size.width = 40
        pers1v.frame.size.height = 40
        
        view.addSubview(pers1v)
        
                    }
        func pers2_view(){
            
            pers2v.image = pers1i
            pers2v.frame.size.width = 40
            pers2v.frame.size.height = 40
            
            view.addSubview(pers2v)
            
                            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pers2_view()
        pers1_view()
        NSLog("ok 2")
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}


