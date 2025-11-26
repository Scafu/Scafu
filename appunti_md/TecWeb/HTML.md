## Lezione del 1/6/7-10-2025

### Argomento: HTML

### Slide: *https://stem.elearning.unipd.it/pluginfile.php/1157723/mod_resource/content/7/htmlx4.pdf*

---

### Innovazioni Introdotte

- Regole meno stringenti
- Gestione standardizzata degli errori
- Ha introdotto un'area di disegno interattiva, cioé il **Canvas**
- Non c'è più bisogno della presenza di un plug-in per video e audio
- Introdotta l'interazione con le API
- Gestione della posizione tramite la **GeoLocation API** di W3C
- Javascript multithread
- Introdotte pagine modificabili dall'utente (**contenteditable**, **draggable**, **spellcheck**)
- Possibilità di usare le pagine anche in offline
- Possibilità di accedere in modo sicuro ad un database locale
- Non si dicono più elementi deprecati, ma vengono definiti obsoleti

---

### Elementi ignorati

Per andare contro alla rigida sintassi dell'XHTML, i browser ignorano completamente, le interruzioni di linea non indentificate con `<br/>` e non contenute in un tag `<pre>`, le tabulazioni e spazi multipli, i tag `<p>` nidificati, tag sconosciuti e i commenti (all'interno non é possibile inserire --)

---

<br/>

```html
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1-strict.dtd">
<!DOCTYPE html>
```

Questa prima riga viene solitamente generata in automatico, dall'editor HTML specifico, non è obbligatoria, ed ha il compito di informare il browser che si tratta di un documento html relativo alle specifiche `(XHTML 1.0 Strict)` e qual è la lingua primaria.
Se si vuole validare la pagina, ad esempio con **http://validator.w3.org/** è obbligatorio inserire questa riga, se infatti non si specificasse un doctype valido, i browser vanno in modalità `quirks mode`.

```html
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="it" lang="it">
  <html lang="it"></html>
</html>
```

Il `Namespace` è una collezione di tipi di elementi e nomi di attributi e per ragioni di accessibilità si deve definire la lingua principale del documento, altrimenti lo screen reader non funziona correttamente, questa cosa si può fare lato server o inline.

---

### La sezione Head

La parte contenuta tra i tag `<head>` e `</head>` viene chiamata intestazione o semplicemente, sezione `head`, qua si trovano tutti i tag che impartiscono le direttive necessarie al browser, quali titolo (obbligatorio), comandi meta, richiami ai fogli di stile e script.
Tutto ciò che si trova in questa struttura non sarà visualizzato, ma verrà interpretato dal browser.
All'interno quindi troviamo:

- `title`, `link`, `base`, `style` e `script`.
- Il `link` definisce un collegamento ad una risorsa esterna, ad esempio lo stylesheet css. - Gli attributi all'interno più comuni sono `href` e `rel`:

  ```html
  <link rel="stylesheet" href="/file.css" />
  <link rel="shortcut icon" href="/img.ico" />
  <link rel="next" title="Next page" href="/next.html" />
  ```

  Si può definire anche una base per i collegamenti usando il tag `base`:

  ```html
  <base href="/miacartella/" />
  ```

La sezione Head contiene anche una serie di comandi, chiamati `MetaComandi`, che non producono cose visive sulla pagina, ma sono indispensabili per altre attività quali la validazione e la lettura da parte dei motori di ricerca.  
Questi meta comandi inseriscono informazioni aggiuntive sul contenuto del documento che si sta creando, come per esempio l'autore, non esistono limiti riguardo il numero di metatag inseriti e ci sono due tipo di metatag disponibili, `http-equiv` e `name`.  
Quando il browser vede questi tag, l'informazione viene processata come se fosse presente in un header di risposta HTTP, quindi prima della creazione del documento, si può quindi condizionare la manipolazione del documento:

```html
<meta http-equiv="refresh" content="15" />
<meta http-equiv="refresh" content="1;URL=nuovaURL" />
<meta http-equiv="expires" content="5" />
```

Ci sono poi i tag `name` con cui é possibile creare valori propri ad esempio suggeriti dai search engine, e include:

- `description`: é una breve descrizione dei contenuti della pagina, è utile quando vi è poco testo nella pagina.
- `keywords`: lista di parole chiavi separate da una virgola.
- `copyright`
- `author`
- `robots`: utilizzato per prevenire l'indicizzazione di una pagina, può avere questi valori `index`, `noindex`, `follow`, `nofollow`, `all`, `none`.
- `rating`: classificazione del contenuto.

---

### La sezione Body

