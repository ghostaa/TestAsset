dojo.provide("config.globalConfiguration");
dojo.require("com.ibm.btt.util.GlobalConfigurationUtil");
/**
 * This property indicates the selection list opens when the user clicks on the button at the right or anywhere on the widget.
 * Options : ["OnlyOnButton","OnWholeWidget"]
 * OnlyOnButton : This property indicates the selection list opens when the user clicks on the button at the right.
 * OnWholeWidget : This property indicates the selection list opens when the user clicks anywhere on the widget.
 */
com.ibm.btt.util.GlobalConfigurationUtil.setValue("selectList.clickModeForDropDown", "OnlyOnButton");




