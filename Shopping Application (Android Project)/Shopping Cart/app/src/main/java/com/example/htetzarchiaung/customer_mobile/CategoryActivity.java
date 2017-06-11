package com.example.zawmyohtet.customer_mobile;

import android.app.ListActivity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

import java.util.List;

public class CategoryActivity extends ListActivity {

    @Override
    protected void onResume(){
        super.onResume();
        new AsyncTask<Void, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(Void... params) {
                return Item.listByCategory();
            }

            @Override
            protected void onPostExecute(List<String> result) {
                ArrayAdapter<String> adapter =
                        new ArrayAdapter<String>(getApplicationContext(),
                                R.layout.row, R.id.textViewName, result);

                setListAdapter(adapter);
            }
        }.execute();
    }
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        new AsyncTask<Void, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(Void... params) {
                return Item.listByCategory();
            }

            @Override
            protected void onPostExecute(List<String> result) {
                ArrayAdapter<String> adapter =
                        new ArrayAdapter<String>(getApplicationContext(),
                                R.layout.row, R.id.textViewName, result);

                setListAdapter(adapter);
            }
        }.execute();
    }
    @Override
    protected void onListItemClick(ListView l, View v,
                                   int position, long id) {
        String category = (String) getListAdapter().getItem(position);
        Intent intent = new Intent(this, MainActivity.class);
        intent.putExtra("Category", category);
        startActivity(intent);
    }
}

