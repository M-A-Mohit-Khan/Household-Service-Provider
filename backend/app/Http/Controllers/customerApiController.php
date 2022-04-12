<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\alluser;
use App\Models\customer;

class customerApiController extends Controller
{
    //Customer

    public function getAllCustomer(){
        
        $customer = c::where('usertype','customer')->get();

        return response($customer, 200);
    }

    public function getOneCustomer($id){
        $customer = c::where('usertype','customer')->where('id',$id)->first();
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

        return response($c, 200);
    }

    public function add(Request $req)
    {
        $alluser = new alluser;
        $alluser->id = $req->id;
        $alluser->password = $req->password;
        $alluser->email = $req->email;
        $alluser->phone = $req->phone;
        $alluser->dob = $req->dob;
        $alluser->gender = $req->gender;
        $alluser->usertype = "customer";
        $alluser->active_status = "active";
        $alluser->save();
        
        $customer = new customer;
        $customer->id = $req->id;
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



}
