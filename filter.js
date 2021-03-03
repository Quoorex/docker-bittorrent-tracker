exports.isTorrentAllowed = function (infoHash, whitelist, cb) {
  if (!whitelist || whitelist.length == 0) {
    // No whitelist configured.
    return null;
  } else if (~whitelist.indexOf(infoHash)) {
    // Torrent is whitelisted.
    return null;
  } else {
    return new Error("disallowed torrent");
  }
};
