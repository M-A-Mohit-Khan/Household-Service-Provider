<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\alluser;
use App\Models\staff;
use App\Models\handover;
use App\Models\transferrequest;
use Illuminate\Support\Facades\Hash;
use Validator;
use App\Mail\SendMail;
use Illuminate\Support\Facades\Mail;


class staffApiController extends Controller
{
    //staff
    
    

    public function Verify(Request $req)
    {
        try
        {
            $num=rand(1,1000000000000);
            $subject="Verify your email";
            $body=$num." Use this code to verify your email.";
            Mail::to($req->email)->send(new SendMail($subject,$body));
            return response()->json(["code"=>$num]);
        }
        catch(\Exception $e)
        {
            return response()->json([
                "status"=>"Failed",
                "message"=>$e->getMessage()
            ],400);
        }
    }





    //Staff's Registration
    public function StaffRegistration(Request $r)
    {
        $check = Validator::make($r->all(),
            [
                'username'=>'required|min:4|max:10|unique:allusers|regex:/^[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*$/',
                'email'=>'required',
                'password'=>'required|min:6|max:11',
                'cpassword'=>'required|same:password',
                'phone'=>'required|min:11|max:11|regex:/^01[3,5,6,7,8,9]{1}[0-9]{8}$/',
                'gender'=>'required',
                'dob'=>'required',
                'branch'=>'required',
                'expertise_area'=>'required',
                'image'=>'required',
                
            ],
            
    );

        
        if($check->fails()){
            return response()->json($check->errors());
        }

        
        $st =new alluser();
        $st->username=$r->username;
        $st->password=md5($r->password);
        $st->email=$r->email;
        $st->phone=$r->phone;
        $st->dob=$r->dob;
        $st->gender=$r->gender;
        
        $st->usertype="staff";
        $st->image=$r->image;
        $st->save();

        if(!$st->save())
        {
            return response()->json(["msg"=>"Error in registration please try again later!"]);
        }

        
        $st1 =new staff();
        $st1->username=$r->username;
        $st1->password=md5($r->password);
        $st1->email=$r->email;
        $st1->phone=$r->phone;
        $st1->dob=$r->dob;
        $st1->gender=$r->gender;
        $st1->branch=$r->branch;
        $st1->expertise_area=$r->expertise_area;
        $st1->image=$r->image;
        $st1->save();


        if(!$st1->save())
        {
            return response()->json(["msg"=>"Error in registration please try again later!"]);
        }

        return response()->json(["msg"=>"Staff successfully registered"]);

    }



    //Staff's Login
    public function StaffLogin(Request $r)
    {
        $check = Validator::make($r->all(),
            [
                'username'=>'required|min:4|max:10|regex:/^[A-Za-z0-9]+(?:[_-][A-Za-z0-9]+)*$/',
                'password'=>'required|min:6|max:11',
                
            ],
            
    );

        
        if($check->fails()){
            return response()->json([
                "status"=>2,
                "message"=>"Email or password not found!"
            ]);
        }

        $user=alluser::where('username',$r->username)->where('password',md5($r->password))->where('active_status',"active")->first();
        if($user==null)
        {
            return response()->json([
                "status"=>3,
                "message"=>"Invalid email or password or status!"
            ]);
        }
        else
        {
            return response()->json(["status"=>1,"message"=>"Login Successful!"]);
        }

    }


    //Staff's Dashboard
    public function UserDashboard($name){
        $status="active";
        $handover = handover::where('staff',$name)->where('status',$status)->get();
        return response()->json(["handover"=>$handover]);
        //return response($handover, 200);
    }

    //Accept Oder By Staff
    public function OrderAccept($id)
    { 
        
        $handover=handover::where('id',$id)->first();
        $handover->status="accepted";
        $handover->save();
        
        return response()->json(["handover"=>$handover]);
    }



    //All Services Given By One Staff
    public function AllService($name){
        $status="accepted";
        $handover = handOver::where('staff',$name)->where('status',$status)->get();
        if($handover==null)
        {
            return response()->json(["msg"=>"No service provided yet!"]);
        }
        else
        {
            return response()->json(["Service given"=>$handover]);
        }
    }



    //Staff's Profile Details
    public function ProfileDetails($id){
        $staff = staff::where('id',$id)->first();
        return response()->json(["staff"=>$staff]);
    }


    //Staff's Password Change
    public function ChangePassword(Request $r)
    {  
        $check = Validator::make($r->all(),
            [
                'username'=>'required',
                'cupassword'=>'required',
                'password'=>'required|min:6|max:11',
                'cpassword'=>'required|same:password',
                
                
            ],
        );

        if($check->fails()){
            return response()->json($check->errors());
        }

        $name=$r->username;
        $staff=staff::where('username',$name)->first();
        if($r->cupassword==$r->password)
        {
            return response()->json(["msg"=>"Current password matches new password"]);
        }
        if(md5($r->cupassword)!=$staff->password)
        {
            return response()->json(["msg"=>"Current password not matched"]);
        }
        else
        {
            $staff->password=md5($r->password);
            $staff->save();
            $user=alluser::where('username',$name)->first();
            $user->password=md5($r->password);
            $user->save();
            return response()->json(["msg"=>"Password changed successfully"]);

        }
      
    }

    //Staff's Branch transfer
    public function BranchTransfer(Request $r)
    {

        $check = Validator::make($r->all(),
            [
                'username'=>'required',
                'des_branch'=>'required',
                
            ],


        );   


        if($check->fails()){
            return response()->json($check->errors());
        }


        $name=$r->username;
        $staff=staff::where('username',$name)->first();
        $curr_branch=$staff->branch;

        $st =new transferrequest();
        $st->username=$name;
        $st->curr_branch=$curr_branch;
        $st->des_branch=$r->des_branch;
       
        $st->save();
        
        return response()->json(["msg"=>"Branch transfer Submitted"]);
    
    }
}
