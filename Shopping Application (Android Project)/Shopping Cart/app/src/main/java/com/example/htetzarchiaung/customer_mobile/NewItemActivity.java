package com.example.zawmyohtet.customer_mobile;

import android.app.Activity;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class NewItemActivity extends Activity {
    final static int []view = {R.id.editTextCategory, R.id.editTextName, R.id.editTextDescription,R.id.editTextPrice};
    final static String []key = {"Category", "Name", "Description","Price"};

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_new_item);

        Button b = (Button) findViewById(R.id.button);
        b.setOnClickListener(new View.OnClickListener() {
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
                        Item.insertItem(params[0]);
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
