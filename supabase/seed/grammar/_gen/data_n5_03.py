G = [
dict(
n=21,
jp="か",
rd="ka",
tr="Partícula de pergunta / Será que",
ex="""か é a partícula que transforma uma frase em pergunta. Ela fica no final da frase e funciona como o ponto de interrogação falado do japonês.

Com a forma educada (です e ます), basta colocar か no final para fazer uma pergunta. Por isso, na escrita japonesa tradicional, muitas vezes nem se usa o símbolo de interrogação: o か já mostra que é uma pergunta.

か também aparece no meio da frase para formar perguntas indiretas, como "sei onde...", "não sei a que horas...". Nesse caso, a pergunta fica dentro de uma frase maior.

Com ませんか, か forma convites educados. E na resposta そうですか, ele não é exatamente uma pergunta, mas mostra que você recebeu e entendeu a informação, como "ah, é?" ou "entendi".""",
st="""Frase educada (です / ます) + か
Palavra interrogativa + … + か
Frase na forma simples + か + 知っています / わかりません (pergunta indireta)
Verbo ません + か (convite)
そうですか (reação a uma informação)""",
no="""Na fala informal, か no final costuma ser substituído por entonação subindo ou pela partícula の. Usar か sozinho com a forma simples pode soar brusco, principalmente na fala masculina.

Com substantivos e adjetivos な na forma simples, o だ desaparece antes de か na pergunta indireta.

A entonação de そうですか muda o sentido: descendo, mostra que você entendeu; subindo, mostra surpresa ou dúvida.""",
bf="か",
rx="か",
tk=["か"],
va=["か"],
E=[
("これは何ですか。", "これはなんですか。", "O que é isto?"),
("明日、学校に行きますか。", "あした、がっこうにいきますか。", "Você vai à escola amanhã?"),
("田中さんがどこにいるか知っていますか。", "たなかさんがどこにいるかしっていますか。", "Você sabe onde o Tanaka está?"),
("一緒に行きませんか。", "いっしょにいきませんか。", "Quer ir junto?"),
("「明日は休みです。」「そうですか。」", "「あしたはやすみです。」「そうですか。」", "\"Amanhã é folga.\" \"Ah, é?\""),
],
R=[
("あなたは学生です____。", "Você é estudante?", ["か"]),
("すみません、トイレはどこです____。", "Com licença, onde fica o banheiro?", ["か"]),
("昨日、何を食べました____。", "O que você comeu ontem?", ["か"]),
("会議が何時に始まる____わかりません。", "Não sei a que horas a reunião começa.", ["か"]),
("「来週、テストがあります。」「そうです____。」", "\"Semana que vem tem prova.\" \"Ah, é?\"", ["か"]),
],
),
dict(
n=22,
jp="〜か〜か",
rd="ka ~ ka",
tr="Ou / Se... ou...",
ex="""か também é usado para apresentar opções, com o sentido de "ou". Quando você coloca か entre duas coisas, mostra que é uma ou outra.

Com substantivos, a forma mais simples é A か B. O segundo か, depois de B, é opcional nesse caso e aparece mais quando se quer deixar bem claro que são alternativas.

Com verbos, a estrutura com dois か é muito comum para expressar dúvida entre duas possibilidades, como "se vai ou não vai". Nesse caso, junta-se o verbo afirmativo e o negativo, cada um seguido de か.

Essa construção aparece muito com verbos como decidir, saber, escolher e perguntar.""",
st="""Substantivo A + か + Substantivo B
Substantivo A + か + Substantivo B + か
Verbo A + か + Verbo B + か
Verbo (forma simples) + か + Verbo (forma ない) + か (se... ou não)""",
no="""A construção com か é diferente de や e と. と junta todas as coisas ("A e B"), や dá exemplos ("A, B e outras coisas"), e か mostra que é uma das opções.

Na pergunta indireta com duas opções, o tom é de dúvida. Por isso, ela aparece com frequência ao falar de decisões que ainda não foram tomadas.

Com substantivos, também é muito comum a forma どちらか, que significa "um dos dois".""",
bf="か",
rx="か",
tk=["か"],
va=["か"],
E=[
("月曜日か火曜日に来てください。", "げつようびかかようびにきてください。", "Venha na segunda ou na terça, por favor."),
("コーヒーか紅茶、どちらがいいですか。", "コーヒーかこうちゃ、どちらがいいですか。", "Café ou chá, qual você prefere?"),
("いつも電車かバスで学校に行きます。", "いつもでんしゃかバスでがっこうにいきます。", "Sempre vou para a escola de trem ou de ônibus."),
("パーティーに行くか行かないか、まだ決めていません。", "パーティーにいくかいかないか、まだきめていません。", "Ainda não decidi se vou à festa ou não."),
("肉か魚か選んでください。", "にくかさかなかえらんでください。", "Escolha carne ou peixe, por favor."),
],
R=[
("赤____青のペンを貸してください。", "Me empresta uma caneta vermelha ou azul, por favor.", ["か"]),
("夏休みは海____山に行きたいです。", "Nas férias de verão, quero ir para a praia ou para a montanha.", ["か"]),
("晩ご飯はラーメン____カレーにしましょう。", "Vamos jantar ramen ou curry.", ["か"]),
("その話が本当____うそか、わかりません。", "Não sei se essa história é verdade ou mentira.", ["か"]),
("彼が来る____来ないか、誰も知りません。", "Ninguém sabe se ele vem ou não.", ["か"]),
],
),
dict(
n=23,
jp="から",
rd="kara",
tr="Porque / Por isso / De / Desde / A partir de",
ex="""から tem dois usos principais no N5, e os dois partem da mesma ideia de "origem".

O primeiro é indicar o motivo. Quando から vem depois de uma frase, ele mostra que aquilo é a causa do que vem depois. A ordem é a contrária do português: primeiro o motivo, depois o resultado. Você pode traduzir como "porque", "como" ou "então", conforme a frase.

O segundo é indicar o ponto de partida, seja de lugar ou de tempo. Depois de um substantivo, から significa "de", "desde" ou "a partir de".

No uso de motivo, から pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, é preciso colocar だ ou です antes de から.

A resposta a uma pergunta com どうして costuma terminar com から, como uma explicação curta.""",
st="""Motivo:
Verbo / Adjetivo い (forma simples ou educada) + から
Substantivo / Adjetivo な + だ / です + から
… + からです (resposta com o motivo)

Ponto de partida:
Substantivo (lugar) + から
Substantivo (tempo) + から""",
no="""から para motivo soa mais subjetivo e direto que ので. Por isso, ele é ótimo para conversas do dia a dia, mas pode soar um pouco forte em pedidos formais ou desculpas.

Não confunda から sozinho com てから, que significa "depois de fazer" e é outra gramática.

Para receber algo de alguém, os verbos もらう e 借りる podem usar から ou に para marcar a pessoa.""",
bf="から",
rx="から",
tk=["から"],
va=["から", "だから", "ですから"],
E=[
("雨が降っているから、家にいます。", "あめがふっているから、いえにいます。", "Como está chovendo, vou ficar em casa."),
("今日は日曜日だから、学校は休みです。", "きょうはにちようびだから、がっこうはやすみです。", "Hoje é domingo, então não tem aula."),
("授業は九時から始まります。", "じゅぎょうはくじからはじまります。", "A aula começa às nove."),
("ブラジルから来ました。", "ブラジルからきました。", "Vim do Brasil."),
("「どうして食べないの？」「お腹がいっぱいだから。」", "「どうしてたべないの？」「おなかがいっぱいだから。」", "\"Por que você não come?\" \"Porque estou cheio.\""),
],
R=[
("寒い____、窓を閉めてください。", "Está frio, então feche a janela, por favor.", ["から"]),
("この銀行は九時____です。", "Este banco abre a partir das nove.", ["から"]),
("駅____家まで歩きました。", "Andei da estação até a casa.", ["から"]),
("明日はテストだ____、今日は勉強します。", "Amanhã tem prova, então hoje vou estudar.", ["から"]),
("「どうして遅れたんですか。」「電車が遅れた____です。」", "\"Por que você se atrasou?\" \"Porque o trem atrasou.\"", ["から"]),
],
),
dict(
n=24,
jp="〜方",
rd="kata",
tr="Jeito de / Modo de / Maneira de",
ex="""方 (lido かた) é usado depois de um verbo para formar a ideia de "jeito de fazer", "modo de fazer" ou "como fazer".

Para isso, tira-se ます da forma educada do verbo e coloca-se 方. O resultado é um substantivo, então ele pode ser usado com partículas como を, が e は.

Como a nova palavra é um substantivo, o objeto do verbo original não usa mais を: ele passa a usar の. Assim, "o jeito de ler o kanji" fica com の entre o kanji e o verbo.

Com verbos com する, como 勉強する, a forma fica 勉強の仕方, usando し方 (às vezes escrito 仕方).""",
st="""Verbo na forma ます sem ます + 方
Substantivo + の + Verbo sem ます + 方
Substantivo + の + し方 / 仕方 (verbos com する)

Escrita: 方 / かた""",
no="""方 também tem outros sentidos. Lido かた, ele é uma forma educada de dizer "pessoa", como em あの方. Lido ほう, ele aparece em comparações e em ほうがいい.

A expressão 仕方がない significa "não tem jeito" e vem justamente da ideia de "não existe um modo de fazer".

Algumas formas são tão comuns que viraram vocabulário próprio, como 読み方 (leitura), 使い方 (modo de usar) e 行き方 (como chegar).""",
bf="方",
rx="方|かた",
tk=["方"],
va=["方", "かた"],
E=[
("この漢字の読み方を教えてください。", "このかんじのよみかたをおしえてください。", "Me ensine a leitura deste kanji, por favor."),
("駅までの行き方がわかりません。", "えきまでのいきかたがわかりません。", "Não sei como chegar até a estação."),
("このアプリの使い方は簡単です。", "このアプリのつかいかたはかんたんです。", "O jeito de usar este aplicativo é fácil."),
("母にカレーの作り方を習いました。", "ははにカレーのつくりかたをならいました。", "Aprendi com minha mãe a fazer curry."),
("先生は話し方がとても優しいです。", "せんせいははなしかたがとてもやさしいです。", "O professor tem um jeito de falar muito gentil."),
],
R=[
("お箸の持ち____を教えてください。", "Me ensine a segurar os hashis, por favor.", ["方", "かた"]),
("このパソコンの使い____がわかりません。", "Não sei usar este computador.", ["方", "かた"]),
("日本語の手紙の書き____を勉強しています。", "Estou estudando como escrever cartas em japonês.", ["方", "かた"]),
("切符の買い____を駅員さんに聞きました。", "Perguntei ao funcionário da estação como comprar a passagem.", ["方", "かた"]),
("彼は歩き____がお父さんに似ています。", "O jeito de andar dele parece com o do pai.", ["方", "かた"]),
],
),
dict(
n=25,
jp="〜けど",
rd="kedo",
tr="Mas / Porém / Embora",
ex="""けど é usado para ligar duas ideias que se contrastam, com o sentido de "mas" ou "embora". Ele fica no final da primeira parte da frase, juntando tudo em uma frase só.

É muito usado na conversa informal. Pode vir depois da forma simples ou da forma educada. Com substantivos e adjetivos な, coloca-se だ antes de けど na forma simples.

Além do contraste, けど também tem uma função muito japonesa: suavizar. Quando uma frase termina com けど e o resto fica "no ar", a pessoa está introduzindo um assunto, fazendo um pedido indireto ou evitando soar direta demais.

Por exemplo, ao pedir ajuda ou fazer uma pergunta, terminar com けど deixa espaço para o outro responder, sem pressão.""",
st="""Verbo / Adjetivo い (forma simples ou educada) + けど + Frase
Substantivo / Adjetivo な + だ + けど + Frase
Substantivo / Adjetivo な + です + けど + Frase
Frase + けど (final suavizado, sem completar)""",
no="""けど é a forma mais curta e casual da família けれども, けれど e けど. Em situações formais e na escrita, けれども ou が são mais adequados.

O uso de けど no final da frase para suavizar é muito comum ao falar com atendentes, professores ou desconhecidos, e não soa mal-educado.

Às vezes けど não indica contraste forte, mas apenas apresenta um contexto antes da informação principal.""",
bf="けど",
rx="けど",
tk=["けど"],
va=["けど"],
E=[
("この店は高いけど、おいしいです。", "このみせはたかいけど、おいしいです。", "Este restaurante é caro, mas é gostoso."),
("行きたいけど、時間がない。", "いきたいけど、じかんがない。", "Quero ir, mas não tenho tempo."),
("日本語は難しいけど、おもしろい。", "にほんごはむずかしいけど、おもしろい。", "Japonês é difícil, mas é interessante."),
("雨だけど、出かけます。", "あめだけど、でかけます。", "Está chovendo, mas vou sair."),
("すみません、ちょっと聞きたいことがあるんですけど…。", "すみません、ちょっとききたいことがあるんですけど…。", "Com licença, eu queria perguntar uma coisa..."),
],
R=[
("薬を飲んだ____、まだ頭が痛いです。", "Tomei remédio, mas ainda estou com dor de cabeça.", ["けど"]),
("兄は背が高い____、私は低いです。", "Meu irmão mais velho é alto, mas eu sou baixo.", ["けど"]),
("今日は休みだ____、仕事に行きます。", "Hoje é folga, mas vou trabalhar.", ["けど"]),
("このアパートは安い____、駅から遠いです。", "Este apartamento é barato, mas é longe da estação.", ["けど"]),
("あのう、駅に行きたいんです____…。", "Hum, eu queria ir à estação...", ["けど"]),
],
),
dict(
n=26,
jp="〜けれども",
rd="keredomo",
tr="Mas / Porém / Embora / No entanto",
ex="""けれども tem o mesmo significado de けど: liga duas ideias que se contrastam, como "mas" ou "embora". A diferença está no tom.

けれども é a forma completa e soa mais educada e cuidadosa. Por isso, combina bem com a forma です e ます, com situações de trabalho, conversas com pessoas mais velhas e textos escritos.

Ele pode ficar no final da primeira parte da frase, ligando as duas ideias, ou no começo de uma nova frase, com o sentido de "no entanto".

Assim como けど, けれども também pode suavizar pedidos e perguntas, deixando a frase mais delicada.""",
st="""Frase (forma educada ou simples) + けれども + Frase
Substantivo / Adjetivo な + です / だ + けれども + Frase
Frase 1 (com ponto final) + けれども、 + Frase 2

Do mais formal ao mais informal: けれども → けれど → けど""",
no="""As três formas, けれども, けれど e けど, são a mesma palavra em níveis diferentes de formalidade. Conhecer as três ajuda a reconhecer o tom de quem fala.

Na escrita muito formal, como relatórios e jornais, é comum usar が ou しかし no lugar de けれども.

Começar a frase com けれども soa um pouco mais formal e literário do que começar com でも.""",
bf="けれども",
rx="けれども|けれど",
tk=["けれども"],
va=["けれども", "けれど"],
E=[
("一生懸命練習したけれども、試合に負けました。", "いっしょうけんめいれんしゅうしたけれども、しあいにまけました。", "Treinei muito, mas perdi a partida."),
("この服はきれいですけれども、少し高いです。", "このふくはきれいですけれども、すこしたかいです。", "Esta roupa é bonita, mas é um pouco cara."),
("雪が降っていますけれども、学校は休みになりません。", "ゆきがふっていますけれども、がっこうはやすみになりません。", "Está nevando, mas as aulas não vão ser canceladas."),
("説明を聞いた。けれども、よくわからなかった。", "せつめいをきいた。けれども、よくわからなかった。", "Ouvi a explicação. No entanto, não entendi bem."),
("すみませんけれども、もう少しゆっくり話してください。", "すみませんけれども、もうすこしゆっくりはなしてください。", "Desculpe, mas fale um pouco mais devagar, por favor."),
],
R=[
("何度も電話しました____、彼は出ませんでした。", "Liguei várias vezes, mas ele não atendeu.", ["けれども", "けれど"]),
("この料理は見た目は普通です____、とてもおいしいです。", "Esta comida tem aparência comum, mas é muito gostosa.", ["けれども", "けれど"]),
("部屋は狭いです____、明るくて気持ちがいいです。", "O quarto é pequeno, mas é claro e agradável.", ["けれども", "けれど"]),
("頑張りました。____、合格できませんでした。", "Me esforcei. No entanto, não consegui passar.", ["けれども", "けれど"]),
("失礼です____、どちら様ですか。", "Desculpe, mas quem é o senhor?", ["けれども", "けれど"]),
],
),
dict(
n=27,
jp="まだ",
rd="mada",
tr="Ainda / Ainda não",
ex="""まだ significa "ainda". Ele mostra que uma situação continua igual e ainda não mudou.

Com frases afirmativas, まだ indica que algo continua acontecendo ou continua sendo verdade, como ainda estar dormindo, ainda ter tempo ou ainda ser estudante.

Com frases negativas, まだ significa "ainda não", ou seja, algo que se espera que aconteça, mas que não aconteceu até agora.

Sozinho, na resposta まだです ou só まだ, ele significa "ainda não". É a resposta natural quando alguém pergunta se você já fez alguma coisa.

O oposto de まだ é もう, que significa "já".""",
st="""まだ + Verbo na forma ている (ainda está fazendo)
まだ + Adjetivo / Substantivo + です
まだ + Verbo na forma ていない / ていません (ainda não fez)
まだです / まだ (resposta: ainda não)""",
no="""Na resposta まだです, não é preciso repetir o verbo; o contexto já deixa claro do que se trata.

まだ pode indicar que ainda falta pouco ou que ainda há margem, como em ainda ter tempo, ainda dar para ir.

Muitas vezes まだ tem um tom de "ainda não, mas vai acontecer". Por isso, ele combina com coisas que se espera fazer no futuro.""",
bf="まだ",
rx="まだ",
tk=["まだ"],
va=["まだ"],
E=[
("弟はまだ寝ています。", "おとうとはまだねています。", "Meu irmão mais novo ainda está dormindo."),
("まだ時間がありますよ。", "まだじかんがありますよ。", "Ainda temos tempo."),
("外はまだ明るいです。", "そとはまだあかるいです。", "Lá fora ainda está claro."),
("「宿題は終わった？」「ううん、まだ。」", "「しゅくだいはおわった？」「ううん、まだ。」", "\"Terminou a lição?\" \"Não, ainda não.\""),
("日本語はまだ下手ですが、毎日勉強しています。", "にほんごはまだへたですが、まいにちべんきょうしています。", "Meu japonês ainda é fraco, mas estudo todo dia."),
],
R=[
("雨が____降っています。", "Ainda está chovendo.", ["まだ"]),
("「もう昼ご飯を食べましたか。」「いいえ、____です。」", "\"Você já almoçou?\" \"Não, ainda não.\"", ["まだ"]),
("父は____会社にいます。", "Meu pai ainda está na empresa.", ["まだ"]),
("私は____学生です。", "Eu ainda sou estudante.", ["まだ"]),
("____五時なのに、外はもう暗い。", "Ainda são cinco horas, mas lá fora já está escuro.", ["まだ"]),
],
),
dict(
n=28,
jp="まだ〜ていません",
rd="mada ~ te imasen",
tr="Ainda não (fiz) / Ainda não aconteceu",
ex="""まだ〜ていません é usado para dizer que algo ainda não foi feito ou ainda não aconteceu até agora, mas que pode ou deve acontecer depois.

A estrutura junta まだ (ainda) com o verbo na forma て seguido de いません. A forma ている aqui não indica uma ação em andamento, e sim um estado: "estar sem ter feito". A ideia é que a situação "não feito" continua até o momento atual.

Um ponto muito importante: em japonês, para dizer "ainda não fiz", não se usa o passado negativo ませんでした. O passado negativo indica que algo não aconteceu em um momento terminado do passado, enquanto まだ〜ていません fala do estado atual.

Na forma informal, usa-se ていない, e na fala casual é comum reduzir para てない.""",
st="""まだ + Verbo na forma て + いません (educado)
まだ + Verbo na forma て + いない (informal)
まだ + Verbo na forma て + ない (informal falado)""",
no="""Responder "ainda não" a uma pergunta com もう〜ましたか pode ser feito de duas formas: com a frase completa usando ていません, ou de forma curta com まだです.

Usar ませんでした no lugar de ていません é um erro muito comum de estudantes. Com ませんでした, a frase passa a ideia de que a oportunidade já acabou.

Na fala rápida, a forma ていない vira てない, e でいない vira でない.""",
bf="ていません",
rx="ていません|でいません|ていない|でいない",
tk=["まだ", "て", "いません"],
va=["ていません", "でいません", "ていない", "でいない", "てない", "でない"],
E=[
("まだ昼ご飯を食べていません。", "まだひるごはんをたべていません。", "Ainda não almocei."),
("その映画はまだ見ていません。", "そのえいがはまだみていません。", "Ainda não vi esse filme."),
("宿題がまだ終わっていない。", "しゅくだいがまだおわっていない。", "A lição ainda não terminou."),
("田中さんはまだ来ていませんね。", "たなかさんはまだきていませんね。", "O Tanaka ainda não chegou, né?"),
("その本は買ったけど、まだ読んでいません。", "そのほんはかったけど、まだよんでいません。", "Comprei esse livro, mas ainda não li."),
],
R=[
("まだ部屋を掃除し____。", "Ainda não limpei o quarto.", ["ていません", "ていない"]),
("「レポートはもう出しましたか。」「いいえ、まだ出し____。」", "\"Você já entregou o relatório?\" \"Não, ainda não entreguei.\"", ["ていません"]),
("バスはまだ来____。", "O ônibus ainda não veio.", ["ていません", "ていない"]),
("新しい漢字をまだ覚え____。", "Ainda não decorei os kanji novos.", ["ていません", "ていない"]),
("薬はもらったけど、まだ飲ん____。", "Peguei o remédio, mas ainda não tomei.", ["でいません", "でいない"]),
],
),
dict(
n=29,
jp="まで",
rd="made",
tr="Até / Até que",
ex="""まで indica o limite final de algo, seja de lugar, de tempo ou de ação. Equivale a "até".

Depois de um lugar, mostra até onde se vai. Depois de um horário ou data, mostra até quando algo continua.

Depois de um verbo na forma de dicionário, まで significa "até que": a primeira ação continua acontecendo até o momento em que a segunda acontece.

É muito comum usar まで junto com から, formando a ideia de "de... até...", tanto para lugares quanto para horários.

Um ponto importante: まで indica que a ação continua o tempo todo até aquele limite. Para dizer "até tal hora" no sentido de prazo, ou seja, fazer algo antes daquele momento, usa-se までに, que é outra gramática.""",
st="""Substantivo (lugar) + まで
Substantivo (tempo) + まで
Verbo na forma de dicionário + まで (até que)
Substantivo + から + Substantivo + まで""",
no="""A diferença entre まで e までに é um erro clássico. まで fala de algo contínuo até o limite; までに fala de um prazo final.

まで também pode significar "até mesmo" depois de substantivos, mostrando que algo vai além do esperado. Esse uso aparece mais em níveis seguintes.

Em horários de funcionamento, a forma 〜までです é uma maneira natural de dizer até quando algo fica aberto ou acontece.""",
bf="まで",
rx="まで",
tk=["まで"],
va=["まで"],
E=[
("駅まで歩きます。", "えきまであるきます。", "Vou a pé até a estação."),
("この店は夜十時までです。", "このみせはよるじゅうじまでです。", "Esta loja funciona até as dez da noite."),
("昨日は夜遅くまで勉強しました。", "きのうはよるおそくまでべんきょうしました。", "Ontem estudei até tarde da noite."),
("東京から大阪まで新幹線で行きました。", "とうきょうからおおさかまでしんかんせんでいきました。", "Fui de Tóquio até Osaka de trem-bala."),
("バスが来るまで、ここで待ちましょう。", "バスがくるまで、ここでまちましょう。", "Vamos esperar aqui até o ônibus chegar."),
],
R=[
("毎日、五時____働きます。", "Todo dia, trabalho até as cinco.", ["まで"]),
("空港____タクシーで行きました。", "Fui de táxi até o aeroporto.", ["まで"]),
("夏休みは八月三十一日____です。", "As férias de verão vão até 31 de agosto.", ["まで"]),
("雨がやむ____、ここにいましょう。", "Vamos ficar aqui até a chuva parar.", ["まで"]),
("この本を最後____読んでください。", "Leia este livro até o final, por favor.", ["まで"]),
],
),
dict(
n=30,
jp="〜前に",
rd="mae ni",
tr="Antes de / Há (tempo atrás)",
ex="""前に é usado para dizer que uma ação acontece antes de outra. Equivale a "antes de".

Ele pode vir depois de um verbo ou de um substantivo. Com verbo, usa-se sempre a forma de dicionário, mesmo que a frase inteira esteja no passado. Isso acontece porque, no momento da primeira ação, a segunda ainda não tinha acontecido.

Com substantivo, coloca-se の entre o substantivo e 前に, como "antes da aula" ou "antes da refeição".

Depois de uma quantidade de tempo, sem の, 前に significa "atrás" ou "há", como "há três anos".""",
st="""Verbo na forma de dicionário + 前に
Substantivo + の + 前に
Período de tempo + 前に (há... / ... atrás)

Escrita: 前に / まえに""",
no="""Usar o verbo no passado antes de 前に é um erro comum. Mesmo falando do passado, o verbo continua na forma de dicionário.

A palavra 前 também significa "frente". Quando se fala de um lugar, como a frente da estação, の前に indica posição, e não tempo. O contexto mostra qual sentido é usado.

O oposto de 前に é 後で (depois de), que usa o verbo na forma た.""",
bf="前に",
rx="前に|まえに",
tk=["前", "に"],
va=["前に", "まえに"],
E=[
("寝る前に歯を磨きます。", "ねるまえにはをみがきます。", "Escovo os dentes antes de dormir."),
("食事の前に手を洗いましょう。", "しょくじのまえにてをあらいましょう。", "Vamos lavar as mãos antes da refeição."),
("日本に来る前に、少し日本語を勉強しました。", "にほんにくるまえに、すこしにほんごをべんきょうしました。", "Antes de vir para o Japão, estudei um pouco de japonês."),
("三年前に結婚しました。", "さんねんまえにけっこんしました。", "Casei há três anos."),
("出かける前に、天気予報を見たほうがいいですよ。", "でかけるまえに、てんきよほうをみたほうがいいですよ。", "Antes de sair, é melhor ver a previsão do tempo."),
],
R=[
("ご飯を食べる____、手を洗います。", "Lavo as mãos antes de comer.", ["前に", "まえに"]),
("授業の____宿題を出してください。", "Entregue a lição antes da aula, por favor.", ["前に", "まえに"]),
("二年____日本に来ました。", "Vim para o Japão há dois anos.", ["前に", "まえに"]),
("電車に乗る____、切符を買います。", "Compro a passagem antes de pegar o trem.", ["前に", "まえに"]),
("試験の____、もう一度復習しました。", "Antes da prova, revisei mais uma vez.", ["前に", "まえに"]),
],
),
]
