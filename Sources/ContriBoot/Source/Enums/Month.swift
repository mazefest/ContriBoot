//
//  Month.swift
//  ContriBoot
//
//  Created by Colby Mehmen on 3/27/25.
//


enum Month: Int, CaseIterable {
    case january = 0, february, march, april, may, june, july, august, september, october, november, december

    var shortTitle: String {
        switch self {
        case .january: "Jan"
        case .february: "Feb"
        case .march: "Mar"
        case .april: "Apr"
        case .may: "May"
        case .june: "Jun"
        case .july: "Jul"
        case .august: "Aug"
        case .september: "Sep"
        case .october: "Oct"
        case .november: "Nov"
        case .december: "Dec"
        }
    }
}