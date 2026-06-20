import UIKit

final class TableStartView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)

        translatesAutoresizingMaskIntoConstraints = false
        register(CellStartView.self, forCellReuseIdentifier: CellStartView.reuseID)

        backgroundColor = .clear
        separatorStyle = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
