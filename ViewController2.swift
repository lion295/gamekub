//
//  ViewController2.swift
//  game
//
//  Created by admin on 13.12.16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit

var kubik = 0

class ViewController2: UIViewController {
    
    let pers1i: UIImage = UIImage(named: "p1.png")!
    let pers1v: UIImageView = UIImageView()
    
    let pers2i: UIImage = UIImage (named: "p2.png")!
    let pers2v: UIImageView = UIImageView ()
    var x: [Int] =  [0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0,
                     0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0,
                     0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0,
                     0,40,80,120,160,200,240,280,280,240,200,160,120,80,40,0
                     ]
    var y: [Int] = [300,300,300,300,300,300,300,300,260,260,260,260,260,260,260,260,
                    220,220,220,220,220,220,220,220,
                    180,180,180,180,180,180,180,180,140,140,140,140,140,140,140,140,
                    100,100,100,100,100,100,100,100,60,60,60,60,60,60,60,60,
                    20,20,20,20,20,20,20,20]
    
    @IBOutlet weak var kub_img: UIImageView!
    
    func kubik_go () -> Int{
        let  k = Int(arc4random_uniform(6)+1)
        let  kub_num: String = String(k) + ".png"
        let ki: UIImage = UIImage(named: kub_num)!
        kub_img.image = ki
        view.addSubview(kub_img)
        return k;
        
    
    }
    
    
    @IBAction func go(_ sender: UIButton) {
        kubik += kubik_go()
        if (kubik<63){
            pers1_view()
        }
    }
    
    
    
    func pers1_view(){
        
        pers1v.image = pers1i
        pers1v.frame.size.width = 40
        pers1v.frame.size.height = 40
        UIView.animate(withDuration: 0.8, animations: {
            self.pers1v.frame.origin.x = CGFloat(self.x[kubik])
            self.pers1v.frame.origin.y = CGFloat(self.y[kubik])
        })
        
        
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


