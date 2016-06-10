//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Rosalyn Kingsmill on 2016-06-09.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBarView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var navigationBarHeight: NSLayoutConstraint!
    var open: Bool = false
    var imageStackView: UIStackView = UIStackView()
    @IBOutlet weak var snackTableView: UITableView!
    var foods: [String] = Array()
    var button1: UIButton = UIButton()
    let button2: UIButton = UIButton()
    let button3: UIButton = UIButton()
    let button4: UIButton = UIButton()
    let button5: UIButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imageStackView.distribution = .FillEqually
        self.imageStackView.translatesAutoresizingMaskIntoConstraints = false
        navigationBarView.addSubview(self.imageStackView)
        self.imageStackView.leadingAnchor.constraintEqualToAnchor(navigationBarView.leadingAnchor).active = true
        self.imageStackView.topAnchor.constraintEqualToAnchor(navigationBarView.topAnchor, constant: 50).active = true
        self.imageStackView.widthAnchor.constraintEqualToAnchor(navigationBarView.widthAnchor).active = true
        self.imageStackView.heightAnchor.constraintEqualToAnchor(navigationBarView.heightAnchor, constant: -50).active = true
        self.imageStackView.hidden = true
        
        self.setUpButtons()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButton(sender: AnyObject) {
        if (self.open == false) {
            self.navigationBarHeight.constant += 136
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = CGAffineTransformMakeRotation(CGFloat(M_PI_2))
                self.imageStackView.hidden = false
                }, completion: { finished in
                    print("plus icon pressed")
            })
            self.open = true
        }
            
        else {
            self.navigationBarHeight.constant -= 136
            UIView.animateWithDuration(1.0, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 5, options: [], animations: {
                self.view.layoutIfNeeded()
                self.addButton.transform = CGAffineTransformMakeRotation(CGFloat(-M_PI_2))
                self.imageStackView.hidden = true
                }, completion: { finished in
                    print("plus icon pressed")
            })
            self.open = false
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.foods.count
    }
 
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = snackTableView.dequeueReusableCellWithIdentifier("snackCell")!
        cell.textLabel!.text = self.foods[indexPath.row]
        return cell
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func setUpButtons() {
        
        self.imageStackView.addArrangedSubview(button1)
        self.imageStackView.addArrangedSubview(button2)
        self.imageStackView.addArrangedSubview(button3)
        self.imageStackView.addArrangedSubview(button4)
        self.imageStackView.addArrangedSubview(button5)
        
        button1.setBackgroundImage(UIImage(named: "oreos.png"), forState: UIControlState.Normal)
        button2.setBackgroundImage(UIImage(named: "pizza_pockets.png"), forState: UIControlState.Normal)
        button3.setBackgroundImage(UIImage(named: "pop_tarts.png"), forState: UIControlState.Normal)
        button4.setBackgroundImage(UIImage(named: "popsicle.png"), forState: UIControlState.Normal)
        button5.setBackgroundImage(UIImage(named: "ramen.png"), forState: UIControlState.Normal)
        
        button1.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button2.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button3.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button4.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
        button5.addTarget(self, action: #selector(ViewController.buttonClicked(_:)), forControlEvents: .TouchUpInside)
    }
    
    func buttonClicked(sender: UIButton) {
        if (sender === button1) {
            addFood("oreos")
        } else if sender === button2 {
            addFood("pizza pockets")
        } else if sender === button3 {
            addFood("pop tarts")
        } else if sender === button4 {
            addFood("popsicle")
        } else if sender === button5 {
            addFood("ramen")
        }
    }
    
    func addFood(food:String) {
        switch food {
        case "oreos":
            foods.append("Oreos")
        case "pizza pockets":
            foods.append("Pizza Pockets")
        case "pop tarts":
            foods.append("Pop Tarts")
        case "popsicle":
            foods.append("Popsicle")
        case "ramen":
            foods.append("Ramen")
        default:
            break;
        }
        snackTableView.reloadData()
    }
}



