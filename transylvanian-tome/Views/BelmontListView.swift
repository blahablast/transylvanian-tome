//
//  BelmontListView.swift
//  transylvanian-tome
//
//  Created by sam blaha on 8/28/23.
//

import SwiftUI

struct BelmontListView: View {
    @ObservedObject var viewModel: BelmontListViewModel
    
    var body: some View {
        List(viewModel.belmonts) { belmont in
            Text(belmont.name)
        }
    }
}

struct BelmontListView_Previews: PreviewProvider {
    static var previews: some View {
        BelmontListView(viewModel: BelmontListViewModel())
    }
}
