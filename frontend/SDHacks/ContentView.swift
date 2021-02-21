//
//  ContentView.swift
//  SDHacks
//
//  Created by Victor Uemura on 2021-02-19.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var index = 0
    @State var login = true
    @State var map = false
    @State var isPresentingScanner = false

    var body: some View {
        ZStack {
            Home(login: $login, map: $map)
                .edgesIgnoringSafeArea(.all)
                .opacity(index == 0 ? 1 : 0)
            QRScanner(isPresentingScanner: $isPresentingScanner) //camera
                .opacity(index == 1 ? 1 : 0)
            Profile() //profile
                .opacity(index == 2 ? 1 : 0)
            if !login && !map {
                MenuBar(index: $index, isPresentingScanner: $isPresentingScanner).edgesIgnoringSafeArea(.all)
            }
        }
    }
}

struct QRScanner: View {
    @Binding var isPresentingScanner : Bool
    @State var scannedCode: String?
    var body: some View {
        NavigationView {
            VStack(spacing: 10) {
                if self.scannedCode != nil {
                    NavigationLink("Next page", destination: Plant(plantInfo: PlantType(PlantID: 1, GardenID: 1, PlotID: 1, PlantType: "Basil Plant", PlantName: "Neymar", Instruction: "Needs phosphate fertilization (2 cups)")), isActive: .constant(true)).hidden()
                }
                Button("Scan Code") {
                    self.isPresentingScanner = true
                }.font(.custom("Poppins-Medium", size: 14))
                .foregroundColor(Color(hex: "3a3a3a"))
                .sheet(isPresented: $isPresentingScanner) {
                    self.scannerSheet
                }
                Text("Scan a QR code to begin")
                    .font(.custom("Poppins-Medium", size: 14))
                    .foregroundColor(Color(hex: "3a3a3a"))
            }

        }
    }

    var scannerSheet : some View {
        CodeScannerView(
            codeTypes: [.qr],
            completion: { result in
                if case let .success(code) = result {
                    self.scannedCode = code
                    self.isPresentingScanner = false
                }
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
