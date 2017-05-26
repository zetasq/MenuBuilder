//
//  NSMenuItem+Init.swift
//  MenuBuilder
//
//  Created by Zhu Shengqi on 26/05/2017.
//  Copyright © 2017 zetasq. All rights reserved.
//

import AppKit

extension NSMenuItem {
  convenience init(title: String, action: Selector, baseKey: Character? = nil, keyModifiers: NSEventModifierFlags = []) {
    self.init(title: title, action: action, keyEquivalent: baseKey?.toString() ?? "")
    
    self.keyEquivalentModifierMask = keyModifiers
  }
}
