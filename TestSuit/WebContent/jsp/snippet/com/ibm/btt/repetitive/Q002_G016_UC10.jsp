<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <table style="${param.visibility}" class="layoutCenter" id="${param.id}_panel">
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;">
          <div class="headArea BTTTableStyle" id="${param.id}_panel01">
          </div>
      </td>
    </tr>
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listLeft">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listCenter">
          <div style="height:100px;" id="${param.id}_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="${param.id}_label" text="UC10 - ECA from widgets inside repetitive panel to widgets outside it"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="${param.id}_panel03" class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="${param.id}_selectedName" text="Label"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:repetitivepanel id="${param.id}_repetitivePanel" dataNameForList="${param.dataName}products">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:image id="${param.id}_image_${index}" dataName="${param.dataName}products.${index}.ProductImageURL" tabIndex="-1"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:button id="${param.id}_button_${index}" type="button" text="Get Name"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                          <div id="${param.id}_panel04_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre">                                <bttdojo:label id="${param.id}_productName_${index}" dataName="${param.dataName}products.${index}.ProductName"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                  <div id="${param.id}_panel05_${index}" class="BTTTableStyle">
                                    <div class="BTTRowStyle">
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="${param.id}_label01_${index}" text="Click button "/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="${param.id}_label02_${index}" text="0"/>
                                      </div>
                                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                        <bttdojo:label id="${param.id}_label03_${index}" text="times"/>
                                      </div>
                                    </div>
                                  </div>
                              </div>
                            </div>
                          </div>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
                  <bttdojo:hidden id="${param.id}_hiddenField_${index}"/>
              </bttdojo:repetitivepanel>
              </div>
            </div>
          </div>
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;" class="listRight">
      </td>
    </tr>
    <tr>
      <td colspan="3" align="left" valign="middle" style="vertical-align:middle;" class="footArea">
      </td>
    </tr>
  </table>
