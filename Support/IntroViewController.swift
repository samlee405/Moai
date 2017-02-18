//
//  IntroViewController.swift
//  Support
//
//  Created by Nabil K on 2017-02-18.
//  Copyright © 2017 Sam Lee. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var coloredView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var addItemView: AddItemView!
    
    var warnings = [String]()
    var helpers = [String]()
    var questionType: QuestionType = .warnings
    
    var colors = [UIColor.red, UIColor.purple]

    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    
    
    @IBAction func addItemButton(_ sender: UIButton) {
        self.addItemView.addShadow(view: self.view)
        //        self.addItemView.center = CGPoint(x: self.view.center.x, y: self.view.frame.height*1.5)
        //        self.addItemView.center = self.view.center
        
        let rect = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height*0.5)
        self.addItemView.frame = rect
        self.addItemView.frame.origin = self.view.frame.origin
        
        
        self.addItemView.addItemTextView.text = "Add Items Here"
        self.addItemView.addItemTextView.textColor = UIColor.gray
        self.addItemView.addItemTextView.delegate = addItemView
        
        self.view.addSubview(self.addItemView.shadow!)
        self.view.addSubview(addItemView)
        
        
        
        let scaleUp = CGAffineTransform(scaleX: 0.1, y: 0.1)
        self.addItemView.transform = scaleUp
        self.addItemView.layer.opacity = 0
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 5, initialSpringVelocity: 2, options: [], animations: {
            self.addItemView.layer.opacity = 1
            self.addItemView.transform = CGAffineTransform.identity
        }, completion: { complete in
            self.addItemView.addItemTextView.becomeFirstResponder()
        })
        
    }
    
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if questionType == .warnings{
            questionType = .helpers
            collectionView.reloadData()
        }
        
        else {
            
            // Trigger a segue here
        }
    }
}


extension IntroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if questionType == .warnings{
            return warnings.count
        }
        
        else{
            return helpers.count
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IntroCollectionCell
        
        
        if questionType == .warnings{
            self.coloredView.backgroundColor = colors[questionType.rawValue]
            cell.imageView.image = #imageLiteral(resourceName: "exclaimation")
            cell.label.text = "Whats signs do you show ehny ou are about to binge or purge?"
        }
        
        else{
            cell.imageView.image = #imageLiteral(resourceName: "plus")
            cell.label.text = "What do you wish you could tell yourself during an episode?"
        }
        
        return cell
    }
    
    
}


extension IntroViewController: AddItemDelegate {
    func getItemsAdded(items: [String]) {
        if self.questionType == .warnings{
            for i in items{
                self.warnings.append(i)
            }
        }
        
        else{
            for i in items{
                self.helpers.append(i)
            }
        }
    }
    
    
    func dismiss(view: AddItemView){
        
        UIView.animate(withDuration: 0.3, animations:{
            
            let move = CGAffineTransform(translationX: 0, y: self.view.frame.height)
            view.transform = move
        }) { completed in
            
            
            if let shadow = view.shadow{
                shadow.removeFromSuperview()
                view.removeFromSuperview()
            }
                
            else{
                view.removeFromSuperview()
            }
            
            view.transform = CGAffineTransform.identity
            
        }
    }
}


enum QuestionType: Int{
    case warnings  = 0
    case helpers = 1
    
}
