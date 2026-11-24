function slow(r) {
    setTimeout(function () {
        r.headersOut['Content-Type'] = 'text/plain';
        r.return(200, 'slow response\n');
    }, 2000);
}
export default { slow };