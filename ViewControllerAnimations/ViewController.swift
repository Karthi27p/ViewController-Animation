//
//  ViewController.swift
//  ViewControllerAnimations
//
//  Created by Karthi on 20/07/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    var contentArray = ["One", "Two", "three", "Four", "Five"]
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return contentArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            contentArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        cell?.textLabel?.text = contentArray[indexPath.row]
        return cell!
    }
    
    let customAnimationViewController = CustomPresentAnimationController()
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "Present")
        {
            let toViewController = segue.destination as UIViewController
            toViewController.transitioningDelegate = self
        }
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
    return customAnimationViewController as UIViewControllerAnimatedTransitioning
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return customAnimationViewController as UIViewControllerAnimatedTransitioning
    }
    let customNavigationViewController = CustomNavigationController()
    let customInteractionViewController = CustomInteractionController()
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        if operation == .push
        {
            customInteractionViewController.attachToViewController(viewController: toVC)
        }
        customNavigationViewController.reverse = (operation == .pop)
        return customNavigationViewController as UIViewControllerAnimatedTransitioning
    }
    func navigationController(_ navigationController: UINavigationController, interactionControllerFor animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return customInteractionViewController.transitionInProgress ? customInteractionViewController : nil
    }
}

