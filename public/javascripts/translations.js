var I18n = I18n || {};
I18n.translations = {"en":{"date":{"formats":{"default":"%Y-%m-%d","short":"%b %d","long":"%B %d, %Y"},"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"order":["year","month","day"]},"time":{"formats":{"default":"%a, %d %b %Y %H:%M:%S %z","short":"%d %b %H:%M","long":"%B %d, %Y %H:%M"},"am":"am","pm":"pm"},"support":{"array":{"words_connector":", ","two_words_connector":" and ","last_word_connector":", and "}},"number":{"format":{"separator":".","delimiter":",","precision":3,"significant":false,"strip_insignificant_zeros":false},"currency":{"format":{"format":"%u%n","unit":"$","separator":".","delimiter":",","precision":2,"significant":false,"strip_insignificant_zeros":false}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}},"human":{"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}},"decimal_units":{"format":"%n %u","units":{"unit":"","thousand":"Thousand","million":"Million","billion":"Billion","trillion":"Trillion","quadrillion":"Quadrillion"}}}},"errors":{"format":"%{attribute} %{message}","messages":{"inclusion":"is not included in the list","exclusion":"is reserved","invalid":"is invalid","confirmation":"doesn't match %{attribute}","accepted":"must be accepted","empty":"can't be empty","blank":"can't be blank","present":"must be blank","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"},"not_a_number":"is not a number","not_an_integer":"must be an integer","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","equal_to":"must be equal to %{count}","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","other_than":"must be other than %{count}","odd":"must be odd","even":"must be even","taken":"has already been taken","in_between":"must be in between %{min} and %{max}","spoofed_media_type":"has an extension that does not match its contents","record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}},"template":{"body":"There were problems with the following fields:","header":{"one":"1 error prohibited this %{model} from being saved","other":"%{count} errors prohibited this %{model} from being saved"}}},"activerecord":{"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"one":"Cannot delete record because a dependent %{record} exists","many":"Cannot delete record because dependent %{record} exist"}}}},"datetime":{"distance_in_words":{"half_a_minute":"half a minute","less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"x_seconds":{"one":"1 second","other":"%{count} seconds"},"less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"x_days":{"one":"1 day","other":"%{count} days"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"x_months":{"one":"1 month","other":"%{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"}},"prompts":{"year":"Year","month":"Month","day":"Day","hour":"Hour","minute":"Minute","second":"Seconds"}},"helpers":{"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","update":"Update %{model}","submit":"Save %{model}"},"page_entries_info":{"more_pages":{"display_entries":"Displaying %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e of \u003cb\u003e%{total}\u003c/b\u003e in total"},"one_page":{"display_entries":{"one":"Displaying \u003cb\u003e1\u003c/b\u003e %{entry_name}","other":"Displaying \u003cb\u003eall %{count}\u003c/b\u003e %{entry_name}","zero":"No %{entry_name} found"}}}},"ransack":{"search":"search","predicate":"predicate","and":"and","or":"or","any":"any","all":"all","combinator":"combinator","attribute":"attribute","value":"value","condition":"condition","sort":"sort","asc":"ascending","desc":"descending","predicates":{"eq":"equals","eq_any":"equals any","eq_all":"equals all","not_eq":"not equal to","not_eq_any":"not equal to any","not_eq_all":"not equal to all","matches":"matches","matches_any":"matches any","matches_all":"matches all","does_not_match":"doesn't match","does_not_match_any":"doesn't match any","does_not_match_all":"doesn't match all","lt":"less than","lt_any":"less than any","lt_all":"less than all","lteq":"less than or equal to","lteq_any":"less than or equal to any","lteq_all":"less than or equal to all","gt":"greater than","gt_any":"greater than any","gt_all":"greater than all","gteq":"greater than or equal to","gteq_any":"greater than or equal to any","gteq_all":"greater than or equal to all","in":"in","in_any":"in any","in_all":"in all","not_in":"not in","not_in_any":"not in any","not_in_all":"not in all","cont":"contains","cont_any":"contains any","cont_all":"contains all","not_cont":"doesn't contain","not_cont_any":"doesn't contain any","not_cont_all":"doesn't contain all","start":"starts with","start_any":"starts with any","start_all":"starts with all","not_start":"doesn't start with","not_start_any":"doesn't start with any","not_start_all":"doesn't start with all","end":"ends with","end_any":"ends with any","end_all":"ends with all","not_end":"doesn't end with","not_end_any":"doesn't end with any","not_end_all":"doesn't end with all","true":"is true","false":"is false","present":"is present","blank":"is blank","null":"is null","not_null":"is not null"}},"views":{"pagination":{"first":"\u0026laquo; First","last":"Last \u0026raquo;","next":"Next \u0026rsaquo;","previous":"\u0026lsaquo; Prev","truncate":"\u0026hellip;"}},"common":{"belonging_to":"belonging to %{company}","belong_to":"belong to %{company}","all_posts":"All posts","signed_in":"Signed in","signed_out":"Signed out","edit":"Edit","delete":"Delete","stocked":"Stocked","language":"Language interface","post":"Post","is":"is","no_permission":"You are not owner"},"users":{"index":{"read_all_this_post":"See all this post","read_this_post":"Read this post"},"edit":{"type_your_nick_name":"Edit your nick name","submit":"Save changes","edit_profile":"Edit your profile","placeholder":"Ex. My name is Jack,  and I am currently studying abroad in Japan. I like listening musics and reading books. Nice to meet you!)","not_found":"It user is not found","bio":"Self Introduction","icon":"Your icon","show_company":"Is a company name displayed?"},"update":{"complate_update_profiles":"Done updating nick name"},"sign_in":"Sign In","sign_out":"Sign Out","nick_name":"Nick name","not_found":"User not found","create_by":"created by %{full_name}","change_interface":"change your interface","tags":"tags often use |","authentication_failed":"Authentication failed, please try again","stocked_notes":"Stoked notes","have_to_sign_in":"You have to sign in."},"notes":{"index":{"title":"Title","content":"Content"},"edit":{"editing":"Editing note"},"tag_and_warning":"tag : It is need to separate by a space","tag_list":"tag list |","tag":"This tag for feed","stock_this_note":"Stock this note","created":"Note was successfully created.","updated":"Note was successfully updated.","deleted":"Note was successfully destroyed."},"stocks":{"has_been_stocked":"has been stocked"},"comments":{"comment":"comment","created":"Comment was successfully created.","updated":"Comment was successfully updated.","deleted":"Comment was successfully destroyed.","falied":"Comment was failed created.","number_of_comment":"%{number_of_comment} comment"},"followers":{"button":"Follow","follow_you":"You were followed by %{name}"},"validation":{"required_nick_name":"Please enter your nick name.","required_title":"Please enter note title","required_tag_list":"Please enter tag list","required_content":"Please enter title","max_length":"Please enter no more than %{limit} characters."}},"cs":{"ransack":{"search":"vyhledávání","predicate":"predikát","and":"a","or":"nebo","any":"kteroukoliv","all":"každou","combinator":"kombinátor","attribute":"atribut","value":"hodnota","condition":"podmínka","sort":"řazení","asc":"vzestupné","desc":"sestupné","predicates":{"eq":"rovno","eq_any":"rovno kterékoliv","eq_all":"rovno všem","not_eq":"nerovno","not_eq_any":"nerovno kterékoliv","not_eq_all":"nerovno všem","matches":"odpovídá","matches_any":"odpovídá kterékoliv","matches_all":"odpovídá všem","does_not_match":"neodpovídá","does_not_match_any":"neodpovídá kterékoliv","does_not_match_all":"neodpovídá všem","lt":"menší než","lt_any":"menší než kterákoliv","lt_all":"menší než všechny","lteq":"menší nebo rovno než","lteq_any":"menší nebo rovno než kterákoliv","lteq_all":"menší nebo rovno než všechny","gt":"větší než","gt_any":"větší než kterákoliv","gt_all":"větší než všechny","gteq":"větší nebo rovno než","gteq_any":"větší nebo rovno než kterákoliv","gteq_all":"větší nebo rovno než všechny","in":"v","in_any":"v kterékoliv","in_all":"ve všech","not_in":"není v","not_in_any":"není v kterékoliv","not_in_all":"není ve všech","cont":"obsahuje","cont_any":"obsahuje kterékoliv","cont_all":"obsahuje všechny","not_cont":"neobsahuje","not_cont_any":"neobsahuje kteroukoliv","not_cont_all":"neobsahuje všechny","start":"začíná s","start_any":"začíná s kteroukoliv","start_all":"začíná se všemi","not_start":"nezačíná s","not_start_any":"nezačíná s kteroukoliv","not_start_all":"nezačíná se všemi","end":"končí s","end_any":"končí s kteroukoliv","end_all":"končí se všemi","not_end":"nekončí s","not_end_any":"nekončí s kteroukoliv","not_end_all":"nekončí se všemi","true":"je pravdivé","false":"není pravdivé","present":"je vyplněné","blank":"je prázdné","null":"je null","not_null":"není null"}}},"es":{"ransack":{"search":"buscar","predicate":"predicado","and":"y","or":"o","any":"cualquier","all":"todos","combinator":"combinado","attribute":"atributo","value":"valor","condition":"condición","sort":"ordernar","asc":"ascendente","desc":"descendente","predicates":{"eq":"es igual a","eq_any":"es igual a cualquier","eq_all":"es igual a todos","not_eq":"no es igual a","not_eq_any":"no es igual a cualquier","not_eq_all":"no es iguala todos","matches":"coincidir","matches_any":"coincidir a cualquier","matches_all":"coincidir a todos","does_not_match":"no coincide","does_not_match_any":"no coincide con ninguna","does_not_match_all":"no coincide con todos","lt":"menor que","lt_any":"menor que cualquier","lt_all":"menor o igual a","lteq":"menor que o igual a","lteq_any":"menor o igual a cualquier","lteq_all":"menor o igual a todos","gt":"mayor que","gt_any":"mayor que cualquier","gt_all":"mayor que todos","gteq":"mayor que o igual a","gteq_any":"mayor que o igual a cualquier","gteq_all":"mayor que o igual a todos","in":"en","in_any":"en cualquier","in_all":"en todos","not_in":"no en","not_in_any":"no en cualquier","not_in_all":"no en todos","cont":"contiene","cont_any":"contiene cualquier","cont_all":"contiene todos","not_cont":"no contiene","not_cont_any":"no contiene ninguna","not_cont_all":"no contiene toda","start":"comienza con","start_any":"comienza con cualquier","start_all":"comienza con toda","not_start":"no inicia con","not_start_any":"no comienza con cualquier","not_start_all":"no inicia con toda","end":"termina con","end_any":"termina con cualquier","end_all":"termina con todo","not_end":"no termina con","not_end_any":"no termina con cualquier","not_end_all":"no termina con todo","true":"es verdadero","false":"es falso","present":"es presente","blank":"está en blanco","null":"es nula","not_null":"no es nula"}},"errors":{"messages":{"in_between":"debe estar entre %{min} y %{max}","spoofed_media_type":"tiene una extensión que no coincide con su contenido"}},"number":{"human":{"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}}}},"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Mostrando \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e %{entry_name} de \u003cb\u003e%{total}\u003c/b\u003e en total"},"one_page":{"display_entries":{"one":"Mostrando \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"Mostrando \u003cb\u003eun total de %{count}\u003c/b\u003e %{entry_name}","zero":"No se han encontrado %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Primera","last":"Última \u0026raquo;","next":"Siguiente \u0026rsaquo;","previous":"\u0026lsaquo; Anterior","truncate":"\u0026hellip;"}}},"fr":{"ransack":{"search":"recherche","predicate":"prédicat","and":"et","or":"ou","any":"au moins un","all":"tous","combinator":"combinateur","attribute":"attribut","value":"valeur","condition":"condition","sort":"tri","asc":"ascendant","desc":"descendant","predicates":{"eq":"égal à","eq_any":"égal à au moins un","eq_all":"égal à tous","not_eq":"différent de","not_eq_any":"différent d'au moins un","not_eq_all":"différent de tous","matches":"correspond à","matches_any":"correspond à au moins un","matches_all":"correspond à tous","does_not_match":"ne correspond pas à","does_not_match_any":"ne correspond pas à au moins un","does_not_match_all":"ne correspond à aucun","lt":"inférieur à","lt_any":"inférieur à au moins un","lt_all":"inférieur à tous","lteq":"inférieur ou égal à","lteq_any":"inférieur ou égal à au moins un","lteq_all":"inférieur ou égal à tous","gt":"supérieur à","gt_any":"supérieur à au moins un","gt_all":"supérieur à tous","gteq":"supérieur ou égal à","gteq_any":"supérieur ou égal à au moins un","gteq_all":"supérieur ou égal à tous","in":"inclus dans","in_any":"inclus dans au moins un","in_all":"inclus dans tous","not_in":"non inclus dans","not_in_any":"non inclus dans au moins un","not_in_all":"non inclus dans tous","cont":"contient","cont_any":"contient au moins un","cont_all":"contient tous","not_cont":"ne contient pas","not_cont_any":"ne contient pas au moins un","not_cont_all":"ne contient pas tous","start":"commence par","start_any":"commence par au moins un","start_all":"commence par tous","not_start":"ne commence pas par","not_start_any":"ne commence pas par au moins un","not_start_all":"ne commence pas par tous","end":"finit par","end_any":"finit par au moins un","end_all":"finit par tous","not_end":"ne finit pas par","not_end_any":"ne finit pas par au moins un","not_end_all":"ne finit pas par tous","true":"est vrai","false":"est faux","present":"est présent","blank":"est blanc","null":"est null","not_null":"n'est pas null"}},"helpers":{"page_entries_info":{"more_pages":{"display_entries":"%{entry_name}  \u003cb\u003e%{first} - %{last}\u003c/b\u003e sur \u003cb\u003e%{total}\u003c/b\u003e au total"},"one_page":{"display_entries":{"one":"\u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"\u003cb\u003etous les %{count}\u003c/b\u003e %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Premier","last":"Dernier \u0026raquo;","next":"Suivant \u0026rsaquo;","previous":"\u0026lsaquo; Précédent","truncate":"\u0026hellip;"}}},"hu":{"ransack":{"search":"keresés","predicate":"állítás","and":"és","or":"vagy","any":"bármely","all":"mindegyik","combinator":"combinator","attribute":"attribute","value":"érték","condition":"feltétel","sort":"rendezés","asc":"növekvő","desc":"csökkenő","predicates":{"eq":"egyenlő","eq_any":"bármelyikkel egyenlő","eq_all":"minddel egyenlő","not_eq":"nem egyenlő","not_eq_any":"nem egyenlő bármelyikkel","not_eq_all":"nem egyenlő egyikkel sem","matches":"egyezik","matches_any":"bármelyikkel egyezik","matches_all":"minddel egyezik","does_not_match":"nem egyezik","does_not_match_any":"nem egyezik semelyikkel","does_not_match_all":"nem egyezik az összessel","lt":"kisebb, mint","lt_any":"bármelyiknél kisebb","lt_all":"mindegyiknél kisebb","lteq":"kisebb vagy egyenlő, mint","lteq_any":"bármelyiknél kisebb vagy egyenlő","lteq_all":"mindegyiknél kisebb vagy egyenlő","gt":"nagyobb, mint","gt_any":"bármelyiknél nagyobb","gt_all":"mindegyiknél nagyobb","gteq":"nagyobb vagy egyenlő, mint","gteq_any":"bármelyiknél nagyobb vagy egyenlő","gteq_all":"mindegyiknél nagyobb vagy egyenlő","in":"értéke","in_any":"értéke bármelyik","in_all":"értéke mindegyik","not_in":"nem ez az értéke","not_in_any":"értéke egyik sem","not_in_all":"értéke nem ezek az elemek","cont":"tartalmazza","cont_any":"bármelyiket tartalmazza","cont_all":"mindet tartalmazza","not_cont":"nem tartalmazza","not_cont_any":"egyiket sem tartalmazza","not_cont_all":"nem tartalmazza mindet","start":"így kezdődik","start_any":"bármelyikkel kezdődik","start_all":"ezekkel kezdődik","not_start":"nem így kezdődik","not_start_any":"nem ezek egyikével kezdődik","not_start_all":"nem ezekkel kezdődik","end":"így végződik","end_any":"bármelyikkel végződik","end_all":"ezekkel végződik","not_end":"nem úgy végződik","not_end_any":"nem ezek egyikével végződik","not_end_all":"nem ezekkel végződik","true":"igaz","false":"hamis","present":"létezik","blank":"üres","null":"null","not_null":"nem null"}}},"nl":{"ransack":{"search":"zoeken","predicate":"eigenschap","and":"en","or":"of","any":"enig","all":"alle","combinator":"combinator","attribute":"attribuut","value":"waarde","condition":"conditie","sort":"sorteren","asc":"oplopend","desc":"aflopend","predicates":{"eq":"gelijk","eq_any":"gelijk enig","eq_all":"gelijk alle","not_eq":"niet gelijk aan","not_eq_any":"niet gelijk aan enig","not_eq_all":"niet gelijk aan alle","matches":"evenaart","matches_any":"evenaart enig","matches_all":"evenaart alle","does_not_match":"evenaart niet","does_not_match_any":"evenaart niet voor enig","does_not_match_all":"evenaart niet voor alle","lt":"kleiner dan","lt_any":"kleiner dan enig","lt_all":"kleiner dan alle","lteq":"kleiner dan of gelijk aan","lteq_any":"kleiner dan of gelijk aan enig","lteq_all":"kleiner dan of gelijk aan alle","gt":"groter dan","gt_any":"groter dan enig","gt_all":"groter dan alle","gteq":"groter dan or equal to","gteq_any":"groter dan or equal to enig","gteq_all":"groter dan or equal to alle","in":"in","in_any":"in enig","in_all":"in alle","not_in":"niet in","not_in_any":"niet in enig","not_in_all":"niet in alle","cont":"bevat","cont_any":"bevat enig","cont_all":"bevat alle","not_cont":"bevat niet","not_cont_any":"bevat niet enig","not_cont_all":"bevat niet alle","start":"start met","start_any":"start met enig","start_all":"start met alle","not_start":"start niet met","not_start_any":"start niet met enig","not_start_all":"start niet met alle","end":"eindigt met","end_any":"eindigt met enig","end_all":"eindigt met alle","not_end":"eindigt niet met","not_end_any":"eindigt niet met enig","not_end_all":"eindigt niet met alle","true":"is waar","false":"is niet waar","present":"is present","blank":"is afwezig","null":"is null","not_null":"is niet null"}}},"ro":{"ransack":{"search":"caută","predicate":"predicat","and":"și","or":"sau","any":"oricare","all":"toate","combinator":"combinator","attribute":"atribut","value":"valoare","condition":"condiție","sort":"sortează","asc":"crescător","desc":"descrescător","predicates":{"eq":"egal cu","eq_any":"egal cu unul din","eq_all":"egal cu toate","not_eq":"diferit de","not_eq_any":"diferit de toate","not_eq_all":"nu este egal cu toate","matches":"corespunde","matches_any":"corespunde cu unul din","matches_all":"corespunde cu toate","does_not_match":"nu corespunde","does_not_match_any":"nu corespunde cu nici un","does_not_match_all":"nu corespunde cu toate","lt":"mai mic de","lt_any":"mai mic decât cel puțin unul din","lt_all":"mai mic decât toate","lteq":"mai mic sau egal decât","lteq_any":"mai mic sau egal decât cel puțin unul din","lteq_all":"mai mic sau egal decât toate","gt":"mai mare de","gt_any":"mai mare decât cel puțin unul din","gt_all":"mai mare decât toate","gteq":"mai mare sau egal decât","gteq_any":"mai mare sau egal decât cel puțin unul din","gteq_all":"mai mare sau egal decât toate","in":"inclus în","in_any":"inclus într-unul din","in_all":"inclus în toate","not_in":"nu este inclus în","not_in_any":"nu este inclus într-unul din","not_in_all":"nu este inclus în toate","cont":"conține","cont_any":"conține unul din","cont_all":"conține toate","not_cont":"nu conține","not_cont_any":"nu conține unul din","not_cont_all":"nu conține toate","start":"începe cu","start_any":"începe cu unul din","start_all":"începe cu toate","not_start":"nu începe","not_start_any":"nu începe cu unul din","not_start_all":"nu începe cu toate","end":"se termină cu","end_any":"se termină cu unul din","end_all":"se termină cu toate","not_end":"nu se termină cu","not_end_any":"nu se termină cu unul din","not_end_all":"nu se termină cu toate","true":"este adevărat","false":"este fals","present":"este prezent","blank":"este gol","null":"este nul","not_null":"nu este nul"}}},"zh":{"ransack":{"search":"搜索","predicate":"基于(predicate)","and":"并且","or":"或者","any":"任意","all":"所有","combinator":"条件组合(combinator)","attribute":"属性","value":"数值","condition":"条件","sort":"排序","asc":"升序","desc":"降序","predicates":{"eq":"等于","eq_any":"等于任意值","eq_all":"等于所有值","not_eq":"不等于","not_eq_any":"不等于任意值","not_eq_all":"不等于所有值","matches":"符合","matches_any":"符合任意条件","matches_all":"符合所有条件","does_not_match":"不符合","does_not_match_any":"符合任意条件","does_not_match_all":"不符合所有条件","lt":"小于","lt_any":"小于任意一个值","lt_all":"小于所有值","lteq":"小于等于","lteq_any":"小于等于任意一个值","lteq_all":"小于等于所有值","gt":"大于","gt_any":"大于任意一个值","gt_all":"大于所有值","gteq":"大于等于","gteq_any":"大于等于任意一个值","gteq_all":"大于等于所有值","in":"被包含","in_any":"被任意值包含","in_all":"被所有值包含","not_in":"不被包含","not_in_any":"不被任意值包含","not_in_all":"不被所有值包含","cont":"包含","cont_any":"包含任意一个值","cont_all":"包含所有值","not_cont":"不包含","not_cont_any":"不包含任意一个值","not_cont_all":"不包含所有值","start":"以改值开始","start_any":"以任意一个值开始","start_all":"以所有值开始","not_start":"不以改值开始","not_start_any":"不以任意一个值开始","not_start_all":"不以所有值开始","end":"以改值结尾","end_any":"以任意一个值结尾","end_all":"以所有值结尾","not_end":"不以改值结尾","not_end_any":"不以任意一个值结尾","not_end_all":"不以所有值结尾","true":"等于true","false":"等于false","present":"有值","blank":"为空","null":"是null","not_null":"不是null"}},"helpers":{"page_entries_info":{"more_pages":{"display_entries":"显示 %{entry_name} \u003cb\u003e%{first} - %{last}\u003c/b\u003e  共\u003cb\u003e%{total}\u003c/b\u003e 页"},"one_page":{"display_entries":"显示 \u003cb\u003e所有 %{count}\u003c/b\u003e %{entry_name}"}}},"views":{"pagination":{"first":"\u0026laquo; 第一页","last":"最后一页 \u0026raquo;","next":"下一页 \u0026rsaquo;","previous":"\u0026lsaquo; 上一页","truncate":"\u0026hellip;"}}},"de":{"errors":{"messages":{"in_between":"muss zwischen %{min} und %{max} sein","spoofed_media_type":"trägt eine Dateiendung, die nicht mit dem Inhalt der Datei übereinstimmt"}},"number":{"human":{"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"kb":"KB","mb":"MB","gb":"GB","tb":"TB"}}}},"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Zeige %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e von insgesamt \u003cb\u003e%{total}\u003c/b\u003e"},"one_page":{"display_entries":{"one":"Zeige \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"Zeige \u003cb\u003ealle %{count}\u003c/b\u003e %{entry_name}","zero":"Kein %{entry_name} gefunden"}}}},"views":{"pagination":{"first":"« Start","last":"Ende »","next":"Weiter »","previous":"\u0026lsaquo; Zurück","truncate":"\u0026hellip;"}}},"az":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Göstərilir %{entry_name} \u003cb\u003e%{first} - %{last}\u003c/b\u003e \u003cb\u003e%{total}-dən\u003c/b\u003e cəmi"},"one_page":{"display_entries":"Göstərilir \u003cb\u003ebütün %{count}\u003c/b\u003e %{entry_name}"}}},"views":{"pagination":{"first":"\u0026laquo; İlk","last":"Axırıncı \u0026raquo;","next":"Növbəti \u0026rsaquo;","previous":"\u0026lsaquo; Əvvəlki","truncate":"\u0026hellip;"}}},"fi":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":null},"one_page":{"display_entries":{"one":"Näytetään \u003cb\u003eyksi\u003c/b\u003e %{entry_name}","other":"Näytetään \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Ensimmäinen","last":"Viimeinen \u0026raquo;","next":"Seuraava \u0026rsaquo;","previous":"\u0026lsaquo; Edellinen","truncate":"\u0026hellip;"}}},"it":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"%{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e di \u003cb\u003e%{total}\u003c/b\u003e totali"},"one_page":{"display_entries":{"one":"\u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"\u003cb\u003eTutti %{count}\u003c/b\u003e %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Inizio","last":"Fine \u0026raquo;","next":"Succ. \u0026rsaquo;","previous":"\u0026lsaquo; Prec.","truncate":"\u0026hellip;"}}},"ja":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"\u003cb\u003e%{total}\u003c/b\u003e中の%{entry_name}を表示しています \u003cb\u003e%{first} - %{last}\u003c/b\u003e"},"one_page":{"display_entries":"\u003cb\u003e%{count}\u003c/b\u003eレコード表示中です %{entry_name}"}},"select":{"prompt":"選択してください。"},"submit":{"create":"登録する","submit":"保存する","update":"更新する"}},"views":{"pagination":{"first":"\u0026laquo; 最初","last":"最後 \u0026raquo;","next":"次 \u0026rsaquo;","previous":"\u0026lsaquo; 前","truncate":"\u0026hellip;"}},"common":{"belonging_to":"%{company}で働いています","belong_to":"%{company}で働いていました","all_posts":"全ての投稿","signed_in":"サインインしました","signed_out":"サインアウトしました","edit":"編集","delete":"削除","stocked":"ストック済み","language":"表示言語","post":"投稿","is":"を","no_permission":"編集する権限がありません"},"users":{"index":{"read_all_this_post":"続きを読む","read_this_post":"この投稿を読む"},"edit":{"type_your_nick_name":"ニックネームを入力してください","submit":"保存","edit_profile":"プロフィールを編集","placeholder":"(例 アメリカに留学している大森です。英語を勉強しています。趣味は映画鑑賞とブログを読むことです。よろしくお願いします。","not_found":"ユーザーが見つかりません","bio":"自己紹介","icon":"プロフィール画像","show_company":"会社名をプロフィールに表示する"},"update":{"complate_update_profiles":"プロフィールの編集が完了しました"},"sign_in":"ログイン","sign_out":"ログアウト","nick_name":"ニックネーム","not_found":"ユーザーが見つかりません","created_by":"%{full_name}が作成","change_interface":"表示言語を変える","tags":"よく使ってるタグ | ","authentication_failed":"認証に失敗しました。再度認証してください","stocked_notes":"ストックした投稿","have_to_sign_in":"ログインする必要があります"},"notes":{"index":{"title":"タイトル","content":"内容"},"edit":{"editing":"ノートを修正"},"tag_and_warning":"タグ ※タグはスペースで区切ってください","tag_list":"タグ一覧 | ","tag":"このタグの投稿一覧","stock_this_note":"ストックする","created":"ノートが作成されました","updated":"ノートが更新されました","deleted":"ノートが削除されました"},"stocks":{"has_been_stocked":"がストックしました"},"comments":{"comment":"コメント","created":"コメントを投稿しました","updated":"コメントを更新しました","deleted":"コメントを削除しました","falied":"コメントの投稿が失敗しました","number_of_comment":"%{number_of_comment} 件のコメント"},"followers":{"button":"フォロー","follow_you":"%{name}さんにフォローされました"},"validation":{"required_nick_name":"ニックネームが入力されていません","required_title":"タイトルを入力してください","required_tag_list":"タグを入力してください","required_content":"内容を入力してください","max_length":"%{limit}文字以内にして下さい"},"datetime":{"distance_in_words":{"about_x_hours":{"one":"約1時間","other":"約%{count}時間"},"about_x_months":{"one":"約1ヶ月","other":"約%{count}ヶ月"},"about_x_years":{"one":"約1年","other":"約%{count}年"},"almost_x_years":{"one":"1年弱","other":"%{count}年弱"},"half_a_minute":"30秒前後","less_than_x_minutes":{"one":"1分以内","other":"%{count}分未満"},"less_than_x_seconds":{"one":"1秒以内","other":"%{count}秒未満"},"over_x_years":{"one":"1年以上","other":"%{count}年以上"},"x_days":{"one":"1日","other":"%{count}日"},"x_minutes":{"one":"1分","other":"%{count}分"},"x_months":{"one":"1ヶ月","other":"%{count}ヶ月"},"x_seconds":{"one":"1秒","other":"%{count}秒"}},"prompts":{"day":"日","hour":"時","minute":"分","month":"月","second":"秒","year":"年"}},"date":{"abbr_day_names":["日","月","火","水","木","金","土"],"abbr_month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"day_names":["日曜日","月曜日","火曜日","水曜日","木曜日","金曜日","土曜日"],"formats":{"default":"%Y/%m/%d","long":"%Y年%m月%d日(%a)","short":"%m/%d"},"month_names":[null,"1月","2月","3月","4月","5月","6月","7月","8月","9月","10月","11月","12月"],"order":["year","month","day"]},"errors":{"format":"%{attribute}%{message}","messages":{"accepted":"を受諾してください。","blank":"を入力してください。","present":"は入力しないでください。","confirmation":"と%{attribute}の入力が一致しません。","empty":"を入力してください。","equal_to":"は%{count}にしてください。","even":"は偶数にしてください。","exclusion":"は予約されています。","greater_than":"は%{count}より大きい値にしてください。","greater_than_or_equal_to":"は%{count}以上の値にしてください。","inclusion":"は一覧にありません。","invalid":"は不正な値です。","less_than":"は%{count}より小さい値にしてください。","less_than_or_equal_to":"は%{count}以下の値にしてください。","not_a_number":"は数値で入力してください。","not_an_integer":"は整数で入力してください。","odd":"は奇数にしてください。","record_invalid":"バリデーションに失敗しました。 %{errors}","restrict_dependent_destroy":"%{record}が存在しているので削除できません。","taken":"はすでに存在します。","too_long":"は%{count}文字以内で入力してください。","too_short":"は%{count}文字以上で入力してください。","wrong_length":"は%{count}文字で入力してください。","other_than":"は%{count}以外の値にしてください。"},"template":{"body":"次の項目を確認してください。","header":{"one":"%{model}にエラーが発生しました。","other":"%{model}に%{count}個のエラーが発生しました。"}}},"number":{"currency":{"format":{"delimiter":",","format":"%n%u","precision":0,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"円"}},"format":{"delimiter":",","precision":3,"separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"十億","million":"百万","quadrillion":"千兆","thousand":"千","trillion":"兆","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n%u","units":{"byte":"バイト","gb":"ギガバイト","kb":"キロバイト","mb":"メガバイト","tb":"テラバイト"}}},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"support":{"array":{"last_word_connector":"と","two_words_connector":"と","words_connector":"と"}},"time":{"am":"午前","formats":{"default":"%Y/%m/%d %H:%M:%S","long":"%Y年%m月%d日(%a) %H時%M分%S秒 %z","short":"%y/%m/%d %H:%M"},"pm":"午後"}},"ko":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"\u003cb\u003e%{total}\u003c/b\u003e중의 %{entry_name}를(을) 표시하고 있습니다 \u003cb\u003e%{first} - %{last}\u003c/b\u003e"},"one_page":{"display_entries":"\u003cb\u003e%{count}\u003c/b\u003e 레코드 표시 중입니다 %{entry_name}"}}},"views":{"pagination":{"first":"\u0026laquo; 처음","last":"마지막 \u0026raquo;","next":"다음 \u0026rsaquo;","previous":"\u0026lsaquo; 이전","truncate":"\u0026hellip;"}}},"pl":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Wyświetla %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e z \u003cb\u003e%{total}\u003c/b\u003e łącznie"},"one_page":{"display_entries":{"few":"Wyświetla \u003cb\u003ewszystkie %{count}\u003c/b\u003e %{entry_name}","one":"Wyświetla \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"Wyświetla \u003cb\u003ewszystkie %{count}\u003c/b\u003e %{entry_name}","zero":"Nie znaleziono %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Pierwsza","last":"Ostatnia \u0026raquo;","next":"Dalej \u0026rsaquo;","previous":"\u0026lsaquo; Wstecz","truncate":"\u0026hellip;"}}},"pt-BR":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Exibindo %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e de um total de \u003cb\u003e%{total}\u003c/b\u003e"},"one_page":{"display_entries":{"one":"Exibindo \u003cb\u003e1\u003c/b\u003e %{entry_name}","other":"Exibindo \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","zero":"Nenhum %{entry_name} encontrado"}}}},"views":{"pagination":{"first":"\u0026laquo; Primeiro","last":"Último \u0026raquo;","next":"Próximo \u0026rsaquo;","previous":"\u0026lsaquo; Anterior","truncate":"\u0026hellip;"}}},"ru":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Показана %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e из \u003cb\u003e%{total}\u003c/b\u003e"},"one_page":{"display_entries":{"few":"Показаны \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","many":"\"Показаны \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}\"","one":"Показано \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"Показаны \u003cb\u003eвсе %{count}\u003c/b\u003e %{entry_name}\""}}}},"views":{"pagination":{"first":"\u0026laquo; Первая","last":"Последняя \u0026raquo;","next":"Следующая \u0026rsaquo;","previous":"\u0026lsaquo; Предыдущая","truncate":"\u0026hellip;"}}},"sk":{"helpers":{"page_entries_info":{"more_pages":{"display_entries":"Zobrazujem %{entry_name} \u003cb\u003e%{first}\u0026nbsp;-\u0026nbsp;%{last}\u003c/b\u003e z celkovo \u003cb\u003e%{total}\u003c/b\u003e"},"one_page":{"display_entries":{"few":"Zobrazujem \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","one":"Zobrazujem \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}","other":"Zobrazujem \u003cb\u003e%{count}\u003c/b\u003e %{entry_name}"}}}},"views":{"pagination":{"first":"\u0026laquo; Prvá","last":"Posledná \u0026raquo;","next":"Ďalej \u0026rsaquo;","previous":"\u0026lsaquo; Späť","truncate":"\u0026hellip;"}}}};