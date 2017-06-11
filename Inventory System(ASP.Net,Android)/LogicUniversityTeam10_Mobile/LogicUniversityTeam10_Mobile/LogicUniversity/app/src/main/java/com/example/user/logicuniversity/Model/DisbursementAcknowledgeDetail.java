package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ei Ei Maw
 */

public class DisbursementAcknowledgeDetail extends java.util.HashMap<String,String> {

    public DisbursementAcknowledgeDetail(String disbursementId, String departmentRequisitionId,String itemId ,String itemName,int needed ,int actualQuantity, String remark){
        put("disbursementId", disbursementId);
        put("departmentRequisitionId", departmentRequisitionId);
        put("itemId",itemId);
        put("itemName", itemName);
        put("needed", Integer.toString(needed));
        put("actualQuantity", Integer.toString(actualQuantity));
        put("remark", remark);
    }

    public DisbursementAcknowledgeDetail(){}

    public static List<DisbursementAcknowledgeDetail> listDisbursementDetail(String disbursementId) {
        List<DisbursementAcknowledgeDetail> list = new ArrayList<DisbursementAcknowledgeDetail>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host+"/GetDisbursementDetailList/" + disbursementId);
            for (int i=0; i<a.length(); i++) {
                DisbursementAcknowledgeDetail s = new DisbursementAcknowledgeDetail();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("disbursementId", jObject.getString("DisbursementId"));
                s.put("departmentRequisitionId", jObject.getString("DepartmentRequisitionId"));
                s.put("itemId",jObject.getString("ItemId"));
                s.put("itemName", jObject.getString("ItemName"));
                s.put("needed", jObject.getString("NeededQuantity"));
                s.put("actualQuantity", Integer.toString(jObject.getInt("ActualQuantity")));
                list.add(s);
            }
        } catch (Exception e) {
        }
        Log.i("Dis_Ackn_Detail","listDisbursementDetail() list: " + list);
        return list;
    }


    public static void updateRetrievalList(List<DisbursementAcknowledgeDetail> list,String remark) {
        JSONArray jsonArray = new JSONArray();
        if(remark.trim().length() == 0){
            remark = "NO REMARK";
        }
        for(DisbursementAcknowledgeDetail sr : list){
            JSONObject json = new JSONObject();
            try {
                json.put("DisbursementId", sr.get("disbursementId"));
                json.put("DepartmentRequisitionId", sr.get("departmentRequisitionId"));
                json.put("ItemId", sr.get("itemId"));
                json.put("ItemName", sr.get("itemName"));
                json.put("NeededQuantity", sr.get("needed"));
                json.put("ActualQuantity", sr.get("actualQuantity"));
                json.put("Remark", remark);
                jsonArray.put(json);
            } catch (Exception e) {
            }
        }
        Log.i("UpdateAck","updateAckList() " + jsonArray.toString());
        String result = JSONParser.postStream(StaffRequisition.host+"/UpdateAcknowledgeInformation", jsonArray.toString());
    }
}
