//
//  ViewController.swift
//  sampleAnimation
//
//  Created by Umesh on 24/01/17.
//  Copyright © 2017 Umesh. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    @IBOutlet weak var topTableConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        
        self.view.backgroundColor = UIColor .red
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action:#selector(searchClicked))
        
        searchBar.isHidden = true
        
        self.setUI()
        
     //   NotificationCenter.default.addObserver(self, selector: #selector(rotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func searchClicked()  {
        print("searchClicked")
        
        searchBar.isHidden = !searchBar.isHidden
        
        setUI()
    }
    
    
    
    func setUI()  {

        if !self.searchBar.isHidden
        {
            print("Hidden = FALSE self.searchBar.frame.size.height = %d",self.searchBar.frame.size.height)
        //  self.tableView.frame.origin.y = self.tableView.frame.origin.y+self.searchBar.frame.size.height
           
        //let verticalConstraintView = tableView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant:0)
        //  verticalConstraintView.isActive = true
            
            topTableConstraint.constant = self.searchBar.frame.size.height
            
        }
        else{
            print("Hidden = TRUE self.searchBar.frame.size.height = %d",self.searchBar.frame.size.height)
            
            topTableConstraint.constant = -self.searchBar.frame.size.height

            /*
            if topTableConstraint.constant<(self.navigationController?.navigationBar.frame.size.height)!
            {
                 topTableConstraint.constant = 0
            }
            else
            {
                topTableConstraint.constant = (self.navigationController?.navigationBar.frame.size.height)!
            }
            */
            
            
            topTableConstraint.constant = topTableConstraint.constant<(self.navigationController?.navigationBar.frame.size.height)! ? 0 : (self.navigationController?.navigationBar.frame.size.height)!
            
        }
        
        self.view.setNeedsLayout()
    }
    
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: nil, completion: {
            _ in
           // self.collectionView.collectionViewLayout.invalidateLayout()
            
//            if !self.searchBar.isHidden
//            {
//                self.tableView.frame.origin.y = self.tableView.frame.origin.y+self.searchBar.frame.size.height
//            }
//            
           self.setUI()
            
        })
    }
    
    
    
    
    
    
    
    
    /*
    func rotated() {
        if UIDeviceOrientationIsLandscape(UIDevice.current.orientation) {
            
            print("Landscape")
            
            tableView.frame.origin.y = tableView.frame.origin.y+searchBar.frame.size.height

            
        }
        
        if UIDeviceOrientationIsPortrait(UIDevice.current.orientation) {
            print("Portrait")
        }
        
    }
    
    */
    
    
    //MARK:- Table View DatatSource and Delegate Methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cellIdentifier = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        cell.textLabel?.text = "AAA"
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    let thirdViewController = self.storyboard?.instantiateViewController(withIdentifier: "ThirdVC_SID")
        self.navigationController?.pushViewController(thirdViewController!, animated: true)
    }
    
    
    
}

