/////// new menu for package version display

import QtQuick 1.1
import "utils.js" as Utils
import com.victron.velib 1.0

MbPage {
	id: root
	title: defaultCount.valid ? qsTr("Active packages (tap to edit)        ") : qsTr ("Package manager not running")
    property string servicePrefix: "com.victronenergy.packageManager"
    property string settingsPrefix: "com.victronenergy.settings/Settings/PackageManager"
    property VBusItem count: VBusItem { bind: Utils.path(settingsPrefix, "/Count") }
	// use DefaultCount as an indication that PackageManager is running
    property VBusItem defaultCount: VBusItem { bind: Utils.path(servicePrefix, "/DefaultCount") }

    model: defaultCount.valid ? count.valid ? count.value : 0 : 0
    delegate: Component
    {
        MbDisplayPackageVersion
        {
            servicePrefix: root.servicePrefix
            settingsPrefix: root.settingsPrefix
            packageIndex: index
        }
    }
}
