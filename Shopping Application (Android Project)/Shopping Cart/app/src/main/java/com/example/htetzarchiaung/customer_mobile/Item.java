package com.example.zawmyohtet.customer_mobile;

import android.graphics.Bitmap;

import org.json.JSONArray;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;

import static android.R.attr.id;

public class Item extends java.util.HashMap<String,String> {

    final static String host = "http://10.10.24.112/Team10ShoppingWebService/Service.svc";

    public Item(int id, String name, String category, String description, boolean status,float price) {
        put("Id", Integer.toString(id));
        put("Name", name);
        put("Category", category);
        put("Description", description);
        String sts = "false";
        if(status){
            sts = "true";
        }
        put("Status",sts);
        put("Price", Float.toString(price));
    }

    public Item(){}

    public static List<String> listByCategory() {
        List<String> list = new ArrayList<>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(host + "/Category");
            for (int i = 0; i < a.length(); i++) {
                String c = a.getString(i);
                list.add(c);
            }
        }
        catch(Exception e){
        }
        return list;
    }

    public static List<String> listItemByCategory(String categoryName) {
        List<String> list = new ArrayList<String>();
        try {
            JSONArray a = JSONParser.getJSONArrayFromUrl(host+"/Category/" + categoryName);
            for (int i=0; i<a.length(); i++) {
                String c = a.getString(i);
                list.add(c);
            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Item getItem(String name) {
        Item item = null;
        try {
            JSONObject json = JSONParser.getJSONFromUrl(host+"/Item/"+name);

            item = new Item(Integer.parseInt(json.getString("Id")),
                    json.getString("Name"),
                    json.getString("Category"),
                    json.getString("Description"),
                    json.getBoolean("Status"),
                    Float.parseFloat(json.getString("Price")));
        } catch (Exception e) {
        }
        return item;
    }

    public static void updateItem(Item item) {
        JSONObject json = new JSONObject();
        try {
            json.put("Id", item.get("Id"));
            json.put("Name", item.get("Name"));
            json.put("Category", item.get("Category"));
            json.put("Description", item.get("Description"));
            json.put("Status", item.get("Status"));
            json.put("Price", item.get("Price"));
        } catch (Exception e) {
        }
        String result = JSONParser.postStream(host+"/Update", json.toString());
    }

    public static void insertItem(Item item) {
        JSONObject json = new JSONObject();
        try {
            json.put("Id", item.get("Id"));
            json.put("Name", item.get("Name"));
            json.put("Category", item.get("Category"));
            json.put("Description", item.get("Description"));
            json.put("Status", item.get("Status"));
            json.put("Price", item.get("Price"));
        } catch (Exception e) {
        }
        String result = JSONParser.postStream(host+"/Insert", json.toString());
    }

    public static void deleteItem(Item cus) {
        JSONObject json = new JSONObject();
        try {
            json.put("Id", cus.get("Id"));
        } catch (Exception e) {
        }
        String result = JSONParser.postStream(host+"/Delete", json.toString());
    }

    public static void updateStatus(Item item){
        JSONObject json = new JSONObject();
        try {
            json.put("Id", item.get("Id"));
        } catch (Exception e) {
        }
        String result = JSONParser.postStream(host+"/Buy", json.toString());
    }
}