//
//  SignupViewDelegateProtocol.swift
//  PraTest
//
//  Created by Toshiyana on 2022/04/23.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
