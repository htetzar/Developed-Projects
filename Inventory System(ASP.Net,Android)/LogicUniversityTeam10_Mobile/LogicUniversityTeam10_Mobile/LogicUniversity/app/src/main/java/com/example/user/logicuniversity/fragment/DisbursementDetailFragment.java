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
import android.widget.TextView;
import com.example.user.logicuniversity.Model.DisbursementDetail;
import com.example.user.logicuniversity.R;
import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */

public class DisbursementDetailFragment extends Fragment {
    List<DisbursementDetail> disbursementDeliveryDetailList;
    View v;
    RecyclerView rvItems;
    String  disbursementId;
    LinearLayoutManager llm;
    public static final String DISBURSEMENT_ID="Disburse";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.disbursement_detail_fragment, container, false);

        Bundle bundle = getArguments();
        if(bundle != null){
            disbursementId = getArguments().getString("DISBURSEMENT_ID");
        }

        new AsyncTask<String, Void, List<DisbursementDetail>>() {
            @Override
            protected List<DisbursementDetail> doInBackground(String... params) {
                Log.i("DisbursementDetail","dibusementId:"+disbursementId);
                return DisbursementDetail.listDisbursementDetail(params[0]);

            }

            @Override
            protected void onPostExecute(List<DisbursementDetail> result) {
                Log.i("Disbursement_frag","onPostExecute():" + result);
                disbursementDeliveryDetailList = result;
                rvItems=(RecyclerView) v.findViewById(R.id.rel_items);
                rvItems.setAdapter(new ItemAdapter());
                llm = new LinearLayoutManager(getActivity());
                rvItems.setLayoutManager(llm);
            }
        }.execute(disbursementId);

        return(v);
    }

    class ItemAdapter extends RecyclerView.Adapter<ItemAdapter.ItemsHolder> {

        @Override
        public ItemsHolder onCreateViewHolder(ViewGroup parent, int viewType) {
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.items_disbursement_detail_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }
        @Override
        public void onBindViewHolder(final ItemsHolder holder, int position) {
            holder.txtName.setText(disbursementDeliveryDetailList.get(position).get("itemName"));
            holder.txtQuantity.setText(disbursementDeliveryDetailList.get(position).get("actualQuantity"));
        }

        @Override
        public int getItemCount() {
            return disbursementDeliveryDetailList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView txtName, txtQuantity;

            public ItemsHolder(View itemView) {
                super(itemView);
                txtName = (TextView) itemView.findViewById(R.id.txtName);
                txtQuantity = (TextView) itemView.findViewById(R.id.txtQuantity);


            }
        }
    }
}
