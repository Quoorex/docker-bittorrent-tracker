exports.isTorrentAllowed = function(infoHash, whitelist) {
  if (!whitelist || whitelist.length == 0) {
    return true;
  } else if (~whitelist.indexOf(infoHash)) {
    return true;
  } else {
    return false;
  }
};
