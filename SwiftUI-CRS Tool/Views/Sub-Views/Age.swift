//
//  Age.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct Age: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Text("How old are you?").font(.headline)
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("Choose the best answer:").padding(.vertical)
                    Text("• If you’ve been invited to apply, enter your age on the date you were invited.").font(.caption)
                    Text("OR").font(.caption)
                    Text("• If you plan to complete an Express Entry profile, enter your current age.").font(.caption)
                })
                VStack(alignment: .center) {
                    Slider(value: $score.age, in: 17...45, step: 1).padding(.vertical)
                    switch (score.age) {
                    case 17:
                        Text("≤ 17").font(.system(size: 100)).bold().padding().foregroundColor(Color(K.LightBlue))
                    case 45:
                        Text("≥ 45").font(.system(size: 100)).bold().padding().foregroundColor(Color(K.LightBlue))
                    default:
                        Text("\(Int(score.age))").font(.system(size: 100)).bold().padding().foregroundColor(Color(K.LightBlue))
                    }
                }
                
            })
        }.padding().navigationTitle("Age")
    }
}

struct Age_Previews: PreviewProvider {
    static var previews: some View {
        Age().environmentObject(Score())
    }
}
