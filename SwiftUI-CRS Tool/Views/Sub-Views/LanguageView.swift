//
//  LanguageView.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct LanguageView: View {
    @EnvironmentObject var score: Score
    
    var speakings: [String] { get { K.LANGUAGE_TESTS[score.firstTest.selectedTest].speaking } }
    var listenings: [String] { get { K.LANGUAGE_TESTS[score.firstTest.selectedTest].listening } }
    var readings: [String] { get { K.LANGUAGE_TESTS[score.firstTest.selectedTest].reading } }
    var writings: [String] { get { K.LANGUAGE_TESTS[score.firstTest.selectedTest].writing } }
   
    var secondTests: [Test] {
        get {
            if (score.firstTest.selectedTest == 0 || score.firstTest.selectedTest == 1) {
                return K.FRENCH_TESTS
            } else {
                return K.ENGLISH_TETS
            }
        }
    }
    
    var secondSpeakings: [String] { get { secondTests[score.secondTest.selectedTest].speaking } }
    var secondListenings: [String] { get { secondTests[score.secondTest.selectedTest].listening } }
    var secondReadings: [String] { get { secondTests[score.secondTest.selectedTest].reading } }
    var secondWritings: [String] { get { secondTests[score.secondTest.selectedTest].writing } }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Official languages: Canada's official languages are English and French.").font(.headline)
                Text("You need to submit language test results that are less than two years old for all programs under Express Entry, even if English or French is your first language.").font(.caption)
                Text("Which language test did you take for your first official language?").font(.headline).multilineTextAlignment(.center)
                Picker(selection: $score.firstTest.selectedTest, label: Text(""), content: {
                    ForEach(0 ..< K.LANGUAGE_TESTS.count) {
                        Text(K.LANGUAGE_TESTS[$0].name)
                    }
                }).pickerStyle(SegmentedPickerStyle())
                
                Stepper(value: $score.firstTest.speaking, in: 0 ... speakings.count - 1) {
                    Text("Speaking: \(speakings[score.firstTest.speaking])").font(.headline)
                }
                Stepper(value: $score.firstTest.listening, in: 0 ... listenings.count - 1) {
                    Text("Listening: \(listenings[score.firstTest.listening])").font(.headline)
                }
                Stepper(value: $score.firstTest.reading, in: 0 ... readings.count - 1) {
                    Text("Reading: \(readings[score.firstTest.reading])").font(.headline)
                }
                Stepper(value: $score.firstTest.writing, in: 0 ... writings.count - 1) {
                    Text("Writing: \(writings[score.firstTest.writing])").font(.headline)
                }
                
                Toggle(isOn: $score.haveSecondLanguage, label: {
                    VStack(alignment: .leading, spacing: 3, content: {
                        Text("Do you have other language results?").font(.headline).padding(.top)
                        Text("If so, which language test did you take for your second official language? Test results must be less than two years old.").font(.caption)
                    })
                })
                
                if (score.haveSecondLanguage) {
                    Picker(selection: $score.secondTest.selectedTest, label: Text(""), content: {
                        ForEach(0 ..< secondTests.count) {
                            Text(secondTests[$0].name)
                        }
                    }).pickerStyle(SegmentedPickerStyle())
                    
                    Stepper(value: $score.secondTest.speaking, in: 0 ... secondSpeakings.count - 1) {
                        Text("Speaking: \(secondSpeakings[score.secondTest.speaking])").font(.headline)
                    }
                    Stepper(value: $score.secondTest.listening, in: 0 ... secondListenings.count - 1) {
                        Text("Listening: \(secondListenings[score.secondTest.listening])").font(.headline)
                    }
                    Stepper(value: $score.secondTest.reading, in: 0 ... secondReadings.count - 1) {
                        Text("Reading: \(secondReadings[score.secondTest.reading])").font(.headline)
                    }
                    Stepper(value: $score.secondTest.writing, in: 0 ... secondWritings.count - 1) {
                        Text("Writing: \(secondWritings[score.secondTest.writing])").font(.headline)
                    }
                }
            }).padding().navigationBarTitle("Language Test")
        }
    }
}

struct LanguageView_Previews: PreviewProvider {
    static var previews: some View {
        LanguageView().environmentObject(Score())
    }
}
