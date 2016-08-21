/*
 * MyMessages
 *    - a tweak to do awesome things to messages
 * Version 0.0.1
 * by EvilPenguin (James Emrich)
 */

@interface CKNavigationController : UINavigationController
@end

@interface CKComposeRecipientSelectionController : UIViewController 
@end
 
@interface CKConversationListController : UITableViewController
@property (nonatomic, retain) UISearchController *searchController;
@end

@interface UIDateLabel : UILabel
@end

@interface CKEntity : NSObject
@property (nonatomic,copy,readonly) NSString *name; 
@property (nonatomic,copy,readonly) NSString *fullName; 
- (int) identifier;
@end

@interface CKConversation : NSObject
@property (nonatomic, retain,readonly) CKEntity *recipient;
@end

@interface CKConversationListCell : UITableViewCell
@property (nonatomic,retain) CKConversation *conversation; 
@end

@interface CKNavigationBar : UINavigationBar
@end

@interface CNAvatarView : UIControl
@end

@interface CKAvatarView : CNAvatarView
@end

@interface CKViewController : UIViewController
@end

@interface CKEditableCollectionView : UICollectionView
@end

@interface CKTranscriptCollectionView : CKEditableCollectionView
@end

@interface CKTranscriptCollectionViewController : CKViewController
@property (nonatomic,retain) CKTranscriptCollectionView *collectionView;  
@end

@interface CKGradientView : UIView
@property (nonatomic,retain) NSArray *colors;
@end

@interface CKBalloonTextView : UITextView
@end

@interface CKTextBalloonView : UIView
@property (nonatomic,retain) CKBalloonTextView *textView; 
@property (nonatomic,retain) CKGradientView *gradientView;
@property (assign, nonatomic) char color;
@end
