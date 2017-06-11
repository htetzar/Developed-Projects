package com.example.user.logicuniversity.Model;

import android.util.Log;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Ei Ei Maw.
 */

public class DisbursementAcknowledge extends java.util.HashMap<String,String> {

    public DisbursementAcknowledge(String departmentRequisitionId,String collectionPointName, String collectionPointTime) {
        put("departmentRequisitionId", departmentRequisitionId);
        put("collectionPointName", collectionPointName);
        put("collectionPointTime", collectionPointTime);
    }

    public DisbursementAcknowledge() {
    }

    public static List<DisbursementAcknowledge> getDisbursementKnowledgeList(String departmentId) {
        List<DisbursementAcknowledge> dList = new ArrayList<DisbursementAcknowledge>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(StaffRequisition.host + "/GetAcknowledgeDisbursementList/" + departmentId);
            for (int i = 0; i < a.length(); i++) {
                DisbursementAcknowledge d = new DisbursementAcknowledge();
                JSONObject jObject = new JSONObject(a.getString(i));
                d.put("disbursementId",jObject.getString("DisbursementId"));
                d.put("departmentRequisitionId", jObject.getString("DepartmentRequisitionId"));
                d.put("collectionPointName", jObject.getString("CollectionPointName"));
                d.put("collectionPointTime", jObject.getString("CollectionPointTime"));
                dList.add(d);
            }
        } catch (Exception e) {
        }
        Log.i("DisbursementAcknow","getDisbursementKnowledgeList() dList: " + dList);
        return dList;
    }


}
