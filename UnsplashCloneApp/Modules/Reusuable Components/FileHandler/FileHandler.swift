//
//  FileHandler.swift
//  UnsplashCloneApp
//
//  Created by Yoonha Kim on 5/14/21.
//

import UIKit

class FileHandler {
    
    static let manager = FileHandler()
    
    let useFileHandler = FileManager.default
    
    private init() {}
    
    func downloadFile(url: URL, completion: @escaping (String) -> Void) {
        print("Start Download File")
        let task = URLSession.shared.downloadTask(with: url) { urlResponse, _, error in
            guard let originalUrl = urlResponse else { return }
    
            do {
                let path = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                let filePath = path.appendingPathComponent("myImage")
                try FileManager.default.moveItem(at: originalUrl, to: filePath)
                print(filePath)
                completion("File is File is completed")
            } catch { print(error.localizedDescription);  return }
        }
        task.resume()
    }
    
    // Get path
    func getPath() -> URL {
        guard let url = useFileHandler.urls(for: .documentDirectory, in: .userDomainMask).first else { fatalError("Failed to get path") }
        let newFolderUrl = url.appendingPathComponent("Test Folder")
        return newFolderUrl
    }
    
    // Copy file
    func createLogsFile() {
        let fileURLProject = Bundle.main.path(forResource: "logs", ofType: "txt")
        let folderUrl = getPath()
        let fileUrl = folderUrl.appendingPathComponent("logs.txt")
        print(fileUrl.absoluteString)
        do {
            try useFileHandler.copyItem(atPath: fileURLProject ?? "", toPath: fileUrl.path)
        } catch {
            print(error)
        }
    }
    
    // Write file with for text
    func writeFile(fileName: String, fileType: String, text: String) {
        let fileNameWithPath: String = "\(fileName).\(fileType)"
        let filePath = getPath()
        let fileUrl = filePath.appendingPathComponent(fileNameWithPath)
        if useFileHandler.fileExists(atPath: fileUrl.path) {
            do {
                guard let fileContents = useFileHandler.contents(atPath: fileUrl.path) else { return }
                let fileContentsAsString = String(bytes: fileContents, encoding: .utf8)
                let fullText = "\(String(describing: fileContentsAsString) ):\(text)"
                guard let data = fullText.data(using: .utf8) else { return }
                try data.write(to: fileUrl)
            } catch {
                print(error)
            }
        } else {
            print("File is not existed")
        }
    }
    
    // Remove items
    func removeFile(fileName: String, fileType: String) {
        let fileNameWithPath: String = "\(fileName).\(fileType)"
        let filePath = getPath()
        let fileUrl = filePath.appendingPathComponent(fileNameWithPath)
        if useFileHandler.fileExists(atPath: fileUrl.path) {
            do {
                try useFileHandler.removeItem(at: fileUrl)
            } catch {
                print(error)
            }
        } else {
            print("File is not existed")
        }
    }
    
    // Read File
    func readFile(filename: String, type: String) -> String {
        let fileURLProject = Bundle.main.path(forResource: filename, ofType: type)
        guard let fileContents = useFileHandler.contents(atPath: fileURLProject ?? "") else { return "" }
        let fileContentsAsString = String(bytes: fileContents, encoding: .utf8)
        print(fileContents)
        return fileContentsAsString ?? ""
    }
}
