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
internal lazy var tableViewController: GHStrategyTableController = {
    let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
    tableViewController.delegate = self
    return tableViewController
}()
```

### Paso 3:
* agregamos el siguiente delegado a nuestro VC

```
extension Viewcontroller: GHStrategyTableControllerDelegate {

    func itemSelected(model: GHModelSimpleTableDelegate) {
        dump(model)
    }
}
```

### Paso 4:
* Creamos una celda de tipo UITableViewCell y le agregamos el siguiente delegado

```
extension MiCelda: GHSimpleTableViewCellDelegate {

    func bind(model: GHModelSimpleTableDelegate) {
    
    // Se castea parametro al modelo de datos seleccionado
    
        guard let model = model as? MiModeloDeDatos else {
            return
        }
    }
}
```

### Paso 5:
* Para poder utilizar cualquier modelo de datos es necesario agregar una extension al modelo
  de datos donde colocaremos el identificador de nuestra celda

```
struct MiModel {
    
    let id: String
    let icon: String
    let description: String
}

extension MiModel: GHModelSimpleTableDelegate {
    var reuseIdentifier: String {
        SimpleCell.id // Colocamos el identificacior de nuestra celda
    }
}
```

### Paso 6:
* En una funcion llamada setDataSource agregamos la informacion a mostrar en la tabla
* Asignamos su delegado
* Le agregamos al contenedor de la tabla, el parametro lazy var de tipo GHStrategyTableController
* Configuramos los contraints de la tabla hacia el contenedor

```
func setDataSource() {
    let arrayData = MiModelo.init().getDataForTable()           // Regresa un array que contiene id y description por cada elemento del arreglo
    self.tableViewController.setSource(listSource: arrayData)   // asignamos el Array a nuestra tabla
    
    if !self.tableViewController.tableView.isDescendant(of: self.containerForTableView) {
            
        self.tableViewController.delegate = self
        self.containerForTableView.addSubview(self.tableViewController.tableView)
        self.tableViewController.tableView.edgesToSuperview()
    }
        
    self.tableViewController.endRefreshing() // Este elemento es unicamente si estamos utilizando la propiedad de refresh controll
}
```

### Paso 6:
* Si todo fue correcto Compilamos y listo una tabla dinamica que puede utilizar cualquier tipo de celda y modelo de datos.


### Agregar: Refresh Control
* En la variable del paso 2 es necesario agregar la siguiente linea **tableViewController.addRefreshControl()**
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