La parte contenuta tra i tag `<body>` e `</body>` viene detta corpo del documento o semplicemente, sezione `body`, questa contiene la pagina vera e propria, o almeno quello che si vedrà a schermo. Questa sezione contiene quasi tutti i tag che descrivono la struttura del documento.  
Ci sono tre classi di attributi comuni:

- `core`: sono `class` cioè la classe di appartenenza, `id` etichetta univoca del tag di riferimento, `title` che aggiunge un titolo ad un elemento e `style` cioè stile in linea.
- Gli `internationalization` cioè `i18n` sono `dir` e `xml:lang`
- `event`: sono tutti gli eventi che vengono rapprensentati come eventi in javascript cioé `onclick`, `ondblclick`, `onmousedown`, `onmouseup`, ecc...

In assenza di regole di stile, i `div` e `span` non alterano la visualizzazione, dare un `id` ad un elemento permette di usarlo, come selettore in un foglio di stile, all'interno di uno script, come ancora di destinazione di un link o come strumento generico nel trattamento dei dati.  
L'elemento `div` è un contenitore generico per l'associazione di fogli di style e crea un nuovo blocco, quando si associa qualcosa al tag div, si estende a tutto il blocco dentro div.  
`Span` invece serve per far supporto per gli stili, diversamente da div, questo è un elemento in linea.

---

HTML5 introduce inoltre nuovi markup per descrivere meglio la struttura interna:

- `header`, `footer`: intestazione a piè piagina di un documento, possono essere usati più volte nella stessa pagina, anche all'interno delle sezioni. `Footer` identifica le informazioni sull'autore dei contenuti.
- `main`: il contenuto principale.
- `nav`: contiene gli elementi per la navigazione e può comparire dentro header.

I nuovi tag aggiunti invece sono:

- `aside`: cioé un contenuto a parte, non necessariamente fisso a destra o sinistra, e identifica un contenuto che può essere rimosso senza alterare il significato della pagina, ma rimane comunque legata al contenuto del tag in cui è annidata.
- `section`: per raggruppare contenuti sullo stesso tema o logicamente collegati.
- `article`: porzione di testo autocontenuto e indipendente dal testo del documento che possa essere distribuito in modo autonomo.

Preferibilmente non bisogna ricorrere a `section` e `article` per soli motivi di stile o scripting, in questo caso `div` è meglio. I tag appena descritti sono detti `sectioning element`, ovvero possono contenere anche `header`, `nav` e `footer`.  
Strumenti utili per vedere se il documento é strutturato bene:

- **http://gsnedders.html5.org/outliner/**
- **https://silktide.com/**

Il testo viene inserito tra `<p>` e `</p>`, con p che sta per paragrafo, tra paragrafi il browser inserisce degli spazi, si può andare a capo in un paragrafo con `<br/>`, in questo caso lo spazio non viene inserito, `<hr/>` inserisce una linea orizzontale.  
Nel codice HTML i commenti sono scritti tra `<!--` e `-->`.  
Per riportare citazioni di autore si devono usare i tag `<blockquote>`, `<q>` o `cite`, la prima introduce un'ampia citazione che occupa un'intero blocco, `q` invece è una citazione ristretta in linea, `cite` o `title` serve per indicare la fonte, mentre in HTML5 questo indica il titolo di un lavoro. `abbr` indica le abbreviazioni, `address` un indirizzo, mentre `acronym` gli acronimi ma solo in XHTML.  
Altri tag di inserimento sono:

- `code`: permette di inserire codice.
- `var`: identifica variabili di codice.
- `samp`: identifica un particolare output di un programma.
- `pre`: permette di inserire testo preformattato, dove spazi, tabulazioni e a capo hanno un valore.
- `ins`: identifica un inserimento redazionale, solitamente é sottolineato.
- `del`: cancellazione redazionale, visualizzato barrato.
- `figure/picture`
- `mark`
- `time`: con l'attributo `datetime` contiene la data e l'ora.
- `meter`: per indicare una misura in una scala che ha un minimo e un massimo.
- `progress`: per indicare un valore che sta cambiando.
- `small`: per indicare le note a piè pagina, i termini in piccolo dei contratti.

Per le liste puntate cioé il tag `<ol>` HTML5 aggiunge gli attributi:

- `reversed`
- `start`: indica il numero con cui parte la lista.
- `type`: specifica il tipo di marcatore.

Per il tag `<li>` invece viene aggiunto `value` che imposta un numero arbitrario. Ci sono anche gli elenchi in cui non si vuole visualizzare il punto e si usa il tag `<dl>`, in cui l'elemento é dentro `<dt>`, e la definizione di questo dentro `<dd>`. Ci possono essere zero o più `<dd>` per un unico `<dt>`.

