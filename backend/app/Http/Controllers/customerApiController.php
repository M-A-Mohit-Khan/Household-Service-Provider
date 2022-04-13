<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\alluser;
use App\Models\customer;
use App\Models\order;

class customerApiController extends Controller
{
    //Customer

    public function getAllCustomer(){
        
        $customer = alluser::where('usertype','customer')->get();

        return response($customer, 200);
    }

    public function getOneCustomer($id){
        $customer = alluser::where('usertype','customer')->where('id',$id)->first();
        return response($customer, 200);
    }

    public function edit(Request $req)
    {
        $alluser = alluser::where('id', $req->id)->first();
        $alluser->username = $req->username;
        $alluser->email = $req->email;
        $alluser->phone = $req->phone;
        $alluser->dob = $req->dob;
        $alluser->save();
        
        $customer = customer::where('id', $req->id)->first();
        $customer->username = $req->username;
        $customer->email = $req->email;
        $customer->phone = $req->phone;
        $customer->dob = $req->dob;
        $customer->save();

        return response($alluser, 200);
    }

    public function add(Request $req)
    {
        $alluser = new alluser;
        // $alluser->id = $req->id;
        $alluser->password = $req->password;
        $alluser->email = $req->email;
        $alluser->phone = $req->phone;
        $alluser->dob = $req->dob;
        $alluser->gender = $req->gender;
        $alluser->usertype = "customer";
        $alluser->active_status = "active";
        $alluser->save();
        
        $customer = new customer;
        // $customer->id = $req->id;
        $customer->username = $req->username;
        $customer->password = $req->password;
        $customer->email = $req->email;
        $customer->phone = $req->phone;
        $customer->dob = $req->dob;
        $customer->gender = $req->gender;
        $customer->usertype = "customer";
        $customer->active_status = "active";
        $customer->save();
        return response($alluser, 200);
    }

    public function delete($id)
    {
        $customer = alluser::where('id', $id)->first();
       
        $found = $customer->delete();
        if ($found) return response("Deleted successfully", 200);
        return response("Delete failed", 404);
    }
//customer controller

public function orderlist(){
        
    $order = order::all();

    return response($order, 200);
}
public function order(Request $req)
{
    $order = new order;
    // $alluser->id = $req->id;
    $order->customer_name = $req->customer_name;
    $order->list = $req->list;
    $order->amount = $req->amount;
    $order->branch = $req->branch;
    $order->address = $req->address;
    $order->status = "pending";
    $order->save();
    return response($order, 200);

}
}
