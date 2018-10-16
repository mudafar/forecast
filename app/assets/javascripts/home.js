document.onreadystatechange = () => {
    if (document.readyState === 'complete') {
        setInterval(function(){ App.forecast.refresh(); }, 10000);
    }
};