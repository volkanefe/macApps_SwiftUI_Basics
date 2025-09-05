//
//  ContentView.swift
//  LoginFormMacOS
//
//  Created by VOLKAN EFE on 26.03.2024.
//

import SwiftUI

struct ContentView: View {
//   GETTING SCREEN FRAME...
    var screen = NSScreen.main?.visibleFrame

//    EMAIL AND PASSWORD TEXTFIELDS...
    @State var email = ""
    @State var password = ""
//    KEEP LOGGED
    @State var keepLogged = false
//    ALERT
    @State var alert = false

    var body: some View {

        HStack(spacing: 0){
            VStack{
                Spacer(minLength: 0)

                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)

                Text("Welcome Program")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding(.vertical, 10)

//                GOOGLE LOGIN...

                Button(action: {}, label: {
                    HStack{



                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)

                        Spacer(minLength: 0)

                        Text("Login with Google")
                            .foregroundColor(.black)

                        Spacer(minLength: 0)

                    }
                    .padding(.vertical, 8)
                    .padding(.horizontal)
                    .background(Color.white)
//                    SHADOW...
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                })
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical)

                HStack{

                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)

                    Text("OR")
                        .foregroundColor(.gray)

                    Rectangle()
                        .fill(Color.gray.opacity(0.5))
                        .frame(height: 1)

                }

                Group{

//                    EMAIL
                    TextField("Email", text: $email)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
//                    BORDER
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7), lineWidth: 1))

//                    PASSWORD
                    SecureField("Password", text: $password)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
//                    BORDER
                        .background(RoundedRectangle(cornerRadius: 2).stroke(Color.gray.opacity(0.7),lineWidth: 1))
                        .padding(.vertical)
//                    KEEP LOGIN AND FORGET PASSWORD...

                    HStack{
                        Toggle("", isOn: $keepLogged)
                            .labelsHidden()
                            .toggleStyle(CheckboxToggleStyle())
                        Text("Keep Logged In")
                            .foregroundColor(.black)
                        Spacer(minLength: 0)

                        Button(action: {}, label: {
                            Text("Forget Password")
                                .foregroundColor(.black)
//                            UNDER LINE
                                .underline(true, color: Color.black)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }

//                    LOGIN BUTTON

                    Button(action: {alert.toggle()}, label: {
                        HStack{

                            Spacer()

                            Text("Login")

                            Spacer()

                            Image(systemName: "arrow.right")
                        }
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.blue)
                        .cornerRadius(2)
                    })
                    .buttonStyle(PlainButtonStyle())
                    .padding(.top)

//                    SIGN UP

                    HStack{
                        Text("Don't have account yet?")
                            .foregroundColor(.gray)
                        

                        Button(action: {}, label: {
                            Text("Sign Up")
                                .foregroundColor(.blue)
                                .underline(true, color: Color.black)
                    })
                    .buttonStyle(PlainButtonStyle())
                    }
                    .padding(.top,10)
                }

                Spacer(minLength: 0)

            }
            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)

            VStack{

                Spacer()

//                WELCOME IMAGE...

                Image("welcome")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                MOVING IMAGE SLIGHTLY OUTSIDE...
                    .padding(.leading,-35)

                Spacer()

            }
//              HALF OF THE WIDTH...
            .frame(width: (screen!.width / 1.8) / 2)
            .background(Color.indigo)

        }
        .ignoresSafeArea(.all, edges: .all)
        .frame(width: screen!.width / 1.8, height: screen!.height - 100)
//        ALWAYS LIGHT MODE
        .preferredColorScheme(.light)
        .alert(isPresented: $alert, content: {
            Alert(title: Text("Message"), message: Text("Logged Successfully"), dismissButton: .destructive(Text("OK")))
        })

    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
