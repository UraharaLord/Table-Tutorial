#  Implementar GHStrategyTableController

### Paso 1:
* Importamos en nuestra Clases la siguiente libreria "ghmjolnircore"
* En nuestro VC crear un outlet hacia un UIVIew este sera nuestro contenedor para la tabla "containerForTableview"

```IBOutlet
@IBOutlet weak var containerForTableView: UIView!
```
* En NibList puede ir entre comillas dobles el nombre del identificador de la celda


```Creamos un lazy var de la siguiente manera
internal lazy var tableViewController: GHStrategyTableController = {
    let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
    tableViewController.delegate = self
    return tableViewController
}()
```

