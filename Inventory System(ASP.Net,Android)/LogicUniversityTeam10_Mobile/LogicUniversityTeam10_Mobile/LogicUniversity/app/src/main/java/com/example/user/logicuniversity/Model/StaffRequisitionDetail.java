package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by ZawMyoHtet.
 */

public class StaffRequisitionDetail extends java.util.HashMap<String,String> {

    public StaffRequisitionDetail(String staffReqisitionId, String itemCode, String itemDescription, int itemQuantity, String staffReqId, String remark, String staffId){
        put("staffReqisitionId", staffReqisitionId);
        put("itemCode", itemCode);
        put("itemDescription", itemDescription);
        put("itemQuantity", Integer.toString(itemQuantity));
        put("staffReqId", staffReqId);
        put("remark", remark);
        put("staffId", staffId);
    }

    public StaffRequisitionDetail(){}

    public static List<StaffRequisitionDetail> listRequisitionDetail(String staffRequisitionId) {
        List<StaffRequisitionDetail> list = new ArrayList<StaffRequisitionDetail>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host+"/GetRequisitionDetail/" + staffRequisitionId);
            for (int i=0; i<a.length(); i++) {
                StaffRequisitionDetail s = new StaffRequisitionDetail();
                JSONObject jObject = new JSONObject(a.getString(i));
                s.put("staffReqisitionId", jObject.getString("StaffReqisitionId"));
                s.put("itemCode", jObject.getString("ItemCode"));
                s.put("itemDescription", jObject.getString("ItemDescription"));
                s.put("itemQuantity", Integer.toString(jObject.getInt("ItemQuantity")));
                list.add(s);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static void ApproveRequisition(List<StaffRequisitionDetail> staffRequisitionDetailList, String remark, String staffId){
        JSONArray jsonArray = new JSONArray();
        if(remark.trim().length() == 0){
            remark = "NO REMARK";
        }
        for(StaffRequisitionDetail staffRequisitionDetail : staffRequisitionDetailList){
            JSONObject json = new JSONObject();
            try {
                json.put("StaffReqisitionId", staffRequisitionDetail.get("staffReqisitionId"));
                json.put("ItemCode", staffRequisitionDetail.get("itemCode"));
                json.put("ItemDescription", staffRequisitionDetail.get("itemDescription"));
                json.put("ItemQuantity", staffRequisitionDetail.get("itemQuantity"));
                json.put("StaffReqId", staffRequisitionDetail.get("staffReqId"));
                json.put("Remark", remark);
                json.put("StaffId", staffId);
                jsonArray.put(json);
            } catch (Exception e) {
            }
        }
        Log.i("StaffRequisitionDetail","ApproveRequisition() " + jsonArray.toString());
        String result = JSONParser.postStream(StaffRequisition.host+"/ApproveRequisition", jsonArray.toString());
    }

    public static void RejectRequisition(String staffReqId, String remark){
        Log.i("StaffRequisitionDetail","RejectRequisition() staffReqId: " + staffReqId + " remark: " + remark);
        if(remark.trim().length() == 0){
            remark = "NO REMARK";
        }
        String url = String.format("%s/RejectRequisition/%s/%s", StaffRequisition.host, staffReqId, remark);
        JSONParser.getStream(url);
    }
}
