function hideModal() {
    document.getElementById("modal-header").innerText = "";
    $(".modal-body").empty();
    $(".modal-footer").empty();
    document.getElementById("modal").style.display = "none";
}

function InsertAttivita(idUtente, idAttivita) {
    var body = {};
    body.idUtente = idUtente;
    body.idAttivita = idAttivita;
    $.ajax({
        method: "POST",
        url: "/api/Attivita/PostPrenotazione",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(body),
        dataType: "json",
        success: function (data, status) {
            console.log(body);
            console.log(data);
            console.log(status);
            this.always();
        },
        error: function (error, status) {
            console.log(body);
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () { }
    });
};

//function prenotaAttivita(userId, idAttivita) {
//    $.ajax({
//        url: "/api/Attivita/PrenotaAttivita",
//        method: "POST",
//        contentType: "application/json; charset=utf-8",
//        data: JSON.stringify(body),
//        dataType: "json",
//        data: {
//            IdUtente: userId,
//            IdAttivita: idAttivita
//        },
//        success: function (response) {
//            // Gestisci la risposta qui se necessario
//            console.log(response);
//        },
//        error: function (error) {
//            // Gestisci l'errore qui se necessario
//            console.log(error);
//        }
//    });
//}

function prenotaAttivita(userId, idAttivita) {
    var body = {};
    body.IdUtente = userId;
    body.IdAttivita = idAttivita;
    console.log(body);
    $.ajax({
        url: "/api/Attivita/PrenotaAttivita",
        method: "POST",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify({
            IdUtente: userId,
            IdAttivita: idAttivita
        }),
        dataType: "json",
        success: function (response) {
            // Gestisci la risposta qui se necessario
            console.log(response);
            alert("Prenotazione effettuata");
            window.location.href = "/Home/Attivita";
        },
        error: function (error) {
            // Gestisci l'errore qui se necessario
            console.log(error);
            alert("Prenotazione effettuata");
            window.location.href = "/Home/Attivita";
        }
    });
}


//function deleteAttivita(idPrenotazioneAttivita) {
//    var body = {};
//    body.idPrenotazioneAttivita = idPrenotazioneAttivita;
//    console.log(body);
//    $.ajax({
//        url: "/api/Attivita/DeleteAttivita",
//        method: "POST",
//        contentType: "application/json; charset=utf-8",
//        data: JSON.stringify({
//            idPrenotazioneAttivita: idPrenotazioneAttivita
//        }),
//        dataType: "json",
//        success: function (response) {
//            // Gestisci la risposta qui se necessario
//            console.log(response);
//        },
//        error: function (error) {
//            // Gestisci l'errore qui se necessario
//            console.log(error);
//        }
//    });
//}

function deleteAttivita(IdPrenotazioneAttivita) {
    var body = {};
    body.IdPrenotazioneAttivita = IdPrenotazioneAttivita;
    $.ajax({
        method: "POST",
        url: "/api/Attivita/DeleteAttivita",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(body),
        dataType: "json",
        success: function (data, status) {
            console.log(body);
            console.log(data);
            console.log(status);
            this.always();
        },
        error: function (error, status) {
            console.log(body);
            console.log(error);
            console.log(status);
            this.always();
        },
        always: function () {
            window.location = window.location;
        }
    });
};