package com.example.user.logicuniversity.Activity;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.util.Log;
import android.support.design.widget.NavigationView;
import android.support.v4.view.GravityCompat;
import android.support.v4.widget.DrawerLayout;
import android.support.v7.app.ActionBarDrawerToggle;
import android.support.v7.app.AppCompatActivity;
import android.support.v7.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.TextView;

import com.example.user.logicuniversity.fragment.DelegateFragment;
import com.example.user.logicuniversity.fragment.StaffRequisitionListFragment;
import com.example.user.logicuniversity.Model.Delegation;
import com.example.user.logicuniversity.R;

import static android.R.attr.fragment;
import static android.R.attr.resource;

/*
  Created By Zaw Myo Htet
 */
public class DepartmentHeadMainActivity extends AppCompatActivity
        implements NavigationView.OnNavigationItemSelectedListener {
    String userId, depId, depHeadId, roleName, userName;
    boolean flag;
    int roleId;
    Delegation delegation;
    TextView textViewUserName, textViewUserRole;
    View header;
    FragmentManager fragmentManager;
    Fragment staffRequisitionListFragment, content_frame, delegateFragment;
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
        roleId = pref.getInt("ROLEID", 2);
        roleName = pref.getString("ROLENAME", "DepartmentHead");

        setContentView(R.layout.activity_department_head_main);
        Toolbar toolbar = (Toolbar) findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        ActionBarDrawerToggle toggle = new ActionBarDrawerToggle(
                this, drawer, toolbar, R.string.navigation_drawer_open, R.string.navigation_drawer_close);
        drawer.setDrawerListener(toggle);
        toggle.syncState();

        NavigationView navigationView = (NavigationView) findViewById(R.id.nav_view);
        navigationView.setNavigationItemSelectedListener(this);

        header = navigationView.getHeaderView(0);
        textViewUserName = (TextView) header.findViewById(R.id.textViewUserName);
        textViewUserRole = (TextView) header.findViewById(R.id.textViewUserRole);
        textViewUserName.setText(userName);
        textViewUserRole.setText(roleName);

        fragmentManager= getFragmentManager();
        content_frame = fragmentManager.findFragmentById(R.id.content_frame);
        bundle = new Bundle();
        if(isNewDelegation()){
            bundle.putInt("RESOURCE",R.layout.delegate_fragment_layout);
        }else{
            bundle.putInt("RESOURCE",R.layout.terminate_fragment_layout);
        }
        bundle.putSerializable("DELEGATION", delegation);

        staffRequisitionListFragment = new StaffRequisitionListFragment();
        staffRequisitionListFragment.setArguments(bundle);

        if(content_frame == null){
            fragmentManager.beginTransaction()
                    .add(R.id.content_frame
                            , staffRequisitionListFragment)
                    .commit();
        }else {
            fragmentManager.beginTransaction()
                    .replace(R.id.content_frame
                            , staffRequisitionListFragment)
                    .commit();
        }
    }

    private void settingBundle(){

    }

    @Override
    public void onBackPressed() {
        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
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
        // Handle navigation view item clicks here.
        int id = item.getItemId();
        if(isNewDelegation()){
            bundle.putInt("RESOURCE",R.layout.delegate_fragment_layout);
        }else{
            bundle.putInt("RESOURCE",R.layout.terminate_fragment_layout);
        }
        bundle.putSerializable("DELEGATION", delegation);
        if (id == R.id.nav_first_layout) {
            Log.i("DepartmentHead_Activity","Approve userId: " + userId +  " depId: " + depId   + " depHeadId: " + depHeadId + " resource" + resource);
            staffRequisitionListFragment = new StaffRequisitionListFragment();
            staffRequisitionListFragment.setArguments(bundle);
            fragmentManager.beginTransaction()
                    .replace(R.id.content_frame
                            , staffRequisitionListFragment)
                    .commit();

        } else if (id == R.id.nav_second_layout) {
            Log.i("DepartmentHead_Activity","Delegate depId: " + depId + " userId: " + userId + " depHeadId: " + depHeadId + " resource" + resource);
            delegateFragment = new DelegateFragment();
            delegateFragment.setArguments(bundle);
            fragmentManager.beginTransaction()
                    .replace(R.id.content_frame
                            , delegateFragment)
                    .commit();
        } else if (id == R.id.nav_third_layout) {
            Intent i = new Intent(DepartmentHeadMainActivity.this, LoginActivity.class);
            startActivity(i);
            finish();
        } /*else if (id == R.id.nav_share) {

        } else if (id == R.id.nav_send) {

        }*/

        DrawerLayout drawer = (DrawerLayout) findViewById(R.id.drawer_layout);
        drawer.closeDrawer(GravityCompat.START);
        Log.i("DepartmentHead_Activity", "onCreateView()");
        return true;
    }

     private boolean isNewDelegation(){
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
        delegation = Delegation.GetDelegation(depId);
        if(delegation != null){
            flag = false;
            Log.i("DepartmentHead_Activity"," onPostExecute flag: " + flag);
        }else{
            flag = true;
        }
        Log.i("DepartmentHead_Activity","onPostExecute " + delegation + " flag: " + flag);
        return flag;
    }
}
