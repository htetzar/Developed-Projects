package com.example.zawmyohtet.customer_mobile;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class DetailsActivity extends Activity {

    final static int []view = {R.id.textViewid, R.id.editTextCategory, R.id.editTextName, R.id.editTextDescription,R.id.editTextPrice};
    final static String []key = {"Id", "Category", "Name", "Description","Price"};
    static String sts;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_details);
        String item = getIntent().getExtras().getString("Item");
        new AsyncTask<String, Void, Item>() {
            @Override
            protected Item doInBackground(String... params) {
                return Item.getItem(params[0]);
            }
            @Override
            protected void onPostExecute(Item result) {
                for (int i=0; i<view.length; i++) {
                    EditText t = (EditText) findViewById(view[i]);
                    t.setText(result.get(key[i]));
                }

                sts = result.get("Status");
            }
        }.execute(item);

        Button b = (Button) findViewById(R.id.buttonUpdate);
        b.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Item item = new Item();
                for (int i=0; i<view.length; i++) {
                    EditText t = (EditText) findViewById(view[i]);
                    item.put(key[i], t.getText().toString());
                }
                item.put("Status", sts);
                new AsyncTask<Item, Void, Void>() {
                    @Override
                    protected Void doInBackground(Item... params) {
                        Item.updateItem(params[0]);
                        return null;
                    }
                    @Override
                    protected void onPostExecute(Void result) {
                        finish();
                    }
                }.execute(item);
            }
        });

        Button b1 = (Button) findViewById(R.id.buttonDelete);
        b1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Item item = new Item();
                for (int i=0; i<view.length; i++) {
                    EditText t = (EditText) findViewById(view[i]);
                    item.put(key[i], t.getText().toString());
                }
                new AsyncTask<Item, Void, Void>() {
                    @Override
                    protected Void doInBackground(Item... params) {
                        Item.deleteItem(params[0]);
                        return null;
                    }
                    @Override
                    protected void onPostExecute(Void result) {
                        finish();
                    }
                }.execute(item);
            }
        });

        Button b2 = (Button) findViewById(R.id.buttonBuy);
        b2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Item item = new Item();
                for (int i=0; i<view.length; i++) {
                    EditText t = (EditText) findViewById(view[i]);
                    item.put(key[i], t.getText().toString());
                }
                new AsyncTask<Item, Void, Void>() {
                    @Override
                    protected Void doInBackground(Item... params) {
                        Item.updateStatus(params[0]);
                        return null;
                    }
                    @Override
                    protected void onPostExecute(Void result) {
                        finish();
                    }
                }.execute(item);
            }
        });
    }
}