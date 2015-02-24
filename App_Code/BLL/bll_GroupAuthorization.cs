using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_GroupAuthorization
/// </summary>
public class bll_GroupAuthorization
{
    dal_GroupAuthorization dalGroupAuthorization = new dal_GroupAuthorization();

    #region Data Member

        private int _GRPFNCID;
        private int _GROUPID;
        private int _FUNCTIONID;
        private DateTime _CREATEDATE;
        private string _AUDUSER = "";

    #endregion

    #region Properties

        public int GRPFNCID
        {
            get { return _GRPFNCID; }
            set { _GRPFNCID = value; }
        }  

        public int GROUPID
        {
            get { return _GROUPID; }
            set { _GROUPID = value; }
        }   

        public int FUNCTIONID
        {
            get { return _FUNCTIONID; }
            set { _FUNCTIONID = value; }
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

    #endregion

    #region Member Functions

        public void Insert()
        {

            dalGroupAuthorization.Insert(this);
        }

        
        public void Update()
        {
            dalGroupAuthorization.Update(this);
        }


        #endregion

}