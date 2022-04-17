//
//  SignupFormRequestModel.swift
//  PraTest
//
//  Created by Toshiyana on 2022/04/12.
//

import Foundation

struct SignupFormRequestModel: Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
