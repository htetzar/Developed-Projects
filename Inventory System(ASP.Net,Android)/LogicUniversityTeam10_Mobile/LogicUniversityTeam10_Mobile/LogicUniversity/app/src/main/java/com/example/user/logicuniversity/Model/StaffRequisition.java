package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */

public class StaffRequisition  extends java.util.HashMap<String,String> {
    final static String host = "http://10.10.2.254/LogicUniversityWebService/Service.svc";
   // final static String host = "http://172.23.134.242/LogicUniversityWebService/Service.svc";
    public StaffRequisition(String staffRequisitionId, String staffRequisitionDate, String staffRequisitionStatus, String staffRequisitionStaffId){
        put("staffRequisitionId", staffRequisitionId);
        put("staffRequisitionDate", staffRequisitionDate);
        put("staffRequisitionStatus", staffRequisitionStatus);
        put("staffRequisitionStaffId", staffRequisitionStaffId);
    }

    public StaffRequisition(){}

    public static List<StaffRequisition> listRequisition(String depId) {
        List<StaffRequisition> list = new ArrayList<StaffRequisition>();
        try {
             JSONArray a = JSONParser.getJSONArrayFromUrl(host+"/GetRequisitionList/" + depId);
            for (int i=0; i<a.length(); i++) {
                StaffRequisition s = new StaffRequisition();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("staffRequisitionId", jObject.getString("StaffRequisitionId"));
                s.put("staffRequisitionDate", jObject.getString("StaffRequisitionDate"));
                s.put("staffRequisitionStatus", jObject.getString("StaffRequisitionStatus"));
                s.put("staffRequisitionStaffId", jObject.getString("StaffRequisitionStaffId"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        Log.i("StaffRequisition","listRequisition() depId " + depId + " list: " + list);
        return list;
    }
}
