
import UIKit

private enum CellsSection: Int, CaseIterable {
    case image
    case title
    case description
}

class DetailCourseView: UIView {

    private var selectedCourse: Course?
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(CourseImageCell.self, forCellReuseIdentifier: CourseImageCell.reuseId)
        tableView.register(CourseTitleCell.self, forCellReuseIdentifier: CourseTitleCell.reuseId)
        tableView.register(CourseDescriptionCell.self, forCellReuseIdentifier: CourseDescriptionCell.reuseId)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ selectedCourse: Course) {
        self.selectedCourse = selectedCourse
    }
}



extension DetailCourseView: UITableViewDataSource, UITableViewDelegate {
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return CellsSection.allCases.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let section = CellsSection(rawValue: section)
//        
//        switch section {
//        case .image: return 1
//        case .title: return 1
//        case .description: return 1
//        default: return 0
//        }
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = CellsSection(rawValue: indexPath.section)
        
        switch section {
        case .image:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: CourseImageCell.reuseId, for: indexPath) as! CourseImageCell
            imageCell.selectionStyle = .none
            imageCell.update(selectedCourse!)
            return imageCell
            
        case .title:
            let titleCell = tableView.dequeueReusableCell(withIdentifier: CourseTitleCell.reuseId, for: indexPath) as! CourseTitleCell
            titleCell.selectionStyle = .none
            titleCell.update(selectedCourse!)
            return titleCell
            
        case .description:
            let descriptionCell = tableView.dequeueReusableCell(withIdentifier: CourseDescriptionCell.reuseId, for: indexPath) as! CourseDescriptionCell
            descriptionCell.selectionStyle = .none
            descriptionCell.update(selectedCourse!)
            return descriptionCell
            
        default:
            return UITableViewCell()
        }
    }
}



extension DetailCourseView {
    
    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 20
    }
    
    func setupViews() {
        tableView.addSubview(self)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}

