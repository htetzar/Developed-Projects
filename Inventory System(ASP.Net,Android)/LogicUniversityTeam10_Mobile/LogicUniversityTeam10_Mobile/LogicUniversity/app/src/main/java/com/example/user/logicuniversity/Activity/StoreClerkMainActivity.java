package com.example.user.logicuniversity.Activity;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.util.Log;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.example.user.logicuniversity.R;
import com.example.user.logicuniversity.fragment.DisbursementAcknowledgeListFragment;
import com.example.user.logicuniversity.fragment.DisbursementListFragment;
import com.example.user.logicuniversity.fragment.StaffRequisitionListFragment;
import com.example.user.logicuniversity.fragment.StationeryRetrievalListFragment;

import static android.R.attr.resource;

/**
 * Created by Htet Zar Chi Aung.
 */

public class StoreClerkMainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {

    String userId, depId, depHeadId, roleName, userName;
    int roleId;
    View header;
    TextView textViewUserName, textViewUserRole;
    FragmentManager fragmentManager;
    Fragment content_frame, staffReqListfrag;
    Bundle bundle;

    SharedPreferences pref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        pref = getSharedPreferences("LOGIC", MODE_PRIVATE);
        userId = pref.getString("STAFFID","1102");
        userName = pref.getString("STAFFNAME","Prof Ezra Pound");
        depId = pref.getString("DEPID","1102");
        depHeadId = pref.getString("DEPHEADID","1102");
        roleId = pref.getInt("ROLEID", 4);
        roleName = pref.getString("ROLENAME", "DepartmentHead");

        setContentView(R.layout.activity_store_clerk_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar2);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout2);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view2);
        navigationView.setNavigationItemSelectedListener(this);

        header = navigationView.getHeaderView(0);
        textViewUserName = (TextView) header.findViewById(R.id.textViewUserName);
        textViewUserRole = (TextView) header.findViewById(R.id.textViewUserRole);
        textViewUserName.setText(userName);
        textViewUserRole.setText(roleName);

        fragmentManager= getFragmentManager();
        content_frame = fragmentManager.findFragmentById(R.id.content_frame2);
        bundle = new Bundle();

        staffReqListfrag = new StationeryRetrievalListFragment();
        staffReqListfrag.setArguments(bundle);
        if(content_frame == null){
            fragmentManager.beginTransaction()
                    .add(R.id.content_frame2
                            , staffReqListfrag)
                    .commit();
        }else {
            fragmentManager.beginTransaction()
                    .replace(R.id.content_frame2
                            , staffReqListfrag)
                    .commit();
        }
    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout2);
        if (drawer.isDrawerOpen(GravityCompat.START)) {
            drawer.closeDrawer(GravityCompat.START);
        } else {
            super.onBackPressed();
        }
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.main, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();

        //noinspection SimplifiableIfStatement
        if (id == R.id.action_settings) {
            return true;
        }

        return super.onOptionsItemSelected(item);
    }

    @SuppressWarnings("StatementWithEmptyBody")
    @Override
    public boolean onNavigationItemSelected(MenuItem item) {
        int id = item.getItemId();

        if (id == R.id.nav_first_layout) {
            Log.i("StoreClerkMain_Activity","Process Requisition userId: " + userId +  " depId: " + depId   + " depHeadId: " + depHeadId + " resource" + resource);
            staffReqListfrag = new StationeryRetrievalListFragment();
            staffReqListfrag.setArguments(bundle);

                fragmentManager.beginTransaction()
                        .replace(R.id.content_frame2
                                , staffReqListfrag)
                        .commit();

        } else if (id == R.id.nav_second_layout) {
            Log.i("StoreClerkMain_Activity","View Disbursement depId: " + depId + " userId: " + userId + " depHeadId: " + depHeadId + " resource" + resource);
            DisbursementListFragment DisbursementListFragment = new DisbursementListFragment();
            DisbursementListFragment.setArguments(bundle);

                fragmentManager.beginTransaction()
                        .replace(R.id.content_frame2
                                , DisbursementListFragment)
                        .commit();

        } else if (id == R.id.nav_third_layout) {
            Intent i = new Intent(StoreClerkMainActivity.this, LoginActivity.class);
            startActivity(i);
            finish();
        }
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout2);
        drawer.closeDrawer(GravityCompat.START);
        Log.i("StoreClerkMain_Activity", "onCreateView()");
        return true;
    }
}
