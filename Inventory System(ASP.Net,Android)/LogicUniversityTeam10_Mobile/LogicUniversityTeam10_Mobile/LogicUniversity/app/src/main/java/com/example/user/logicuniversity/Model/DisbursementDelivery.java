package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ei Ei Maw.
 */

public class DisbursementDelivery extends java.util.HashMap<String,String> {

    public DisbursementDelivery(String disbursementId,String departmentRequisitionId, String departmentName, String representativeName, String collectionPointName, String collectionPointTime) {
        put("disbursementId",disbursementId);
        put("departmentRequisitionId", departmentRequisitionId);
        put("departmentName", departmentName);
        put("representativeName", representativeName);
        put("collectionPointName", collectionPointName);
        put("collectionPointTime", collectionPointTime);
    }

    public DisbursementDelivery() {
    }

    public static List<DisbursementDelivery> getDisbursementList() {
        List<DisbursementDelivery> dList = new ArrayList<DisbursementDelivery>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host + "/GetDisbursementList");
            for (int i = 0; i < a.length(); i++) {
                DisbursementDelivery d = new DisbursementDelivery();
                JSONObject jObject = new JSONObject(a.getString(i));

                d.put("disbursementId",jObject.getString("DisbursementId"));
                d.put("departmentRequisitionId", jObject.getString("DepartmentRequisitionId"));
                d.put("departmentName", jObject.getString("DepartmentName"));
                d.put("representativeName", jObject.getString("RepresentativeName"));
                d.put("collectionPointName", jObject.getString("CollectionPointName"));
                d.put("collectionPointTime", jObject.getString("CollectionPointTime"));
                dList.add(d);
            }
        } catch (Exception e) {
        }
        Log.i("DisbursementDelivery","getDisbursementList() dList: " + dList);
        return dList;
    }


}
