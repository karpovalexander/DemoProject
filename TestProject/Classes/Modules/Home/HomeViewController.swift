//
//  HomeViewController.swift
//  TestProject


import UIKit
import ReactiveSwift
import ReactiveCocoa
import TableKit

class HomeViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    lazy var viewModel: HomeViewModelProtocol = HomeViewModel(router: HomeRouter(sourceViewController: self))
    private lazy var tableDirector = TableDirector(tableView: tableView)
    
    let keyboardStatus = MutableProperty<(CGFloat, TimeInterval, UIView.AnimationOptions)?>(nil)
    
    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.backgroundColor = UIColor.clear
        searchBar.returnKeyType = .default
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.placeholder = L10n.Home.SearchBar.placeholder
        var textFieldInsideSearchBar = searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.backgroundColor = Color.searchBarField
        textFieldInsideSearchBar?
            .reactive
            .controlEvents(.primaryActionTriggered)
            .observeValues {
            textField in
            textField.resignFirstResponder()
        }
        return searchBar
    }()
    
    // MARK: - lifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        loadData()
        setupKeyboardHandler()
    }
    
    // MARK: - Actions
    
    @IBAction private func infoButtonAction(_ sender: UIButton) {
        self.viewModel.showInfo()
    }
    
    // MARK: - Private
    
    private func configureUI() {
        navigationItem.titleView = searchBar
        
        view.backgroundColor = Color.background
        
        tableView.sectionFooterHeight = CGFloat.leastNormalMagnitude
    }
    
    private func setupKeyboardHandler() {
        keyboardStatus.producer.startWithValues { keyboard in
            guard let (height, duration, options) = keyboard else { return }
            UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
                self.tableView.contentInset.bottom = height
            }, completion: nil)
        }
        
        let center = NotificationCenter.default.reactive
        let keyboardNotifications = Signal.merge(
            center.notifications(forName: UIResponder.keyboardWillChangeFrameNotification),
            center.notifications(forName: UIResponder.keyboardWillHideNotification),
            center.notifications(forName: UIResponder.keyboardWillShowNotification)
        )
        keyboardStatus <~ keyboardNotifications.map { $0.parseKeyboardNotification() }
    }
    
    private func loadData() {
        showLoader()
        viewModel.loadData()
            .observe(on: QueueScheduler.main)
            .startWithResult { [weak self] (result) in
                guard let `self` = self else { return }
                self.hideLoader()
                self.configureDirector()
        }
    }
    
    private func configureDirector() {
        tableDirector.clear()
        
        let generalSection = TableSection()
        
        if let vm = viewModel.categoryViewModel {
            let categoryRow = TableRow<CategoryTableViewCell>(item: vm)
            generalSection.append(row: categoryRow)
        }
        
        if let vm = viewModel.bannersViewModel {
            generalSection.append(row: TableRow<BannersTableViewCell>(item: vm))
        }
        
        let sections = viewModel.offerSectionViewModels.map { sectionViewModel -> TableSection in
            let headerView = OfferSectionHeaderView.loadFromNib()
            headerView.configure(viewModel: sectionViewModel)
            let rows = sectionViewModel.items.map { offerViewModel -> TableRow<OfferTableViewCell> in
                return TableRow<OfferTableViewCell>(item: offerViewModel).on(.canDelete) { (options) -> Bool in
                    return true
                }.on(.canEdit) { (options) -> Bool in
                    return true
                }
            }
            return TableSection(headerView: headerView, footerView: nil, rows: rows)
        }
        
        tableDirector.append(section: generalSection)
        tableDirector.append(sections: sections)
        tableDirector.reload()
    }
}
