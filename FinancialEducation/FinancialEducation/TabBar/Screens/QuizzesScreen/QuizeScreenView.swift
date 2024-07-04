
import UIKit

class QuizeScreenView: UIView {
    
    var onOpenQuize: ((Quiz)->())?
    
    private var quizzes: [Quiz] = []
    
    private lazy var tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = .backgroundColor
        tableView.layer.cornerRadius = 20
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(QuizzesCell.self, forCellReuseIdentifier: QuizzesCell.reuseId)
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Update
    func update(_ data: [Quiz]) {
        self.quizzes = data
    }
}



extension QuizeScreenView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: QuizzesCell.reuseId, for: indexPath) as! QuizzesCell
        let data = quizzes[indexPath.row]
        cell.update(data)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let quiz = quizzes[indexPath.row]
        onOpenQuize?(quiz)
        
    }
}



extension QuizeScreenView {
    
    func setupView() {
        addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
