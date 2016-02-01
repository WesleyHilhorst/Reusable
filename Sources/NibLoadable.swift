import UIKit

/// Make your UIView subclasses
/// conform to this protocol when they *are* NIB-based
/// to be able to instantiate them from NIB in a type-safe manner
public protocol NibLoadable: class {
  static var nib: UINib { get }
}

// MARK: - Default implementation form NibLoadable

public extension NibLoadable {
  static var nib: UINib {
    return UINib(nibName: String(Self), bundle: nil)
  }
}

// MARK: - Support for instantiation from nib

public extension NibLoadable where Self: UIView {
  /**
   Returns a `UIView` object instantiated from nib

   - returns: A `NibLoadable`, `UIView` instance
   */
  static func loadFromNib() -> Self {
    return nib.instantiateWithOwner(nil, options: nil).first as! Self
  }
}