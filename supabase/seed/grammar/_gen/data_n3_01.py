G = [
dict(
n=1,
jp="〜上げる",
rd="ageru",
tr="Terminar de (por completo) / Concluir / Finalizar",
ex="""上げる, ligado a outro verbo, indica que uma ação foi concluída por completo, com cuidado ou esforço, até chegar a um resultado final. Equivale a "terminar de" ou "concluir".

A estrutura junta o verbo na forma ます sem ます com 上げる. O resultado funciona como um verbo do grupo 2.

A ideia é de algo que foi construído ou produzido até ficar pronto: escrever um relatório inteiro, terminar de tricotar um suéter, construir uma equipe. Por isso, aparece muito com verbos de criação, como 書く, 作る, 編む e 仕上げる.

Comparado a 終わる, que só indica que a ação terminou, 上げる destaca o esforço e a qualidade do resultado final.""",
st="""Verbo na forma ます sem ます + 上げる

Passado: 上げた / 上げました
Forma て: 上げて

Combinações comuns: 書き上げる / 作り上げる / 仕上げる / 編み上げる / 育て上げる""",
no="""Alguns verbos com 上げる têm outros sentidos, por causa da ideia original de "levantar". 読み上げる significa "ler em voz alta", e 持ち上げる significa "levantar algo".

仕上げる já é uma palavra própria e significa "dar o acabamento final".

Em contextos de trabalho, 書き上げる e 仕上げる são muito usados para falar da conclusão de documentos e projetos.""",
bf="上げる",
rx="上げ",
tk=["上げる"],
va=["上げる", "上げた", "上げました", "上げて"],
E=[
("徹夜して、やっとレポートを書き上げた。", "てつやして、やっとレポートをかきあげた。", "Virei a noite e finalmente terminei de escrever o relatório."),
("三日でこの絵を仕上げました。", "みっかでこのえをしあげました。", "Finalizei este quadro em três dias."),
("彼女は一人でこのセーターを編み上げた。", "かのじょはひとりでこのセーターをあみあげた。", "Ela tricotou este suéter inteiro sozinha."),
("一年かけて、この家を作り上げました。", "いちねんかけて、このいえをつくりあげました。", "Levamos um ano para construir esta casa por completo."),
("みんなで力を合わせて、いいチームを作り上げた。", "みんなでちからをあわせて、いいチームをつくりあげた。", "Todos juntaram forças e construíram uma ótima equipe."),
],
R=[
("徹夜して、卒業論文を書き____。", "Virei a noite e terminei de escrever o TCC.", ["上げた", "上げました"]),
("料理人は三時間かけてスープを作り____。", "O cozinheiro levou três horas para preparar a sopa por completo.", ["上げた", "上げました"]),
("祖母は一週間でマフラーを編み____。", "Minha avó terminou de tricotar o cachecol em uma semana.", ["上げた", "上げました"]),
("締め切りまでに作品を仕____ください。", "Finalize a obra até o prazo, por favor.", ["上げて"]),
("父は長い時間をかけて、この会社を築き____。", "Meu pai levou muito tempo para construir esta empresa.", ["上げた", "上げました"]),
],
),
dict(
n=2,
jp="〜あまり",
rd="amari",
tr="Tanto que / De tanto / Por excesso de",
ex="""No N3, あまり aparece com o sentido de "por excesso de", indicando que um sentimento ou estado foi tão forte que causou um resultado, geralmente inesperado ou negativo. Equivale a "tanto que", "de tanto" ou "por excesso de".

Ele vem depois de substantivos com の (como 心配のあまり, "de tanta preocupação") e depois de verbos na forma simples (como 緊張したあまり).

Também existe a forma あまりの + Substantivo + に, que significa "com tanto... que". Por exemplo, "com tanto calor, passei mal".

Os substantivos usados costumam ser sentimentos ou estados, como alegria, preocupação, tristeza, surpresa, nervosismo e cansaço.

O resultado, na segunda parte, é algo que a pessoa não conseguiu controlar, como chorar, não conseguir dormir ou não conseguir falar.""",
st="""Substantivo + の + あまり、 + Resultado
Verbo (forma simples) + あまり、 + Resultado
あまりの + Substantivo + に、 + Resultado""",
no="""Esse uso é bem diferente de あまり〜ない (não muito), aprendido no N4. Aqui, あまり indica excesso.

A segunda parte não costuma ser uma ação planejada, mas uma reação involuntária.

Muitos substantivos usados aqui terminam em さ, como 嬉しさ, 悲しさ e 暑さ.""",
bf="あまり",
rx="あまり",
tk=["あまり"],
va=["あまり", "のあまり", "あまりの"],
E=[
("合格の知らせを聞いて、嬉しさのあまり、泣いてしまった。", "ごうかくのしらせをきいて、うれしさのあまり、ないてしまった。", "Ao saber da aprovação, chorei de tanta alegria."),
("母は心配のあまり、夜も眠れなかった。", "はははしんぱいのあまり、よるもねむれなかった。", "De tanta preocupação, minha mãe não conseguiu dormir à noite."),
("面接で緊張したあまり、何も話せなかった。", "めんせつできんちょうしたあまり、なにもはなせなかった。", "Fiquei tão nervoso na entrevista que não consegui falar nada."),
("あまりの暑さに、気分が悪くなった。", "あまりのあつさに、きぶんがわるくなった。", "Com tanto calor, passei mal."),
("彼は仕事に熱中するあまり、食事を忘れてしまった。", "かれはしごとにねっちゅうするあまり、しょくじをわすれてしまった。", "Ele estava tão concentrado no trabalho que se esqueceu de comer."),
],
R=[
("驚きの____、声が出なかった。", "De tanto susto, não consegui falar.", ["あまり"]),
("疲れの____、電車で寝てしまった。", "De tanto cansaço, acabei dormindo no trem.", ["あまり"]),
("____の痛さに、思わず叫んだ。", "Com tanta dor, gritei sem querer.", ["あまり"]),
("合格を喜ぶ____、彼は飛び上がった。", "De tanta alegria pela aprovação, ele pulou.", ["あまり"]),
("恥ずかしさの____、顔が真っ赤になった。", "De tanta vergonha, fiquei com o rosto vermelho.", ["あまり"]),
],
),
dict(
n=3,
jp="あまりにも",
rd="amari ni mo",
tr="Demais / Excessivamente / Tão... que",
ex="""あまりにも é um advérbio que indica que algo está além do normal, em um grau excessivo. Equivale a "demais", "excessivamente" ou "tão... que".

Ele vem antes de adjetivos e de outras expressões de grau, intensificando-as muito. Muitas vezes, a frase continua mostrando a consequência desse excesso, como não conseguir comprar algo caro demais.

O tom costuma ser de surpresa, crítica ou espanto, mas também pode expressar admiração, como uma paisagem tão bonita que deixa a pessoa sem palavras.

A forma あまりに, sem も, tem o mesmo sentido e é um pouco menos enfática.""",
st="""あまりにも + Adjetivo
あまりにも + Adjetivo + て、 + Consequência
あまりにも + Substantivo / Adjetivo な + だ

Variação: あまりに""",
no="""あまりにも é mais forte que とても. とても é neutro ("muito"); あまりにも indica que passou do ponto.

Também pode aparecer com verbos que indicam grau, como あまりにも違う (é diferente demais).

Na fala, あまりにも pode soar dramático, por isso aparece muito em reclamações e reações de surpresa.""",
bf="あまりにも",
rx="あまりにも|あまりに",
tk=["あまりにも"],
va=["あまりにも", "あまりに"],
E=[
("この問題はあまりにも難しい。", "このもんだいはあまりにもむずかしい。", "Esta questão é difícil demais."),
("値段があまりにも高くて、買えなかった。", "ねだんがあまりにもたかくて、かえなかった。", "O preço era alto demais, e não consegui comprar."),
("あまりにも疲れていて、すぐ寝てしまった。", "あまりにもつかれていて、すぐねてしまった。", "Estava tão cansado que dormi na hora."),
("彼の話はあまりにもおかしくて、みんな笑った。", "かれのはなしはあまりにもおかしくて、みんなわらった。", "A história dele era tão engraçada que todos riram."),
("その知らせはあまりにも突然だった。", "そのしらせはあまりにもとつぜんだった。", "Essa notícia foi repentina demais."),
],
R=[
("今日は____暑くて、外に出たくない。", "Hoje está quente demais, não quero sair.", ["あまりにも", "あまりに"]),
("宿題が____多くて、終わらない。", "A lição é tanta que não termina.", ["あまりにも", "あまりに"]),
("山の上の景色が____きれいで、言葉が出なかった。", "A paisagem no alto da montanha era tão bonita que fiquei sem palavras.", ["あまりにも", "あまりに"]),
("客に対する彼の態度は____失礼だ。", "A atitude dele com os clientes é mal-educada demais.", ["あまりにも", "あまりに"]),
("その映画が____悲しくて、泣いてしまった。", "Esse filme era tão triste que acabei chorando.", ["あまりにも", "あまりに"]),
],
),
dict(
n=4,
jp="〜合う",
rd="au",
tr="Um ao outro / Mutuamente / Juntos",
ex="""合う, ligado a outro verbo, indica que duas ou mais pessoas fazem a mesma ação uma com a outra, de forma recíproca. Equivale a "um ao outro", "mutuamente" ou "entre si".

A estrutura junta o verbo na forma ます sem ます com 合う. O resultado funciona como um verbo do grupo 1.

Por exemplo, ajudar-se mutuamente, conversar entre si, trocar opiniões, abraçar-se.

É muito comum com verbos de comunicação e cooperação, como 話す, 助ける, 教える, 協力する e 出す (no sentido de apresentar ideias).

Para reforçar a ideia de reciprocidade, também se usa お互いに (um ao outro) antes do verbo.""",
st="""Verbo na forma ます sem ます + 合う

Educado: 合います
Passado: 合った / 合いました
Forma て: 合って

Combinações comuns: 話し合う / 助け合う / 教え合う / 出し合う / 愛し合う""",
no="""話し合う significa "discutir" ou "conversar para chegar a um acordo", e virou uma palavra muito usada sozinha.

Sozinho, 合う significa "combinar", "servir" ou "estar certo", como em サイズが合う (o tamanho serve).

A ideia de cooperação de 合う reflete um valor importante na cultura japonesa: resolver as coisas em grupo.""",
bf="合う",
rx="合い|合う|合っ|合わ",
tk=["合う"],
va=["合う", "合います", "合った", "合いました", "合って"],
E=[
("あの二人は助け合って生活している。", "あのふたりはたすけあってせいかつしている。", "Aqueles dois vivem se ajudando."),
("会議で、みんなで意見を出し合いました。", "かいぎで、みんなでいけんをだしあいました。", "Na reunião, todos trocaram opiniões."),
("私たちは毎日メールで連絡し合っている。", "わたしたちはまいにちメールでれんらくしあっている。", "Nós nos falamos por e-mail todos os dias."),
("困ったときは、話し合うことが大切だ。", "こまったときは、はなしあうことがたいせつだ。", "Quando há problemas, é importante conversar."),
("久しぶりに会った二人は、抱き合って喜んだ。", "ひさしぶりにあったふたりは、だきあってよろこんだ。", "Os dois, que não se viam havia muito tempo, se abraçaram de alegria."),
],
R=[
("旅行の計画について、家族で話し____。", "Conversamos em família sobre o plano da viagem.", ["合いました", "合った"]),
("兄弟は助け____ことが大切です。", "É importante que irmãos se ajudem.", ["合う"]),
("二人はお互いに愛し____いる。", "Os dois se amam.", ["合って"]),
("試合の後、両チームの選手たちは握手し____。", "Depois da partida, os jogadores das duas equipes apertaram as mãos.", ["合った", "合いました"]),
("みんなで協力し____、仕事を終わらせた。", "Todos cooperaram entre si e terminaram o trabalho.", ["合って"]),
],
),
dict(
n=5,
jp="〜ばいい",
rd="ba ii",
tr="Basta / É só / O que devo...?",
ex="""ばいい é usado para dar conselhos, sugerir soluções ou pedir orientação. Equivale a "basta", "é só" ou, em perguntas, "o que devo...?".

Ele junta a forma condicional ば com いい. A ideia literal é "se fizer isso, está bom".

Em afirmações, ばいい sugere uma solução simples: "se não entender, é só perguntar ao professor".

Em perguntas, com palavras como どう, 何 e どこ, ele pede orientação: "o que devo fazer?". Por exemplo, どうすればいいですか é uma das perguntas mais úteis em japonês.

Com なあ ou のに no final, ばいい expressa um desejo: "seria bom se...", "tomara que...".""",
st="""Verbo na forma condicional ば + いい
Palavra interrogativa + … + Verbo ば + いいですか (pedido de orientação)
Verbo ば + いいか + わからない
Verbo ば + いいなあ / いいのに (desejo)""",
no="""ばいい e たらいい têm sentidos muito parecidos e muitas vezes podem ser trocados. ばいい soa um pouco mais neutro e geral.

Em conselhos, ばいい pode soar um pouco frio se dito a superiores, como se a solução fosse óbvia. Com eles, ほうがいいと思います é mais suave.

ばいいのに também aparece para criticar levemente alguém que não faz algo óbvio.""",
bf="ばいい",
rx="ばいい",
tk=["ば", "いい"],
va=["ばいい", "ばいいです", "ばいいですか", "ばいいのに"],
E=[
("わからなければ、先生に聞けばいい。", "わからなければ、せんせいにきけばいい。", "Se não entender, é só perguntar ao professor."),
("すみません、どうすればいいですか。", "すみません、どうすればいいですか。", "Com licença, o que devo fazer?"),
("駅までは、このバスに乗ればいいですよ。", "えきまでは、このバスにのればいいですよ。", "Para ir até a estação, basta pegar este ônibus."),
("明日、晴れればいいなあ。", "あした、はれればいいなあ。", "Tomara que faça sol amanhã."),
("旅行に何を持っていけばいいかわからない。", "りょこうになにをもっていけばいいかわからない。", "Não sei o que devo levar na viagem."),
],
R=[
("疲れたなら、少し休め____。", "Se está cansado, é só descansar um pouco.", ["ばいい", "ばいいです"]),
("この書類はどこに出せ____ですか。", "Onde devo entregar este documento?", ["ばいい"]),
("誰に相談すれ____かわからない。", "Não sei com quem devo conversar.", ["ばいい"]),
("彼女が早く元気になれ____なあ。", "Tomara que ela melhore logo.", ["ばいい"]),
("時間がないなら、タクシーで行け____。", "Se não tem tempo, é só ir de táxi.", ["ばいい", "ばいいです"]),
],
),
dict(
n=6,
jp="〜ばよかった",
rd="ba yokatta",
tr="Devia ter / Teria sido bom / Quem dera",
ex="""ばよかった é usado para expressar arrependimento por algo que a pessoa fez ou deixou de fazer no passado. Equivale a "devia ter feito" ou "teria sido bom se...".

Ele junta a forma condicional ば com よかった, o passado de いい. A ideia literal é "se eu tivesse feito isso, teria sido bom".

Com o verbo afirmativo, indica arrependimento por não ter feito algo: "devia ter estudado mais". Com o verbo negativo (なければよかった), indica arrependimento por ter feito algo: "não devia ter dito aquilo".

Com のに no final, ばよかったのに expressa pena ou leve crítica sobre a ação de outra pessoa, como "você devia ter vindo, foi divertido".""",
st="""Verbo na forma condicional ば + よかった (devia ter feito)
Verbo na forma ない → なければよかった (não devia ter feito)
Verbo ば + よかったのに (pena / crítica a outra pessoa)

Educado: ばよかったです""",
no="""たらよかった tem o mesmo sentido e também é muito usado na conversa.

O oposto, para expressar alívio, é てよかった (que bom que fiz).

ばよかった aparece muito em reflexões e conversas sobre erros, e é uma forma natural de mostrar arrependimento.""",
bf="ばよかった",
rx="ばよかった",
tk=["ば", "よかった"],
va=["ばよかった", "ばよかったです", "ばよかったのに", "なければよかった"],
E=[
("試験に落ちた。もっと勉強すればよかった。", "しけんにおちた。もっとべんきょうすればよかった。", "Fui reprovado. Devia ter estudado mais."),
("雨が降ってきた。傘を持ってくればよかった。", "あめがふってきた。かさをもってくればよかった。", "Começou a chover. Devia ter trazido o guarda-chuva."),
("あんなこと言わなければよかった。", "あんなこといわなければよかった。", "Não devia ter dito aquilo."),
("もっと早く家を出ればよかったです。", "もっとはやくいえをでればよかったです。", "Devia ter saído de casa mais cedo."),
("君も来ればよかったのに。楽しかったよ。", "きみもくればよかったのに。たのしかったよ。", "Você devia ter vindo. Foi divertido."),
],
R=[
("寝坊した。目覚ましをかけれ____。", "Dormi demais. Devia ter colocado o despertador.", ["ばよかった"]),
("この服は高すぎた。買わなけれ____。", "Esta roupa foi cara demais. Não devia ter comprado.", ["ばよかった"]),
("風邪がひどくなった。もっと早く病院に行け____。", "O resfriado piorou. Devia ter ido ao hospital mais cedo.", ["ばよかった"]),
("わからないところを、先生に聞いておけ____。", "Devia ter perguntado ao professor as partes que não entendi.", ["ばよかった"]),
("君も来れ____のに。", "Você devia ter vindo.", ["ばよかった"]),
],
),
dict(
n=7,
jp="〜ば〜ほど",
rd="ba ~ hodo",
tr="Quanto mais... mais...",
ex="""ば〜ほど é usado para dizer que, quanto mais algo acontece ou aumenta, mais outra coisa muda também. Equivale a "quanto mais..., mais...".

A estrutura repete a mesma palavra duas vezes: primeiro na forma condicional ば, depois na forma de dicionário seguida de ほど. Por exemplo, "quanto mais pratica, melhor fica".

Funciona com verbos e com adjetivos. Com adjetivos い, usa-se ければ e depois o adjetivo normal: 広ければ広いほど. Com adjetivos な, usa-se なら ou であれば: 静かなら静かなほど.

A segunda parte mostra a mudança proporcional, que pode ser positiva ou negativa.""",
st="""Verbo ば + Verbo (dicionário) + ほど
Adjetivo い sem い + ければ + Adjetivo い + ほど
Adjetivo な + なら + Adjetivo な + な + ほど

Forma curta: Verbo / Adjetivo + ほど (sem a parte com ば)""",
no="""Às vezes, a primeira parte com ば é omitida, ficando só a forma com ほど: 練習するほど上手になる. O sentido é o mesmo.

A expressão 早ければ早いほどいい ("quanto mais cedo, melhor") é muito usada.

ほど sozinho também indica grau ou extensão, como em "a ponto de", que aparece em outras gramáticas do N3.""",
bf="ほど",
rx="ほど",
tk=["ば", "ほど"],
va=["ば〜ほど", "ほど"],
E=[
("練習すればするほど、上手になります。", "れんしゅうすればするほど、じょうずになります。", "Quanto mais você pratica, melhor fica."),
("考えれば考えるほど、わからなくなる。", "かんがえればかんがえるほど、わからなくなる。", "Quanto mais penso, menos entendo."),
("部屋は広ければ広いほどいい。", "へやはひろければひろいほどいい。", "Quanto maior o quarto, melhor."),
("日本語は勉強すればするほどおもしろい。", "にほんごはべんきょうすればするほどおもしろい。", "Quanto mais estudo japonês, mais interessante fica."),
("野菜は新しければ新しいほどおいしい。", "やさいはあたらしければあたらしいほどおいしい。", "Quanto mais fresca a verdura, mais gostosa."),
],
R=[
("甘い物は、食べれば食べる____、太ります。", "Quanto mais doce você come, mais engorda.", ["ほど"]),
("アパートは駅に近ければ近い____、家賃が高い。", "Quanto mais perto da estação, mais caro é o aluguel.", ["ほど"]),
("話せば話す____、彼のことが好きになった。", "Quanto mais conversávamos, mais eu gostava dele.", ["ほど"]),
("返事は早ければ早い____いいです。", "Quanto mais cedo a resposta, melhor.", ["ほど"]),
("練習すればする____、自信がつく。", "Quanto mais você treina, mais confiança ganha.", ["ほど"]),
],
),
dict(
n=8,
jp="〜ば〜のに",
rd="ba ~ noni",
tr="Se... (mas não é assim) / Seria bom se... / Quem dera",
ex="""ば〜のに é usado para expressar uma situação hipotética que é contrária à realidade, acompanhada de lamento, pena ou frustração. Equivale a "se..., (mas não é assim)" ou "quem dera...".

A primeira parte, com ば, apresenta uma condição que não existe na realidade. A segunda parte, terminada em のに, mostra o resultado que aconteceria, e o tom de "que pena que não é assim".

Por exemplo, "se eu tivesse tempo, poderia ir" (mas não tenho tempo).

No passado, a frase mostra arrependimento sobre algo que poderia ter acontecido: "se não tivesse chovido, teríamos ido à praia".

Com いい, a forma ばいいのに expressa um desejo ou uma leve crítica: "seria bom se ele viesse também".""",
st="""Verbo / Adjetivo ば + … + のに (contrário à realidade)
Verbo ば + … + Verbo た + のに (passado: teria...)
Verbo ば + いいのに (seria bom se...)""",
no="""A palavra のに no final da frase dá todo o tom emocional de lamento. Sem ela, a frase fica neutra.

たら também pode ser usado no lugar de ば: 時間があったら、行けるのに.

Essa estrutura é muito comum em conversas, para expressar frustrações do dia a dia.""",
bf="のに",
rx="のに",
tk=["ば", "のに"],
va=["ば〜のに", "ばいいのに", "ばよかったのに"],
E=[
("時間があれば、一緒に行けるのに。", "じかんがあれば、いっしょにいけるのに。", "Se eu tivesse tempo, poderia ir junto. (Mas não tenho.)"),
("もう少し安ければ、買うのに。", "もうすこしやすければ、かうのに。", "Se fosse um pouco mais barato, eu compraria."),
("雨が降らなければ、海に行けたのに。", "あめがふらなければ、うみにいけたのに。", "Se não tivesse chovido, teríamos ido à praia."),
("もっと早く言ってくれれば、手伝ったのに。", "もっとはやくいってくれれば、てつだったのに。", "Se você tivesse me dito antes, eu teria ajudado."),
("彼もパーティーに来ればいいのに。", "かれもパーティーにくればいいのに。", "Seria bom se ele também viesse à festa."),
],
R=[
("お金があれば、旅行に行ける____。", "Se eu tivesse dinheiro, poderia viajar.", ["のに"]),
("天気がよければ、ここから富士山が見えた____。", "Se o tempo estivesse bom, daria para ver o Monte Fuji daqui.", ["のに"]),
("言ってくれれば、駅まで迎えに行った____。", "Se você tivesse me avisado, eu teria ido te buscar na estação.", ["のに"]),
("日本語が話せれば、旅行がもっと楽しい____。", "Se eu falasse japonês, a viagem seria mais divertida.", ["のに"]),
("そんなに眠いなら、早く寝ればいい____。", "Se está com tanto sono, devia ir dormir cedo.", ["のに"]),
],
),
dict(
n=9,
jp="〜ばかりで",
rd="bakari de",
tr="Só... e não / Apenas... sem",
ex="""ばかりで é usado para criticar uma situação em que só acontece uma coisa, e o que deveria acontecer não acontece. Equivale a "só... e não..." ou "apenas..., sem...".

ばかり indica que algo se repete demais ("só isso"), e で liga essa situação à consequência negativa que vem depois.

Por exemplo, "ele só fala e não faz nada" ou "só chove e não dá para lavar roupa".

O tom é de reclamação, insatisfação ou crítica. A segunda parte geralmente é negativa, mostrando o problema causado pelo excesso.

Ele vem depois de substantivos, de verbos na forma de dicionário e de verbos na forma て (てばかりで).""",
st="""Substantivo + ばかりで + Frase negativa
Verbo na forma de dicionário + ばかりで + Frase negativa
Verbo na forma て + ばかりで + Frase negativa""",
no="""A expressão 口ばかりで significa "só da boca para fora", ou seja, a pessoa fala muito e não age.

Em textos, também aparece a forma ばかりで、〜ない, enfatizando o que não acontece.

Para uma descrição neutra, sem crítica, prefira だけで.""",
bf="ばかりで",
rx="ばかりで",
tk=["ばかり", "で"],
va=["ばかりで"],
E=[
("彼は口ばかりで、何もしない。", "かれはくちばかりで、なにもしない。", "Ele só fala e não faz nada."),
("毎日雨ばかりで、洗濯ができない。", "まいにちあめばかりで、せんたくができない。", "Só chove todo dia, e não dá para lavar roupa."),
("弟は遊んでばかりで、全然勉強しない。", "おとうとはあそんでばかりで、ぜんぜんべんきょうしない。", "Meu irmão mais novo só brinca e não estuda nada."),
("彼女は文句を言うばかりで、手伝おうとしない。", "かのじょはもんくをいうばかりで、てつだおうとしない。", "Ela só reclama e não tenta ajudar."),
("このクラスは男の子ばかりで、女の子がいない。", "このクラスはおとこのこばかりで、おんなのこがいない。", "Esta turma só tem meninos, não tem nenhuma menina."),
],
R=[
("彼は寝て____、仕事をしない。", "Ele só dorme e não trabalha.", ["ばかりで"]),
("最近は失敗____、自信がなくなった。", "Ultimamente só tenho errado e perdi a confiança.", ["ばかりで"]),
("この店は高い物____、買えるものがない。", "Esta loja só tem coisa cara, não tem nada que eu possa comprar.", ["ばかりで"]),
("子供は泣く____、何も話してくれない。", "A criança só chora e não me conta nada.", ["ばかりで"]),
("毎日同じ料理____、もう飽きた。", "Todo dia é só a mesma comida, já enjoei.", ["ばかりで"]),
],
),
dict(
n=10,
jp="〜ばかりでなく",
rd="bakari de naku",
tr="Não só... mas também / Além de",
ex="""ばかりでなく é usado para dizer que algo não se limita a um elemento, mas inclui outro também. Equivale a "não só... mas também" ou "além de".

A primeira parte apresenta o elemento mais óbvio ou esperado, e a segunda acrescenta outro, muitas vezes com も.

Por exemplo, "ele fala não só inglês, mas também chinês" ou "esta loja não só é barata, como também é gostosa".

É mais formal que だけでなく, que tem o mesmo sentido. Por isso, aparece muito em textos escritos, discursos e explicações.

Ele vem depois de substantivos, verbos e adjetivos na forma simples. Com adjetivos な, usa-se な antes.""",
st="""Substantivo + ばかりでなく、 + … + も
Verbo / Adjetivo い (forma simples) + ばかりでなく
Adjetivo な + な + ばかりでなく

Variação: ばかりではなく""",
no="""だけでなく é mais comum na conversa. ばかりでなく soa um pouco mais formal.

No nível N2, aparece ばかりか, com sentido parecido, mas mais enfático e às vezes com surpresa.

A segunda parte costuma ter も, reforçando a ideia de "também".""",
bf="ばかりでなく",
rx="ばかりでなく|ばかりではなく",
tk=["ばかり", "で", "なく"],
va=["ばかりでなく", "ばかりではなく"],
E=[
("彼は英語ばかりでなく、中国語も話せる。", "かれはえいごばかりでなく、ちゅうごくごもはなせる。", "Ele fala não só inglês, mas também chinês."),
("この店は安いばかりでなく、おいしい。", "このみせはやすいばかりでなく、おいしい。", "Esta loja não só é barata, como também é gostosa."),
("子供ばかりでなく、大人も楽しめる映画だ。", "こどもばかりでなく、おとなもたのしめるえいがだ。", "É um filme que não só as crianças, mas também os adultos podem aproveitar."),
("雨ばかりでなく、風も強くなってきた。", "あめばかりでなく、かぜもつよくなってきた。", "Não só a chuva, mas também o vento ficou mais forte."),
("彼女は歌が上手なばかりでなく、ダンスも上手だ。", "かのじょはうたがじょうずなばかりでなく、ダンスもじょうずだ。", "Ela não só canta bem, como também dança bem."),
],
R=[
("このアニメは日本____、外国でも人気がある。", "Este anime é popular não só no Japão, mas também no exterior.", ["ばかりでなく", "ばかりではなく"]),
("この薬は頭痛____、熱にも効く。", "Este remédio funciona não só para dor de cabeça, mas também para febre.", ["ばかりでなく", "ばかりではなく"]),
("彼は勉強ができる____、スポーツも得意だ。", "Ele não só vai bem nos estudos, como também é bom em esportes.", ["ばかりでなく", "ばかりではなく"]),
("野菜____、果物も食べましょう。", "Vamos comer não só verduras, mas também frutas.", ["ばかりでなく", "ばかりではなく"]),
("父は平日____、週末も働いている。", "Meu pai trabalha não só nos dias úteis, mas também nos fins de semana.", ["ばかりでなく", "ばかりではなく"]),
],
),
]
