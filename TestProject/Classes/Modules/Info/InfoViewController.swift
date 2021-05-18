//
//  InfoViewController.swift
//  TestProject


import UIKit

class InfoViewController: UIViewController {

    @IBOutlet private weak var closeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    private func setupUI() {
        closeButton.titleLabel?.font = Font.bold(size: 24)
        closeButton.setTitle(L10n.Info.close, for: .normal)
        closeButton.setTitleColor(Color.black, for: .normal)
    }
    

    // MARK: - Actions
    
    @IBAction private func closeButtonAction(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}
