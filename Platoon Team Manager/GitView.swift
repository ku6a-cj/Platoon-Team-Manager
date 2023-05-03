//
//  GitView.swift
//  AcademyRecruit
//
//  Created by Jakub Chodara on 06/10/2022.
//

import SwiftUI

struct GitView: View {
    var body: some View {
        WebView(url: URL(string: "https://github.com/ku6a-cj")!)
    }
}

struct GitView_Previews: PreviewProvider {
    static var previews: some View {
        GitView()
    }
}
