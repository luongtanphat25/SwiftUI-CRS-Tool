//
//  PickerView.swift
//  SwiftUI-CRS Tool
//
//  Created by Phat Luong on 2021-01-19.
//

import Foundation
import SwiftUI

struct PickerView: UIViewRepresentable {
    let data: [String]
    var cellHeight: CGFloat
    @Binding var selections: Int
    
    func makeUIView(context: UIViewRepresentableContext<PickerView>) -> UIPickerView {
        let picker = UIPickerView()
        picker.dataSource = context.coordinator
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIView(_ uiView: UIPickerView, context: UIViewRepresentableContext<PickerView>) {
        uiView.selectRow(selections, inComponent: 0, animated: false)
    }
    
    func makeCoordinator() -> PickerView.Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
        let parent: PickerView
        
        init(_ pickerView: PickerView) {
            self.parent = pickerView
        }
        
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return self.parent.data.count
        }
        
        func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel(frame: CGRect(x: 0, y: 0, width: pickerView.frame.size.width - 30, height: self.parent.cellHeight))
            label.text = self.parent.data[row]
            label.numberOfLines = 0;
            label.font = UIFont.preferredFont(forTextStyle: .subheadline)
            return label;
        }
        
        func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
            return self.parent.cellHeight
        }
        
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            parent.selections = row
        }
    }
}
