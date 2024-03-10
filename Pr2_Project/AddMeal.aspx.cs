using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Pr2_Project
{
    public partial class AddMeal : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ButtonCreate_Click(object sender, EventArgs e)
        {
            string connect = "data source=BASEL; database=PR2; integrated security=SSPI";
            SqlConnection sql = new SqlConnection(connect);
            try
            {
                sql.Open();
                String fileName = Path.GetFileNameWithoutExtension(mealPicture.FileName);
                String SavePath = Server.MapPath("mealPictures/" + fileName);
                String ext = Path.GetExtension(mealPicture.FileName);
                mealPicture.PostedFile.SaveAs(SavePath + ext);
                string name = TextBoxname.Text;
                string ingredients = TextBoxIngredients.Text;
                string category = DropDownListCategory.SelectedValue.ToString();
                string price = TextBoxPrice.Text;
                String img = "mealPictures/" + mealPicture.PostedFile.FileName;
                string qnt = mealQnt.Text;
                string insert = "insert into boz values" +
                    "('" + name + "','" + ingredients + "','" + category + "','" + price + "','" + img + "','" + qnt + "');";
                SqlCommand command = new SqlCommand(insert, sql);
                command.ExecuteNonQuery();
                Response.Redirect("~/Default");
            }
            catch (Exception ex)
            {
                Response.Write("Error " + ex.Message);
            }
            finally
            {
                sql.Close();
            }
        }
    }
}