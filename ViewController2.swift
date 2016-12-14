//
//  ViewController2.swift
//  game
//
//  Created by admin on 13.12.16.
//  Copyright © 2016 admin. All rights reserved.
//

import UIKit
import AVFoundation

var kubik = 0
var kubik2 = 0
var pers1win: Bool = false
var pers2win: Bool = false

class ViewController2: UIViewController {
    var go_sound = AVAudioPlayer()
     var go_sound2 = AVAudioPlayer()
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
    
    func pers2go()
    {
        kubik2 += kubik_go() + 30
        
        let sound2 = NSURL(fileURLWithPath:Bundle.main.path(forResource: "pers2go2", ofType: "mp3")!)
        do{
            go_sound2 = try AVAudioPlayer(contentsOf: sound2 as URL)
            go_sound2.prepareToPlay()
            go_sound2.play()
        }
        catch
        {
            print("Error2")
        }
        
      //  hod2.text = "Позиция второго игрока: \(kubik2)"
                if ( kubik2<63){
            pers2_view()
        }
    
        
        else {
            
            if (pers2win != true)
            {
                
                kubik2 = 63
                pers2_view()
                pers2win = true
            }
                
            else {
                kubik = 0
                kubik2 = 0
                pers1_view()
                pers2_view()
                pers2win = false
                hod2.text = "Позиция второго игрока: \(kubik2)"
                
                
            }
            
            
        }
        go.isEnabled = true
        hod2.text = "Позиция второго игрока: \(kubik2)"
        
        
    }
    
    
    @IBAction func go(_ sender: UIButton) {
        kubik += kubik_go()
      //  led sound = NSURL(fileURLWithPath:Bundle.main.path(forRecourse: "pers2go1", ofType: ",mp3")!)
        let sound = NSURL(fileURLWithPath:Bundle.main.path(forResource: "pers2go1", ofType: "mp3")!)
        do{
            go_sound = try AVAudioPlayer(contentsOf: sound as URL)
            go_sound.prepareToPlay()
            go_sound.play()
        }
        catch
        {
            print("Error")
        }
        
                            hod1.text = "Позиция первого игрока: \(kubik)"
        

        if (kubik<63){
            if (kubik2 != 63)
            {
            pers1_view()
            go.isEnabled = false
            _ = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController2.pers2go), userInfo: nil, repeats: false)
            }
            
            else {
                // персонаж 2 выиграл
                
                let alert = UIAlertController(title: "Вы проиграли!", message: "лох, епта!", preferredStyle: .alert
                )
                alert.addAction (UIAlertAction(title: "ок", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                kubik = 0
                kubik2 = 0
                pers1_view()
                pers2_view()
                pers1win = false
                hod2.text = "Позиция первого игрока: \(kubik2)"
                hod1.text = "Позиция первого игрока: \(kubik)"
                pers2win = false
            }
            
            
            
            }
        
        else {
        
             if (pers1win != true)
             {
            
                    kubik = 63
                    pers1_view()
                    pers1win = true
             }
            
             else {
                // персонаж 1 выиграл
                
              let alert = UIAlertController(title: "Вы победили!", message: "Поздравляем, епта!", preferredStyle: .alert
                )
                alert.addAction (UIAlertAction(title: "ок", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
                
                
                
                    kubik = 0
                    kubik2 = 0
                    pers1_view()
                    pers2_view()
                    pers1win = false
                    hod2.text = "Позиция первого игрока: \(kubik2)"
                    hod1.text = "Позиция первого игрока: \(kubik)"
                
               
            
            }
            
            
        }
        
    
        
    }
    
    
    @IBOutlet weak var hod1: UILabel!
    @IBOutlet weak var hod2: UILabel!
    @IBOutlet weak var go: UIButton!
    
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
            
            pers2v.image = pers2i
            pers2v.frame.size.width = 40
            pers2v.frame.size.height = 40
        UIView.animate(withDuration: 0.8, animations: {
            self.pers2v.frame.origin.x = CGFloat(self.x[kubik2])
            self.pers2v.frame.origin.y = CGFloat(self.y[kubik2])
        })
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


