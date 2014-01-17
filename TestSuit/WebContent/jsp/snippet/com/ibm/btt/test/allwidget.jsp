<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div style="${param.visibility}" id="${param.id}_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="${param.id}_group" text="This is a inner page">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:tabbedpane id="${param.id}_tabbedPane">
                  <bttdojo:contentpane id="${param.id}_ContentPane01" title="check">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:radio id="${param.id}_radio" dataName="${param.dataName}gender" value="1" text="male"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:radio id="${param.id}_radio01" dataName="${param.dataName}gender" value="0" text="famale"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:checkbox id="${param.id}_checkBox" dataName="${param.dataName}level.level1" checkedValue="true" text="Level 1"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:checkbox id="${param.id}_checkBox01" dataName="${param.dataName}level.level2" checkedValue="true" text="Level 2"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:image id="${param.id}_image" dataName="${param.dataName}image" tabIndex="-1"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:a id="${param.id}_link" text="baidu" action="http://www.baidu.com"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane02" title="selct">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="${param.id}_label01" text="combo"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:combo id="${param.id}_combo" dataNameForList="${param.dataName}combo" labelField="comboLabel" valueField="comboValue"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="${param.id}_label02" text="select"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:select id="${param.id}_selectList" dataNameForList="${param.dataName}select" labelField="selectLabel" valueField="selectValue"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane03" title="Multi select">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:multiSelect id="${param.id}_multiSelect" dataNameForList="${param.dataName}MultiSelect" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:checkedMultiSelect id="${param.id}_checkedMultiSelect" dataNameForList="${param.dataName}MultiSelect" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:enhancedMultiSelect id="${param.id}_checkedMultiSelectExt" dataNameForList="${param.dataName}MultiSelect" labelField="FieldForLabel" valueField="FieldForValue" selectedField="FieldForSelect" disabledField="FieldForDisable"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane04" title="richText">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:richTextEditor id="${param.id}_richText" dataName="${param.dataName}richtext"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane05" title="textArea">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:textArea id="${param.id}_textArea" dataName="${param.dataName}textArea"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:button id="${param.id}_button" type="button" text="Get hidden value"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="${param.id}_label" text="hidden value"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:button id="${param.id}_button01" type="button" text="Get script location"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:label id="${param.id}_label03" text="Label"/>
                        </div>
                      </div>
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:message id="${param.id}_message" dataName="${param.dataName}errorMessage"/>
                        </div>
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        </div>
                      </div>
                    </div>
                    <bttdojo:hidden id="${param.id}_hiddenField" dataName="${param.dataName}hiddenField"/>
                    <bttdojo:script id="${param.id}_script" location="js/keymap/globalKeyMap.js" executeOnLoad="false"/>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane06" title="table">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:table id="${param.id}_table" dataNameForList="${param.dataName}table" isPageable="false" operationName="PAG_snippet$com$ibm$btt$test$allwidget_table" directPagination="false" paginationWhenLoading="false" rowsPerPage="25">
                            <bttdojo:column level="1" rowSpan="1" widget="Button" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column0" newWindow="false" dataName="column1" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
                            <bttdojo:column level="1" rowSpan="1" widget="Content" align="left" width="150" colSpan="1" hidden="false" headerHAlign="left" text="column1" widgets="columnId1_widget0,columnId1_widget1,columnId1_widget2,columnId1_widget3" dataName="column2" noresize="false" repeat="true" id="columnId1" headerVAlign="left">
                              <bttdojo:button type="button" text="aa" cellWidgetId="columnId1_widget0"/>
                              <bttdojo:label cellWidgetId="columnId1_widget1" cellWidgetDataName="column1"/>
                              <bttdojo:a text="bb" action="#" cellWidgetId="columnId1_widget2"/>
                              <bttdojo:image location="img/G016/imgs/cards/1.jpg" tabIndex="-1" cellWidgetId="columnId1_widget3"/>
                            </bttdojo:column>
                            <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="column2" dataName="column3" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
                          </bttdojo:table>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
                  <bttdojo:contentpane id="${param.id}_ContentPane07" title="tree">
                    <div class="BTTTableStyle">
                      <div class="BTTRowStyle">
                        <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <bttdojo:tree id="${param.id}_tree" dataNameForTreeContent="${param.dataName}root"/>
                        </div>
                      </div>
                    </div>
                </bttdojo:contentpane>
              </bttdojo:tabbedpane>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
  </div>
