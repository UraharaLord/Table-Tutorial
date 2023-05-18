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