Per inserire un'immagine si utilizza il tag `<img src="xxx.yy"/>`, dove xxx é il nome dell'immagine e yyy l'estensione. Gli attributi di img sono `alt`, che serve come testo alternativo per lo screen reader e il search engine, `width` e `height` fanno conoscere la precisa dimensione dell'immagine al browser prima di scaricarla.

Dato che il peso delle immagini influisce sul carciamente e quindi della `UX`, tramite l'attributo `loading` si può decidere quando il browser scaricare un'immagine, con `eager` subito, e `lazy` cioè solo quando l'immagine è visibile. Questo attributo va solo aggiunto alle immagine `below the fold` cioè quelle non visualizzate senza lo scroll.
Il tag `img` dentro `figure` se ha una `figcaption` cioè una didascalia non necessita di `alt`, per i responsive design viene usato il tag `picture` che permette di avere immagini in formati diversi.  
Per inserire i link si usa il tag `<a>` che sta per ancora, la sorgente può essere un pezzo di testo detto `hot word`, ma possono essere anche immagini dette `thumbnail`, la destinazione può essere una pagina, o una parte di essa:

```html
<a href="http://ind_server:8080/path/doc.html#frammento"> Sorgente del link </a>
```

I riferimenti possono essere assoluti o relativi se presente il tag base, il `target` indica il frame di destinazione, se non esiste si apre una nuova finestra, nella versione `Strict` questo non è valido, in HTML5 si.
Riguardo all'accessibilità è importante che i link siano accessibili anche a coloro che non possono usare il mouse per questo bisogna aggiungere l'attributo `accesskey` e `tabindex` che indicano un carattere per portare il focus sul link e l'ordine di tabulazione.  
Le tabelle servono per tabulare colonne di dati, spesso usate erroneamente come contenitori, si creano con il tag `<table>`, in cui all'interno vengono usati i tag `<tr>` e `<td>` per indicare, le righe e colonne, si possono inoltre nidificare tabelle in celle di altre tabelle.  
Ci sono alcune regole fondamentali per la progettazione con la presenza di tabelle:

- Non ci possono essere righe senza celle al loro interno.
- Le colonne non si definiscono in modo esplicito, ma si definiscono le celle all'interno delle righe tramite elementi `td`.
- Si possono definire celle che occupano più di una colonna con `colspan` o più di una riga `rowspan`.
- Si possono creare intestazioni per colonne o righe con tag `th` al posto di `td`.
- Il tag `<caption>` posto subito dopo table, permette di inserire un titolo, in genere visualizzato sopra la tabella.
- La struttura della tabella viene descritta da riferimento contenuto in un `aria-describedby`.

```html
<form action="http://server/path/file.php" method="post">
  <!– elementi del form -->
</form>
```

Il Form presenta l'attributo `method` che può avere due valori, `get` e `post`, il primo è di default, viene utilizzato per leggere dati, da cui il browser allega la stringa di query all'url del programma CGI.  
Il metodo post invece viene usato per inviare dati, la stringa di query viene passata come input.  
La query contiene i dati inviati cliccando il pulsante `Submit`, il nome e il valore di ciascun elemento della form sono codificati come assegnamenti cioè `nome=Mario&cognome=Rossi`, i caratteri speciali sono codificati sottoforma di numeri esadecimali preceduti da `%`, con il metodo get la stringa viene inserita dal server in una variabile ambiente, mentre con il metodo post si deve leggere la stringa query dall'input standard.  
Gli elementi inseriti come testo in una forma si inseriscono con soli 3 tag:

- `<input>`: questo tag permette da solo di creare diversi elementi di una form a seconda del contenuto attribuito a `type`:

  - `text`: una singola riga di testo con maxlength elementi
  - `password`: una riga di testo offuscata
  - `checkbox`: un semplice on/off
  - `radio`: per selezionare una o più opzioni
  - `submit`: pulsante per inviare i dati del modulo
  - `reset`: pulsante per riportare i valori predefiniti nei campi del modulo
  - `hidden`: per dati non visibili o non editabili
  - `file`: per caricare file
  - `button`: per richiamare script lato client
  - `image`

  In caso di form molto lunghi, il tag `<fieldset>` permette di raggruppare elementi logicamente correlati, subito dopo il tag di apertura di fieldset ci può essere il tag `<legend>` che inserisce una intestazione, la visualizzazione di default riquadra gli elementi con un bordo con la leggenda che interrompe quello superiore.  
  Il tag `<label>` invece inserisce un'etichetta ad un campo del form, non perforza adiacente, con id il valore dell'attributo for.  
  Ci possono essere form con pulsanti, per questo caso ci sono due tipi di pulsanti, `<checkbox>` e `<radio>`, i primi sono le scelte multiple, le seconde sono selezione di un'unica voce, l'attributo `checked = "checked"` permette di specificare lo stato iniziale del pulsante di scelta. Se un pulsante `checkbox` non è selezionato il dato non viene inviato al server, viene inviato altrimenti il valore `on` associato al nome del controllo, oppure il valore `value` se presente.  
  Per i pulsanti radio è obbligatorio definire l'attributo `value`, che viene inviato al server in caso di selezione. I tag input di tipo `hidden` non vengono visualizzati nel form e non possono in alcun modo interagire con l'utente, questo tipo di tag può essere usato per passaggio di dati in modo da non richiedere all'utente, quando si é in un form, salvataggio di informazioni calcolato sulla base dei dati inseriti e definizione di variabili.
  Il tag `<file>` consente all'utente di selezionare un file dal proprio computer, il tag form di apertura deve contenere l'attributo `enctype = "multipart/form-data"` che comunica al server ce si stanno inviando dati non solo testuali, inoltre non può essere usato con metodo get.

