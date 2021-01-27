//
//  WorkExperiences.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-19.
//

import SwiftUI

struct WorkExperiences: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("In the last ten years, how many years of skilled work experience in Canada do you have?")
                    .font(.headline)
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("It must have been paid and full-time (or an equal amount in part-time).").bold()
                    Text("Note: In Canada, the National Occupational Classification (NOC) is the official list of all the jobs in the Canadian labour market. It describes each job according to skill type, group and level.")
                    Text("\"Skilled work\" in the NOC is:").bold()
                    Text("• Managerial jobs (NOC Skill Level 0)\n• Professional jobs (NOC Skill Type A)\n• Technical jobs and skilled trades/ manual work (NOC Skill Type B)")
                }).font(.caption)
               
                
                Stepper(value: $score.canadianEx, in: 0 ... K.WORK_EXPERIENCES.count - 1) {
                    switch score.canadianEx {
                    case 0:
                        Text("None or < 1 year")
                    case 1:
                        Text("1 year")
                    case 5:
                        Text("≥ 5 years")
                    default:
                        Text("\(K.WORK_EXPERIENCES[score.canadianEx]) years")
                    }
                }.font(.headline)
                
                Text("In the last 10 years, how many total years of foreign skilled work experience do you have?").font(.headline)
                Text("It must have been paid, full-time (or an equal amount in part-time), and in only one occupation (NOC skill type 0, A or B).").font(.caption)
                
                Stepper(value: $score.foriegnEx, in: 0 ... K.FOREIGN_EXPERIENCE.count - 1) {
                    switch score.foriegnEx {
                    case 0:
                        Text("None or < 1 year")
                    case 1:
                        Text("1 year")
                    case 2:
                        Text("2 years")
                    default:
                        Text("≥ 3 years")
                    }
                }.font(.headline)
            })
        }.padding().navigationBarTitle("Work Experience")
    }
}

struct WorkExperiences_Previews: PreviewProvider {
    static var previews: some View {
        WorkExperiences().environmentObject(Score())
    }
}
