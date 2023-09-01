//
//  XDismissBtn.swift
//  transylvanian-tome
//
//  Created by sam blaha on 9/1/23.
//

import SwiftUI

struct XDismissBtn: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(Color.black)
        }
    }
}

struct XDismissBtn_Previews: PreviewProvider {
    static var previews: some View {
        XDismissBtn()
    }
}
