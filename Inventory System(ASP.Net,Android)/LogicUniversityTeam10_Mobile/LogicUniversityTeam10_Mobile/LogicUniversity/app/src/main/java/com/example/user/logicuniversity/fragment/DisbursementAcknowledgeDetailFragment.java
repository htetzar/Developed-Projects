package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.content.Intent;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.text.Editable;
import android.text.TextWatcher;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.user.logicuniversity.Activity.DepartmentHeadMainActivity;
import com.example.user.logicuniversity.Activity.RepMainActivity;
import com.example.user.logicuniversity.Model.DisbursementAcknowledgeDetail;
import com.example.user.logicuniversity.Model.DisbursementDetail;
import com.example.user.logicuniversity.R;

import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */

public class DisbursementAcknowledgeDetailFragment extends Fragment {
    List<DisbursementAcknowledgeDetail> disbursementAckDetailList;
    View v;
    RecyclerView rvItems;
    String  disbursementId,remark;
    LinearLayoutManager llm;
    Button btnAck;
    EditText editTextActual,editRemark;
    public static final
    String DISBURSEMENT_ID="Disburse";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.disbursement_detail_acknowledge_fragment, container, false);

        Bundle bundle = getArguments();
        if(bundle != null){
            disbursementId = getArguments().getString("DISBURSEMENT_ID");
        }

        new AsyncTask<String, Void, List<DisbursementAcknowledgeDetail>>() {
            @Override
            protected List<DisbursementAcknowledgeDetail> doInBackground(String... params) {
               // Log.i("Disbursement_detail_frag","doInBackground() disbursementId: " + params[0]);
                //Log.i("Requisition_detail_frag","doInBackground() requisitionId: " + params[0]);
                Log.i("Dis_ack_frag","dibusementId:"+disbursementId);
                return DisbursementAcknowledgeDetail.listDisbursementDetail(params[0]);

            }

            @Override
            protected void onPostExecute(List<DisbursementAcknowledgeDetail> result) {
           //  Log.i("Disbursement_detail_frag","onPostExecute() result: " + result);
                Log.i("Dis_ack_frag","onPostExecute():" + result);

                disbursementAckDetailList = result;
                rvItems=(RecyclerView) v.findViewById(R.id.rel_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute(disbursementId);

        btnAck = (Button) v.findViewById(R.id.btnAck);
        editRemark=(EditText) v.findViewById(R.id.editRemark);

        btnAck.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Log.i("Dept_Ack_ListFragment","btnAck() stationeryRetrievalList: "+ disbursementAckDetailList);
                remark=editRemark.getText().toString();
                new AsyncTask<List<DisbursementAcknowledgeDetail>, Void, Void>() {
                    @Override
                    protected Void doInBackground(List<DisbursementAcknowledgeDetail>... params) {
                        Log.i("Dept_Retri_ListFragment","doInBackground" + params[0]);
                        DisbursementAcknowledgeDetail.updateRetrievalList(params[0],remark);
                        return null;
                    }

                    @Override
                    protected void onPostExecute(Void result) {
                        Log.i("Dept_Ackk_ListFragment","onPostExecute" + result);
                        Toast.makeText(getActivity(),"Acknowledge Successfull", Toast.LENGTH_SHORT).show();
                        Intent i = new Intent(getActivity(), RepMainActivity.class);
                        i.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
                        startActivity(i);
                    }
                }.execute(disbursementAckDetailList);
            }
        });
        return(v);
    }

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            //Log.i("Dept_Ackk_ListFragment","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.items_disbursement_ack_detail_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }
        @Override
        public void onBindViewHolder(final ItemsHolder holder, final int position) {
            holder.txtItemName.setText(disbursementAckDetailList.get(position).get("itemName"));
            holder.txtNeededQty.setText(disbursementAckDetailList.get(position).get("needed"));
            holder.editTextActual.setText(disbursementAckDetailList.get(position).get("actualQuantity"));
            holder.editTextActual.addTextChangedListener(new TextWatcher() {


                public void afterTextChanged(Editable s) {
                   /* Log.i("Dept_Ackk_ListFragment","onTextChanged() s: "+ s.toString());
                    stationeryRetrievalList.get(position).put("actual", s.toString());*/
                }

                public void beforeTextChanged(CharSequence s, int start,
                                              int count, int after) {
                }

                public void onTextChanged(CharSequence s, int start, int before, int count) {
                    Log.i("Dept_Ackk_ListFragment","onTextChanged() s: "+ s.toString());
                    disbursementAckDetailList.get(position).put("actual", s.toString());
                }
            });
        }

        @Override
        public int getItemCount() {
            return disbursementAckDetailList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView txtItemName, txtNeededQty;
            EditText editTextActual;


            public ItemsHolder(View itemView) {
                super(itemView);
                txtItemName = (TextView) itemView.findViewById(R.id.txtItemName);
                txtNeededQty = (TextView) itemView.findViewById(R.id.txtNeededQty);
                editTextActual=(EditText) itemView.findViewById(R.id.editTextActual);


            }
        }
    }
}
