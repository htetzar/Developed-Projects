package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONObject;

/**
 * Created by Zaw Myo Htet.
 */

public class Delegation extends java.util.HashMap<String,String> {

    public Delegation(int delegateId, String departmentHeadId, String staffId, String startDate, String endDate, String staffName, String roleName)
    {
        put("delegateId",Integer.toString(delegateId));
        put("departmentHeadId",departmentHeadId);
        put("staffId",staffId);
        put("startDate",startDate);
        put("endDate",endDate);
        put("staffName", staffName);
        put("roleName", roleName);
    }

    public Delegation(){}

    public static Delegation GetDelegation(String depId){
        String url = String.format("%s/CheckDelegationStatus/%s", StaffRequisition.host, depId);
        JSONObject b = JSONParser.getJSONFromUrl(url);
        Delegation d = new Delegation();
        try {
            if(b.isNull("DelegateId")|| b.getInt("DelegateId") == 0){
                // throw new Exception();
                d = null;
            }else{
                d.put("delegateId", Integer.toString(b.getInt("DelegateId")));
                d.put("departmentHeadId", b.getString("DepartmentHeadId"));
                d.put("staffId", b.getString("StaffId"));
                d.put("roleName", b.getString("RoleName"));
                d.put("startDate", b.getString("StartDate"));
                d.put("endDate", b.getString("EndDate"));
                d.put("staffName", b.getString("StaffName"));
                d.put("roleName", b.getString("RoleName"));
            }
        } catch (Exception e) {
            Log.e("Staff.Login()", "JSONArray error");
        }
        Log.i("Delegation","GetDelegation() d: " + d);
        return d;
    }

    public static void SaveDelegateInfo(Delegation delegation) {
        JSONObject json = new JSONObject();
        try {
            //json.put("delegateId", delegation.get("delegateId"));
            json.put("DepartmentHeadId", delegation.get("departmentHeadId"));
            json.put("StaffId", delegation.get("staffId"));
            json.put("StaffName", delegation.get("staffName"));
            json.put("RoleName", delegation.get("roleName"));
            json.put("StartDate", delegation.get("startDate"));
            json.put("EndDate", delegation.get("endDate"));
        } catch (Exception e) {
        }
        Log.i("Delegation","SaveDelegatInfo " + json.toString());
        String result = JSONParser.postStream(StaffRequisition.host+"/SaveDelegationInfo", json.toString());
    }

    public static void TerminateDelegation(String deptId) {
        Log.i("Delegation","TerminateDelegatioon ");
        String url = String.format("%s/TerminateDelegation/%s", StaffRequisition.host, deptId);
        JSONParser.getStream(url);
    }
}
