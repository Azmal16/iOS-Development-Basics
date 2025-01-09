//
//  HostingController.swift
//  HealthKitDemo
//
//  Created by MMH on 8/1/25.
//


import WatchKit
import SwiftUI

class HostingController: WKHostingController<HeartRateView> {
    override var body: HeartRateView {
        return HeartRateView()
    }
}
