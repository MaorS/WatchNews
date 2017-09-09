//
//  Utils.swift
//  WatchTest
//
//  Created by Maor Shams on 09/09/2017.
//  Copyright © 2017 Maor Shamsian. All rights reserved.
//

import WatchKit
import UIKit

public extension WKInterfaceImage {
    
    /// Animates `imageNamed` animation sequence in `animationRange` for `duration` until stops.
    /// Renders default system activity indicator if no parameter given.
    public func startActivityIndicator(
        imageNamed imageName: String = "Activity",
        animationRange: NSRange = NSMakeRange(0, 30),
        duration: TimeInterval = 1) {
        setImageNamed(imageName)
        startAnimatingWithImages(in: animationRange, duration: duration, repeatCount: 0)
    }
    
    /// Stops activity indication animation.
    public func stopActivityIndicator() {
        stopAnimating()
        setImage(nil)
    }
}

// MARK: - WKInterfaceGroup Extension
public extension WKInterfaceGroup {
    
    /// Animates `imageNamed` animation sequence in `animationRange` for `duration` until stops.
    /// Renders default system activity indicator if no parameter given.
    public func startActivityIndicator(
        imageNamed imageName: String = "Activity",
        animationRange: NSRange = NSMakeRange(0, 30),
        duration: TimeInterval = 1) {
        setBackgroundImageNamed(imageName)
        startAnimatingWithImages(in: animationRange, duration: duration, repeatCount: 0)
    }
    
    /// Stops activity indication animation.
    public func stopActivityIndicator() {
        stopAnimating()
        setBackgroundImage(nil)
    }
}
