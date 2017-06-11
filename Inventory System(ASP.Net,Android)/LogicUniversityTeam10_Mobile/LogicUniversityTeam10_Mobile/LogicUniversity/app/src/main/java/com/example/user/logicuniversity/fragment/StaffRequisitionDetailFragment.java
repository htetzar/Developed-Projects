package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.ListFragment;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.SimpleAdapter;
import android.widget.TextView;
import android.widget.Toast;

import com.example.user.logicuniversity.Activity.DepartmentHeadMainActivity;
import com.example.user.logicuniversity.Model.Delegation;
import com.example.user.logicuniversity.Model.StaffRequisition;
import com.example.user.logicuniversity.Model.StaffRequisitionDetail;
import com.example.user.logicuniversity.R;

import org.w3c.dom.Text;

import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */

public class StaffRequisitionDetailFragment extends Fragment {
    List<StaffRequisitionDetail> staffRequsitionDetailList;
    String staffRequisitionId, status, remark, userId, depId;
    int resource;
    boolean flag;
    View v;
    ListView lv;
    RecyclerView rvItems;
    LinearLayoutManager llm;
    Button btnApprove, btnReject;
    EditText editTextRemark;
    TextView textViewRemark;
    Delegation delegation;
    SharedPreferences pref;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.staff_requisition_detail_fragment, container, false);
        editTextRemark = (EditText) v.findViewById(R.id.editTextRemark);
        btnReject = (Button) v.findViewById(R.id.buttonreject);
        btnApprove = (Button) v.findViewById(R.id.buttonapprove);
        textViewRemark = (TextView) v.findViewById(R.id.textViewRemark);

        Bundle bundle = getArguments();
        if(bundle != null){
            staffRequisitionId = bundle.getString("staffRequisitionId");
            resource = bundle.getInt("RESOURCE");
            status = bundle.getString("STATUS");
            if(status.equals("nodelegated")){
                btnApprove.setVisibility(View.GONE);
                btnReject.setVisibility(View.GONE);
                editTextRemark.setVisibility(View.GONE);
                textViewRemark.setVisibility(View.GONE);

            }else{
                btnApprove.setVisibility(View.VISIBLE);
                btnReject.setVisibility(View.VISIBLE);
                editTextRemark.setVisibility(View.VISIBLE);
                textViewRemark.setVisibility(View.VISIBLE);
            }
        }
        pref = getActivity().getSharedPreferences("LOGIC", getActivity().MODE_PRIVATE);
        userId = pref.getString("STAFFID","1102");
        depId = pref.getString("DEPID", "ENGL");
        new AsyncTask<String, Void, List<StaffRequisitionDetail>>() {
            @Override
            protected List<StaffRequisitionDetail> doInBackground(String... params) {
                Log.i("Requisition_detail_frag","doInBackground() requisitionId: " + params[0]);
                return StaffRequisitionDetail.listRequisitionDetail(params[0]);
            }

            @Override
            protected void onPostExecute(List<StaffRequisitionDetail> result) {
                Log.i("Requisition_detail_frag","onPostExecute() result: " + result);
                staffRequsitionDetailList = result;
                rvItems = (RecyclerView) v.findViewById(R.id.rl_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute(staffRequisitionId);

        btnApprove.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                remark = editTextRemark.getText().toString();
                new AsyncTask<List<StaffRequisitionDetail>, Void, Void>() {
                    @Override
                    protected Void doInBackground(List<StaffRequisitionDetail>... params) {
                        Log.i("Staff_Req_Detail_F","doInBackground() " + params[0]);
                         StaffRequisitionDetail.ApproveRequisition(params[0], remark, userId);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        Log.i("Staff_Req_Detail_F","onPostExecute() ");
                        Toast.makeText(getActivity(),"Approve Successfull", Toast.LENGTH_SHORT).show();
                        Intent i = new Intent(getActivity(), DepartmentHeadMainActivity.class);
                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(i);
                    }
                }.execute(staffRequsitionDetailList);
            }
        });

        btnReject.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                remark = editTextRemark.getText().toString();
                new AsyncTask<String, Void, Void>() {
                    @Override
                    protected Void doInBackground(String... params) {
                        Log.i("Staff_Req_Detail_F","doInBackground" + params[0]);
                        StaffRequisitionDetail.RejectRequisition(params[0], params[1]);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        Log.i("Staff_Req_Detail_F","onPostExecute" + result);
                        Toast.makeText(getActivity(),"Reject Successfull", Toast.LENGTH_SHORT).show();
                        Intent i = new Intent(getActivity(), DepartmentHeadMainActivity.class);
                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(i);
                    }
                }.execute(staffRequisitionId, remark);
            }
        });
        return(v);
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

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            Log.i("Requisition_detail_frag","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.items_requisition_detail_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }

        @Override
        public void onBindViewHolder(final ItemsHolder holder, int position) {
            Log.i("Requisition_detail_frag","onBindViewHolder() position: " + position + " staffRequistionDetailList: " + staffRequsitionDetailList);
            holder.tvItemDescription.setText(staffRequsitionDetailList.get(position).get("itemDescription"));
            holder.tvItemCode.setText(staffRequsitionDetailList.get(position).get("itemCode"));
            holder.tvItemQty.setText(staffRequsitionDetailList.get(position).get("itemQuantity"));

        }

        @Override
        public int getItemCount() {
            return staffRequsitionDetailList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView tvItemDescription, tvItemCode, tvItemQty;

            public ItemsHolder(View itemView) {
                super(itemView);
                tvItemDescription = (TextView) itemView.findViewById(R.id.tvItemDescription);
                tvItemCode = (TextView) itemView.findViewById(R.id.tvItemCode);
                tvItemQty = (TextView) itemView.findViewById(R.id.tvItemQty);


            }
        }
    }
}
