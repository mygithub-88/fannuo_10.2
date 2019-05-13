<%
Response.Charset = "utf-8"
Session.CodePage = "65001"
Dim site_dir,data_path,connstr,conn
site_dir = "/"'如放在子目录请把"/"改成"/abc/",其中abc为二级目录名
data_path = ""&site_dir&"data/#data.mdb"
connstr = "Provider = Microsoft.Jet.OLEDB.4.0; Data Source = "&Server.MapPath(data_path)&" "
Set conn = Server.CreateObject("ADODB.Connection")
conn.Open connstr
%>
