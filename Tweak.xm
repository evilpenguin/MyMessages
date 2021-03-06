/*
 * MyMessages
 *    - a tweak to do awesome things to messages
 * Version 0.0.3
 * by EvilPenguin (James Emrich)
 */

#include "MyMessages.h"

typedef NS_ENUM(char, CKColoredBalloonViewColorType) {
	CKColoredBalloonViewColorTypeReceiver 	= -0x01,
	CKColoredBalloonViewColorTypeSMS		= 0x00,
	CKColoredBalloonViewColorTypeiMessage 	= 0x01
};

static UIColor *MYMBackgroundColor = [UIColor colorWithWhite:0.29f alpha:1.0f];

#pragma mark - == CKNavigationController ==

%hook CKNavigationController

- (void) viewDidLoad {
	%orig;
	self.view.backgroundColor = MYMBackgroundColor;

	UINavigationBar *navBar = self.navigationBar;
	navBar.tintColor = [UIColor whiteColor];
	navBar.barTintColor = MYMBackgroundColor;

	NSMutableDictionary *titleDict = [NSMutableDictionary dictionaryWithDictionary:navBar.titleTextAttributes];
	titleDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
	navBar.titleTextAttributes = titleDict;
}

%end

#pragma mark - == CKConversationListController ==

%hook CKConversationListController

- (void) viewDidLoad {
	%orig;
	self.view.backgroundColor = MYMBackgroundColor;

	UISearchBar *searchBar = self.searchController.searchBar;
	searchBar.tintColor = [UIColor whiteColor];
	searchBar.barTintColor = MYMBackgroundColor;
	searchBar.keyboardAppearance = UIKeyboardAppearanceDark;
}

%end 

#pragma mark - == CKConversationListCell ==

 %hook CKConversationListCell

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	CKConversationListCell *cell = %orig;
	cell.backgroundColor = [UIColor clearColor];

	UIView *bgColorView = [[UIView alloc] init];
	bgColorView.backgroundColor = [UIColor lightGrayColor];
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
 
// Notification
- (UIColor *) notificationSubtitleColor {
	return [UIColor whiteColor];
}

// Send Button
- (UIColor *) sendButtonColorForColorType:(char)color {
	return %orig;
}

// Recipient
- (UIColor *) recipientTextColorForColorType:(char)color {
	if (color == CKColoredBalloonViewColorTypeReceiver) { 
		return [UIColor orangeColor];
	}
	else if (color == CKColoredBalloonViewColorTypeSMS) {
		return [UIColor purpleColor];
	}
	else if (color == CKColoredBalloonViewColorTypeiMessage) {
		return [UIColor colorWithRed:0.9f green:0.58f blue:0.0f alpha:1.0f];
	}
	
	return %orig;
}

- (UIColor *) recipientsDividerColor {
	return %orig;
}

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
	return MYMBackgroundColor;
}

- (UIColor *) transcriptSeparatorColor {
	return [UIColor redColor];
}

// Wave
- (UIColor *) waveformUnplayedColor {
	return [UIColor whiteColor];
}

- (UIColor *) waveformDisabledColor {
	return [UIColor whiteColor];
}

- (UIColor *) waveformColorForColorType:(char)color {
	return [UIColor whiteColor];
}

// Attachment
- (UIColor *) attachmentBalloonTitleTextColor {
	return [UIColor whiteColor];
}

- (UIColor *) attachmentBalloonActionColor {
	return [UIColor whiteColor];
}

-(UIColor *) attachmentBalloonSubtitleTextColor {
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
	return MYMBackgroundColor;
}

// Entry Field
- (UIColor *) entryFieldTextColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldAudioRecordingBaloonColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldBackgroundColor {
	return MYMBackgroundColor;
}

- (UIColor *) entryFieldGrayColor {
	return [UIColor yellowColor];
}

- (UIColor *) entryFieldCoverBorderColor {
	return MYMBackgroundColor;
}

- (UIColor *) entryFieldCoverFillColor {
	return MYMBackgroundColor;
}

- (UIColor *) entryFieldButtonColor {
	return [UIColor purpleColor];
}

// Balloon
- (NSArray<UIColor *> *) balloonColorsForColorType:(char)color { 
	if (color == CKColoredBalloonViewColorTypeReceiver) { 
		return @[[UIColor orangeColor], [UIColor orangeColor]];
	}
	else if (color == CKColoredBalloonViewColorTypeSMS) {
		return @[[UIColor purpleColor], [UIColor purpleColor]];
	}
	else if (color == CKColoredBalloonViewColorTypeiMessage) {
		return @[[UIColor colorWithRed:0.9f green:0.58f blue:0.0f alpha:1.0f], [UIColor colorWithRed:0.9f green:0.58f blue:0.0f alpha:1.0f]];
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
	else if (color == CKColoredBalloonViewColorTypeiMessage) {
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
	else if (color == CKColoredBalloonViewColorTypeiMessage) {
		return [UIColor whiteColor];
	}

	return %orig;
}

%end
