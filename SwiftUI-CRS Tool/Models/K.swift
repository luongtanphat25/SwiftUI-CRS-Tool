//
//  Data.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-21.
//

import Foundation
import SwiftUI
struct K {
    static let LANGUAGE_TESTS = [Tests.CELPIP, Tests.IELTS, Tests.TEF, Tests.TCF]
    static let ENGLISH_TETS = [Tests.CELPIP, Tests.IELTS]
    static let FRENCH_TESTS = [Tests.TEF, Tests.TCF]
    static let MARITAL_STATUS = ["Annulled Marriage",
                                 "Common-Law",
                                 "Divorced / Separated",
                                 "Legally Separated",
                                 "Married",
                                 "Never Married / Single",
                                 "Widowed"]
    static let EDUCATION_LEVELS = ["None, or less than secondary (high school)",
                                   "Secondary diploma (high school graduation)",
                                   "One-year program at a university, college, trade or technical school, or other institute",
                                   "Two-year program at a university, college, trade or technical school, or other institute",
                                   "Bachelor's degree (three or more year program at a university, college, trade or technical school, or other institute)",
                                   "Two or more certificates, diplomas or degrees. One must be for a program of three or more years",
                                   "Master's degree, or professional degree needed to practice in a licensed profession",
                                   "Doctoral level university degree (PhD)"]
    static let STUDY_IN_CANADA_LEVELS = ["Secondary (high school) or less",
                                         "One - or two-year diploma or certificate",
                                         "Degree, diploma or certificate of three years or longer OR a Master’s, professional or doctoral degree of at least one academic year"]
    static let WORK_EXPERIENCES =  [0, 1, 2, 3, 4, 5]
    static let FOREIGN_EXPERIENCE = [0, 1, 2, 3]
    static let NOC_TYPES = ["Type O", "Type A or B", "Type C or D"]
    
    static let LightBlue = "LightBlue"
    static let LightGreen = "LightGreen"
    static let GoogleButtonColor = "GoogleButtonColor"
    static let GoogleLogo = "GoogleLogo"
    static let CornerValue: CGFloat = 10
}
