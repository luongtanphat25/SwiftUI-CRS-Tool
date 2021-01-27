//
//  Certificates.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-19.
//

import SwiftUI

struct Certificates: View {
    @EnvironmentObject var score: Score
    
    var body: some View {
        ScrollView{
            VStack(alignment: .leading, spacing: 10, content: {
                Toggle(isOn: $score.haveCertificate, label: {
                    Text("Do you have a certificate of qualification from a Canadian province, territory or federal body?").font(.headline)
                }).padding(.trailing)
                VStack {
                    Text("Note: A certificate of qualification lets people work in some skilled trades in Canada. Only the provinces, territories and a federal body can issue these certificates. To get one, a person must have them assess their training, trade experience and skills to and then pass a certification exam.")
                    Text("People usually have to go to the province or territory to be assessed. They may also need experience and training from an employer in Canada.")
                    Text("This isn’t the same as a nomination from a province or territory.")
                }.font(.caption)
                
                Toggle(isOn: $score.haveJobOffer, label: {
                    Text("Do you have a valid job offer supported by a Labour Market Impact Assessment (if needed)?").font(.headline)
                }).padding(.trailing)
                Text("A valid job offer must be:")
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("• full-time")
                    Text("• in a skilled job listed as Skill Type 0, or Skill Level A or B in the 2011 National Occupational Classification")
                    Text("• supported by a Labour Market Impact Assessment (LMIA) or exempt from needing one")
                    Text("• for one year from the time you become a permanent resident")
                }).font(.caption)
                Text("A job offer isn’t valid if your employer is:")
                VStack(alignment: .leading, spacing: 3, content: {
                    Text("• an embassy, high commission or consulate in Canada or")
                    Text("• on the list of ineligible employers.")
                }).font(.caption)
                Text("Whether an offer is valid or not also depends on different factors, depending on your case.").font(.footnote)
                if (score.haveJobOffer) {
                    Picker(selection: $score.noc, label: Text(""), content: {
                        ForEach(0 ..< K.NOC_TYPES.count) {
                            Text(K.NOC_TYPES[$0])
                        }
                    }).pickerStyle(SegmentedPickerStyle()).padding(.top)
                }
                
                Toggle(isOn: $score.haveNomination, label: {
                    Text("Do you have a nomination certificate from a province or territory?").font(.headline)
                }).padding(.trailing).padding(.top)
            })
        }.padding().navigationBarTitle("Certificates")
    }
}

struct Certificates_Previews: PreviewProvider {
    static var previews: some View {
        Certificates().environmentObject(Score())
    }
}
