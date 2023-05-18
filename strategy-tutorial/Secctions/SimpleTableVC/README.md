#  Implementar GHStrategyTableController

### Paso 1:
* Importamos en nuestra Clases la siguiente libreria "ghmjolnircore"
* Creamos un lazy var de la siguiente manera
* En nibList se puede colocar entre comillas dobles el identifier de la cel "Mi celda Id"

    internal lazy var tableViewController: GHStrategyTableController = {
        let tableViewController = GHStrategyTableController(nibList: [ (SimpleCell.id, .main)])
        tableViewController.delegate = self
        return tableViewController
    }()

   
