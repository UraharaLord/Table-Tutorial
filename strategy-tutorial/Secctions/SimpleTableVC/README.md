#  Implementar GHStrategyTableController

### Paso 1:
* Importamos en nuestra Clases la siguiente libreria "ghmjolnircore"
* En NibList puede ir entre comillas dobles el nombre del identificador de la celda

```Creamos un lazy var de la siguiente manera
    internal lazy var tableViewController: GHStrategyTableController = {
        let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
        tableViewController.delegate = self
        return tableViewController
    }()

    
