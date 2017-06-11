package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.TextView;

import com.example.user.logicuniversity.Model.DisbursementDelivery;
import com.example.user.logicuniversity.Model.StaffRequisitionDetail;
import com.example.user.logicuniversity.R;

import java.util.List;

/**
 * Created by Ei Ei Maw.
 */

public class DisbursementListFragment extends Fragment {
    List<DisbursementDelivery> disbursementDeliveryList;
    View v;
    RecyclerView rvItems;
    LinearLayoutManager llm;
    public static final String DISBURSEMENT_ID="Disburse";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.disbursement_list_fragment, container, false);

        new AsyncTask<Void, Void, List<DisbursementDelivery>>() {
            @Override
            protected List<DisbursementDelivery> doInBackground(Void... params) {
                Log.i("Disb_List_frag","doInBackground() requisitionId: ");
                return DisbursementDelivery.getDisbursementList();
            }

            @Override
            protected void onPostExecute(List<DisbursementDelivery> result) {
                Log.i("Disb_List_frag","onPostExecute() result: " + result);
                disbursementDeliveryList = result;
                rvItems = (RecyclerView) v.findViewById(R.id.rl_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute();

        return(v);
    }

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            Log.i("Disb_List_frag","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.items_disbursement_list_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }

        @Override
        public void onBindViewHolder(final ItemsHolder holder, final int position) {
            Log.i("Disb_List_frag","onBindViewHolder() position: " + position + " disbursementList: " + disbursementDeliveryList);
            disbursementDeliveryList.get(position).get("disbursementId");
            holder.txtDepReqId.setText(disbursementDeliveryList.get(position).get("departmentRequisitionId"));
            holder.txtDeName.setText(disbursementDeliveryList.get(position).get("departmentName"));
            holder.txtRepName.setText(disbursementDeliveryList.get(position).get("representativeName"));
            holder.txtCollPoint.setText(disbursementDeliveryList.get(position).get("collectionPointName"));
            holder.txtCollTime.setText(disbursementDeliveryList.get(position).get("collectionPointTime"));
            holder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Bundle b = new Bundle();
                    b.putString("DISBURSEMENT_ID", disbursementDeliveryList.get(holder.getAdapterPosition()).get("disbursementId"));
                    FragmentManager fm = getFragmentManager();
                    Fragment secondFragment = new DisbursementDetailFragment();
                    Fragment frg = fm.findFragmentById(R.id.content_frame2);
                    secondFragment.setArguments(b);

                    if (frg == null) {
                        fm.beginTransaction().add(R.id.content_frame2, secondFragment).commit();
                    } else {
                        fm.beginTransaction().replace(R.id.content_frame2, secondFragment).commit();
                    }
                }
            });
        }

        @Override
        public int getItemCount() {
            return disbursementDeliveryList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView txtDepReqId, txtDeName, txtRepName, txtCollPoint, txtCollTime;
            public ItemsHolder(View itemView) {
                super(itemView);
                txtDepReqId = (TextView) itemView.findViewById(R.id.txtDepReqId);
                txtDeName = (TextView) itemView.findViewById(R.id.txtDeName);
                txtRepName = (TextView) itemView.findViewById(R.id.txtRepName);
                txtCollPoint = (TextView) itemView.findViewById(R.id.txtCollPoint);
                txtCollTime = (TextView) itemView.findViewById(R.id.txtCollTime);

            }
        }
    }
}
