//
//  ViewController.swift
//  InspetorIntegration
//
//  Created by Inspetor on 16/07/19.
//  Copyright © 2019 Inspetor. All rights reserved.
//

import UIKit
import Inspetor
import CoreLocation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK: Properties
    @IBOutlet weak var pickerView: UIPickerView!
    let inspetor = Inspetor.sharedInstance
    let manager = CLLocationManager()
    let trackingActions = [
        "TrackLogin",
        "TrackLogout",
        "TrackAccountCreation",
        "TrackAccountUpdate",
        "TrackAccountDeletion",
        "TrackPassRecovery",
        "TrackPassReset",
        "TrackEventCreation",
        "TrackEventUpdate",
        "TrackEventDeletion",
        "TrackTransferCreation",
        "TrackTransferUpdate",
        "TrackSaleCreation",
        "TrackSaleUpdate"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        print(self.trackingActions.count)
        if CLLocationManager.locationServicesEnabled() {
            if (CLLocationManager.authorizationStatus() != .authorizedAlways || CLLocationManager.authorizationStatus() != .authorizedWhenInUse) {
                manager.requestWhenInUseAuthorization()
            }
        }
    }
    
    //MARK: Helper Functions
    private func runTrackingFunction(action: String) {
        switch action {
        case "TrackLogin":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackLogin(accountId: "123")
            }
        case "TrackLogout":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackLogout(accountId: "123")
            }
        case "TrackAccountCreation":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackAccountCreation(accountId: "123")
            }
        case "TrackAccountUpdate":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackAccountUpdate(accountId: "123")
            }
        case "TrackAccountDeletion":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackAccountDeletion(accountId: "123")
            }
        case "TrackPassRecovery":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackPasswordRecovery(accountEmail: "pass_recovery@email.com")
            }
        case "TrackPassReset":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackPasswordReset(accountEmail: "pass_recovery@email.com")
            }
        case "TrackEventCreation":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackEventCreation(eventId: "123")
            }
        case "TrackEventUpdate":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackEventUpdate(eventId: "123")
            }
        case "TrackEventDeletion":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackEventDeletion(eventId: "123")
            }
        case "TrackTransferCreation":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackItemTransferCreation(transferId: "123")
            }
        case "TrackTransferUpdate":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackItemTransferUpdate(transferId: "123")
            }
        case "TrackSaleCreation":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackSaleCreation(saleId: "123")
            }
        case "TrackSaleUpdate":
            if (Inspetor.isConfigured()) {
                try! self.inspetor.trackSaleUpdate(saleId: "123")
            }
        default:
            print("ERROR")
        }
    }
    
    //MARK: Actions
    @IBAction func trackAction(_ sender: UIButton) {
        
        let action = self.trackingActions[self.pickerView.selectedRow(inComponent: 0)]
        self.runTrackingFunction(action: action)
        
    }
    
    @IBAction func trackAllActions(_ sender: UIButton) {
        for action in self.trackingActions {
            self.runTrackingFunction(action: action)
        }
    }
    
    //MARK: UIPickerViewDataSource
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.trackingActions.count
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.trackingActions[row]
    }
}

