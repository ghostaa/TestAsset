<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div style="${param.visibility}" id="${param.id}_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:image id="${param.id}_image" location="img/G016/imgs/wholelayout/head.jpg" tabIndex="-1"/>
      </div>
    </div>
  </div>
