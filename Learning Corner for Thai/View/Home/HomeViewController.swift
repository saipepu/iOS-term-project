//
//  HomeViewController.swift
//  Learning Corner for Thai
//
//  Created by Swan Nay Phue Aung on 29/08/2024.
//

import UIKit
import GoogleSignIn
import Combine


class HomeViewController: UIViewController {
    
    //MARK: - Variables
//    private let leaderboardStats = UserMock.shared.users
    private let usersVM : GetAllUserViewModel
//    private let courses = CourseMock.instance.courses
    private let coursesVM : GetCourseViewModel
    
    // for fetching current user
    //let currentUserVM = GetUserByUserIdViewModel.instance
    
    // for displaying all users in leaderboard
   // let allUsersVM = GetAllUserViewModel.instance
    
    // for fetching courses
   // let coursesVM = GetCourseViewModel.instance
    private let searchBar = ReusableSearchBar()
    private let courseCell = CourseCell()

    private let googleService = GoogleService()
    

    //MARK: - UI Components
    
    private let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView : UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private let profileImageView : UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.image = UIImage(named: "profile_1")
        profileImageView.contentMode = .scaleAspectFit
        profileImageView.tintColor = .blue
        return profileImageView
    }()
    
    
    private let switchRoleButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: Constants.roleSwtichButton), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(roleSwitched), for: .touchUpInside)
        return button
    }()
    
    private lazy var headerHStack : UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [profileImageView, switchRoleButton])
        hStack.axis = .horizontal
        hStack.distribution = .equalSpacing
        hStack.alignment = .center
        hStack.translatesAutoresizingMaskIntoConstraints = false
        return hStack
    }()
    
    private let nameCalloutLabel : UILabel = {
        let label = UILabel()
        label.applyBodyFont()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.applySecondaryLabelColor()
        label.text = "Hey, Pepu"
        label.numberOfLines = 1
        label.textAlignment = .left
        return label
    }()
    
    
    private let welcomeText : UILabel = {
        let label = UILabel()
        label.applyHeadingFont()
        label.applyPrimaryLabelColor()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        label.text = "Let’s Explore Thailand Together!"
        label.textAlignment = .left
        return label
    }()
    
    private let conversationsLabel : UILabel = {
        let label = UILabel()
        label.applySubHeadingFont()
        label.applyPrimaryLabelColor()
        label.text = "Conversations"
        label.textAlignment = .left
        return label
    }()
    
    private let seeAllButton : UIButton = {
        let button = UIButton()
        button.setTitle("see all", for: .normal)
        button.setTitleColor(UIColor(named:Theme.tint), for: .normal)
        button.addTarget(self, action: #selector(seeAllClicked), for: .touchUpInside)
        return button
    }()
    
    private lazy var courseHeadingHStack : UIStackView = {
        let hStack = UIStackView(arrangedSubviews: [conversationsLabel,seeAllButton])
        hStack.translatesAutoresizingMaskIntoConstraints = false
        hStack.axis = .horizontal
        hStack.alignment = .center
        hStack.distribution = .equalSpacing
        return hStack
    }()
    
    
    private let collectionView: UICollectionView = {
         let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .horizontal
         layout.minimumInteritemSpacing = 12
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        
         
         let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
         collectionView.translatesAutoresizingMaskIntoConstraints = false
         collectionView.showsHorizontalScrollIndicator = false
         return collectionView
     }()
    
    
    private let leaderboardHeading : UILabel = {
        let label = UILabel()
        label.applySubHeadingFont()
        label.applyPrimaryLabelColor()
        label.text = "Top 3 Learners"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private var tableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    //MARK: -Lifecycle Methods

    init(usersVM: GetAllUserViewModel, coursesVM : GetCourseViewModel ) {
            self.usersVM = usersVM
            self.coursesVM = coursesVM
            super.init(nibName: nil, bundle: nil)
        }
  
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("HomeViewController loaded")
        self.usersVM.onUsersUpdated = {
            DispatchQueue.main.async {
                print("Fetched users: \(self.usersVM.userData)") 
               self.tableView.reloadData()
            }
        }
        self.coursesVM.onCoursesUpdate = {
            DispatchQueue.main.async {
                print("Fetched courses: \(self.coursesVM.courseData)")
               self.collectionView.reloadData()
            }
        }
        
        
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        collectionView.delegate = self
        collectionView.dataSource = self
        tableView.register(LeaderboardCell.self, forCellReuseIdentifier: Constants.leaderboardCellIdentifier)
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: Constants.courseCellIdentifier)
        setUpUI()
        setUpConstraints()
        self.tableView.reloadData()
        collectionView.reloadData()

    }
    

    
    
    
    //MARK: - Set Up UI
    fileprivate func setUpUI() {
        print(tableView.frame)
   
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        courseCell.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(headerHStack)
        contentView.addSubview(nameCalloutLabel)
        contentView.addSubview(welcomeText)
        contentView.addSubview(searchBar)
        contentView.addSubview(courseHeadingHStack)
        contentView.addSubview(collectionView)
        contentView.addSubview(leaderboardHeading)
        contentView.addSubview(tableView)
        
    }
    
    //MARK: - Set Up Constraints
    fileprivate func setUpConstraints() {
        
        
        
//        if let users = allUsersVM.userData {
//            let tableViewHeight = CGFloat(users.count * 50) // 50 is the row height
            
        if let users = usersVM.userData {
            let tableViewHeight = CGFloat(  users.count * 50) // 50 is the row height
            
            NSLayoutConstraint.activate([
                
                // Scroll View Constraints
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
                scrollView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor),
                
                // Contnet View of the Scroll View Constraints
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                
                // Profile Image Size Constraints
                profileImageView.widthAnchor.constraint(equalToConstant: 65),
                profileImageView.heightAnchor.constraint(equalToConstant: 65),
                
                // Switch Role Button Size Constraints
                switchRoleButton.widthAnchor.constraint(equalToConstant: 65),
                switchRoleButton.heightAnchor.constraint(equalToConstant: 65),
                
                // Header Row Constraints
                headerHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
                headerHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                headerHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                
                // Name Label Constraints
                nameCalloutLabel.topAnchor.constraint(equalTo: headerHStack.bottomAnchor,constant: 32),
                nameCalloutLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                
                // Welcome Label Constraints
                welcomeText.topAnchor.constraint(equalTo: nameCalloutLabel.bottomAnchor, constant: 4),
                welcomeText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                welcomeText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                
                // Search Bar Constraints
                searchBar.topAnchor.constraint(equalTo: welcomeText.bottomAnchor, constant: 32),
                searchBar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                searchBar.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                searchBar.heightAnchor.constraint(equalToConstant: 50),
                
                //Course Heading HStackConstarints
                courseHeadingHStack.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 32),
                courseHeadingHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                courseHeadingHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
                
                // Collection View Constraints
                collectionView.topAnchor.constraint(equalTo: courseHeadingHStack.bottomAnchor, constant: 12),
                collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                collectionView.heightAnchor.constraint(equalToConstant: 220),
                
                
                // Leaderboard Heading Constraints
                leaderboardHeading.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 32),
                leaderboardHeading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
                
                // Table View Constraints
                tableView.topAnchor.constraint(equalTo: leaderboardHeading.bottomAnchor, constant: 12),
                tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                tableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,constant: -12),
                tableView.heightAnchor.constraint(equalToConstant: tableViewHeight)
                
            ])
            
        }
    }
    
    //MARK: - Set Up Actions
    @objc fileprivate func roleSwitched() {
        print("Role is switched")

        googleService.signOutWithGoogle()

        tableView.reloadData()

    }
    
    @objc fileprivate func seeAllClicked() {
        print("See all is clicked")
    }
    
    
}
//MARK: - Table View Delegate and Data Source Methods
extension HomeViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let allUsers = usersVM.userData else {
            print("No users found")
            return 0
        }
        print("Number of users: \(allUsers.count)") // Debugging log
        return allUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.leaderboardCellIdentifier, for: indexPath) as! LeaderboardCell
         
         guard let users = usersVM.userData else { return cell }
         
         print("Configuring cell at row: \(indexPath.row) for user: \(users[indexPath.row])") // Debugging log
         
         cell.configure(at: indexPath, user: users[indexPath.row])
         
         return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

//MARK: - Text Field Delegate Methods
extension HomeViewController : UISearchBarDelegate {
    
}

//MARK: - Text Field Delegate Methods
extension HomeViewController : UICollectionViewDelegateFlowLayout,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return coursesVM.courseData?.count ?? 0
        print("num of courses" ,coursesVM.courseData?.count ?? 0)
//        return courses.count
      }
      
      func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.courseCellIdentifier, for: indexPath) as! CourseCell
          guard let courses = coursesVM.courseData else { return cell }
          print("Configuring course cell at row: \(indexPath.row) for user: \(courses[indexPath.row])")
          cell.configure(course: courses[indexPath.row])
//          cell.configure(course: courses[indexPath.row])
          return cell
      }
      
    
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 180, height: 200) // Adjust as needed
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let course = coursesVM.courseData?[indexPath.row]
        let quizVC = QuizViewController()
              
        if let quizzez = course?.quizzes {
            quizVC.configure(quizzez: quizzez)
            navigationController?.pushViewController(quizVC, animated: true)
        }
    }
    
}
