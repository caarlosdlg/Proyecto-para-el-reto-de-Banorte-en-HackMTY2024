//
//  ContentView.swift
//  Proyecto-para-el-reto-de-Banorte-en-HackMTY2024
//
//  Created by Carlos Delgado on 15/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoggedIn = false // Estado para controlar la navegación

    var body: some View {
        NavigationView {
            ZStack {
                Color.red // Fondo rojo
                    .edgesIgnoringSafeArea(.all) // Asegura que cubra toda la pantalla
                
                VStack {
                    Text("Banorte")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.bottom, 50)

                    TextField("Usuario", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.bottom, 20)

                    SecureField("Contraseña", text: .constant(""))
                        .padding()
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding(.bottom, 20)

                    NavigationLink(destination: HomeView(), isActive: $isLoggedIn) {
                        Button(action: {
                            withAnimation {
                                isLoggedIn = true // Navegar a la pantalla de inicio
                            }
                        }) {
                            Text("Iniciar Sesión")
                                .font(.headline)
                                .foregroundColor(.red)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

struct HomeView: View {
    @State private var credit = generateRandomCredit()
    @State private var showOtherOptions = false
    @State private var movements = generateRandomMovements()
    @State private var cardNumber = generateRandomCardNumber()

    var body: some View {
        ZStack {
            Color.red // Fondo rojo
                .edgesIgnoringSafeArea(.all) // Asegura que cubra toda la pantalla
            
            VStack {
                // Diseño de la tarjeta de crédito
                VStack(alignment: .leading, spacing: 20) {
                    Text("Bienvenido, Carlos")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Número de Tarjeta")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    Text(cardNumber)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    HStack {
                        Text("Saldo Disponible")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    Text(credit)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
                .padding()
                .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding()

                // Botones de opciones
                VStack(spacing: 20) {
                    HStack(spacing: 20) {
                        NavigationLink(destination: TransferView()) {
                            Text("Transferencia")
                                .font(.headline)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }
                        
                        NavigationLink(destination: WithdrawalView()) {
                            Text("Retiro sin Tarjeta")
                                .font(.headline)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }
                    }
                    
                    HStack(spacing: 20) {
                        NavigationLink(destination: AvailableCardsView()) {
                            Text("Tarjetas Disponibles")
                                .font(.headline)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }

                        Button(action: {
                            withAnimation {
                                showOtherOptions.toggle()
                            }
                        }) {
                            Text("Otros")
                                .font(.headline)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.red)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showOtherOptions) {
                            OtherOptionsView()
                        }
                    }
                }
                .padding()

                // Movimientos
                List(movements, id: \.self) { movement in
                    Text(movement)
                        .foregroundColor(.white)
                }
                .background(Color.red)
                .cornerRadius(10)
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TransferView: View {
    var body: some View {
        Text("Transferencia")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct WithdrawalView: View {
    var body: some View {
        Text("Retiro sin Tarjeta")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct AvailableCardsView: View {
    var body: some View {
        Text("Tarjetas Disponibles")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

struct OtherOptionsView: View {
    @State private var movements = generateRandomMovements()

    var body: some View {
        NavigationView {
            List(movements, id: \.self) { movement in
                Text(movement)
            }
            .navigationTitle("Movimientos")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cerrar") {
                        // Cierra la vista de otros
                    }
                }
            }
        }
    }
}

func generateRandomCardNumber() -> String {
    return "**** **** **** \(Int.random(in: 1000...9999))"
}

func generateRandomCredit() -> String {
    return "$\(Int.random(in: 100000...1000000))"
}

func generateRandomMovements() -> [String] {
    return [
        "Compra en tienda - $\(Int.random(in: 10...100)).00",
        "Pago de factura - $\(Int.random(in: 100...500)).00",
        "Depósito - $\(Int.random(in: 500...1000)).00"
    ]
}

#Preview {
    ContentView()
}
