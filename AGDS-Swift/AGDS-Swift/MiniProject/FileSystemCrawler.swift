//
//  FileSystemCrawler.swift
//  AGDS-Swift
//
//  Created by Jose Hermilo Ortega Martinez on 2020-06-26.
//  Copyright © 2020 Jose Hermilo Ortega Martinez. All rights reserved.
//

import Foundation

func fileSystemCrawler(at url: URL, _ index: Int, _ tab: String, _ nFolders: inout Int, _ nFiles: inout Int) -> [Int]{
    let content = try! FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
    if index + 1 > content.count { return [nFolders, nFiles] }
    print((index + 1 == content.count) ? "\(tab[tab.index(tab.startIndex, offsetBy: 0)..<tab.index(tab.startIndex, offsetBy: tab.count - 2)])└─ \(content[index].lastPathComponent)":"\(tab) \(content[index].lastPathComponent)")
    if content[index].pathExtension != ""{ nFiles = nFiles + 1 }
    else{ nFolders = nFolders + 1 }
    if content[index].hasDirectoryPath {
        fileSystemCrawler(at: content[index].absoluteURL, 0, "\t│" + tab, &nFolders, &nFiles)
    }
    return fileSystemCrawler(at: url, index + 1, tab, &nFolders, &nFiles)
}
