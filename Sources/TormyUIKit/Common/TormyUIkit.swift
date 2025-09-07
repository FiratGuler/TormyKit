//
//  TormyUIkit.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

@MainActor
final class TormyUIKit {
    
    static let shared = TormyUIKit()
    
    private init() {}
    
    var bundle: Bundle = .main
    
    // MARK: - Log
    static func log(_ message: String,
                           file: String = #file,
                           function: String = #function,
                           line: Int = #line) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("🐞 [\(fileName):\(line)] func: \(function) ")
        print("\(message)")
#endif
    }
    
    // MARK: - Localized
    
    public func localized(_ key: String) -> String {
        return NSLocalizedString(key, bundle: bundle, comment: "")
    }

    
    // MARK: - Image
    
    static func safeImage(_ name: String) -> UIImage {
#if DEBUG
        return UIImage(named: name) ?? UIImage(systemName: "applelogo") ?? UIImage()
#else
        return UIImage(named: name) ?? UIImage()
#endif
    }
}
