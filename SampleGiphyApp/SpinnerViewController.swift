

import UIKit
import Foundation

fileprivate let overlayViewTag = 999
fileprivate let activityIndicatorTag = 1000

class SpinnerViewController: UIViewController {
    var spinner = UIActivityIndicatorView(style: .large)

//    override func loadView() {
//        view = UIView()
//        view.backgroundColor = UIColor(white: 0, alpha: 0.7)
//
//        spinner.translatesAutoresizingMaskIntoConstraints = false
//        spinner.startAnimating()
//        view.addSubview(spinner)
//
//        spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//    }
 
    public func displayActivityIndicator(shouldDisplay: Bool) -> Void {
           if shouldDisplay {
               setActivityIndicator()
           } else {
               removeActivityIndicator()
           }
       }
    
    public func setActivityIndicator() -> Void {
//          guard let parentViewForOverlay = navigationController?.view ?? view else { return }
//view = UIView()
view.backgroundColor = UIColor(white: 0, alpha: 0.7)

spinner.translatesAutoresizingMaskIntoConstraints = false
spinner.startAnimating()
view.addSubview(spinner)

spinner.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
spinner.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//          //configure overlay
//          let overlay = UIView()
//          overlay.translatesAutoresizingMaskIntoConstraints = false
//          overlay.backgroundColor = UIColor(white: 0, alpha: 0.7)
////            UIColor.black
//          overlay.alpha = 0.5
//          overlay.tag = overlayViewTag

          //configure activity indicator
//          let activityIndicator = UIActivityIndicatorView(style: .large)
//          activityIndicator.translatesAutoresizingMaskIntoConstraints = false
//          activityIndicator.tag = activityIndicatorTag

          //add subviews
//          overlay.addSubview(activityIndicator)
//          parentViewForOverlay.addSubview(overlay)

          //add overlay constraints
//          overlay.heightAnchor.constraint(equalTo: parentViewForOverlay.heightAnchor).isActive = true
//          overlay.widthAnchor.constraint(equalTo: parentViewForOverlay.widthAnchor).isActive = true
//
//          //add indicator constraints
//          activityIndicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
//          activityIndicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true

          //animate indicator
//          activityIndicator.startAnimating()
      }
//
    public func removeActivityIndicator() -> Void {

            UIView.animate(withDuration: 0.2, animations: {
                self.spinner.stopAnimating()
            }) { (finished) in
                self.spinner.removeFromSuperview()
            }
    }
//

//
  
//
//    public func getOverlayView() -> UIView? {
//        return navigationController?.view.viewWithTag(overlayViewTag) ?? view.viewWithTag(overlayViewTag)
//    }
}

