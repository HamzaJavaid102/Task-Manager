//
//  Bundle.swift
//  QCSM4
//
//  Created by Yasir Basharat on 27/02/2019.
//  Copyright © 2019 Yasir Basharat. All rights reserved.
//

import Foundation

extension Bundle {

	var displayName: String? {
		return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
	}

	class func versionDisplayString() -> String {
		let dictionary = Bundle.main.infoDictionary!
		let version = dictionary["CFBundleShortVersionString"] as! String
		let build = dictionary["CFBundleVersion"] as! String
		return "\(version) build \(build)"
	}

	class func appVersion() -> String {
		return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
	}

	class func appBuild() -> String {
		return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
	}


}
