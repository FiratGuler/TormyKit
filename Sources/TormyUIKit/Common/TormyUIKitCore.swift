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

    public enum LogType { case debug, error, success }
    
    public static func log(_ message: String,
                           type: LogType = .debug,
                           file: String = #file,
                           function: String = #function,
                           line: Int = #line,
                           showMeta: Bool = false) {
    #if DEBUG
        let fileName = (file as NSString).lastPathComponent
        
        let emoji: String = {
            switch type {
            case .debug: return "🐞🐞🐞"
            case .error: return "🆘‼️🆘"
            case .success: return "✅✅✅"
            }
        }()
        
        if showMeta {
            print("""
            \(emoji) TORMYKIT ─────────────────────────────
            ├─ File: \(fileName):\(line)
            ├─ Func: \(function)
            ├─ Message: \(message)
            └─────────────────────────────────────────────
            """)
        } else {
            print("""
            \(emoji) TORMYKIT ─────────────────────────────
            ├─ \(message)
            └─────────────────────────────────────────────
            """)
        }
    #endif
    }
    
    // MARK: - Localized

    public static func localized(_ key: String,
                                 file: String = #file,
                                 function: String = #function,
                                 line: Int = #line) -> String {
        let localized = NSLocalizedString(key, bundle: .main, comment: "")
        
#if DEBUG
        if localized == key {
            TormyUIKitCore.log("Local key bulunamadı: \(key)", type: .error, file: file, function: function, line: line ,showMeta: true)
        }
#endif
        return localized
    }

    
    // MARK: - Image
    
    public static func safeImage(_ name: String,
                                 file: String = #file,
                                 function: String = #function,
                                 line: Int = #line) -> UIImage {
    #if DEBUG
        if let image = UIImage(named: name) {
            return image
        } else {
            UIImage(systemName: "applelogo")
            TormyUIKitCore.log("Görsel Bulunamadı: \(name)", type: .error, file: file, function: function, line: line ,showMeta: true)
            return UIImage()
        }
    #else
        return UIImage(named: name) ?? UIImage()
    #endif
    }
}

