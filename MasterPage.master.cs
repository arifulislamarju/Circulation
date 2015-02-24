using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;

public partial class MasterPage : System.Web.UI.MasterPage
{
    clsDataProvider dataProvider = new clsDataProvider();

    #region All Global Variable
    #endregion

    #region Page Load Event
    
       protected void Page_Load(object sender, EventArgs e)
    
        {
                lblWellCome1.Text = this.Session["UserName"].ToString();

            CustomizePermission();
        }

    #endregion

    #region All Private Methods

        private void CustomizePermission()
        {
            string strFncName = "";

            string selFncName = "Select functionName from View_PermissionCustomize where userName='" + this.Session["UserName"].ToString() + "' and functionName like 'FORM_%'";
            SqlDataReader sdr = dataProvider.getDataReader(selFncName);
            
            while (sdr.Read())
            {
                strFncName = sdr["functionName"].ToString();

                if (strFncName == "FORM_createUser")
                {
                    this.CreateUser.Visible = true;
                }
                else if (strFncName == "FORM_userGroup")
                {
                    this.userGroup.Visible = true;
                }
                
                else if (strFncName == "FORM_groupAuthorization")
                {
                    this.groupAuthorization.Visible = true;
                }
                else if (strFncName == "FORM_hawkerInfo")
                {
                    this.hawkerInfo.Visible = true;
                }
                else if (strFncName == "FORM_AgentSalesQuantity")
                {
                    this.AgentSalesQuantity.Visible = true;
                }
                else if (strFncName == "FORM_CreateRegion")
                {
                    this.region.Visible = true;
                }
                else if (strFncName == "FORM_CreateAUthority")
                {
                    this.authority.Visible = true;
                }

                else if (strFncName == "FORM_CreateDistribution")
                {
                    this.Distribution.Visible = true;
                }

                else if (strFncName == "FORM_weeklyRateSetup")
                {
                    this.weeklyRateSetup.Visible = true;
                }

                else if (strFncName == "FORM_reasonOfUnsold")
                {
                    this.reasonOfUnsold.Visible = true;
                }

                else if (strFncName == "FORM_route")
                {
                    this.route.Visible = true;
                }

                else if (strFncName == "FORM_subRoute")
                {
                    this.subRoute.Visible = true;
                }

                else if (strFncName == "FORM_vehicle")
                {
                    this.vehicle.Visible = true;
                }
                else if (strFncName == "FORM_transportSchedule")
                {
                    this.TransportSchedule.Visible = true;
                }

                else if (strFncName == "FORM_AgentDeed")
                {
                    this.AgentDeed.Visible = true;
                }

                else if (strFncName == "FORM_CompititorData")
                {
                    this.CompititorData.Visible = true;
                }

                else if (strFncName == "FORM_PaperTransaction")
                {
                    this.PaperTransaction.Visible = true;
                }
                else if (strFncName == "FORM_Population")
                {
                    this.population.Visible = true;
                }
                else if (strFncName == "FORM_OrderCapture")
                {
                    this.OrderCapture.Visible = true;
                }
                else if (strFncName == "FORM_copyOrder")
                {
                    this.copyOrder.Visible = true;
                }
                else if (strFncName == "FORM_Quantity_Inc_Dec")
                {
                    this.Quantity_Inc_Dec.Visible = true;
                }
                else if (strFncName == "FORM_ReturnEntry")
                {
                    this.ReturnEntry.Visible = true;
                }
                else if (strFncName == "FORM_regularModify")
                {
                    this.RegularModify.Visible = true;
                }
                else if (strFncName == "FORM_ChalanModify")
                {
                    this.ChalanModify.Visible = true;
                }
                else if (strFncName == "FORM_yearlyTarget")
                {
                    this.yearly.Visible = true;
                }
                else if (strFncName == "FORM_monthlyTarget")
                {
                    this.monthly.Visible = true;
                }
                else if (strFncName == "FORM_QuarterlyTarget")
                {
                    this.Quarterly.Visible = true;
                }
                else if (strFncName == "FORM_rptLabelPrint")
                {
                    this.rtpLabel.Visible = true;
                }
                else if (strFncName == "FORM_CTPSetup")
                {
                    this.CTPSetup.Visible = true;
                }

                else if (strFncName == "FORM_CTPSchedule")
                {
                    this.CTPSchedule.Visible = true;
                }
                else if (strFncName == "FORM_PageSetup")
                {
                    this.PageSetup.Visible = true;
                }
                else if (strFncName == "FORM_UnsoldReport")
                {
                    this.UnsoldReport.Visible = true;
                }
                else if (strFncName == "FORM_OrderSynchronize")
                {
                    this.OrderSynchronize.Visible = true;
                }
                else if (strFncName == "FORM_CategorySetup")
                {
                    this.CategorySetup.Visible = true;
                }
                else if (strFncName == "FORM_dashBoard")
                {
                    this.DashBoard.Visible = true;
                }

                else if (strFncName == "FORM_CompetitorSale")
                {
                    this.CompetitorSale.Visible = true;
                }

                else if (strFncName == "FORM_TransportTime")
                {
                    this.TransportTime.Visible = true;
                }
            }
            sdr.Close();
        }

    #endregion
}   
