using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Pr2_Project
{
    public partial class Default : System.Web.UI.Page
    {

        static readonly string connect = "data source=BASEL; database=PR2; integrated security=SSPI";
        SqlConnection sql = new SqlConnection(connect);
        protected void Page_Load(object sender, EventArgs e)
        {
            tableEdit.Visible= false;
            try
            {
                sql.Open();
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from boz", sql); //to select
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                GridViewMeal.DataSource = dt;
                GridViewMeal.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.Message);
            }
            finally
            {
                sql.Close();
            }
        }

        protected void ButtonAddMeal_Click(object sender, EventArgs e)
        {
            Response.Redirect("./AddMeal");
        }
        protected void Order_click(object sender, EventArgs e)
        {
            LinkButton lk = (LinkButton)sender;
            GridViewRow selectedRow = (GridViewRow)lk.NamingContainer; // to grap the selected row
            string id = selectedRow.Cells[0].Text;
            string Mname = selectedRow.Cells[1].Text;
            int amount = Convert.ToInt32(TextBoxAmount.Text);
            int qt = Convert.ToInt32(selectedRow.Cells[6].Text); 
            if (qt > 0)
            {
                try
                {
                    sql.Open();
                    string command = "UPDATE boz set quantity = quantity-" + amount + " WHERE ID='" + id + "';";
                    SqlCommand sqlc = new SqlCommand(command, sql);
                    sqlc.ExecuteNonQuery(); // to reduce qunatity from database
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from boz", sql); 
                    DataTable dt = new DataTable();
                    sqlDa.Fill(dt);
                    GridViewMeal.DataSource = dt;
                    GridViewMeal.DataBind();// reget values from database
                    string orderTime = DateTime.Now.ToString("hh:mm:ss tt");
                    string insertOrder = "insert into u_order values" +
                        "('" + orderTime + "','" + id + "')";
                    SqlCommand commandOrder = new SqlCommand(insertOrder, sql);
                    commandOrder.ExecuteNonQuery();
                    Purchase.Text = "You ordered " + Mname + " amount =  " + amount;
                    TextBoxAmount.Text = "";
                }
                catch (Exception ex)
                {
                    Response.Write("Error" + ex.Message);
                }
                finally
                {
                    sql.Close();
                }
            }
            else
            {
                Order.Text = "Sorry,we ran out of this meal!" + amount;
            }
        }
        protected void Update_Click(object sender, EventArgs e)
        {
            tableEdit.Visible= true; // show table for updating values
            LinkButton lk = (LinkButton)sender;
            GridViewRow selectedRow = (GridViewRow)lk.NamingContainer; // to get the selected row 
            string mealID = selectedRow.Cells[0].Text;
            string mealName = selectedRow.Cells[1].Text;
            string mealIngredients = selectedRow.Cells[2].Text;
            string mealCategory = selectedRow.Cells[3].Text;
            string mealPrice = selectedRow.Cells[4].Text;
            string mealQNT = selectedRow.Cells[6].Text;
            TextBoxID.Text = mealID;
            TextBoxname.Text = mealName;
            TextBoxIngredients.Text = mealIngredients;
            DropDownListCategory2.Text = mealCategory;
            TextBoxPrice.Text = mealPrice;
            mealQnt.Text = mealQNT;
        }
        protected void DropDownListCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            string category = DropDownListCategory.SelectedValue.ToString();//to get the selected value from the drop list
            if (category == "*")
            {
                try
                {
                    sql.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from boz", sql); //to get values
                    DataTable dt = new DataTable();
                    sqlDa.Fill(dt);
                    GridViewMeal.DataSource = dt;
                    GridViewMeal.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Error" + ex.Message);
                }
                finally
                {
                    sql.Close();
                }
            }
            else
            {
                try
                {
                    sql.Open();
                    SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from boz where mealCategory = '" + category + "';", sql); //to get values based on category from the droplist
                    DataTable dt = new DataTable();
                    sqlDa.Fill(dt);
                    GridViewMeal.DataSource = dt;
                    GridViewMeal.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Error" + ex.Message);
                }
                finally
                {
                    sql.Close();
                }
            }
        }

        protected void ButtonUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                sql.Open();
                String fileName = Path.GetFileNameWithoutExtension(mealPicture.FileName);//to get name of the picture without the ext 
                String SavePath = Server.MapPath("mealPictures/" + fileName);//to add the pic name to the path where we save the project pictures
                String ext = Path.GetExtension(mealPicture.FileName);//to get the ext of the file 
                mealPicture.PostedFile.SaveAs(SavePath + ext);//to save file and combine the file name with the file ext
                string ID = TextBoxID.Text;
                string Name = TextBoxname.Text;
                string ingredients = TextBoxIngredients.Text;
                string category = DropDownListCategory2.Text;
                string price = TextBoxPrice.Text;
                String img = "mealPictures/" + mealPicture.PostedFile.FileName;
                string qnt = mealQnt.Text;
                string command = "UPDATE boz set mealName = '" + Name + "', mealIngredients = '" + ingredients + "', mealCategory = '" + category + "', mealPrice = '" + price + "', mealPicture = '" + img + "', quantity = '" + qnt + "' WHERE ID='" + ID + "';";
                SqlCommand sqlc = new SqlCommand(command, sql);
                sqlc.ExecuteNonQuery(); // to update the selected row
                SqlDataAdapter sqlDa = new SqlDataAdapter("SELECT * from boz ;", sql); //to get values
                DataTable dt = new DataTable();
                sqlDa.Fill(dt);
                GridViewMeal.DataSource = dt;
                GridViewMeal.DataBind();
                tableEdit.Visible = false; // hide the update table
            }
            catch (Exception ex)
            {
                Response.Write("Error" + ex.Message);
            }
            finally
            {
                sql.Close();
            }
        }
    }
}