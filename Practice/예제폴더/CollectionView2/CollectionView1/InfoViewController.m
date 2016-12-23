#import "InfoViewController.h"

@interface InfoViewController ()

@property (weak, nonatomic) IBOutlet UIBarButtonItem *closeButton;
@property (weak, nonatomic) IBOutlet UINavigationBar *topBar;

- (IBAction)onTistoryBlog:(id)sender;
- (IBAction)onMeetkeiBlog:(id)sender;
- (IBAction)onBlueBentusSIte:(id)sender;
- (IBAction)onClose:(id)sender;

@end

@implementation InfoViewController

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.contentSizeForViewInPopover = self.view.bounds.size;
	
	if (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)
		self.topBar.topItem.leftBarButtonItem = nil;
}

- (IBAction)onTistoryBlog:(id)sender {
	NSURL* url = [[NSURL alloc] initWithString:@"http://covelist.tistory.com"];
	[[UIApplication sharedApplication] openURL:url];
}

- (IBAction)onMeetkeiBlog:(id)sender {
	NSURL* url = [[NSURL alloc] initWithString:@"http://meetkei.com"];
	[[UIApplication sharedApplication] openURL:url];
}

- (IBAction)onBlueBentusSIte:(id)sender {
	NSURL* url = [[NSURL alloc] initWithString:@"http://www.bluebentus.com"];
	[[UIApplication sharedApplication] openURL:url];
}

- (IBAction)onClose:(id)sender {
	if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
		[self dismissViewControllerAnimated:YES completion:NULL];
	}
}
@end
