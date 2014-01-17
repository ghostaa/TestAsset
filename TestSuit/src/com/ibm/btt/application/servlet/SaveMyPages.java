package com.ibm.btt.application.servlet;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ibm.btt.base.Context;
import com.ibm.btt.base.DSEInvalidArgumentException;
import com.ibm.btt.base.DSEInvalidRequestException;
import com.ibm.btt.base.DSEObjectNotFoundException;
import com.ibm.btt.base.DataElement;
import com.ibm.btt.base.IndexedCollection;
import com.ibm.btt.base.KeyedCollection;
import com.ibm.btt.channel.SessionHandler;
import com.ibm.json.java.JSONArray;
import com.ibm.json.java.JSONObject;

public class SaveMyPages extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		if (req.getContentType().indexOf("application/json") > -1) {
			StringBuffer jb = new StringBuffer();
			String line = null;
			JSONObject json = null;
			try {
				BufferedReader reader = req.getReader();
				while ((line = reader.readLine()) != null)
					jb.append(line);
			} catch (Exception e) { /* report an error */
			}
			try {
				json = JSONObject.parse(jb.toString());
			} catch (Exception e) {
				// crash and burn
				throw new IOException("Error parsing JSON request string");
			}

			System.out.println(json.toString());
			JSONObject mypages = (JSONObject) json.get("myPages");
			JSONArray currentContainer = (JSONArray) mypages
					.get("currentPortletsContainer");
			JSONArray deployedPortlets = (JSONArray) mypages
					.get("deployedPortlets");

			try {
				Context ctx = SessionHandler.findCurrentContextForSession(req
						.getSession().getId());
				KeyedCollection skc = ctx.getKeyedCollection();
				KeyedCollection smp = (KeyedCollection) skc
						.tryGetElementAt("myPages");
				IndexedCollection sContainer = (IndexedCollection) smp
						.tryGetElementAt("currentPortletsContainer");
				IndexedCollection sPortlets = (IndexedCollection) smp
						.tryGetElementAt("deployedPortlets");

				sContainer.removeAll();
				for (int i = 0; i < currentContainer.size(); i++) {
					JSONObject x = (JSONObject) currentContainer.get(i);
					KeyedCollection col = (KeyedCollection) sContainer
							.createElement(false);
					col.trySetValueAt("index", x.get("index"));
					col.trySetValueAt("width", new Double(String.valueOf(x.get("width"))));
					sContainer.addElement(col);
				}
				sPortlets.removeAll();
				for (int i = 0; i < deployedPortlets.size(); i++) {
					JSONObject x = (JSONObject) deployedPortlets.get(i);
					KeyedCollection col = (KeyedCollection) sPortlets
							.createElement(false);
					col.trySetValueAt("title", x.get("title"));
					col.trySetValueAt("url", x.get("url"));
					col.trySetValueAt("closable", x.get("closable"));
					col.trySetValueAt("content", x.get("content"));
					col.trySetValueAt("open", x.get("open"));
					col.trySetValueAt("columnId", x.get("columnId"));
					col.trySetValueAt("rowId", x.get("rowId"));
					sPortlets.addElement(col);
				}

			} catch (DSEInvalidRequestException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DSEObjectNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DSEInvalidArgumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			resp.setStatus(200);
			resp.flushBuffer();
		} else {
			resp.sendError(401);
		}

	}
}
