function getIP( ) {
 print(eval( new java.lang.StringBuffer().append(new java.io.BufferedReader(new java.io.InputStreamReader(new java.net.URL( "http://pv.sohu.com/cityjson?ie=utf-8" ).openStream())).readLine())))
}