//
//  QuestionList.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct QuestionList: View {
    @EnvironmentObject var score: Score
    @ObservedObject var delegate: AppDelegate
    
    var body: some View {
        VStack {
            List {
                NavigationLink(
                    destination: MaritalStatus(),
                    label: { Text("What is your marital status?")})
                NavigationLink(
                    destination: Age(),
                    label: { Text("How old are you?") })
                NavigationLink(
                    destination: Education(),
                    label: { Text("What is your level of education?") })
                NavigationLink(
                    destination: LanguageView(),
                    label: { Text("Official languages: English and French") })
                NavigationLink(
                    destination: WorkExperiences(),
                    label: { Text("Work Experience") })
                NavigationLink(
                    destination: Certificates(),
                    label: { Text("Certificates, Job offer and Nomination") })
                NavigationLink(
                    destination: Relative(),
                    label: { Text("Relatives") })
                if (score.havePartner) {
                    NavigationLink(
                        destination: Partner(),
                        label: { Text("Spouse/common-law partner's information") })
                }
            }
            NavigationLink(destination: Result(delegate: self.delegate),label: {
                Text("Calculate Score")
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(K.LightBlue))
                    .cornerRadius(K.CornerValue)
            }).padding()
        }
    }
}
