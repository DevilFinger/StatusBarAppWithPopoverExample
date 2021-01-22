//
//  AppDelegate.swift
//  StatusBarAppWithPopoverExample
//
//  Created by raymond on 2021/1/22.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    
    var statusItem: NSStatusItem?
     
    var popover: NSPopover?
     
    var popoverVC: PopoverViewController?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        statusItem?.button?.title = "StatusBarAppWithPopoverExample"
             
        let itemImage = NSImage(named: "SplitScreen")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        statusItem?.button?.target = self
        statusItem?.button?.action = #selector(showPopoverVC)
        
        
        popover = NSPopover()
        popover?.behavior = .transient
    }
    
    
    @objc func showPopoverVC(){
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "PopoverViewControllerID")) as? PopoverViewController
        else { return }
        
        popoverVC = vc
        
        if let pop = popover, let button = statusItem?.button{
            pop.contentViewController = popoverVC
            popover?.show(relativeTo: button.bounds, of: button, preferredEdge: .minY)
        }
        
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

