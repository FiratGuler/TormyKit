//
//  TormyUIkit.swift
//  Wordy
//
//  Created by Fırat Güler on 7.09.2025.
//

import UIKit

@MainActor
public final class TormyUIKitCore {
    
    static let shared = TormyUIKitCore()
    
    private init() {}
    
    // MARK: - Logs
    public static func log(_ message: String,
                           file: String = #file,
                           function: String = #function,
                           line: Int = #line) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("🐞🐞🐞 TORMYKIT  [\(fileName):\(line)] func: \(function) \n\(message) ")
#endif
    }
    
    public static func errorLog(_ message: String,
                                file: String = #file,
                                function: String = #function,
                                line: Int = #line) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("🆘‼️🆘 TORMYKIT [\(fileName):\(line)] func: \(function) \n\(message)")
#endif
    }
    
    public static func successLog(_ message: String,
                                file: String = #file,
                                function: String = #function,
                                line: Int = #line) {
#if DEBUG
        let fileName = (file as NSString).lastPathComponent
        print("✅✅✅ TORMYKIT [\(fileName):\(line)] func: \(function) \n\(message)")
#endif
    }
    
    
    // MARK: - Localized
    
    public static func localized(_ key: String) -> String {
        return NSLocalizedString(key, bundle: .main, comment: "")
    }

    
    // MARK: - Image
    
    public static func safeImage(_ name: String,
                                 file: String = #file,
                                 function: String = #function,
                                 line: Int = #line) -> UIImage {
    #if DEBUG
        if let image = UIImage(named: name) ?? UIImage(systemName: "applelogo") {
            return image
        } else {
            errorLog("Görsel Bulunamadı: \(name)", file: file, function: function, line: line)
            return UIImage()
        }
    #else
        return UIImage(named: name) ?? UIImage()
    #endif
    }
}

