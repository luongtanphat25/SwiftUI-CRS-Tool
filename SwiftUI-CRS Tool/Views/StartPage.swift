//
//  StartPage.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct StartPage: View {
    @ObservedObject var delegate: AppDelegate
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Skilled Immigrants (Express Entry)")
                    .font(.headline)
                ScrollView {
                    VStack(alignment: .leading, spacing: 10, content: {
                        Text("Legal Disclaimer").bold()
                        VStack(alignment: .leading, spacing: 3, content: {
                            
                            Text("This tool is intended solely for general guidance and reference purposes. In the event of any discrepancy between the results of this questionnaire and that provided by the Express Entry electronic system, the results provided by the system shall govern, in accordance with provisions of the Immigration and Refugee Protection Act, the Immigration and Refugee Protection Regulations, and Minister's Instructions issued under IRPA s.10.3. This tool will be updated from time to time in accordance with changes to the Ministerial Instructions governing Express Entry.")
                            Text("This tool will help you calculate your Comprehensive Ranking System (CRS) score based on the answers you provide below. The CRS is a points-based system that we use to assess and score your profile and rank it in the Express Entry pool. It’s used to assess your: skills, education, language ability, work experience, other factors.")
                        }).font(.caption)
                        Text("This tool will help you calculate your Comprehensive Ranking System (CRS) score based on the answers you provide below. The CRS is a points-based system that we use to assess and score your profile and rank it in the Express Entry pool. It’s used to assess your: skills, education, language ability, work experience, other factors.").font(.footnote)
                        Text("Use this tool if: ").bold()
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("• you’re eligible for at least 1 Express Entry program")
                            Text("and")
                            Text("• you have not filled out an Express Entry profile but you’d like to see what your Comprehensive Ranking System (CRS) score might be if you do")
                            Text("or")
                            Text("• you were invited to apply for permanent residence, and want to see if a change to your profile may affect your CRS score")
                        }).font(.caption)
                    })
                }.padding(.vertical)
                NavigationLink(destination: QuestionList(delegate: self.delegate).navigationBarTitle("Question List"),label: {
                    Text("Start")
                        .font(.headline)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color(K.LightBlue))
                        .cornerRadius(K.CornerValue)
                })
            }).navigationBarTitle("CRS Tool", displayMode: .large).padding()
        }
    }
}
