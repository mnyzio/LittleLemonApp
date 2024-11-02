//
//  LittleLemonLogo.swift
//  LittleLemonDinerMenu
//
//  Created by Miroslaw Nyzio on 10/24/24.
//

import SwiftUI

struct LittleLemonLogo: View {
    var body: some View {
        Image("LittleLemonLogo")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 250, height: 450, alignment: .center)
    }
}

#Preview {
    LittleLemonLogo()
}
