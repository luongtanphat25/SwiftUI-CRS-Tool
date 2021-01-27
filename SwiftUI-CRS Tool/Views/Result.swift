//
//  Result.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-21.
//

import SwiftUI


struct Result: View {
    @EnvironmentObject var score: Score
    @ObservedObject var delegate: AppDelegate
    var totalA: Int { score.ageToScore() + score.educationToScore() + score.firstTestToScore() + score.secondTestToScore() + score.canadianExperienceToScore()}
    var totalB: Int { score.partnerEducationToScore() + score.partnerCLBToScore() + score.partnerExperienceToScore() }
    
    var educationTotal: Int {
        let t = score.clbAndEducationToScore() + score.workAndEducationToScore()
        return t >= 50 ? 50 : t
    }
    
    var foreignTotal: Int {
        let t = score.foreignWorkAndCLBToScore() + score.experienceToScore()
        return t >= 50 ? 50 : t
    }
    var totalC: Int {
        let t = score.certificateAndCLBToScore() + educationTotal + foreignTotal
        return t >= 100 ? 100 : t
    }
    var nominationScore: Int { score.haveNomination ? 600 : 0 }
    var siblingScore: Int{ score.haveCanadianRelative ? 15 : 0 }
    var totalD: Int {
        let t = score.frenchSkillToScore() + score.studyCanadaToScore() + score.jobOfferToScore() + nominationScore + siblingScore
        return t >= 600 ? 600 : t
    }
    var total: Int { totalA + totalB + totalC + totalD }
    
    var body: some View {
        VStack {
            Text("\(total)").font(.system(size: 80)).bold().padding().foregroundColor(Color(K.LightBlue))
            ScrollView {
                VStack(alignment: .leading, spacing: 10, content: {
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Core/Human capital factors: \(totalA)").font(.headline).foregroundColor(Color(K.LightBlue))
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Age: \(score.ageToScore())")
                            Text("Level of education: \(score.educationToScore())")
                            Text("First Official Language: \(score.firstTestToScore())")
                            Text("Second Official Language: \(score.secondTestToScore())")
                            Text("Canadian work experience: \(score.canadianExperienceToScore())")
                        }).font(.caption)
                    })
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Spouse factors: \(totalB)").font(.headline).foregroundColor(Color(K.LightBlue))
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Level of education: \(score.partnerEducationToScore())")
                            Text("First Official Language: \(score.partnerCLBToScore())")
                            Text("Canadian work experience: \(score.partnerExperienceToScore())")
                        }).font(.caption)
                    })
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Skill transferability factors: \(totalC)").font(.headline).foregroundColor(Color(K.LightBlue))
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Education: \(educationTotal)").bold().foregroundColor(Color(K.LightBlue))
                            Text("Official Language proficiency and education: \(score.clbAndEducationToScore())")
                            Text("Canadian work experience and education: \(score.workAndEducationToScore())")
                        }).font(.caption)
                        VStack(alignment: .leading, spacing: 3, content: {
                            
                            Text("Foreign work experience: \(foreignTotal)").bold().foregroundColor(Color(K.LightBlue))
                            Text("Official Language proficiency and foreign work experience: \(score.foreignWorkAndCLBToScore())")
                            Text("Canadian and foreign work experience: \(score.experienceToScore())")
                        }).font(.caption)
                        Text("Certificate of qualification: \(score.certificateAndCLBToScore())").font(.caption).bold().foregroundColor(Color(K.LightBlue))
                    })
                    
                    VStack(alignment: .leading, spacing: 5, content: {
                        Text("Additional points: \(totalD)").font(.headline).foregroundColor(Color(K.LightBlue))
                        VStack(alignment: .leading, spacing: 3, content: {
                            Text("Provincial nomination: \(nominationScore)")
                            Text("Job offer: \(score.jobOfferToScore())")
                            Text("Study in Canada: \(score.studyCanadaToScore())")
                            Text("Sibling in Canada: \(siblingScore)")
                            Text("French-language skills: \(score.frenchSkillToScore())")
                        }).font(.caption)
                    })
                })
            }
        }.padding().navigationTitle("Your total score")
        .navigationBarItems(trailing:
                                NavigationLink("Sign in", destination: Login(delegate: self.delegate)))
    }
}
