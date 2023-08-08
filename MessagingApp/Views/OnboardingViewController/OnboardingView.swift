//
//  ViewController.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 07.08.2023.
//

import UIKit

final class OnboardingView: SuperViewController {
    
    let onboardingArray: [OnboardingModel] = [
        OnboardingModel(image: UIImage(named: "1"), title: "Create an account", subtitle: "Connect with people around the world", message: "Users will be able to go live, chat and meet with people near by"),
        OnboardingModel(image: UIImage(named: "2"), title: "Log in to your account", subtitle: "Let's build connection with new peoples", message: "Connect helps you locate the people around you who are closet from your home town!"),
        OnboardingModel(image: UIImage(named: "3"), title: "Char with friends", subtitle: "Fell the happiness", message: "Find a new friends and start chatting")]
    
    
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal
        viewLayout.minimumLineSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.isPagingEnabled = true
        collectionView.isDirectionalLockEnabled = true
        collectionView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0)
        return collectionView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .blue
        pageControl.pageIndicatorTintColor = .black
        pageControl.tintColor = .gray
        pageControl.layer.cornerRadius = (pageControl.frame.height / 2)
        return pageControl
        
    }()
    
    let stackView = OnboardingStackView()
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = onboardingArray.count
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        collectionView.reloadData()
    }
    
    
}
@objc extension OnboardingView {
    func toNextView() {
        navigationController?.pushViewController(SignInView(), animated: true)
        
    }
}
extension OnboardingView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.identifier, for: indexPath) as! OnboardingCell
        cell.setup(with: onboardingArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageControl.currentPage = indexPath.row
    }
    
    
    
}

extension OnboardingView {
    
    override func setupViews() {
        super.setupViews()
//        view.addView(view: backgroundImage)
        view.addView(view: collectionView)
        view.addView(view: pageControl)
        view.addView(view: stackView)
        
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            
//            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: (view.frame.height * 2) / 3),
            
            
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 5),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 25),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
    }
    override func configureAppearance() {
        let button1 = UIBarButtonItem(title: "Skip", image: UIImage(named: "arrow.right"), target: self, action: #selector(toNextView))
        self.navigationItem.rightBarButtonItem  = button1
        view.backgroundColor = .white
        
    }
    
}

