//= require jquery3
//= require popper
//= require bootstrap
//= require_tree .
//= require jquery
//= require jquery_ujs

// this is used to automatically close the alert or notice after 2 second
window.setTimeout(function() {
    $(".alert").fadeTo(300, 0).slideUp(300, function(){
        $(this).remove(); 
    });
}, 3000);

/* display selected file name in blog page*/
function filename()
{   
  var fileName = document.getElementById("blog_image").files[0].name;
  document.getElementById('image_label').innerText=fileName;
}



    // Returns text statistics for the specified editor by id
function getStats(id) {
    var body = tinymce.get(id).getBody(), text = tinymce.trim(body.innerText || body.textContent);

    return {
        chars: text.length,
        words: text.split(/[\w\u2019\'-]+/).length
    };
} 
/* it call on submit the form */
function submitForm() {
        // Check if the user has entered 0 characters
        if (getStats('blog_Discription').chars <= 0) {
            alert("Enter Discription");
            return false;
        }
        // check atleast 20 words are present or not
        else if (getStats('blog_Discription').words <= 20) {
            alert("Atleast 20 words required");
            return false;
        }
        else
        {
        	return true;
        }
    }



/* convert to csv*/
function downloadCSV(csv, filename) {
    var csvFile;
    var downloadLink;

    // CSV file
    csvFile = new Blob([csv], {type: "text/csv"});

    // Download link
    downloadLink = document.createElement("a");

    // File name
    downloadLink.download = filename;

    // Create a link to the file
    downloadLink.href = window.URL.createObjectURL(csvFile);

    // Hide download link
    downloadLink.style.display = "none";

    // Add the link to DOM
    document.body.appendChild(downloadLink);

    // Click download link
    downloadLink.click();
}

function exportTableToCSV(filename) {
    var csv = [];
    var rows = document.querySelectorAll("table tr");
    
    for (var i = 0; i < rows.length; i++) {
        var row = [], cols = rows[i].querySelectorAll("td, th");
        
        for (var j = 0; j < 3; j++) 
            row.push(cols[j].innerText);
        
        csv.push(row.join(","));        
    }

    // Download CSV file
    downloadCSV(csv.join("\n"), filename);
}