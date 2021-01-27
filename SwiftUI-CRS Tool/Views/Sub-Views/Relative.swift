//
//  Relative.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-19.
//

import SwiftUI

struct Relative: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                Toggle(isOn: $score.haveCanadianRelative, label: {
                    Text("Do you or your spouse or common law partner (if they will come with you to Canada) have at least one brother or sister living in Canada who is a citizen or permanent resident?").font(.headline)
                }).padding(.trailing).padding(.top)
                Text("Note: to answer yes, the brother or sister must be:").font(.subheadline)
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("• 18 years old or older")
                    Text("• related to you or your partner by blood, marriage, common-law partnership or adoption")
                    Text("• have a parent in common with you or your partner")
                }).font(.caption)
                Text("A brother or sister is related to you by:").font(.subheadline)
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("• blood (biological)")
                    Text("• adoption")
                    Text("• marriage (step-brother or step-sister)")
                }).font(.caption)
            })
        }.padding().navigationBarTitle("Relatives")
    }
}

struct Relative_Previews: PreviewProvider {
    static var previews: some View {
        Relative().environmentObject(Score())
    }
}
