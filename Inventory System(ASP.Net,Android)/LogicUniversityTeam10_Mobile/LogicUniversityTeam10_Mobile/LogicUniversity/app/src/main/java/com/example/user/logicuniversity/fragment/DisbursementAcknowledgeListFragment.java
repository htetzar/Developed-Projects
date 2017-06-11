package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.example.user.logicuniversity.Model.DisbursementAcknowledge;
import com.example.user.logicuniversity.Model.DisbursementDelivery;
import com.example.user.logicuniversity.Model.DisbursementDetail;
import com.example.user.logicuniversity.R;

import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */

public class DisbursementAcknowledgeListFragment extends Fragment {
    List<DisbursementAcknowledge> disbursementAcknowledgeList;
    View v;
    RecyclerView rvItems;
    LinearLayoutManager llm;
    String userId, depId, depHeadId;
    SharedPreferences pref;

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.disbursement_knowledge_fragment, container, false);
        pref = getActivity().getSharedPreferences("LOGIC", getActivity().MODE_PRIVATE);
        userId = pref.getString("STAFFID","1102");
        depId = pref.getString("DEPID", "ENGL");
        depHeadId = pref.getString("DEPHEADID", "1102");
        /*Bundle bundle = getArguments();
        if(bundle != null){
            depId = bundle.getString("DEPID");
        }*/

        new AsyncTask<String, Void, List<DisbursementAcknowledge>>() {
            @Override
            protected List<DisbursementAcknowledge> doInBackground(String... params) {
                Log.i("Disb_List_frag","doInBackground() requisitionId: "+params[0]);
                return DisbursementAcknowledge.getDisbursementKnowledgeList(params[0]);
            }

            @Override
            protected void onPostExecute(List<DisbursementAcknowledge> result) {
                Log.i("Ack_List_frag","onPostExecute() result: " + result);
                disbursementAcknowledgeList = result;
                rvItems = (RecyclerView) v.findViewById(R.id.rl_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute(depId);

        return(v);
    }

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
         //   Log.i("Disb_List_frag","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.items_disbursement_knowledge_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }

        @Override
        public void onBindViewHolder(final ItemsHolder holder, final int position) {
            Log.i("Ack_List_frag","onBindViewHolder() position: " + position + " disbursementList: " + disbursementAcknowledgeList);

            holder.txtReValue.setText(disbursementAcknowledgeList.get(position).get("departmentRequisitionId"));
            holder.txtColP.setText(disbursementAcknowledgeList.get(position).get("collectionPointName"));
            holder.txtCoTime.setText(disbursementAcknowledgeList.get(position).get("collectionPointTime"));

            holder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Bundle b = new Bundle();
                    b.putString("DISBURSEMENT_ID", disbursementAcknowledgeList.get(holder.getAdapterPosition()).get("disbursementId"));
                    FragmentManager fm = getFragmentManager();
                    Fragment secondFragment = new DisbursementAcknowledgeDetailFragment();
                    Fragment frg = fm.findFragmentById(R.id.content_frame3);
                    secondFragment.setArguments(b);

                    if (frg == null) {
                        fm.beginTransaction().add(R.id.content_frame3, secondFragment).commit();
                    } else {
                        fm.beginTransaction().replace(R.id.content_frame3, secondFragment).commit();
                    }
                }
            });
        }

        @Override
        public int getItemCount() {
            return disbursementAcknowledgeList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView txtReId, txtReValue, txtColP, txtCoTime;
            public ItemsHolder(View itemView) {
                super(itemView);
                txtReId = (TextView) itemView.findViewById(R.id.txtReId);
                txtReValue = (TextView) itemView.findViewById(R.id.txtReValue);
                txtColP = (TextView) itemView.findViewById(R.id.txtColP);
                txtCoTime = (TextView) itemView.findViewById(R.id.txtCoTime);

            }
        }
    }
}
