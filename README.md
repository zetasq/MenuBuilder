# MenuBuilder
A simple DSL for NSMenu and NSMenuItem.

[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

## Installation
### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate MenuBuilder into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "zetasq/MenuBuilder"
```

Run `carthage update` to build the framework and drag the built `MenuBuilder.framework` into your Xcode project.

## Usage

### Setup a NSMenu's items

```swift
// Create an NSMenu and open a context to create items
let rootMenu = NSMenu().withBuildContext { context in
  // Create a submenu in the current context
  context.addSubmenu(title: "Test") { context in
    // Add "About Test" menuitem in the current submenu context
    context.addItem(title: "About Test", action: #selector(NSApplication.orderFrontStandardAboutPanel(_:)))

    // Add a separator menuitem
    context.addSeparator()

    // Add several other items
    context.addItem(title: "Hide Test", action: #selector(NSApplication.hide(_:)), baseKey: "h", keyModifiers: [.command])
    context.addItem(title: "Hide Others", action: #selector(NSApplication.hideOtherApplications(_:)), baseKey: "h", keyModifiers: [.option, .command])
    context.addItem(title: "Show All", action: #selector(NSApplication.unhideAllApplications(_:)))
    context.addItem(title: "Quit Test", action: #selector(NSApplication.terminate(_:)), baseKey: "q", keyModifiers: .command)
  }
}

// Assign the rootMenu to the application's mainMenu
NSApplication.shared().mainMenu = rootMenu
```
