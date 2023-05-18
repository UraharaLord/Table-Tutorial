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
