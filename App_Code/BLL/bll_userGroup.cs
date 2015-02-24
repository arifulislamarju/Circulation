using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_userGroup
/// </summary>
public class bll_userGroup
{   
    dal_userGroup dalUserGroup = new dal_userGroup();

	
        #region Data Member       
          
          private int _GROUPID;
          private string _GROUPNAME = "";
          private string _GROUPDESC = "";         
          private DateTime _CREATEDATE;         
          private string _AUDUSER = "";
          private int _USERFUNCID;
          private string _FUNCNAME = "";
          

        #endregion

        #region Properties

          public int GROUPID
          {
              get { return _GROUPID; }
              set { this._GROUPID = value; }
          }
          public string GROUPNAME
          {
              get { return _GROUPNAME; }
              set { this._GROUPNAME = value; }
          }
          public string GROUPDESC
          {
              get { return _GROUPDESC; }
              set { this._GROUPDESC = value; }
          }
          
          public DateTime CREATEDATE
          {
              get { return _CREATEDATE; }
              set { _CREATEDATE = value; }
          }
          public string AUDUSER
          {
              get { return _AUDUSER; }
              set { this._AUDUSER = value; }
          }
          public int USERFUNCID
          {
              get { return _USERFUNCID; }
              set { _USERFUNCID = value; }
          }


          public string FUNCNAME
          {
              get { return _FUNCNAME; }
              set { _FUNCNAME = value; }
          }

        #endregion

        #region Member Functions

              public void Insert()
              {
                  dalUserGroup.Insert(this);

              }

              public void Delete()
              {
                  dalUserGroup.Delete(this);
              }

              public void Update()
              {
                  dalUserGroup.Update(this);
              }

              
          #endregion

   
}