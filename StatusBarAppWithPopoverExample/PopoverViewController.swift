//
//  PopoverViewController.swift
//  StatusBarAppWithPopoverExample
//
//  Created by raymond on 2021/1/22.
//

import Foundation
import Cocoa

class PopoverViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func showMainVc(_ sender: NSButton) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "MainViewControllerID")) as? MainViewController
        else { return }
        
        guard let appDelegate = NSApplication.shared.delegate as? AppDelegate, let pop = appDelegate.popover else { return }
        
        
        let window = NSWindow(contentViewController: vc)
        window.makeKeyAndOrderFront(sender)
        window.level = .floating
        window.title = "Main View Controller"
        var centerX : CGFloat = 0.0
        var centerY : CGFloat = 0.0
        let width : CGFloat = 534.0
        let height : CGFloat = 319.0
            
        if let screen = window.screen {
            centerX = screen.frame.midX - width / 2.0
            centerY = screen.frame.midY - height / 2.0
        }
        window.setFrame(CGRect.init(x: centerX, y: centerY, width: width, height: height), display:true)
        pop.close()
    }
}
