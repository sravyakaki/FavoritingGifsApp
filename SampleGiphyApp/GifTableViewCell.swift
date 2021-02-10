//
//  GifTableViewCell.swift
//  SampleGiphyApp
//
//  Created by Sravya Kaki on 11/27/20.
//  Copyright © 2020 Sravya Kaki. All rights reserved.
//

import UIKit
class GifTableViewCell: UITableViewCell {
    
        /// Gif to be displayed.
    var gif: Gif?
    /// ImageView to contain our gif.
    var gifView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFit
        return v
    }()
    
    var viewControllerObject: ViewController?
    let favoriteButton = UIButton(type: .custom)

    override func layoutSubviews() {
        super.layoutSubviews()
        // Make sure cell has a gif object
        if gif != nil {
            // Grab gif from gif object and display it inside the imageview
            let gifURL = gif!.getGifURL()
            gifView.image = UIImage.gif(url: gifURL)
            gifView.frame = CGRect(x: 0, y: 0, width: bounds.width - 90, height: bounds.height)
            addSubview(gifView)
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
        favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .selected)
        favoriteButton.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        favoriteButton.tintColor = .red
        favoriteButton.addTarget(self, action: #selector(handleFavoriteBtnClick), for: .touchUpInside)
        accessoryView = favoriteButton
        backgroundColor = .lightGray
    }
    
    @objc private func handleFavoriteBtnClick() {
        print("Button clicked")
        viewControllerObject?.favoriteButtonTappedCell(cell: self)
        favoriteButton.isSelected.toggle()
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
