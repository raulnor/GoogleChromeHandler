build: GoogleChromeHandler.app/Contents/MacOS/*
	mkdir -p GoogleChromeHandler.app/Contents/MacOS
	cp Info.plist GoogleChromeHandler.app/Contents/
	mkdir -p GoogleChromeHandler.app/Contents/Resources
	cp AppIcon.icns GoogleChromeHandler.app/Contents/Resources/
	swiftc main.swift -o GoogleChromeHandler.app/Contents/MacOS/GoogleChromeHandler -framework Cocoa

install:
	cp -R GoogleChromeHandler.app ~/Applications
	open ~/Applications/GoogleChromeHandler.app

clean:
	rm -r GoogleChromeHandler.app

.PHONY: build