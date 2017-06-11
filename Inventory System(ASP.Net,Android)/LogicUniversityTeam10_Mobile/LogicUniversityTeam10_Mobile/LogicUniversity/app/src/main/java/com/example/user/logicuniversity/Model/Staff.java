package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZawMyoHtet.
 */

public class Staff extends java.util.HashMap<String,String> {

    public Staff(String staffId, String password, String staffName, int roleId, String departmentId, String email, String phoneNumber, String address, String emailPassword, String roleName, String departmentName, String departmentHeadId){
        put("staffId",staffId);
        put("password",password);
        put("staffName",staffName);
        put("roleId", Integer.toString(roleId));
        put("departmentId",departmentId);
        put("email",email);
        put("phoneNumber",phoneNumber);
        put("address",address);
        put("emailPassword",emailPassword);
        put("roleName",roleName);
        put("departmentName",departmentName);
        put("departmentHeadId", departmentHeadId);
    }

    public Staff(){
    }

    public static Staff Login(String userId, String password){
        String url = String.format("%s/Login/%s/%s", StaffRequisition.host, userId, password);
        // JSONObject b = JSONParser.getJSONFromUrl(StaffRequisition.host + "/Login/" + userId + "/" + password);
        JSONObject b = JSONParser.getJSONFromUrl(url);
        Staff staff = new Staff();
        try {
            if(b.isNull("StaffName") || b.getInt("RoleId") == 0){
                 staff = null;
            }else {
                staff = new Staff(b.getString("StaffId"), b.getString("Password"),
                        b.getString("StaffName"), b.getInt("RoleId"),
                        b.getString("DepartmentId"), b.getString("Email"), b.getString("PhoneNumber"),
                        b.getString("Address"), b.getString("EmailPassword"), b.getString("RoleName"), b.getString("DepartmentName"), b.getString("DepartmentHeadId"));
            }
        } catch (Exception e) {
            Log.e("Staff.Login()", "JSONArray error" + e);
        }
        Log.i("Staff","Login() staff: " + staff);
        return staff;
    }

    public static List<Staff> listStaff(String depId, String staffId) {
        String url = String.format("%s/GetStaffNameByDepartmentId/%s/%s", StaffRequisition.host, depId, staffId);
        List<Staff> list = new ArrayList<Staff>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(url);
            for (int i=0; i<a.length(); i++) {
                JSONObject jObject = new JSONObject(a.getString(i));
                Staff s = new Staff(jObject.getString("StaffId"), jObject.getString("Password"),
                        jObject.getString("StaffName"), jObject.getInt("RoleId"),
                        jObject.getString("DepartmentId"), jObject.getString("Email"), jObject.getString("PhoneNumber"),
                        jObject.getString("Address"), jObject.getString("EmailPassword"), jObject.getString("RoleName"), jObject.getString("DepartmentName"), jObject.getString("DepartmentHeadId"));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
