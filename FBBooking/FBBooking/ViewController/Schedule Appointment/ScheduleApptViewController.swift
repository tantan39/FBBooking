//
//  ScheduleApptViewController.swift
//  FBBooking
//
//  Created by Tan Tan on 3/30/21.
//

import UIKit
import RxCocoa
import RxSwift
import SVProgressHUD

class ScheduleApptViewController: BaseViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.chooseDateAndTime
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let dateTimePickerView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    private let serviceLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.service
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private let addServiceButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.addService, for: .normal)
        button.setTitleColor(.primary1, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    private let addServiceCustomView: AddServicesCustomView = {
        let view = AddServicesCustomView()
        return view
    }()
    
    private let noteTextView: UITextView = {
        let textView = UITextView()
        textView.layer.cornerRadius = 5.0
        textView.layer.borderWidth = 1.0
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.text = TextManager.leaveANote
        textView.textColor = .lightGray
        return textView
    }()
    
    private let submitButton: FBRoundedCornerButton = {
        let button = FBRoundedCornerButton()
        button.backgroundColor = .primary1
        button.setTitleColor(UIColor.white, for: .normal)
        button.setTitle(TextManager.bookNow, for: .normal)
        return button
    }()
    
    override func setupUIComponents() {
        self.navigationItem.title = TextManager.scheduleAppt
        self.view.backgroundColor = .white
        
        setupTitleLabel()
        setupDateTimeView()
        setupServiceLabel()
        setupAddServiceButton()
        setupAddServiceView()
        setupNoteTextView()
        setupSubmitButton()
        
        handleObservers()
    }
    
    private func handleObservers() {
        self.submitButton.rx.controlEvent(.touchUpInside).subscribe { [weak self] (_) in
            guard let self = self else { return }
            let confirmRouter = ConfirmationRoute()
            SVProgressHUD.show()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                SVProgressHUD.dismiss()
                confirmRouter.navigate(from: self, transitionType: .present, animated: false)
            }
            
        }
    }
    
    private func setupTitleLabel() {
        self.view.addSubview(self.titleLabel)
        self.titleLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.view.safeAreaLayoutGuide.snp.topMargin).offset(Dimension.shared.normalVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
        }
    }
    
    private func setupDateTimeView() {
        self.view.addSubview(self.dateTimePickerView)
        self.dateTimePickerView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.titleLabel.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalVerticalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalVerticalMargin)
            maker.height.equalTo(self.view.bounds.height*0.5)
        }
    }
    
    private func setupServiceLabel() {
        self.view.addSubview(self.serviceLabel)
        self.serviceLabel.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.dateTimePickerView.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            maker.leading.equalTo(self.dateTimePickerView)
            
        }
    }
    
    private func setupAddServiceButton() {
        self.view.addSubview(self.addServiceButton)
        self.addServiceButton.snp.makeConstraints { (maker) in
            maker.top.centerY.equalTo(self.serviceLabel)
            maker.trailing.equalTo(self.dateTimePickerView.snp.trailing)
        }
    }
    
    private func setupAddServiceView() {
        self.view.addSubview(self.addServiceCustomView)
        self.addServiceCustomView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.serviceLabel.snp.bottom)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalHorizontalMargin)
        }
    }
    
    private func setupNoteTextView() {
        self.view.addSubview(self.noteTextView)
        self.noteTextView.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.addServiceCustomView.snp.bottom).offset(Dimension.shared.mediumVerticalMargin)
            maker.leading.equalToSuperview().offset(Dimension.shared.normalHorizontalMargin)
            maker.trailing.equalToSuperview().offset(-Dimension.shared.normalHorizontalMargin)
            maker.height.equalTo(30)
        }
    }
    
    private func setupSubmitButton() {
        self.view.addSubview(self.submitButton)
        self.submitButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.noteTextView.snp.bottom).offset(Dimension.shared.normalVerticalMargin)
            maker.leading.trailing.equalTo(self.noteTextView)
            maker.height.equalTo(Dimension.shared.buttonHeight)
        }
    }
}
