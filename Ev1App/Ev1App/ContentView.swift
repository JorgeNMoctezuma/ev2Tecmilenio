import SwiftUI
import AVFoundation

// ==========================
// VISTA 1 
// ==========================
struct VistaUno: View {
    @State private var nombre: String = ""
    @State private var edad: String = ""
    @State private var color: String = ""
    @State private var mensajeResultado: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Formulario")
                .font(.largeTitle)
                .bold()

            TextField("¿Cuál es tu nombre?", text: $nombre)
                .textFieldStyle(.roundedBorder)
            
            TextField("¿Cuántos años tienes?", text: $edad)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            TextField("¿Cuál es tu color favorito?", text: $color)
                .textFieldStyle(.roundedBorder)

            Button(action: {
                mensajeResultado = "Hola \(nombre), tienes \(edad) años y tu color favorito es \(color)."
            }) {
                Text("Proyectar")
            }

            Text(mensajeResultado)
                .padding()
            
            Spacer()
        }
        .padding()
    }
}

// ==========================
// VISTA 2
// ==========================
struct VistaDos: View {
    @State private var colorDelSimbolo: Color = .gray
    @State private var opacidad: Double = 1.0

    let listaColores: [Color] = [.red, .blue, .green, .yellow, .purple, .orange, .pink, .cyan]

    var body: some View {
        VStack(spacing: 30) {
            Text("Editor de Símbolo")

            Image(systemName: "paintpalette.fill")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(colorDelSimbolo)
                .opacity(opacidad)

            Button("Rojo") { colorDelSimbolo = .red }
            Button("Azul") { colorDelSimbolo = .blue }

            Button("Color Aleatorio") {
                colorDelSimbolo = listaColores.randomElement()!
            }

            Slider(value: $opacidad)
        }
    }
}

// ==========================
// VISTA 3
// ==========================
struct VistaTres: View {
    
    @State private var eleccionJugador = ""
    @State private var eleccionCPU = ""
    @State private var resultado = ""
    
    let opciones = ["Piedra", "Papel", "Tijera"]
    
    var body: some View {
        VStack {
            Text("Piedra, Papel o Tijera")
            
            Text("Tú: \(eleccionJugador)")
            Text("CPU: \(eleccionCPU)")
            Text(resultado)
            
            HStack {
                Button("Piedra") { jugar(eleccion: "Piedra") }
                Button("Papel") { jugar(eleccion: "Papel") }
                Button("Tijera") { jugar(eleccion: "Tijera") }
            }
        }
    }
    
    func jugar(eleccion: String) {
        eleccionJugador = eleccion
        eleccionCPU = opciones.randomElement()!
        
        if eleccionJugador == eleccionCPU {
            resultado = "Empate"
        } else if
            (eleccionJugador == "Piedra" && eleccionCPU == "Tijera") ||
            (eleccionJugador == "Papel" && eleccionCPU == "Piedra") ||
            (eleccionJugador == "Tijera" && eleccionCPU == "Papel") {
            resultado = "¡Ganaste!"
        } else {
            resultado = "Perdiste"
        }
    }
}

// ==========================
// VISTA 4
// ==========================
struct Tarea: Identifiable {
    let id = UUID()
    var titulo: String
    var estaCompletada: Bool
}

struct VistaCuatro: View {
    @State private var listaDeTareas: [Tarea] = []
    @State private var nuevaTareaTexto: String = ""

    var body: some View {
        VStack {
            Text("Mis Tareas")

            HStack {
                TextField("Nueva tarea...", text: $nuevaTareaTexto)
                Button("+") {
                    agregarTarea()
                }
            }

            List {
                ForEach(listaDeTareas) { tarea in
                    Text(tarea.titulo)
                }
                .onDelete(perform: borrarTarea)
            }
        }
    }

    func agregarTarea() {
        if !nuevaTareaTexto.isEmpty {
            listaDeTareas.append(Tarea(titulo: nuevaTareaTexto, estaCompletada: false))
            nuevaTareaTexto = ""
        }
    }

    func borrarTarea(at offsets: IndexSet) {
        listaDeTareas.remove(atOffsets: offsets)
    }
}

// ==========================
// VISTA 6
// ==========================
struct VistaSeis: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
            Text("Hello, world!")
        }
    }
}

// ==========================
// VISTA 7
// ==========================
enum DiaSemana { case lunes, martes, miercoles, jueves, viernes }
enum Direccion { case norte, sur, este, oeste }
enum Planeta: String { case tierra = "Tierra" }
enum Clima { case sol, lluvia, viento }

struct VistaSiete: View {
    var body: some View {
        VStack {
            Text("Vista 7 funcionando")
        }
    }
}

// ==========================
// VISTA 8 (TABVIEW)
// ==========================
struct VistaOcho: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "house.fill")
                    .font(.largeTitle)
                Text("Inicio")
            }
            .tabItem {
                Label("Inicio", systemImage: "house")
            }

            VStack {
                Image(systemName: "magnifyingglass")
                    .font(.largeTitle)
                Text("Buscar")
            }
            .tabItem {
                Label("Buscar", systemImage: "magnifyingglass")
            }

            VStack {
                Image(systemName: "person.fill")
                    .font(.largeTitle)
                Text("Perfil")
            }
            .tabItem {
                Label("Perfil", systemImage: "person")
            }
        }
        .accentColor(.blue)
    }
}

// ==========================
// MENÚ PRINCIPAL
// ==========================
struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 15) {
                Text("Menú Principal")

                NavigationLink("Vista 1") { VistaUno() }
                NavigationLink("Vista 2") { VistaDos() }
                NavigationLink("Vista 3") { VistaTres() }
                NavigationLink("Vista 4") { VistaCuatro() }
                NavigationLink("Vista 6") { VistaSeis() }
                NavigationLink("Vista 7") { VistaSiete() }
                NavigationLink("Vista 8") { VistaOcho() }
            }
        }
    }
}

#Preview {
    ContentView()
}
