//
//  ViewController.swift
//  DropDownMenuTutorial
//
//  Created by Ngo Dang tan on 10/23/20.
//

import UIKit
private let reuseIdentifier = "DropDownCell"
enum Colors: Int, CaseIterable {
    case Purple
    case Pink
    case Teal
    
    var description: String {
        switch self {
        case .Purple:
            return "Purple"
        case .Pink:
            return "Pink"
        case .Teal:
            return "Teal"
 
        }
    }
    
    var color: UIColor {
        switch self {
        case .Purple:
            return UIColor.purple()
        case .Pink:
            return UIColor.pink()
        case .Teal:
            return UIColor.teal()
        }
    }
}
class ViewController: UIViewController {

    // MARK: - Properties
    private var tableView: UITableView!
    private var showMenu = false
    
    let colorView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 5
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.rgb(red: 17, green: 154, blue: 237)
        return view
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        configureTableView()
        
        view.addSubview(colorView)
        colorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        colorView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 32).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 300).isActive = true
    }
    
    // MARK: - Selectors
    @objc func handleDropDown(){
        showMenu = !showMenu
        var indexPaths = [IndexPath]()
        Colors.allCases.forEach { color in
            let indexPath = IndexPath(row: color.rawValue, section: 0)
            indexPaths.append(indexPath)
        }
        
        if showMenu {
            tableView.insertRows(at: indexPaths, with: .fade)
        }else{
            tableView.deleteRows(at: indexPaths, with: .fade)
        }
    }
    
    
    // MARK: - Helpers
    
    func configureTableView(){
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.isScrollEnabled = false
        tableView.rowHeight = 50
        
        tableView.register(DropDownCell.self, forCellReuseIdentifier: reuseIdentifier)
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 44).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }


}

    // MARK: - UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let button = UIButton(type: .system)
        button.setTitle("Select Color", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        
        return button
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showMenu ? Colors.allCases.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! DropDownCell
        cell.titleLabel.text = Colors(rawValue: indexPath.row)?.description
        cell.backgroundColor = Colors(rawValue: indexPath.row)?.color
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let color = Colors(rawValue: indexPath.row) else {return}
        colorView.backgroundColor = color.color
    }
    
    
}


