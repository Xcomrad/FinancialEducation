
import UIKit

class CoursesScreenView: UIView {
    
    var onSelectedCourse: ((Course)->())?
    
    private var courses: [Course] = []
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: UIScreen.main.bounds.width - 40, height: 250)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .backgroundColor
        
        collectionView.register(CourseCell.self, forCellWithReuseIdentifier: CourseCell.reuseId)
        return collectionView
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
    func update(_ data: [Course]) {
        courses = data
    }
}



extension CoursesScreenView {
    
    func setup() {
        backgroundColor = .backgroundColor
    }
    
    func setupViews() {
        addSubview(collectionView)
    }
    
    func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}



extension CoursesScreenView: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        onSelectedCourse?(course)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CourseCell.reuseId, for: indexPath) as! CourseCell
        let data = courses[indexPath.row]
        cell.update(data)
        return cell
    }
}
