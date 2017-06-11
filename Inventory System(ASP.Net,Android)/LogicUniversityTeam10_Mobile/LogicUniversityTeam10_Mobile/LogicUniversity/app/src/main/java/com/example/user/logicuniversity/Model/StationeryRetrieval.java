package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Htet Zar Chi Aung.
 */

public class StationeryRetrieval extends java.util.HashMap<String,String> {

    public StationeryRetrieval(String binId,String itemName,String quantity,String deptId,int needed,int actual,String deptReqId){
        put("binId", binId);
        put("itemName", itemName);
        put("quantity", quantity);
        put("deptId",deptId);
        put("needed",Integer.toString(needed));
        put("actual",Integer.toString(actual));
        put("deptReqId",deptReqId);
    }

    public StationeryRetrieval(){}

    public static List<StationeryRetrieval> listStationeryRetrieval() {
        List<StationeryRetrieval> list = new ArrayList<StationeryRetrieval>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host+"/GetItemNeeded/");
            for (int i=0; i<a.length(); i++) {
                StationeryRetrieval s = new StationeryRetrieval();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("binId", jObject.getString("BinId"));
                s.put("itemName", jObject.getString("ItemName"));
                s.put("quantity", jObject.getString("Quantity"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        Log.i("StationeryRetrieval","listStationeryRetrieval() " + list);
        return list;
    }


    public static List<StationeryRetrieval> listDepartmentItems(String itemName) {
        List<StationeryRetrieval> list = new ArrayList<StationeryRetrieval>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host+"/GetDepartmentNeeded/"+itemName);
            for (int i=0; i<a.length(); i++) {
                StationeryRetrieval s = new StationeryRetrieval();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("deptId", jObject.getString("DepartmentId"));
                s.put("needed", jObject.getString("NeededQuantity"));
                s.put("actual", jObject.getString("ActualQuantity"));
                s.put("deptReqId", jObject.getString("DepartmentRequisitionId"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        Log.i("StationeryRetrieval","listDepartmentItems() " + list);
        return list;
    }

    public static void updateRetrievalList(List<StationeryRetrieval> list,String itemName) {
        JSONArray jsonArray = new JSONArray();
        for(StationeryRetrieval sr : list){
            JSONObject json = new JSONObject();
            try {
                json.put("ItemName", itemName);
                json.put("ActualQuantity", sr.get("actual"));
                json.put("DepartmentId", sr.get("deptId"));
                json.put("DepartmentRequisitionId", sr.get("deptReqId"));
                jsonArray.put(json);
            } catch (Exception e) {
            }
        }
        Log.i("StationeryRetrieval","updateRetrievalList() " + jsonArray.toString());
        String result = JSONParser.postStream(StaffRequisition.host+"/updateStationeryRetrievalList", jsonArray.toString());
    }
}
