#include <Geode/Geode.hpp>
#include <Geode/modify/MenuLayer.hpp>

using namespace geode::prelude;

class $modify(MenuLayer) {
	bool init() {
		auto res = MenuLayer::init();
		if(!res) return false;

		auto bottomMenu = this->getChildByID("bottom-menu");
		if(!bottomMenu) {
			log::error("bottom-menu not found");
			return true;
		}

		auto ngButton = bottomMenu->getChildByID("newgrounds-button");
		if(!ngButton) {
			log::error("newgrounds-button not found");
			return true;
		}

		auto ngButtonSprite = ngButton->getChildren()->objectAtIndex(0);
		if(!ngButtonSprite) {
			log::error("newgrounds-button CCSprite not found");
			return true;
		}

		static_cast<CCNode*>(ngButtonSprite)->setScale(0.92);
		bottomMenu->updateLayout();

		return true;
	} 
};
