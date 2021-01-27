//
//  Education.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct Education: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                Text("What is your level of education?").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Text("Enter the highest level of education for which you:").font(.subheadline)
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("• earned a Canadian degree, diploma or certificate or").font(.caption)
                    Text("• had an Educational Credential Assessment (ECA) if you did your study outside Canada. (ECAs must be from an approved agency, in the last five years)").font(.caption)
                }).padding(.bottom)
                
                PickerView(data: K.EDUCATION_LEVELS, cellHeight: 75, selections: $score.education).frame(width: UIScreen.main.bounds.width - 40, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.vertical)
                
                Toggle(isOn: $score.haveCanadianDegree, label: {
                    Text("Have you earned a Canadian degree, diploma or certificate?").font(.headline)
                }).padding(.top).padding(.trailing)
                
                if (score.haveCanadianDegree) {
                    Text("Choose the best answer to describe this level of education.").font(.caption).padding(.bottom)
                    PickerView(data: K.STUDY_IN_CANADA_LEVELS, cellHeight: 100, selections: $score.studyInCanada).frame(width: UIScreen.main.bounds.width - 40, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).padding(.top)
                }
            })
        }.padding().navigationBarTitle("Education Level")
    }
}

struct Education_Previews: PreviewProvider {
    static var previews: some View {
        Education().environmentObject(Score())
    }
}
