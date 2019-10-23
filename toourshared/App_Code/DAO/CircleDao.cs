﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using tooushared.Lib;

/// <summary>
/// CircleDao의 요약 설명입니다.
/// </summary>
public class CircleDao
{
    public CircleDao()
    {
        //
        // TODO: 여기에 생성자 논리를 추가합니다.
        //
    }

    public string InsertCircle(Circle circle)
    {

  
        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        string Sql = "INSERT INTO toourshared.circle (cir_crd,cir_name,cir_content,cos_no,map_no) VALUES(@cir_crd,@cir_name,@cir_content,@cos_no,@map_no); select last_insert_id()";
        MySqlCommand cmd = new MySqlCommand(Sql, con);

        cmd.Parameters.AddWithValue("@cir_crd", circle.Cir_crd);
        cmd.Parameters.AddWithValue("@cir_name",circle.Cir_name);
        cmd.Parameters.AddWithValue("@cir_content",circle.Cir_content);
        cmd.Parameters.AddWithValue("@cos_no", circle.Cos_no);
        cmd.Parameters.AddWithValue("@map_no", circle.Map_no);

        con.Open();

     

        string result = cmd.LastInsertedId.ToString();

        con.Close();


        return result;
    }
    //public void DeleteCommentBy(mem_id)
    public DataSet SelectCircle()
    {
        MyDB myDB = new MyDB();
        MySqlConnection con = myDB.GetCon();

        string sql = "Select cir_no,cir_crd,cir_name,cir_content,cos_no,map_no  From toourshared.circle";
        MySqlCommand cmd = new MySqlCommand(sql, con); // 커맨드(sql문을 con에서 수행하기 위한 명령문) 생성 DB에서 수행시킬 명령 생성   

        MySqlDataAdapter ad = new MySqlDataAdapter();
        ad.SelectCommand = cmd;
        DataSet ds = new DataSet();
        ad.Fill(ds);


        return ds;
    }

    public Circle selectCircleByCir_no(Circle circle)
    {

        MyDB mydb = new MyDB();

        Circle result = new Circle();
        MySqlConnection con;

        try
        {
            con = mydb.GetCon();

            string Sql = "SELECT * FROM toourshared.circle where cir_no=@cir_no";


            MySqlCommand cmd = new MySqlCommand(Sql, con);

            cmd.Parameters.AddWithValue("@cir_no", circle.Cir_no);

            con.Open();
            MySqlDataReader rd = cmd.ExecuteReader();

            if (rd.HasRows)
            {
                rd.Read();

                result.Cir_no = rd["cir_no"].ToString();
                result.Cir_crd = rd["cir_crd"].ToString();
                result.Cir_name = rd["cir_name"].ToString();
                result.Cir_content = rd["cir_content"].ToString();
                result.Cos_no = rd["cos_no"].ToString();
                result.Map_no = rd["map_no"].ToString();


                //lstMember.Add(tmpMemberPointer);

                return result;

            }

            con.Close();

        }
        catch (Exception ex)
        {
            Console.Write(ex.ToString());
        }
        return result;
    }

}

