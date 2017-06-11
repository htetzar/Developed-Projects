package com.example.user.logicuniversity.fragment;

import android.app.Fragment;
import android.app.FragmentManager;
import android.app.FragmentTransaction;
import android.app.ListFragment;
import android.os.AsyncTask;
import android.os.Bundle;
import android.support.v7.widget.LinearLayoutManager;
import android.support.v7.widget.RecyclerView;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ListView;
import android.widget.TextView;

import com.example.user.logicuniversity.Model.StaffRequisition;
import com.example.user.logicuniversity.Model.StationeryRetrieval;
import com.example.user.logicuniversity.R;

import java.util.List;



/**
 * Created by Htet Zar Chi Aung.
 */

public class StationeryRetrievalListFragment extends Fragment {
    List<StationeryRetrieval> stationeryRetrievalList;
    View v;
    ListView lv;
    RecyclerView rvItems;
    LinearLayoutManager llm;
    public static final String ITEM_NAME = "ITEM_NAME";

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        v = inflater.inflate(R.layout.stationery_retrieval_recycler_fragment, container, false);

        new AsyncTask<Void, Void, List<StationeryRetrieval>>() {
            @Override
            protected List<StationeryRetrieval> doInBackground(Void... params) {
                Log.i("Requisition_detail_frag","doInBackground() requisitionId: " );
                return StationeryRetrieval.listStationeryRetrieval();
            }

            @Override
            protected void onPostExecute(List<StationeryRetrieval> result) {
                Log.i("Requisition_detail_frag","onPostExecute() result: " + result);
                stationeryRetrievalList = result;
                rvItems = (RecyclerView) v.findViewById(R.id.r2_items);
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
            Log.i("Requisition_detail_frag","onCreateViewHolder() ViewGroup: " + parent + " viewType: " + viewType);
            View v = LayoutInflater.from(getActivity()).inflate(R.layout.item_stationery_retrieval_list_fragment,
                    parent, false);
            return new ItemsHolder(v);
        }

        @Override
        public void onBindViewHolder(final ItemsHolder holder, int position) {
            Log.i("Requisition_detail_frag","onBindViewHolder() position: " + position + " stationeryRetrievalList: " + stationeryRetrievalList);
            holder.tvBinId.setText(stationeryRetrievalList.get(position).get("binId"));
            holder.tvItemName.setText(stationeryRetrievalList.get(position).get("itemName"));
            holder.tvQuantity.setText(stationeryRetrievalList.get(position).get("quantity"));
            holder.itemView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Bundle b = new Bundle();
                    Log.i("St_Retri_L_Frg","onBindViewHolder() itemName: " + stationeryRetrievalList.get(holder.getAdapterPosition()).get("itemName"));
                    b.putString("ITEM_NAME", stationeryRetrievalList.get(holder.getAdapterPosition()).get("itemName"));
                    FragmentManager fm = getFragmentManager();
                    Fragment secondFragment = new DepartmentRetrievalListFragment();
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
            return stationeryRetrievalList.size();
        }

        class ItemsHolder extends RecyclerView.ViewHolder {
            TextView tvBinId, tvItemName, tvQuantity;


            public ItemsHolder(View itemView) {
                super(itemView);
                tvBinId = (TextView) itemView.findViewById(R.id.tvBinId);
                tvItemName = (TextView) itemView.findViewById(R.id.tvItemName);
                tvQuantity = (TextView) itemView.findViewById(R.id.tvQuantity);
            }
        }
    }
}
