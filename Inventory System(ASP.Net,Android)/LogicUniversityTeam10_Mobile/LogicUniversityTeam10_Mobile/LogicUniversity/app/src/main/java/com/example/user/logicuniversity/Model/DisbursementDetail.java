package com.example.user.logicuniversity.Model;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ei Ei Maw.
 */

public class DisbursementDetail extends java.util.HashMap<String,String> {

    public DisbursementDetail(String disbursementId,String departmentRequisitionId,String itemName,int actualQuantity){
        put("disbursementId", disbursementId);
        put("departmentRequisitionId", departmentRequisitionId);
        put("itemName", itemName);
        put("actualQuantity", Integer.toString(actualQuantity));
    }

    public DisbursementDetail(){}

    public static List<DisbursementDetail> listDisbursementDetail(String disbursementId) {
        List<DisbursementDetail> list = new ArrayList<DisbursementDetail>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host+"/GetDisbursementDetailList/" + disbursementId);
            for (int i=0; i<a.length(); i++) {
                DisbursementDetail s = new DisbursementDetail();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("disbursementId", jObject.getString("DisbursementId"));
                s.put("departmentRequisitionId", jObject.getString("DepartmentRequisitionId"));
                s.put("itemName", jObject.getString("ItemName"));
                s.put("actualQuantity", Integer.toString(jObject.getInt("ActualQuantity")));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }
}
