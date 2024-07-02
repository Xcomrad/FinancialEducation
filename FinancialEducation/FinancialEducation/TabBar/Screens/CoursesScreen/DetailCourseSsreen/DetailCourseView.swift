
import UIKit

class DetailCourseView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        return scrollView
    }()
    
    private lazy var contentView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    private lazy var courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "fin")
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 30
        imageView.layer.borderColor = UIColor.borderColor.cgColor
        imageView.layer.borderWidth = 0.5
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Знакомство с финансами"
        label.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    private lazy var subititleLabel: UILabel = {
        let label = UILabel()
        label.text = """
            Финансовая грамотность - это набор навыков и знаний, которые помогают не тратить лишнего и приумножать накопления. \n К ним относятся планирование бюджета, знание кредитных и страховых продуктов, умение распоряжаться деньгами, правильно оплачивать счета, инвестировать и откладывать. \n Финансовая грамотность похожа на школьный предмет. Вы начинаете с базовых принципов и со временем осваиваете все больше полезных инструментов. \n Есть три основных основных подхода, которыми пользуются люди, умеющие обращаться с деньгами. \n 1. Формировать «подушку безопасности». Она спасет в чрезвычайной ситуации вроде потери работы или серьезной поломки машины. Минимальный размер резервов — доходы за 3–6 месяцев, оптимальный — за 12 месяцев. Например, с зарплатой в ₽50 тыс. минимальная подушка безопасности будет ₽150–300 тыс., а оптимальная— ₽600 тыс. Если у вас есть дети, резервы нужно увеличить. \n 2. Инвестировать в будущее. Нельзя брать новые кредиты, пока не выплатили текущие, а также тратить кредитные деньги на развлечения и одежду. Стоит задуматься о пенсионных отчислениях и страховании, вкладывать в обучение и покупать только ту технику, которая нужна для работы. Например, если вы дизайнер, хорошим приобретением будет мощный компьютер, который потянет сложные программы по 3D-моделированию и поможет больше зарабатывать. \n 3. Вести ежемесячный бюджет. Чтобы научиться тратить меньше, чем вы получаете, следует вести бюджет. Нужно учитывать доходы: зарплату, инвестиции, налоговые вычеты; фиксированные расходы: арендные, коммунальные и кредитные платежи; переменные издержки: питание, покупки, поездки и развлечения; сбережения. \n Правильное отношение к деньгам — основа жизненной философии финансово грамотного человека. Для этого нужно развить финансовое мышление и поддерживать дисциплину.
            """
        
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .textColor
        return label
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
}



extension DetailCourseView {
    
    func setup() {
        backgroundColor = .darckColor
        layer.cornerRadius = 30
    }
    
    func setupViews() {
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addArrangedSubview(courseImageView)
        contentView.addArrangedSubview(titleLabel)
        contentView.addArrangedSubview(subititleLabel)
    }
    
    func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
        }
        
        courseImageView.snp.makeConstraints { make in
            make.width.equalTo(contentView)
        }
        
        subititleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(contentView).inset(20)
        }
    }
}


