//
//  Protocols.swift
//  signInAndSignOut_feature
//
//  Created by SID on 22/08/2024.
//

import Foundation
protocol DataSendingProtocol {
    func sendDataToDashboard(userName: String, password: String)
}

protocol PackagesDelegates {
    func didEdit(for indexpath:IndexPath?)
    func didDelete(for indexpath:IndexPath?)
}

protocol bindingDataDelegate {
    func didSetDelegates(_ delegate: PackagesDelegates, with indexpath:IndexPath?)
}
