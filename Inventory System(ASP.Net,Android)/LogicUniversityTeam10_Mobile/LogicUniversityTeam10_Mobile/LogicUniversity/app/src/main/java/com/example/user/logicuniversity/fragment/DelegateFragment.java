package com.example.user.logicuniversity.fragment;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.app.Dialog;
import android.app.Fragment;
import android.content.Context;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.StrictMode;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentManager;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.example.user.logicuniversity.Model.Delegation;
import com.example.user.logicuniversity.Model.Staff;
import com.example.user.logicuniversity.R;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by Zaw Myo Htet.
 */
public class DelegateFragment extends Fragment{
    int resource;
    View myView;
    Button btnDelegate, btnTerminate;
    static EditText editStaffId,editTextStartDate, editTextEndDate;
    Spinner spinnerStaffId;
    String userId, depId, depHeadId, roleName, userName;
    int roleId;
    String spinnerItemSelectedText, spinnerItemSelectedNameText;
    List<String> staffNameStringList = new ArrayList<String>();
    List<Staff> staffList;
    Delegation newDelegation, oldDelegation;
    SharedPreferences pref;

    InputMethodManager inputManager;
    private FragmentActivity context;
    FragmentManager fragManager;

    @Override
    public void onAttach(Activity activity) {
        context=(FragmentActivity) activity;
        super.onAttach(activity);
    }


    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        // pref = PreferenceManager.getDefaultSharedPreferences(getActivity().getApplicationContext());
        pref = getActivity().getSharedPreferences("LOGIC", getActivity().MODE_PRIVATE);
        userId = pref.getString("STAFFID","1102");
        userName = pref.getString("STAFFNAME","Prof Ezra Pound");
        depId = pref.getString("DEPID","1102");
        depHeadId = pref.getString("DEPHEADID","1102");
        roleId = pref.getInt("ROLEID", 2);
        roleName = pref.getString("ROLENAME", "DepartmentHead");
        resource = R.layout.delegate_fragment_layout;

        Bundle bundle = getArguments();

        if(bundle != null) {
            /*userId = bundle.getString("STAFFID");
            depId = bundle.getString("DEPID");
            depHeadId = bundle.getString("DEPHEADID")*/;
            resource = bundle.getInt("RESOURCE");
            oldDelegation = (Delegation) bundle.getSerializable("DELEGATION");
            Log.i("DelegateFragment","bundle is not null userId: " + userId + " depId: " + depId + " depHeadId: " + depHeadId + " oldDelegation: " + oldDelegation);
        }

        myView = inflater.inflate(resource, container, false);

