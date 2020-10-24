import UIKit

@IBDesignable
class NibViewInitializer: UIView {

    @IBOutlet var contentView: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        if subviews.isEmpty {
            loadNib()
        }
    }

    private func loadNib() {
        let ttt = type(of: self)
        let classString = String(describing: ttt)
        let bundle = Bundle(for: ttt)

        if UINib(nibName: classString, bundle: bundle).instantiate(
            withOwner: self,
            options: nil).first as? UIView != nil {
            
            awakeFromNib()

            addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                contentView.topAnchor.constraint(equalTo: topAnchor),
                contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
                contentView.trailingAnchor.constraint(equalTo: trailingAnchor)
            ])
        }
        viewLoaded()
    }

    func viewLoaded() {
        // custom implementation
    }
}