- `<textarea>`: Permette all'utente di inserire testo più lungo di una riga e viene scritto così:
  ```html
  <textarea rows="20" cols="40" name="message">
  scrivi qualcosa qui
  </textarea>
  ```
  Gli attributi `rows` e `cols` sono obbligatori.
- `<select>`: Permette di creare elenco di dati, visualizzato solitamente da una tendina, su cui effettuare una o più scelte, per impostazione, viene visualizzata solo la prima opzione, l'attributo `size`, si può modificare questa scelta, al server viene inviato la coppia nome del tag select/contenuto del tag option scelto, o il valore value se presente.

L'HTML5 aggiunge alcuni widget:

- Al tag `<form>` vengono aggiunti gli attributi, `target` che indica dove visualizzare la risposta scegliendo tra `_blank`, `_self`, `_parent`, `_top`, `_iframename`, poi `autocomplete` e poi `Novalidate`.  
  Vengono aggiunto anche i tag, `<keygen>` per generare le chiavi per un sistema crittografico, `<menu>` per i menù contestuali e `<output>` che funge da segnaposto per i risultati di un calcolo.
- Al tag `<input>` vengono aggiunti valori all'attributo `type`, `number` che inserisce due freccette per aumentare o diminuire il valore, ma rimane editabile, `range`, `color`, `email`, `url`, `tel`, `search`, `datetime`, `datetime-local`, `date`, `month`, `time`, `week`.  
  Per i controlli vengono aggiunti nuovi attributi, `required`, `formnovalidate`, `pattern` che contiene un'espressione regolare per la validazione dell'input, `placeholder`, `autocomplete`, `autofocus`, `spellcheck`, `min`, `max`, `step`, `multiple`.  
  L'attributo `autocomplete` aiuta a velocizzare le operazioni di completamento di una form.

Il `canvas` è un elemento `bit-map` che permette di disegnare degli elementi, quindi avere immagini animate, deve usato però cautamente ed è necessario impostare un fallback:

```html
<canvas id="canvasID" width="300" height="200"></canvas
```

Questo ad esempio viene visualizzato dai browser che non supportano HTML5, con canvas si possono disegnare forme, testo, linee e curve, colorarle, creare pattern e gradienti, copiare immagini, proveniente da video e altri canvas, manipolare i pixel ed esportare il contenuto di un canvas in un file statico.  
Tutto ciò che viene fatto nelle canvas viene realizzato tramite JavaScript, le canvas tuttavia presentano anche dei contro, se usate troppo infatto possono appesantire in modo notevole il caricamento, non utilizzano il `DOM`, in genere non sono accessibili, perchè lo screen reader si basa su DOM, gli unici pro sono che, i canvas sono l'unico modo per generare immagini in modo dinamico, sono una buona alternativa a SVG.  
HTML5 offre anche la possibilità di riprodurre file audio e video in modo nativo:

- `<audio>`: s
  ```html
  <audio src="song.mp3" autoplay loop controls />
  <audio controls="controls">
    <source src="song.ogg" type="audio/ogg" />
    <source src="song.mp3" type="audio/mp3" />
    <p>Testo sostitutivo dell’audio.</p>
  </audio>
  ```
- `<video>`:
  ```html
  <video width="320" height="240" controls="controls" poster="img.jpg">
    <source src="movie.mp4" type="video/mp4" />
    <source src="movie.ogg" type="video/ogg" />
    <p>Testo alternativo al video.</p>
  </video>
  ```

Per salvare i dati di un client prima si potevano usare i `cookies`, ma ora HTML5 offre, `Web Storage`, `Web SQL Database`, `IndexedDB`

<style>

p{
font-size: 16px
}
ul{
font-size: 16px
}
</style>
