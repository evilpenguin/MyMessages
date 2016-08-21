/*
 * MyMessages
 *    - a tweak to do awesome things to messages
 * Version 0.0.1
 * by EvilPenguin (James Emrich)
 */

#include "MyMessages.h"

typedef NS_ENUM(char, CKColoredBalloonViewColorType) {
	CKColoredBalloonViewColorTypeReceiver 	= -0x01,
	CKColoredBalloonViewColorTypeSMS		= 0x00,
	CKColoredBalloonViewColorTypeSender 	= 0x01
};

#pragma mark - == CKNavigationController ==

%hook CKNavigationController

- (void) viewDidLoad {
	%orig;
	self.view.backgroundColor = [UIColor purpleColor];

	UINavigationBar *navBar = self.navigationBar;
	navBar.tintColor = [UIColor whiteColor];
	navBar.barTintColor = [UIColor purpleColor];

	NSMutableDictionary *titleDict = [NSMutableDictionary dictionaryWithDictionary:navBar.titleTextAttributes];
	titleDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
	navBar.titleTextAttributes = titleDict;
}

%end


#pragma mark - == CKConversationListController ==

%hook CKConversationListController

- (void) viewDidLoad {
	%orig;
	self.view.backgroundColor = [UIColor purpleColor];

	UISearchBar *searchBar = self.searchController.searchBar;
	searchBar.tintColor = [UIColor whiteColor];
	searchBar.barTintColor = [UIColor purpleColor];
	searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
}

%end 

#pragma mark - == CKConversationListCell ==

 %hook CKConversationListCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	CKConversationListCell *cell = %orig;
	cell.backgroundColor = [UIColor clearColor];

	UIView *bgColorView = [[UIView alloc] init];
	bgColorView.backgroundColor = [UIColor blackColor];
	cell.selectedBackgroundView = bgColorView;

	return cell;
}

- (void) layoutSubviews {
	%orig;

	UIImageView *unreadImageView = MSHookIvar<UIImageView *>(self, "_unreadIndicatorImageView");
	unreadImageView.image = [unreadImageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
	unreadImageView.tintColor = [UIColor yellowColor];
}

 %end
 

#pragma mark - == CKUIBehavior ==

%hook CKUIBehavior
 
 // Details
- (UIColor *) detailsBackgroundColor {
	return %orig;
}

// App Tint
- (UIColor *) appTintColor {
	return %orig;
}

// Keyboard
- (UIKeyboardAppearance) keyboardAppearance {
	return UIKeyboardAppearanceDark;
}

// Messages
- (UIColor *) activeRecordingDotColor {
	return [UIColor yellowColor];
}

// Transcript
- (UIColor *) transcriptTextColor {
	return [UIColor yellowColor];
}

- (UIColor *) transcriptBackgroundColor {
	return [UIColor purpleColor];
}

- (UIColor *) transcriptSeparatorColor {
	return [UIColor redColor];
}

// Attachment
- (UIColor *) attachmentBalloonTitleTextColor {
	return [UIColor whiteColor];
}

// Conversation
- (UIColor *) conversationListDateColor {
	return [UIColor whiteColor];
}
- (UIColor *) conversationListSenderColor {
	return [UIColor whiteColor];
}
- (UIColor *) conversationListSummaryColor {
	return [UIColor whiteColor];
}

-(UIColor *) conversationListGroupCountColor {
	return [UIColor whiteColor];
}

// Progress
- (UIColor *) progressBarTrackTintColor {
	return [UIColor purpleColor];
}

// Recipients
- (UIColor *) recipientsDividerColor {
	return [UIColor yellowColor];
}

// Entry Field
- (UIColor *) entryFieldTextColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldAudioRecordingBaloonColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldBackgroundColor {
	return [UIColor purpleColor];
}

- (UIColor *) entryFieldGrayColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldCoverBorderColor {
	return [UIColor purpleColor];
}

- (UIColor *) entryFieldCoverFillColor {
	return [UIColor purpleColor];
}

- (UIColor *)entryFieldButtonColor {
	return [UIColor purpleColor];
}

// Balloon
- (NSArray<UIColor *> *) balloonColorsForColorType:(char)color { 
	if (color == CKColoredBalloonViewColorTypeReceiver) { 
		return @[[UIColor orangeColor], [UIColor orangeColor]];
	}
	else if (color == CKColoredBalloonViewColorTypeSMS) {
		return @[[UIColor purpleColor], [UIColor magentaColor]];
	}
	else if (color == CKColoredBalloonViewColorTypeSender) {
		return @[[UIColor brownColor], [UIColor brownColor]];
	}
	
	return %orig;
 }

- (UIColor *) balloonTextColorForColorType:(char)color {
	if (color == CKColoredBalloonViewColorTypeReceiver) { 
		return [UIColor whiteColor];
	}
	else if (color == CKColoredBalloonViewColorTypeSMS) {
		return [UIColor whiteColor];
	}
	else if (color == CKColoredBalloonViewColorTypeSender) {
		return [UIColor whiteColor];
	}

	return %orig;
}

- (UIColor *) balloonTextLinkColorForColorType:(char)color {
	if (color == CKColoredBalloonViewColorTypeReceiver) { 
		return [UIColor whiteColor];
	}
	else if (color == CKColoredBalloonViewColorTypeSMS) {
		return [UIColor whiteColor];
	}
	else if (color == CKColoredBalloonViewColorTypeSender) {
		return [UIColor whiteColor];
	}

	return %orig;
}

%end