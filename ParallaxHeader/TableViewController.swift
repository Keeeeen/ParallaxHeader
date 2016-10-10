//
//  TableViewController.swift
//  ParallaxHeader
//
//  Created by K.Kawakami on 2016/10/10.
//  Copyright © 2016年 川上健太郎. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var headerView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.contentInset.top = 200
        
        headerView =  UIImageView(frame: CGRect(x: 0, y: -200, width: view.frame.width, height: 200))
        headerView?.backgroundColor = UIColor.green
        headerView?.image = UIImage(named: "leaf_drop_dew_surface_90302_2560x1600")
        tableView.addSubview(headerView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "1"

        return cell
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollY = scrollView.contentOffset.y
        guard let header = headerView else {
            return
        }
        if scrollY < -200 {
            let scaleRatio: CGFloat = -(scrollY) / header.bounds.height
            header.transform = CGAffineTransform(scaleX: scaleRatio, y: scaleRatio)
            header.frame.origin.y = scrollY
        } else if scrollY > -64 {
            header.frame = CGRect(x: 0, y: scrollView.contentOffset.y - 136, width: view.frame.width, height: 200)
        } else {
            header.frame = CGRect(x: 0, y: -200, width: view.frame.width, height: 200)
        }
    }
}
