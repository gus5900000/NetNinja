import SwiftUI

struct SettingProfile: View {
    let items = ["Notifications", "Langues", "Accessibilité", "Ajout d'un articles", "Déconnexion"]
    @State private var articles: [LastActu] = []
    
    var body: some View {
        NavigationStack {
            List(items, id: \.self) { item in
                NavigationLink(destination: destinationView(for: item)) {
                    Text(item)
                        .bold()
                        .foregroundColor(.black)
                        .font(.system(size: 20))
                        .padding()
                }
            }
            .navigationTitle("Réglages ⚙️")
        }
    }
    
    @ViewBuilder
    func destinationView(for item: String) -> some View {
        switch item {
        case "Notifications":
            NotificationsView()
        case "Langues":
            LanguageSettingView()
        case "Accessibilité":
            AccessibilityView()
        case "Déconnexion":
            LogoutView()
        case "Ajout d'un articles":
            addArticle(onSave: { newActu in
                tabLastActu.append(newActu)
            })

        default:
            Text("Non disponible")
        }
    }
}

struct NotificationsView: View {

    @State var notificationsEnabled = true
    @State var soundEnabled = false

    var body: some View {
        ScrollView {
            VStack {
                Toggle("Activer les notifications", isOn: $notificationsEnabled)
                    .padding(.trailing,10)
                Toggle("Sonnerie des notifications", isOn: $soundEnabled)
                    .padding(.trailing,10)
            }
        }
        .padding()
        .navigationTitle("Notifications")
    }
}

struct LanguageSettingView: View {
    var body: some View {
        List {
            Text("🇺🇸 Anglais").padding()
            Text("🇫🇷 Français").padding()
            Text("🇪🇸 Espagnol").padding()
        }
        .navigationTitle("Langues")
    }
}

struct AccessibilityView: View {
    var body: some View {
        ScrollView {
            NavigationLink(destination: Secret() ) {
                Text("Options d'accessibilité")
                    .padding()
                    .navigationTitle("Accessibilité")
            }
        }
    }
}

struct LogoutView: View {
    
    @ObservedObject var user = monUser

    
    var body: some View {
        ScrollView {
            VStack {
                Spacer().frame(height: 300)
                Button(action: {
                    user.modaleLogin = true
                } ) {
                    VStack {
                        Image(systemName: "trash.slash.circle.fill")
                            .foregroundStyle(.red)
                            .scaledToFit()
                            .font(.system(size:100))
                        
                        HStack {
                            Text("Retour à la connexion")
                                .foregroundColor(.white)
                                .frame(width: 200, height: 50)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                    
                }
            }

            
        }
        .navigationTitle("Déconnexion")
    }
}


struct addArticle: View {
    @State var name: String = ""
    @State var location: String = ""
    @State var dateOfPublish: String = ""
    @State var content: String = ""
    @State var image: String = ""
    @State var selectedTag: Tag = .general

    @Environment(\.presentationMode) var presentationMode
    var onSave: (LastActu) -> Void

    var body: some View {
        NavigationView {
            Form {
                TextField("Nom de l'article", text: $name)
                TextField("Lieu ", text: $location)
                TextField("Date de publication", text: $dateOfPublish)
                Picker("Tag", selection: $selectedTag) {
                    ForEach(Tag.allCases, id: \.self) { tag in
                        Text(tag.rawValue).tag(tag)
                    }
                }
                TextField("Contenu", text: $content)
                TextField("Image", text: $image)

                Button("Enregistrer") {
                    let newActu = LastActu(name: name, location: location, dateOfPublish: dateOfPublish, tag: selectedTag, content: content, image: image)
                    onSave(newActu)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationBarTitle("Nouvelle articles")
        }
    }
}

#Preview {
    SettingProfile()
}
