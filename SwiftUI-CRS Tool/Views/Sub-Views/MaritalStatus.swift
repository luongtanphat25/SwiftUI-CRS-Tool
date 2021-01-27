//
//  MaritalStatus.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-17.
//

import SwiftUI

struct MaritalStatus: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10, content: {
                VStack(alignment: .leading, spacing: 0, content: {
                    Text("What is your marital status?")
                        .font(.headline).padding(.vertical)
                    Picker(selection: $score.selectedMaritalStatus, label: Text(""), content: {
                        ForEach(0 ..< K.MARITAL_STATUS.count) {
                            Text(K.MARITAL_STATUS[$0])
                        }
                    })
                })
                let selectedStatus = K.MARITAL_STATUS[score.selectedMaritalStatus]
                if (selectedStatus == "Common-Law" || selectedStatus == "Married"){
                    Toggle(isOn: $score.isPartnerCanadian) {
                        Text("Is your spouse or common-law partner a citizen or permanent resident of Canada?").font(.headline)
                    }.padding(.horizontal)
                    if (!score.isPartnerCanadian) {
                        Toggle(isOn: $score.isWithPartner, label: {
                            Text("Will your spouse or common-law partner come with you to Canada?").font(.headline)
                        }).padding(.horizontal)
                    }
                }
            })
        }
        .padding()
        .navigationBarTitle("Marital Status")
    }
}

struct MaritalStatus_Previews: PreviewProvider {
    static var previews: some View {
        MaritalStatus().environmentObject(Score())
    }
}
