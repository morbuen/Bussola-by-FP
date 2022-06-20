//
//  Markers.swift
//  Bussola by FP
//
//  Created by Francesco Puzone on 20/06/22.
//

import Foundation
import SwiftUI

struct Marker: Hashable {
    let degrees: Double
    let label: String
    
    init(degrees: Double, label: String = "") {
        self.degrees = degrees
        self.label = label
    }
    
    func degreeText() -> String {
        if self.degrees == 0.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 30.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 60.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 60.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 90.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 120.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 150.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 180.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 210.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 240.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 270.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 300.0 {
            return String(format: "%.0f", self.degrees)
        } else if self.degrees == 330.0 {
            return String(format: "%.0f", self.degrees)
        } else {
            return String("")
        }
    }
    
    static func markers() -> [Marker] {
        return [
            Marker(degrees: 2),
            Marker(degrees: 4),
            Marker(degrees: 6),
            Marker(degrees: 8),
            Marker(degrees: 10),
            Marker(degrees: 12),
            Marker(degrees: 14),
            Marker(degrees: 16),
            Marker(degrees: 18),
            Marker(degrees: 20),
            Marker(degrees: 22),
            Marker(degrees: 24),
            Marker(degrees: 26),
            Marker(degrees: 28),
            Marker(degrees: 32),
            Marker(degrees: 34),
            Marker(degrees: 36),
            Marker(degrees: 38),
            Marker(degrees: 40),
            Marker(degrees: 42),
            Marker(degrees: 44),
            Marker(degrees: 46),
            Marker(degrees: 48),
            Marker(degrees: 50),
            Marker(degrees: 52),
            Marker(degrees: 54),
            Marker(degrees: 56),
            Marker(degrees: 58),
            Marker(degrees: 62),
            Marker(degrees: 64),
            Marker(degrees: 66),
            Marker(degrees: 68),
            Marker(degrees: 70),
            Marker(degrees: 72),
            Marker(degrees: 74),
            Marker(degrees: 76),
            Marker(degrees: 78),
            Marker(degrees: 80),
            Marker(degrees: 82),
            Marker(degrees: 84),
            Marker(degrees: 86),
            Marker(degrees: 88),
            Marker(degrees: 92),
            Marker(degrees: 94),
            Marker(degrees: 96),
            Marker(degrees: 98),
            Marker(degrees: 100),
            Marker(degrees: 102),
            Marker(degrees: 104),
            Marker(degrees: 106),
            Marker(degrees: 108),
            Marker(degrees: 110),
            Marker(degrees: 112),
            Marker(degrees: 114),
            Marker(degrees: 116),
            Marker(degrees: 118),
            Marker(degrees: 122),
            Marker(degrees: 124),
            Marker(degrees: 126),
            Marker(degrees: 128),
            Marker(degrees: 130),
            Marker(degrees: 132),
            Marker(degrees: 134),
            Marker(degrees: 136),
            Marker(degrees: 138),
            Marker(degrees: 140),
            Marker(degrees: 142),
            Marker(degrees: 144),
            Marker(degrees: 146),
            Marker(degrees: 148),
            Marker(degrees: 152),
            Marker(degrees: 154),
            Marker(degrees: 156),
            Marker(degrees: 158),
            Marker(degrees: 160),
            Marker(degrees: 162),
            Marker(degrees: 164),
            Marker(degrees: 166),
            Marker(degrees: 168),
            Marker(degrees: 170),
            Marker(degrees: 172),
            Marker(degrees: 174),
            Marker(degrees: 176),
            Marker(degrees: 178),
            Marker(degrees: 182),
            Marker(degrees: 184),
            Marker(degrees: 186),
            Marker(degrees: 188),
            Marker(degrees: 190),
            Marker(degrees: 192),
            Marker(degrees: 194),
            Marker(degrees: 196),
            Marker(degrees: 198),
            Marker(degrees: 200),
            Marker(degrees: 202),
            Marker(degrees: 204),
            Marker(degrees: 206),
            Marker(degrees: 208),
            Marker(degrees: 212),
            Marker(degrees: 214),
            Marker(degrees: 216),
            Marker(degrees: 218),
            Marker(degrees: 220),
            Marker(degrees: 222),
            Marker(degrees: 224),
            Marker(degrees: 226),
            Marker(degrees: 228),
            Marker(degrees: 230),
            Marker(degrees: 232),
            Marker(degrees: 234),
            Marker(degrees: 236),
            Marker(degrees: 238),
            Marker(degrees: 242),
            Marker(degrees: 244),
            Marker(degrees: 246),
            Marker(degrees: 248),
            Marker(degrees: 250),
            Marker(degrees: 252),
            Marker(degrees: 254),
            Marker(degrees: 256),
            Marker(degrees: 258),
            Marker(degrees: 260),
            Marker(degrees: 262),
            Marker(degrees: 264),
            Marker(degrees: 266),
            Marker(degrees: 268),
            Marker(degrees: 272),
            Marker(degrees: 274),
            Marker(degrees: 276),
            Marker(degrees: 278),
            Marker(degrees: 280),
            Marker(degrees: 282),
            Marker(degrees: 284),
            Marker(degrees: 286),
            Marker(degrees: 288),
            Marker(degrees: 290),
            Marker(degrees: 292),
            Marker(degrees: 294),
            Marker(degrees: 296),
            Marker(degrees: 298),
            Marker(degrees: 302),
            Marker(degrees: 304),
            Marker(degrees: 306),
            Marker(degrees: 308),
            Marker(degrees: 310),
            Marker(degrees: 312),
            Marker(degrees: 314),
            Marker(degrees: 316),
            Marker(degrees: 318),
            Marker(degrees: 320),
            Marker(degrees: 322),
            Marker(degrees: 324),
            Marker(degrees: 326),
            Marker(degrees: 328),
            Marker(degrees: 332),
            Marker(degrees: 334),
            Marker(degrees: 336),
            Marker(degrees: 338),
            Marker(degrees: 340),
            Marker(degrees: 342),
            Marker(degrees: 344),
            Marker(degrees: 346),
            Marker(degrees: 348),
            Marker(degrees: 350),
            Marker(degrees: 352),
            Marker(degrees: 354),
            Marker(degrees: 356),
            Marker(degrees: 358),
        ]
    }
    static func markers2() -> [Marker] {
        return [
            Marker(degrees: 0, label: "N"),
            Marker(degrees: 30),
            Marker(degrees: 60),
            Marker(degrees: 90, label: "E"),
            Marker(degrees: 120),
            Marker(degrees: 150),
            Marker(degrees: 180, label: "S"),
            Marker(degrees: 210),
            Marker(degrees: 240),
            Marker(degrees: 270, label: "W"),
            Marker(degrees: 300),
            Marker(degrees: 330),
        ]
    }
}
