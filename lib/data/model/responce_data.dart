class ResponceData {
 final bool isSuccess;
 final int statusCode;
 final String isError;
 final dynamic responceData;

  ResponceData(
      {required this.statusCode,
      required this.isSuccess,
      required this.responceData,
       this.isError='Something went wrong'
      });
}
