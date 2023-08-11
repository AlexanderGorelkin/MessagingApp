//
//  ViewController.swift
//  MessagingApp
//
//  Created by Александр Горелкин on 07.08.2023.
//

import UIKit


protocol stackViewControllerDelegate: AnyObject {
    
    func skipButtonPressed()
    func nextButtonPressed()
    
}

final class OnboardingViewController: SuperViewController {
    
    
    
    private let onboardingArray: [OnboardingModel] = [
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
        collectionView.isUserInteractionEnabled = false
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
    
    private let stackView = OnboardingStackView()
    
    private let buttonToNext: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Get start", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = R.Colors.blue
        button.addTarget(self, action: #selector(toSignInView), for: .touchUpInside)
        return button
    }()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = onboardingArray.count
        collectionView.delegate = self
        collectionView.dataSource = self
        stackView.delegate = self
        collectionView.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.identifier)
        collectionView.reloadData()
    }
    
    
}
@objc extension OnboardingViewController {
    func toSignInView() {
        self.navigationController?.pushViewController(SigninViewController(), animated: true)
        UserDefaults.standard.hasOnboarded = true
    }
}
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, stackViewControllerDelegate {
    func nextButtonPressed() {
        
        if pageControl.currentPage == onboardingArray.count - 1 {
            self.stackView.removeFromSuperview()
            self.view.addView(view: buttonToNext)
            buttonToNext.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            buttonToNext.topAnchor.constraint(equalTo: pageControl.bottomAnchor, constant: 25).isActive = true
            buttonToNext.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
            buttonToNext.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        } else {
            pageControl.currentPage += 1
            collectionView.scrollToItem(at: IndexPath(item: pageControl.currentPage, section: 0), at: .centeredHorizontally, animated: true)
        }
        
        
        
        
        
    }
    
    func skipButtonPressed() {
        self.navigationController?.pushViewController(SigninViewController(), animated: true)
        UserDefaults.standard.hasOnboarded = true
    }
    
    
    
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

extension OnboardingViewController {
    
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
            stackView.heightAnchor.constraint(equalToConstant: 40),
            
            
            
            
            
            
        ])
    }
    override func configureAppearance() {
        view.backgroundColor = .white
        
    }
    
}

