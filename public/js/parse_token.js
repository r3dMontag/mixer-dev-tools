$(document).ready(function() {
    var oauthHash = location.hash.substr(1);
    var accessToken = oauthHash.substr(oauthHash.indexOf('access_token=')).split('&')[0].split('=')[1];
    var errorMsg = oauthHash.substr(oauthHash.indexOf('error_description=')).split('&')[0].split('=')[1];

    if (accessToken) {
      $("#quickAuthShowToken").show();
      $("#mixerError").hide();
      $("#quickAuthTokenField").val(encodeURIComponent(accessToken));
    } else if(errorMsg) {
      $("#errorMsgField").text(unescape(errorMsg));
      $("#quickAuthShowToken").hide();
      $("#mixerError").show();
    }
});
