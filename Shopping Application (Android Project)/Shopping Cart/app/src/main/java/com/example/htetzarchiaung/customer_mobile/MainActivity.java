package com.example.zawmyohtet.customer_mobile;

import android.app.ListActivity;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

import java.util.List;

import static android.R.attr.category;

public class MainActivity extends ListActivity {
    ArrayAdapter<String> adapter;
    String  category;

    @Override
   protected void onResume(){
        super.onResume();
       Toast t  = Toast.makeText(this, "OnResume State",Toast.LENGTH_SHORT);
       // t.show();
        category = getIntent().getStringExtra("Category");
        new AsyncTask<String, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(String... params) {
                return Item.listItemByCategory(params[0]);
            }
            @Override
            protected void onPostExecute(List<String> result) {
                adapter =
                        new ArrayAdapter<String>(getApplicationContext(),
                                R.layout.row, R.id.textViewName, result);

                setListAdapter(adapter);
            }
        }.execute(category);
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        category = getIntent().getStringExtra("Category");
        new AsyncTask<String, Void, List<String>>() {
            @Override
            protected List<String> doInBackground(String... params) {
                return Item.listItemByCategory(params[0]);
            }
            @Override
            protected void onPostExecute(List<String> result) {
                 adapter =
                        new ArrayAdapter<String>(getApplicationContext(),
                                R.layout.row, R.id.textViewName, result);

                setListAdapter(adapter);
            }
        }.execute(category);
    }

    @Override
    protected void onListItemClick(ListView l, View v,
                                   int position, long id) {
        String item = (String) getListAdapter().getItem(position);
        Intent intent = new Intent(this, DetailsActivity.class);
        intent.putExtra("Item", item);
        startActivity(intent);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        switch (item.getItemId()) {
            case R.id.newCustomer:
                Intent intent = new Intent(MainActivity.this, NewItemActivity.class);
                startActivity(intent);
                return true;
            default:
                return super.onOptionsItemSelected(item);
        }
    }
}
