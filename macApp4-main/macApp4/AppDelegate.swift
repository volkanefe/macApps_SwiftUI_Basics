//
//  AppDelegate.swift
//  macApp4
//
//  Created by VOLKAN EFE on 14.07.2025.
//

import Cocoa
import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    var statusItem: NSStatusItem?
    var ip = "-"
    var mac = "-"
    var internetDurumu = "Kontrol ediliyor..."
    var timer: Timer?

    func applicationDidFinishLaunching(_ notification: Notification) {
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        if let button = statusItem?.button {
            button.image = NSImage(systemSymbolName: "network", accessibilityDescription: "Ağ Bilgisi")
        }

        setupMenu()
        yenile()

        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(yenile), userInfo: nil, repeats: true)
    }

    func setupMenu() {
        let menu = NSMenu()
        menu.autoenablesItems = false

        let ipItem = NSMenuItem()
        ipItem.attributedTitle = NSAttributedString(string: "IP: \(ip)", attributes: [.foregroundColor: NSColor.systemBlue])
        ipItem.isEnabled = true
        menu.addItem(ipItem)

        let macItem = NSMenuItem()
        macItem.attributedTitle = NSAttributedString(string: "MAC: \(mac)", attributes: [.foregroundColor: NSColor.systemGreen])
        macItem.isEnabled = true
        menu.addItem(macItem)

        let statusItem = NSMenuItem()
        statusItem.attributedTitle = NSAttributedString(string: "Bağlantı: \(internetDurumu)", attributes: [.foregroundColor: NSColor.systemOrange])
        statusItem.isEnabled = true
        menu.addItem(statusItem)

        menu.addItem(NSMenuItem.separator())
        menu.addItem(NSMenuItem(title: "Çıkış", action: #selector(terminate), keyEquivalent: "q"))

        self.statusItem?.menu = menu
    }

    @objc func yenile() {
        ip = IPFetcher.getLocalIPAddress() ?? "Yok"
        mac = MacAddressFetcher.getMacAddress() ?? "Yok"
        InternetChecker.check { [weak self] durum in
            DispatchQueue.main.async {
                self?.internetDurumu = durum ? "Bağlı" : "Bağlı değil"
                self?.updateMenu()
            }
        }
    }

    func updateMenu() {
        guard let menu = statusItem?.menu else { return }
        menu.item(at: 0)?.attributedTitle = NSAttributedString(string: "IP: \(ip)", attributes: [.foregroundColor: NSColor.systemIndigo, .font: NSFont.systemFont(ofSize: 13, weight: .bold)])
        menu.item(at: 1)?.attributedTitle = NSAttributedString(string: "MAC: \(mac)", attributes: [.foregroundColor: NSColor.systemBrown, .font: NSFont.systemFont(ofSize: 13, weight: .bold)])
        menu.item(at: 2)?.attributedTitle = NSAttributedString(string: "Bağlantı: \(internetDurumu)", attributes: [.foregroundColor: NSColor.systemOrange, .font: NSFont.systemFont(ofSize: 13, weight: .bold)])
    }

    @objc func terminate() {
        NSApp.terminate(nil)
    }
}
