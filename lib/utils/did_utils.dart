void checkDID(String did) {
  var parts = did.split(":");

  //5 cause= did:ethr:1337:0xsd8sd8dsd8sd88sd8s8dd8
  if (parts.length > 5 || parts.length < 3) {
    throw 'Wrong did strcuture';
  }

  if (parts[0] != 'did') {
    throw 'did scheme not found';
  }

  //check if third part is chain id => did:ethr-ethr:1337:0xsd98f9df898df8duf8dfj8df8d8f
  if (parts.length == 4) {
    var chainId = int.tryParse(parts[2]);
    if (chainId == null) {
      throw 'chan id not found';
    }
  }
}
