#  Implementar GHStrategyTableController

### Paso 1:
* Importamos en nuestra Clases la siguiente libreria "ghmjolnircore"
* En nuestro VC crear un outlet hacia un UIVIew este sera nuestro contenedor para la tabla "containerForTableview"

```
@IBOutlet weak var containerForTableView: UIView!
```

### Paso 2:
* Creamos un lazy var de la siguiente manera
* El parametro NibList puede ir entre comillas dobles el nombre del identificador de la celda

```
    internal lazy var tableSectionCpntroller: GHStrategyTableSectionController = {
        let tableView = GHStrategyTableSectionController(nibList: [(InfoCardCell.id, .main)])
            tableView.cellDelegate = self
            tableView.delegate = self
        return tableView
    }()

```

### Paso 3:
* agregamos el siguiente delegado a nuestro VC, uno es para el tap de la celda y otro para el header o section

```
extension Viewcontroller: GHStrategyTableControllerDelegate, GHStrategyTableViewCellDelegate {

    func itemSelected(model: GHModelSimpleTableDelegate) {
        guard let model = model as? MyModelRow else { return }
        
        dump("esta es la card seleccionada")
        dump(model.description ?? "")
        
        simpleAlert(title: "Atención", message: model.description ?? "")
    }
    
    func tapView(identifier: Int, data: Any?) {
        dump("este es el header")
    }
}
```

### Paso 4:
* Creamos una celda de tipo UITableViewCell y le agregamos el siguiente delegado

```
extension InfoCardCell: GHSimpleTableViewCellDelegate {

    func bind(model: GHModelSimpleTableDelegate) {
    
    // Se castea parametro al modelo de datos seleccionado
    
        guard let model = model as? MyModelRow else {
            return
        }
    }
}
```

### Paso 5:

* Ocupas dos modelos de datos uno para el header y otro para los rows los cuales los agregaremos adelante

* Para poder utilizar cualquier modelo de datos es necesario agregar una extension al modelo
  de datos donde colocaremos el identificador de nuestra celda.


```
// modelo para la seccion o header

struct ModelSection: GHModelTableSectionDelegate {
    var titleSection: String?
    var listSection: [GHModelSimpleTableDelegate]?
    
    init(titleSection: String?, listSection: [GHModelSimpleTableDelegate]?) {
        self.titleSection   = titleSection
        self.listSection    = listSection
    }
}

```

```
// modelo para los row
struct MyModelRow {
    
    let id: String?
    let icon: String?
    let description: String?
    
    internal init(id: String? = nil, icon: String? = nil, description: String? = nil) {
        self.id = id
        self.icon = icon
        self.description = description
    }
    
    func getDataForTable() -> [GHModelTableSectionDelegate] {
        var array: [ModelSection] = []
        
        let urlStr: String = "https://retos-operaciones-logistica.eae.es/wp-content/uploads/2020/01/proyectos-tecnologicos-600x300.jpg"
        var miModel: [MyModelRow] = []
        
        
        for (index, _) in (1...10).enumerated() {
            miModel.append(MyModelRow(id: "\(index)",
                                    icon: urlStr,
                             description: "Selccionaste la card número \(index)"))
        }
                
        array.append(ModelSection(titleSection: "Mi header seccion 1", listSection: miModel))
        
        for (index, _) in (1...10).enumerated() {
            miModel.append(MyModelRow(id: "\(index)",
                                    icon: urlStr,
                             description: "Selccionaste la card número \(index)"))
        }
                
        array.append(ModelSection(titleSection: "Mi header seccion 2", listSection: miModel))
        
        return array
    }
}
```

* Agregamos el delegado a la celda.

```
extension MyModelRow: GHModelSimpleTableDelegate {
    public var reuseIdentifier: String {
        InfoCardCell.id
    }
    
    var bundle: Bundle? {
        .main
    }
}
```

### Paso 6:
* En una funcion llamada setDataSource agregamos la informacion a mostrar en la tabla
* Asignamos su delegado para que se muestre la informacion
* Le agregamos al contenedor de la tabla, el parametro lazy var de tipo GHStrategyTableSectionController que creamos
* Configuramos los contraints de la tabla hacia el contenedor y el titulo

```
    func setupView() {
        self.title = "MY Header"
        
        // se carga el view del header o el section para cada arreglo de los rows
        let heightSection = 52.0
        self.tableSectionCpntroller.setSectionView(heightSection: heightSection) { title in
            let view = UIView(frame: CGRect( x: 0,
                                             y: 0,
                                         width: self.containerForTableView.bounds.size.width,
                                        height: heightSection))
            
            view.backgroundColor = .systemOrange
            
            let label = UILabel(frame: CGRect( x: 0, y: 0, width: self.containerForTableView.bounds.size.width,height: heightSection))
                label.textColor = .darkGray
                label.textAlignment = .left
                label.numberOfLines = 0
                label.text = title
            
            view.addSubview(label)
            
            label.edgesToSuperview()
            
            return view
        }
        
        // se cargan los rows por cada header o section
        if !self.tableSectionCpntroller.tableView.isDescendant(of: self.containerForTableView) {
            self.tableSectionCpntroller.delegate = self
            self.tableSectionCpntroller.cellDelegate = self
            if let table = self.tableSectionCpntroller.tableView {
                
                self.containerForTableView.addSubview(table)
                self.containerForTableView.constraints(to: table)
            }
        }
    }
```

### Paso 6:
* Si todo fue correcto Compilamos y listo una tabla dinamica que puede utilizar cualquier tipo de celda y modelo de datos.


### Agregar: Refresh Control
* En la variable del paso 2 es necesario agregar la siguiente linea **tableSectionCpntroller.addRefreshControl()**
* Quedaria de la siguiente manera

```
    internal lazy var tableViewController: GHStrategyTableController = {
        let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
        
        // Agregamos propiedad de refreshControll
        tableViewController.addRefreshControl()
        
        tableViewController.delegate = self
        return tableViewController
    }()
```

