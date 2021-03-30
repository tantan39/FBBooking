//
//  Logging.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import CocoaLumberjack

private let fileLogger: DDFileLogger = DDFileLogger()

open class Logging {
    
    public static func setupLogger() {
    
        DDLog.add(DDTTYLogger.sharedInstance as! DDLogger) // TTY = Xcode console
        fileLogger.rollingFrequency = TimeInterval(60*60*24)  // 24 hours
        fileLogger.logFileManager.maximumNumberOfLogFiles = 7
        DDLog.add(fileLogger)
        
        #if PROD
        
        #else
        
        #endif
    }
}

public func loggerAllLogFiles() -> [String] {
    return fileLogger.logFileManager.sortedLogFilePaths
}

public func logDebug(_ message: @autoclosure () -> String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: UInt = #line, userInfo: [String: Any] = [:]) {
    DDLogDebug(message as! Any, file: fileName, function: functionName, line: lineNumber)
}
public func logVerbose(_ message: @autoclosure () -> String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: UInt = #line, userInfo: [String: Any] = [:]) {
    DDLogVerbose(message as! Any, file: fileName, function: functionName, line: lineNumber)
}
public func logInfo(_ message: @autoclosure () -> String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: UInt = #line, userInfo: [String: Any] = [:]) {
    DDLogInfo(message as! Any, file: fileName, function: functionName, line: lineNumber)
}
public func logWarn(_ message: @autoclosure () -> String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: UInt = #line, userInfo: [String: Any] = [:]) {
    DDLogWarn(message as! Any, file: fileName, function: functionName, line: lineNumber)
}
public func logError(_ message: @autoclosure () -> String, functionName: StaticString = #function, fileName: StaticString = #file, lineNumber: UInt = #line, userInfo: [String: Any] = [:]) {
    DDLogError(message as! Any, file: fileName, function: functionName, line: lineNumber)
}
public func safelyFatalError(_ message: String) {
    #if DEBUG
        fatalError(message)
    #else
        // Never do it in prod environment
    #endif
}
