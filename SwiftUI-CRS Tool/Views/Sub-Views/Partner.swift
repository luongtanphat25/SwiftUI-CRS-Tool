//
//  PartnerEducation.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-20.
//

import SwiftUI

struct Partner: View {
    @EnvironmentObject var score: Score
    
    var speakings: [String] { get { K.LANGUAGE_TESTS[score.partnerTestResult.selectedTest].speaking } }
    var listenings: [String] { get { K.LANGUAGE_TESTS[score.partnerTestResult.selectedTest].listening } }
    var readings: [String] { get { K.LANGUAGE_TESTS[score.partnerTestResult.selectedTest].reading } }
    var writings: [String] { get { K.LANGUAGE_TESTS[score.partnerTestResult.selectedTest].writing } }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("What is the highest level of education for which your spouse or common-law partner's has:").font(.headline)
                PickerView(data: K.EDUCATION_LEVELS, cellHeight: 75, selections: $score.partnerEducation).frame(width: UIScreen.main.bounds.width - 40, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.vertical)
                
                Text("In the last ten years, how many years of skilled work experience in Canada does your spouse/common-law partner have?").font(.headline)
                Text("It must have been paid, full-time (or an equal amount in part-time), and in one or more NOC 0, A or B jobs.").font(.caption)
                Stepper(value: $score.partnerEx, in: 0 ... K.WORK_EXPERIENCES.count - 1) {
                    switch score.partnerEx {
                    case 0:
                        Text("None or < 1 year")
                    case 1:
                        Text("1 year")
                    case 5:
                        Text("≥ 5 years")
                    default:
                        Text("\(K.WORK_EXPERIENCES[score.partnerEx]) years")
                    }
                }.font(.headline)
                
                Toggle(isOn: $score.partnerHaveTest, label: {
                    Text("Did your spouse or common-law partner take a language test?").font(.headline)
                }).padding(.trailing)
                if (score.partnerHaveTest) {
                    Picker(selection: $score.partnerTestResult.selectedTest, label: Text(""), content: {
                        ForEach(0 ..< K.LANGUAGE_TESTS.count) {
                            Text(K.LANGUAGE_TESTS[$0].name)
                        }
                    }).pickerStyle(SegmentedPickerStyle()).padding(.vertical)
                    
                    Stepper(value: $score.partnerTestResult.speaking, in: 0 ... speakings.count - 1) {
                        Text("Speaking: \(speakings[score.partnerTestResult.speaking])").font(.headline)
                    }
                    Stepper(value: $score.partnerTestResult.listening, in: 0 ... listenings.count - 1) {
                        Text("Listening: \(listenings[score.partnerTestResult.listening])").font(.headline)
                    }
                    Stepper(value: $score.partnerTestResult.reading, in: 0 ... readings.count - 1) {
                        Text("Reading: \(readings[score.partnerTestResult.reading])").font(.headline)
                    }
                    Stepper(value: $score.partnerTestResult.writing, in: 0 ... writings.count - 1) {
                        Text("Writing: \(writings[score.partnerTestResult.writing])").font(.headline)
                    }
                }
                
                
            })
        }.padding().navigationBarTitle("Partner's Info")
    }
}

struct Partner_Previews: PreviewProvider {
    static var previews: some View {
        Partner().environmentObject(Score())
    }
}
