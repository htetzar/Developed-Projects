package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.ListFragment;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.SimpleAdapter;

import com.example.user.logicuniversity.Model.StaffRequisition;
import com.example.user.logicuniversity.R;

import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */
public class StaffRequisitionListFragment extends ListFragment {

    View myView;
    List<StaffRequisition> staffRequisitionList;
    String userId, depId;
    int resource;
    SharedPreferences pref;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        myView = inflater.inflate(R.layout.requisition_list_fragment_layout, container, false);
        Bundle bundle = getArguments();
        if(bundle != null){
           // userId = bundle.getString("STAFFID");
           // depId = bundle.getString("DEPID");
            resource = bundle.getInt("RESOURCE");
        }
        // pref = PreferenceManager.getDefaultSharedPreferences(getActivity().getApplicationContext());
        pref = getActivity().getSharedPreferences("LOGIC", getActivity().MODE_PRIVATE);
        userId = pref.getString("STAFFID","1102");
        depId = pref.getString("DEPID", "ENGL");
        new AsyncTask<String, Void, List<StaffRequisition>>() {
            @Override
            protected List<StaffRequisition> doInBackground(String... params) {
                return StaffRequisition.listRequisition(params[0]);
            }

            @Override
            protected void onPostExecute(List<StaffRequisition> result) {
                Log.i("StaffRequisitionList","onPostExecute() " + result);
                staffRequisitionList = result;
                SimpleAdapter adapter = new SimpleAdapter(getActivity(), result,
                        android.R.layout.simple_list_item_2,
                        new String[]{"staffRequisitionId", "staffRequisitionDate"},
                        new int[]{android.R.id.text1, android.R.id.text2});
                setListAdapter(adapter);
            }
        }.execute(depId);

        return myView;
    }

    @Override
    public void onListItemClick(ListView l, View v, int position, long id) {

        StaffRequisition s = (StaffRequisition) getListAdapter().getItem(position);
       // final String TAG = "DETAILS_FRAG";
        FragmentManager fragmentManager = getFragmentManager();
        Fragment content_frame = fragmentManager.findFragmentById(R.id.content_frame);
        FragmentTransaction trans = fragmentManager.beginTransaction();
        Fragment detailFragment = new StaffRequisitionDetailFragment();
        Bundle bundle = new Bundle();
        bundle.putString("staffRequisitionId", s.get("staffRequisitionId"));
        if(resource == R.layout.delegate_fragment_layout){
            bundle.putString("STATUS", "delegated");
        }else{
            bundle.putString("STATUS", "nodelegated");
        }
        /*bundle.putString("STAFFID", userId);
        bundle.putString("DEPID", depId);*/
        bundle.putInt("RESOURCE", resource);
        detailFragment.setArguments(bundle);
        Log.i("RequisitionList_Frag", "outside");
        if(content_frame == null){
            Log.i("RequisitionList_Frag", "Inside null");
            trans.add(R.id.content_frame, detailFragment);

        }else{
            Log.i("RequisitionList_Frag", "Inside not null");
            trans.replace(R.id.content_frame
                            , detailFragment).commit();

        }

    }
}
