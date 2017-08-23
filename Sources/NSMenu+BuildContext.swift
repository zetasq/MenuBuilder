//
//  NSMenu+BuildContext.swift
//  MenuBuilder
//
//  Created by Zhu Shengqi on 26/05/2017.
//  Copyright © 2017 zetasq. All rights reserved.
//

import AppKit

extension NSMenu {
  public func withBuildContext(_ body: (_ context: BuildContext) -> Void) -> NSMenu {
    let buildContext = BuildContext(menu: self)
    
    body(buildContext)
    
    return self
  }
  
  public struct BuildContext {
    private let menu: NSMenu
    
    init(menu: NSMenu) {
      self.menu = menu
    }
    
    public func addSeparator() {
      let separatorItem = NSMenuItem.separator()
      menu.addItem(separatorItem)
    }
    
    @discardableResult
    public func addSubmenu(title: String, _ body: (_ context: BuildContext) -> Void) -> NSMenuItem {
      let menuItem = NSMenuItem(title: title, action: nil, keyEquivalent: "")
      menu.addItem(menuItem)
      
      let submenu = NSMenu(title: title)
      menuItem.submenu = submenu
      
      let subcontext = BuildContext(menu: submenu)
      body(subcontext)
      
      return menuItem
    }
    
    @discardableResult
    public func addItem(title: String, action: Selector, baseKey: Character? = nil, keyModifiers: NSEventModifierFlags = []) -> NSMenuItem {
      let menuItem = NSMenuItem(title: title, action: action, baseKey: baseKey, keyModifiers: keyModifiers)
      
      menu.addItem(menuItem)
      
      return menuItem
    }
  }
}
