//
//  Extensions.swift
//  NotNetflix
//
//  Created by Daniel Sanchez Torres on 14/11/23.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
