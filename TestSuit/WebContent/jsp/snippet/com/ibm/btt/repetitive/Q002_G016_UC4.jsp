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
          <div style="height:139px;" id="${param.id}_panel02" class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:label id="${param.id}_label" text="UC4 - Main scenario"/>
              </div>
            </div>
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                  <div id="${param.id}_panel03" class="BTTTableStyle">
                    <div class="BTTRowStyle">
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
                          <div style="height:79px;" id="${param.id}_panel04_${index}" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="nombre">                                <bttdojo:label id="${param.id}_label02_${index}" dataName="${param.dataName}products.${index}.ProductName" text="Label"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="puntos">                                <bttdojo:label id="${param.id}_label03_${index}" dataName="${param.dataName}products.${index}.RequiredPoints" text="Label"/>
</div>                              </div>
                            </div>
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
<div style="display:inline-block;width:auto;height:auto;" class="giftlink">                                <bttdojo:a id="${param.id}_link_${index}" text="Consultar  >>" action="#"/>
</div>                              </div>
                            </div>
                          </div>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                    </div>
                  </div>
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
    <tr>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
      <td align="left" valign="middle" style="vertical-align:middle;">
      </td>
    </tr>
  </table>
