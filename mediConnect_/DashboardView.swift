//
import SwiftUI

struct DashboardView: View {
   
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                VStack {
                    NavigationLink(destination: MediInfoOneView()) {
                        Image(systemName: "calendar")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    Text("My Scheduler")
                }
                
                Spacer()
            
            
                
                VStack {
                    NavigationLink(destination: ConnectHubView()) {
                        Image(systemName: "person.3.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    Text("Connect Hub")
                }
                
                Spacer()
            }
            
            HStack {
                Spacer()
                                  
                                  VStack {
                                      NavigationLink(destination: ProfileView(firstName: <#String#>, lastName: <#String#>, dateOfBirth: <#Date#>, alias: <#String#>)) {
                                          Image(systemName: "person.crop.circle")
                                              .resizable()
                                              .scaledToFit()
                                              .frame(width: 100, height: 100)
                                      }
                                      Text("Profile")
                                  }
                                  
                                  Spacer()
                VStack {
                    Button(action: {
                        // Handle settings button action
                    }) {
                        Image(systemName: "gear")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                    }
                    Text("Settings")
                }
                
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}

