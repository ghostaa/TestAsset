<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div style="${param.visibility}" id="${param.id}_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:group id="${param.id}_group" text="Include page - login">
          <div class="BTTTableStyle">
            <div class="BTTRowStyle">
              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                <bttdojo:form id="${param.id}_form" errorPage="snippet/com/ibm/btt/test/login.jsp">
                  <div class="BTTTableStyle">
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="${param.id}_label" text="username"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="${param.id}_text" dataName="${param.dataName}User.UserName" type="String"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:label id="${param.id}_label01" text="password"/>
                      </div>
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                        <bttdojo:textbox id="${param.id}_text01" dataName="${param.dataName}User.UserPassword" type="String" password="true"/>
                      </div>
                    </div>
                    <div class="BTTRowStyle">
                      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                      </div>
                      <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                          <div id="${param.id}_panel01" class="BTTTableStyle">
                            <div class="BTTRowStyle">
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="${param.id}_fill" type="button" text="auto fill"/>
                              </div>
                              <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
                                <bttdojo:button id="${param.id}_button01" type="reset" text="reset"/>
                              </div>
                              <div class="BTTCellStyle" align="right" style="vertical-align:middle;">
                                <bttdojo:button id="${param.id}_button" type="submit" text="login" flowEvent="login"/>
                              </div>
                            </div>
                          </div>
                      </div>
                    </div>
                  </div>
              </bttdojo:form>
              </div>
            </div>
          </div>
      </bttdojo:group>
      </div>
    </div>
  </div>
