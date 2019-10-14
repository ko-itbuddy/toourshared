﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using MySql.Data.MySqlClient;
using System.Data;
using tooushared.Lib;
using tooushared.DTO;



/// <summary>
/// MemberDao의 요약 설명입니다.
/// </summary>
namespace tooushared.DAO
{
    public class MemberDao
    {



        public MemberDao()
        {
            //
            // TODO: 여기에 생성자 논리를 추가합니다.
            //
        }



        public int InsertMember(Member member)
        {



            int result;
            if (member.Mem_id == "" && member.Mem_pw == "" && member.Mem_name == "")
            {
                Console.WriteLine("error parameter value is empty");
                result = -2;
            }
            DataSet ds = new DataSet();
            try
            {
                MyDB myDB = new MyDB();
                MySqlConnection con = myDB.GetCon();




                string Sql = "INSERT INTO toourshared.member (mem_id, mem_state, mem_phone, mem_pw, mem_name, mem_sex, mem_ques, mem_answer, mem_birth, mem_email, mem_reg_datetime, mem_timestmap, mem_img_url)" +
                    " VALUES (@mem_id, @mem_state, @mem_phone, @mem_pw, @mem_name, @mem_sex, @mem_ques, @mem_answer, @mem_birth, @mem_email, @mem_reg_datetime, @mem_timestmap, @mem_img_url)";

                MySqlCommand cmd = new MySqlCommand(Sql, con);

                cmd.Parameters.AddWithValue("@mem_id", member.Mem_id);
                cmd.Parameters.AddWithValue("@mem_state", member.Mem_state);
                cmd.Parameters.AddWithValue("@mem_phone", member.Mem_phone);
                cmd.Parameters.AddWithValue("@mem_pw", member.Mem_pw);
                cmd.Parameters.AddWithValue("@mem_name", member.Mem_name);
                cmd.Parameters.AddWithValue("@mem_sex", member.Mem_sex);
                cmd.Parameters.AddWithValue("@mem_ques", member.Mem_ques);
                cmd.Parameters.AddWithValue("@mem_answer", member.Mem_answer);
                cmd.Parameters.AddWithValue("@mem_birth", member.Mem_birth);
                cmd.Parameters.AddWithValue("@mem_email", member.Mem_email);
                cmd.Parameters.AddWithValue("@mem_reg_datetime", member.Mem_reg_datetime);
                cmd.Parameters.AddWithValue("@mem_timestmap", member.Mem_timestmap);
                cmd.Parameters.AddWithValue("@mem_img_url", member.Mem_img_url);




                con.Open();


                con.Close();
                result = cmd.ExecuteNonQuery();

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.StackTrace);
                //-1 이면 오류
                result = -1;

            }


            return result;

        }

        public List<Member> selectFile(Member member)
        {

            MyDB mydb = new MyDB();
            List<Member> lstMember = new List<Member>();
            Member tmpMemberPointer;
            MySqlConnection con;

            try
            {

                con = mydb.GetCon();

                string Sql = "SELECT member.mem_id,    member.mem_state,    member.mem_phone,    member.mem_pw,    member.mem_name,    member.mem_sex,    member.mem_ques,    member.mem_answer,    member.mem_birth,    member.mem_email,    member.mem_reg_datetime,    member.mem_timestmap,    member.mem_img_url FROM toourshared.member";


                MySqlCommand cmd = new MySqlCommand(Sql, con);

                con.Open();
                MySqlDataReader rd = cmd.ExecuteReader();

                if (rd.HasRows)
                {


                    while (rd.Read())
                    {
                        tmpMemberPointer = new Member();

                        tmpMemberPointer.Mem_id = rd["mem_id"].ToString();
                        tmpMemberPointer.Mem_state = rd["mem_state"].ToString();
                        tmpMemberPointer.Mem_phone = rd["mem_phone"].ToString();
                        tmpMemberPointer.Mem_pw = rd["mem_pw"].ToString();
                        tmpMemberPointer.Mem_name = rd["mem_name"].ToString();
                        tmpMemberPointer.Mem_sex = rd["mem_sex"].ToString();
                        tmpMemberPointer.Mem_ques = rd["mem_ques"].ToString();
                        tmpMemberPointer.Mem_answer = rd["mem_answer"].ToString();
                        tmpMemberPointer.Mem_birth = rd["mem_birth"].ToString();
                        tmpMemberPointer.Mem_email = rd["mem_email"].ToString();
                        tmpMemberPointer.Mem_reg_datetime = rd["mem_reg_datetime"].ToString();
                        tmpMemberPointer.Mem_timestmap = rd["mem_timestmap"].ToString();
                        tmpMemberPointer.Mem_img_url = rd["mem_img_url"].ToString();

                        lstMember.Add(tmpMemberPointer);


                    }
                }

                con.Close();


            }
            catch (Exception ex)
            {
                Console.Write(ex.ToString());
            }



            return lstMember;
        }
    }
}