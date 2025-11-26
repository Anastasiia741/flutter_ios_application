//
//  SwiftWriter.swift
//  Runner
//
//  Created by Анастасия Набатова on 26/11/25.
//

import Foundation

class SwiftWriter {
    static let shared = SwiftWriter()

    func writeAndRead(n: Int) -> String {
        let text = "hello world \(n)\n"
        let file = getFilePath()

        write_text_to_file(file, text)

        return text
    }

    private func getFilePath() -> String {
        let dir = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask
        )[0]
        return dir.appendingPathComponent("output.txt").path
    }
}