        editTextStartDate = (EditText) myView.findViewById(R.id.editTextStartDate);
        editTextStartDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v1) {
                hideVirtualKeyboard();
                showDatePickerDialogStartDate(v1);
            }
        });
        editTextEndDate = (EditText) myView.findViewById(R.id.editTextEndDate);
        editTextEndDate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v2) {
                hideVirtualKeyboard();
                showDatePickerDialogEndDate(v2);

            }
        });

        if(resource == R.layout.delegate_fragment_layout){
            spinnerStaffId = (Spinner) myView.findViewById(R.id.spinnerEmpId);
            StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.LAX);
            staffList = Staff.listStaff(depId, userId);
            Log.i("DelegateFragment","staffList " + staffList);
            convertForSpinner();
            ArrayAdapter<String> staffAdapter = new ArrayAdapter<String>(getActivity(), android.R.layout.simple_dropdown_item_1line,staffNameStringList);
            spinnerStaffId.setAdapter(staffAdapter);
            spinnerStaffId.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                @Override
                public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                    spinnerItemSelectedText = parent.getItemAtPosition(position).toString();
                    Log.i("DelegateFragment","spinner onItemSelected() spinner: " + spinnerItemSelectedText);
                }

                @Override
                public void onNothingSelected(AdapterView<?> parent) {

                }
            });


            btnDelegate = (Button) myView.findViewById(R.id.buttonDelegate);
            btnDelegate.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Log.i("DelegateFragment","btnDelegate");
                    newDelegation = new Delegation();

                    if(!isEmpty(spinnerItemSelectedText)) {
                        spinnerItemSelectedNameText = spinnerItemSelectedText;
                        spinnerItemSelectedText = convertToStaffId(spinnerItemSelectedText);
                    }

                    String startDate = editTextStartDate.getText().toString();
                    String endDate = editTextEndDate.getText().toString();
                    if(!isEmpty(spinnerItemSelectedText) && !isEmpty(startDate) && !isEmpty(endDate)){
                        newDelegation.put("departmentHeadId", depHeadId);
                        newDelegation.put("staffId",spinnerItemSelectedText);
                        newDelegation.put("startDate", startDate);
                        newDelegation.put("endDate",endDate);
                        newDelegation.put("staffName",userName);
                        newDelegation.put("roleName",roleName);

                        new AsyncTask<Delegation, Void, Void>() {
                            @Override
                            protected Void doInBackground(Delegation... params) {
                                Log.i("DelegateFragment","doInBackground" + params[0]);
                                Delegation.SaveDelegateInfo(params[0]);
                                return null;
                            }

                            @Override
                            protected void onPostExecute(Void result) {
                                Log.i("DelegateFragment","onPostExecute" + result);
                                editTextStartDate.setText("");
                                editTextEndDate.setText("");
                                btnDelegate.setEnabled(false);
                                Toast.makeText(getActivity(), spinnerItemSelectedNameText + " has been authorized! !",Toast.LENGTH_SHORT).show();
                            }
                        }.execute(newDelegation);
                    }
                }
            });
        }else{
            editStaffId = (EditText) myView.findViewById(R.id.editTextStaffId);
            btnTerminate = (Button) myView.findViewById(R.id.buttonTerminate);
            if(oldDelegation != null){
                editStaffId.setText(oldDelegation.get("staffName"));
                editStaffId.setFocusable(false);
                editTextStartDate.setText(oldDelegation.get("startDate"));
                editTextStartDate.setFocusable(false);
                editTextStartDate.setEnabled(false);
                editTextEndDate.setText(oldDelegation.get("endDate"));
                editTextEndDate.setFocusable(false);
                editTextEndDate.setEnabled(false);
            }

            btnTerminate.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    Log.i("DelegateFragment","btnTerminate");
                    if(!isEmpty(editStaffId.getText().toString()) && !isEmpty(editTextStartDate.getText().toString()) && !isEmpty(editTextEndDate.getText().toString())){
                        new AsyncTask<String, Void, Void>() {
                            @Override
                            protected Void doInBackground(String... params) {
                                Log.i("DelegateFragment","doInBackground" + params[0]);
                                Delegation.TerminateDelegation(params[0]);
                                return null;
                            }

                            @Override
                            protected void onPostExecute(Void result) {
                                Log.i("DelegateFragment","onPostExecute" + result);
                                editStaffId.setText("");
                                editTextStartDate.setText("");
                                editTextEndDate.setText("");
                                btnTerminate.setEnabled(false);
                                Toast.makeText(getActivity(),oldDelegation.get("staffName") + " has been terminated!",Toast.LENGTH_SHORT).show();
                            }
                        }.execute(depId);
                    }
                }
            });
        }
        return myView;
    }

    //hide keyboard
    public void hideVirtualKeyboard()
    {
        inputManager = (InputMethodManager) getActivity().getSystemService(Context.INPUT_METHOD_SERVICE);
        inputManager.hideSoftInputFromWindow(getActivity().getCurrentFocus().getWindowToken(),InputMethodManager.HIDE_NOT_ALWAYS);
    }
    // datepicker
    public void showDatePickerDialogStartDate(View v) {
        DialogFragment newFragment = new StartDatePickerFragment();
        newFragment.show(context.getSupportFragmentManager(), "datePicker");
    }
    public void showDatePickerDialogEndDate(View v) {
        DialogFragment newFragment = new EndDatePickerFragment();
        newFragment.show(context.getSupportFragmentManager(), "datePicker");
    }
    public static class StartDatePickerFragment extends DialogFragment implements
            DatePickerDialog.OnDateSetListener {

        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            // Use the current date as the default date in the picker
            final Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int day = c.get(Calendar.DAY_OF_MONTH);

            // Create a new instance of DatePickerDialog and return it
            return new DatePickerDialog(getActivity(), this, year, month, day);
        }

        public void onDateSet(DatePicker view, int year, int month, int day) {
            //logic here
            editTextStartDate.setText(year + "/" + (month + 1) + "/" + day);
        }
    }
    public static class EndDatePickerFragment extends DialogFragment implements
            DatePickerDialog.OnDateSetListener {

        @Override
        public Dialog onCreateDialog(Bundle savedInstanceState) {
            // Use the current date as the default date in the picker
            final Calendar c = Calendar.getInstance();
            int year = c.get(Calendar.YEAR);
            int month = c.get(Calendar.MONTH);
            int day = c.get(Calendar.DAY_OF_MONTH);

            // Create a new instance of DatePickerDialog and return it
            return new DatePickerDialog(getActivity(), this, year, month, day);
        }

        public void onDateSet(DatePicker view, int year, int month, int day) {
            //logic here
            editTextEndDate.setText(year + "/" + (month + 1) + "/" + day);
        }
    }

    private void convertForSpinner(){
        if(staffNameStringList.size() > 0) {
            staffNameStringList.clear();
        }
        for(Staff ss : staffList){
            staffNameStringList.add(ss.get("staffName"));
        }
        Log.i("DelegateFragment","convertForSpinner() staffNameStringList: " + staffNameStringList);
    }

    private String convertToStaffId(String staffName){
        String staffSelectedId = "";
        if(staffNameStringList.size() > 0 && staffList.size() > 0){
            int index = staffNameStringList.indexOf(staffName);
            staffSelectedId = staffList.get(index).get("staffId");
        }
        Log.i("DelegateFragment","convertToStaffId() staffName: " + staffName + " staffId: " + staffSelectedId);
        return staffSelectedId;
    }

    private boolean isEmpty(String input){
        return input.trim().length() == 0;
    }

}
