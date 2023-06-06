//
//  DateFormatter.swift
//  kpz-2023-animals-ios
//
//  Created by Rafał Kwiecień on 30/05/2023.
//

import Foundation

func formatDate(isoDate: String) -> String? {
    let isoFormatter = ISO8601DateFormatter()
    isoFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    if let date = isoFormatter.date(from: isoDate) {
        let polishFormatter = DateFormatter()
        polishFormatter.locale = Locale(identifier: "pl_PL")
        polishFormatter.dateFormat = "yyyy-MM-dd"
        return polishFormatter.string(from: date)
    }
    return nil
}
