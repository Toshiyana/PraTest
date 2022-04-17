//
//  SignupWebServiceProtocol.swift
//  PraTest
//
//  Created by Toshiyana on 2022/04/12.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void)
}
