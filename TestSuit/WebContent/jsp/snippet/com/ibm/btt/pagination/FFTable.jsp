<%@ taglib uri="/WEB-INF/bttdojo.tld" prefix="bttdojo"%>
<%request.setAttribute("dse_sessionId", session.getId()); %>
  <div style="${param.visibility}" id="${param.id}_panel" class="BTTTableStyle">
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:label id="${param.id}_label" text="FF Table"/>
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
    </div>
    <div class="BTTRowStyle">
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
      </div>
      <div class="BTTCellStyle" align="left" style="vertical-align:middle;">
        <bttdojo:table id="${param.id}_table" dataNameForList="${param.dataName}table_List" isPageable="true" operationName="PAG_snippet$com$ibm$btt$pagination$FFTable_table" directPagination="false" paginationWhenLoading="false" rowsPerPage="25">
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="filed1" dataName="filed1" noresize="false" repeat="true" id="columnId0" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="filed2" dataName="filed2" noresize="false" repeat="true" id="columnId1" headerVAlign="left"/>
          <bttdojo:column level="1" rowSpan="1" align="left" width="80" colSpan="1" hidden="false" headerHAlign="left" text="filed3" dataName="filed3" noresize="false" repeat="true" id="columnId2" headerVAlign="left"/>
        </bttdojo:table>
      </div>
    </div>
  </div>
