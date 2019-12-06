module cma{
  module cimiss{
    dictionary<string, string> RequestParams;
    sequence<string> StringArray;
    sequence<float> FloatArray;
    sequence<StringArray> CommonArray;
    sequence<FloatArray> GridArray;
    struct RequestInfo{
      int errorCode;
      string errorMessage;
      string requestElems;
      string requestParams;
      string requestTime;
      string responseTime;
      int rowCount;
      int takeTime;
    };
    struct RetArray2D{
      CommonArray data;
      RequestInfo request;
    };
    struct RetGridArray2D{
      GridArray data;
      RequestInfo request;
      float startLat;
      float startLon;
      float endLat;
      float endLon;
      int latCount;
      int lonCount;
      float lonStep;
      float latStep;
    };
    struct FileInfo{
      string fileName;
      string savePath;
      string suffix;
      string size;
      string fileUrl;
      string imgBase64;
      StringArray attributes;
    };
    sequence<FileInfo> FileInfoList;
    struct RetFilesInfo{
      FileInfoList fileInfos;
      RequestInfo request;
    };
    interface DataAPIAccess {
        // void callAPItoarray2D( string usrId,string pwd,string interfaceId,string remoteIP,string language,string version,RequestParams params,out RetArray2D datas );
        RetArray2D callAPItoarray2D( string usrId,string pwd,string interfaceId,string remoteIP,string language,string version,RequestParams params);
        RetGridArray2D callAPItogridArray2D( string usrId,string pwd,string interfaceId,string remoteIP,string language,string version, RequestParams params);
        RetFilesInfo callAPItosaveAsFile( string usrId,string pwd,string interfaceId, string remoteIP,string language,string version,RequestParams params, string dataFormat, string savePath);
        RetFilesInfo callAPItodownFile( string usrId,string pwd,string interfaceId,string remoteIP,string language,string version, RequestParams params, string saveDir);
        RetFilesInfo callAPItofileList(string usrId,string pwd,string interfaceId,string remoteIP,string language,string version, RequestParams params);
        string callAPItoserializedStr( string usrId,string pwd,string interfaceId,string remoteIP,string language,string version, RequestParams params, string dataFormat);
    	
    	//store
		RequestInfo callAPItostoreArray2D(string usrId, string pwd, string interfaceId, string remoteIP,string language,string version,RequestParams params, CommonArray inArray2D );
		RequestInfo callAPItostoreFileByFtp(string usrId, string pwd, string interfaceId, string remoteIP,string language,string version,RequestParams params, CommonArray inArray2D, StringArray ftpfiles );	
		int callAPItostoreSerializedStr(string usrId, string pwd, string interfaceId, string remoteIP,string language,string version, RequestParams params, string inString );
	
    
    };
};
};