#! /bin/bash

cat << EOF > ~/.lldbinit

command alias swift_reveal_load_sim expr dlopen("/Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/libReveal.dylib", 2)
command alias swift_reveal_load_dev expr dlopen(NSBundle.mainBundle().pathForResource("libReveal", ofType: "dylib")!, 2)
command alias swift_reveal_start expr NSNotificationCenter.defaultCenter().postNotificationName("IBARevealRequestStart", object: nil)
command alias swift_reveal_stop expr NSNotificationCenter.defaultCenter().postNotificationName("IBARevealRequestStop", object: nil)
command alias objc_reveal_load_sim expr (void*)dlopen("/Applications/Reveal.app/Contents/SharedSupport/iOS-Libraries/libReveal.dylib", 0x2);
command alias objc_reveal_load_dev expr (void*)dlopen([(NSString*)[(NSBundle*)[NSBundle mainBundle] pathForResource:@"libReveal" ofType:@"dylib"] cStringUsingEncoding:0x4], 0x2);
command alias objc_reveal_start expr (void)[(NSNotificationCenter*)[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStart" object:nil];
command alias objc_reveal_stop expr (void)[(NSNotificationCenter*)[NSNotificationCenter defaultCenter] postNotificationName:@"IBARevealRequestStop" object:nil];

EOF

echo "done"
