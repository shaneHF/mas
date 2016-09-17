//
//  List.swift
//  mas-cli
//
//  Created by Andrew Naylor on 21/08/2015.
//  Copyright (c) 2015 Andrew Naylor. All rights reserved.
//

struct ListCommand: CommandType {
    typealias Options = NoOptions<MASError>
    let verb = "list"
    let function = "Lists apps from the Mac App Store which are currently installed"
    
    func run(options: Options) -> Result<(), MASError> {
        let softwareMap = CKSoftwareMap.sharedSoftwareMap()
        guard let products = softwareMap.allProducts() else {
            print("No installed apps found")
            return .Success(())
        }
        for product in products {
            print("\(product.itemIdentifier) \(product.appName) (\(product.bundleVersion))")
        }
        return .Success(())
    }
}