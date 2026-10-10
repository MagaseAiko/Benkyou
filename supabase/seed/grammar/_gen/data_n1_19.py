G = [
dict(
n=181,
jp="〜たら〜たで",
rd="tara ~ ta de",
tr="Se... também tem seus problemas / Se acontecer... aí / Tanto faz se",
ex="""たら〜たで indica que, mesmo que algo aconteça como se queria, ou de outra forma, surgem novos problemas ou situações. Equivale a "se..., também tem seus problemas" ou "se acontecer..., aí...".

Muitas vezes a pessoa mostra que nenhuma situação é perfeita. Por exemplo, "quando não tem dinheiro é ruim, mas quando tem, também dá trabalho".

Também pode mostrar aceitação, como "se der errado, aí a gente pensa".""",
st="""Verbo (forma たら) + Mesmo verbo (forma た) + で
Adjetivo い (forma かったら) + Mesmo adjetivo (forma かった) + で
Adjetivo な / Substantivo + だったら + だったで""",
no="""Muitas vezes vem junto com ば〜で, que tem um sentido parecido.

A segunda parte costuma mostrar um novo problema ou uma ideia de "tanto faz".""",
bf="たら〜たで",
rx="たで|だで|ったで",
tk=["たら", "た", "で"],
va=["たら〜たで", "だったら〜だったで"],
E=[
("お金がないと困るが、あったらあったで心配が増える。", "おかねがないとこまるが、あったらあったでしんぱいがふえる。", "Sem dinheiro é ruim, mas quando se tem, também aumentam as preocupações."),
("子供が小さいと大変だが、大きくなったらなったで別の悩みがある。", "こどもがちいさいとたいへんだが、おおきくなったらなったでべつのなやみがある。", "Com filhos pequenos é difícil, mas quando crescem, surgem outras preocupações."),
("失敗したら失敗したで、また考えればいい。", "しっぱいしたらしっぱいしたで、またかんがえればいい。", "Se der errado, aí a gente pensa de novo."),
("暇だったら暇だったで、退屈だ。", "ひまだったらひまだったで、たいくつだ。", "Quando estou desocupado, também fico entediado."),
("雨が降ったら降ったで、家で映画を見よう。", "あめがふったらふったで、いえでえいがをみよう。", "Se chover, tudo bem, vamos ver um filme em casa."),
],
R=[
("仕事がないと困るが、忙しかったら忙しかった____、大変だ。", "Sem trabalho é ruim, mas quando estou ocupado também é difícil.", ["で"]),
("一人暮らしは寂しいが、家族と住んだら住んだ____、うるさい。", "Morar sozinho é solitário, mas morar com a família também é barulhento.", ["で"]),
("遅れたら遅れた____、仕方がない。", "Se atrasar, aí não tem jeito.", ["で"]),
("合格したらした____、また新しい悩みが出てくる。", "Se passar, também vão surgir novas preocupações.", ["で"]),
("車があったらあった____、維持費がかかる。", "Ter carro também tem seus problemas, gasta-se com manutenção.", ["で"]),
],
),
dict(
n=182,
jp="〜たら〜ところだ",
rd="tara ~ tokoro da",
tr="Se tivesse... teria / Se fosse... seria / Caso contrário teria",
ex="""たら〜ところだ indica uma situação hipotética, contrária à realidade. Equivale a "se tivesse..., teria...".

A pessoa imagina o que teria acontecido se algo fosse diferente. Muitas vezes há alívio ou arrependimento. Por exemplo, "se não tivesse levado guarda-chuva, teria me molhado todo".

As formas ば〜ところだ e なら〜ところだ têm o mesmo sentido.""",
st="""Verbo (forma たら / ば) + 〜 + Verbo (forma dicionário) + ところだ / ところだった""",
no="""É muito comum na forma ところだった, no passado.

Também aparece como ところです, mais educado.""",
bf="たら〜ところだ",
rx="ところだ|ところです",
tk=["たら", "ところ", "だ"],
va=["たら〜ところだ", "たら〜ところだった", "ば〜ところだ"],
E=[
("傘を持っていなかったら、ずぶぬれになるところだった。", "かさをもっていなかったら、ずぶぬれになるところだった。", "Se eu não tivesse levado guarda-chuva, teria ficado encharcado."),
("君が教えてくれなかったら、忘れるところだった。", "きみがおしえてくれなかったら、わすれるところだった。", "Se você não tivesse me avisado, eu teria esquecido."),
("もう少し安かったら、買うところだ。", "もうすこしやすかったら、かうところだ。", "Se fosse um pouco mais barato, eu compraria."),
("時間があれば、手伝うところですが、今日は無理です。", "じかんがあれば、てつだうところですが、きょうはむりです。", "Se eu tivesse tempo, ajudaria, mas hoje não dá."),
("いつもなら怒るところだが、今日は許してあげる。", "いつもならおこるところだが、きょうはゆるしてあげる。", "Normalmente eu ficaria bravo, mas hoje vou perdoar."),
],
R=[
("ブレーキが遅れていたら、事故になる____。", "Se tivesse freado mais tarde, teria havido um acidente.", ["ところだった"]),
("地図がなかったら、道に迷う____。", "Sem o mapa, eu teria me perdido.", ["ところだった"]),
("普通なら断る____が、あなたの頼みなら引き受けます。", "Normalmente eu recusaria, mas sendo um pedido seu, aceito.", ["ところだ", "ところです"]),
("目覚ましが鳴らなかったら、遅刻する____。", "Se o despertador não tivesse tocado, eu teria me atrasado.", ["ところだった"]),
("お金があれば、行く____けど、今月は厳しい。", "Se eu tivesse dinheiro, iria, mas este mês está apertado.", ["ところだ", "ところです"]),
],
),
dict(
n=183,
jp="〜たりとも",
rd="tari tomo",
tr="Nem um único / Nem mesmo um / Nem sequer",
ex="""たりとも indica que nem a menor quantidade é permitida ou aceita. Equivale a "nem um único" ou "nem mesmo um".

Vem depois de expressões com "um", como um dia, uma pessoa, um iene ou um minuto, e a frase é negativa. Por exemplo, "não se pode perder nem um minuto".

É uma expressão formal e enfática.""",
st="""一 + Contador + たりとも + Frase negativa""",
no="""Expressões comuns são 一日たりとも, 一人たりとも, 一円たりとも e 一瞬たりとも.

É parecido com も, como em 一日も, mas たりとも é muito mais enfático.""",
bf="たりとも",
rx="たりとも",
tk=["たり", "とも"],
va=["たりとも"],
E=[
("一日たりとも練習を休んだことはない。", "いちにちたりともれんしゅうをやすんだことはない。", "Nunca faltei ao treino nem um único dia."),
("一円たりとも無駄にしてはいけない。", "いちえんたりともむだにしてはいけない。", "Não se deve desperdiçar nem um único iene."),
("一瞬たりとも油断できない。", "いっしゅんたりともゆだんできない。", "Não dá para se descuidar nem por um instante."),
("一人たりとも犠牲者を出してはならない。", "ひとりたりともぎせいしゃをだしてはならない。", "Não se pode deixar haver nem uma única vítima."),
("彼女のことは一時たりとも忘れたことがない。", "かのじょのことはいちじたりともわすれたことがない。", "Nunca a esqueci nem por um momento."),
],
R=[
("試験中は、一分____無駄にできない。", "Durante a prova, não dá para desperdiçar nem um minuto.", ["たりとも"]),
("この部屋には、一人____入ってはいけない。", "Ninguém pode entrar nesta sala, nem uma única pessoa.", ["たりとも"]),
("一秒____目を離すな。", "Não tire os olhos nem por um segundo.", ["たりとも"]),
("借りたお金は一円____返していない。", "Não devolvi nem um iene do dinheiro emprestado.", ["たりとも"]),
("一日____家族のことを忘れたことはない。", "Nunca esqueci da minha família nem um único dia.", ["たりとも"]),
],
),
dict(
n=184,
jp="〜たるもの / 〜たる",
rd="taru mono / taru",
tr="Quem é / Na condição de / Alguém que é",
ex="""たるもの e たる indicam uma posição ou papel importante e o comportamento esperado de quem ocupa esse lugar. Equivalem a "quem é..." ou "na condição de...".

A segunda parte costuma dizer como essa pessoa deve agir. Por exemplo, "quem é professor deve dar o exemplo aos alunos".

É uma expressão muito formal e antiquada, usada para falar de responsabilidades.""",
st="""Substantivo (posição) + たるもの + べきだ / なければならない
Substantivo (posição) + たる + Substantivo""",
no="""Expressões comuns são 教師たるもの, 親たるもの, 社会人たるもの e 王たる者.

É parecido com である以上, mas mais formal.""",
bf="たるもの",
rx="たるもの|たる者|たる",
tk=["たる", "もの"],
va=["たるもの", "たる者", "たる"],
E=[
("教師たるもの、生徒の手本にならなければならない。", "きょうしたるもの、せいとのてほんにならなければならない。", "Quem é professor deve ser um exemplo para os alunos."),
("社会人たるもの、時間は守るべきだ。", "しゃかいじんたるもの、じかんはまもるべきだ。", "Quem é profissional deve ser pontual."),
("親たる者、子供の安全を第一に考えるべきだ。", "おやたるもの、こどものあんぜんをだいいちにかんがえるべきだ。", "Quem é pai deve pensar em primeiro lugar na segurança dos filhos."),
("医師たる者の責任は重い。", "いしたるもののせきにんはおもい。", "A responsabilidade de quem é médico é grande."),
("リーダーたる人物には、決断力が必要だ。", "リーダーたるじんぶつには、けつだんりょくがひつようだ。", "Uma pessoa na condição de líder precisa ter capacidade de decisão."),
],
R=[
("政治家____、国民のために働くべきだ。", "Quem é político deve trabalhar pelo povo.", ["たるもの", "たる者"]),
("学生____、勉強を第一にすべきだ。", "Quem é estudante deve colocar os estudos em primeiro lugar.", ["たるもの", "たる者"]),
("プロ____、言い訳をしてはいけない。", "Quem é profissional não deve dar desculpas.", ["たるもの", "たる者"]),
("警察官____者が、法律を破るとは。", "Que alguém na condição de policial quebre a lei...", ["たる"]),
("社長____、社員の生活を守らなければならない。", "Quem é presidente deve proteger a vida dos funcionários.", ["たるもの", "たる者"]),
],
),
dict(
n=185,
jp="〜て敵わない",
rd="te kanawanai",
tr="Insuportável / Não aguento / Demais",
ex="""て敵わない indica que uma situação é tão desagradável que a pessoa não consegue suportar. Equivale a "insuportável" ou "não aguento".

Costuma vir com adjetivos que expressam incômodo, como quente, barulhento, dolorido ou chato. Por exemplo, "o barulho dos vizinhos é insuportável".

É uma expressão coloquial, com tom de reclamação.""",
st="""Adjetivo い (sem い) + くて敵わない
Adjetivo な + で敵わない
Verbo (forma て) + 敵わない""",
no="""Também é escrito てかなわない, em hiragana.

É parecido com てたまらない, mas て敵わない é usado só com coisas desagradáveis.""",
bf="て敵わない",
rx="て敵わない|でかなわない|てかなわない|で敵わない|て敵いません",
tk=["て", "敵わない"],
va=["て敵わない", "てかなわない", "で敵わない"],
E=[
("隣の家がうるさくて敵わない。", "となりのいえがうるさくてかなわない。", "O barulho da casa vizinha é insuportável."),
("今年の夏は暑くてかなわない。", "ことしのなつはあつくてかなわない。", "O calor deste verão é insuportável."),
("毎日同じことを言われて敵わない。", "まいにちおなじことをいわれてかなわない。", "Não aguento ouvir a mesma coisa todo dia."),
("この仕事は面倒で敵わない。", "このしごとはめんどうでかなわない。", "Este trabalho é chato demais."),
("歯が痛くてかなわない。", "はがいたくてかなわない。", "Meu dente dói insuportavelmente."),
],
R=[
("蚊に刺されて、かゆく____。", "Fui picado por mosquito e a coceira é insuportável.", ["て敵わない", "てかなわない"]),
("部屋が狭く____。", "O quarto é apertado demais, não aguento.", ["て敵わない", "てかなわない"]),
("彼の自慢話が長く____。", "As histórias de vangloria dele são longas demais, não aguento.", ["て敵わない", "てかなわない"]),
("毎朝の満員電車が不快____。", "O trem lotado toda manhã é insuportável.", ["で敵わない", "でかなわない"]),
("母に毎日勉強しろと言われ____。", "Não aguento minha mãe mandando eu estudar todo dia.", ["て敵わない", "てかなわない"]),
],
),
dict(
n=186,
jp="〜てからというもの",
rd="te kara to iu mono",
tr="Desde que / Desde então / A partir do momento em que",
ex="""てからというもの indica que, a partir de um acontecimento, a situação mudou e continua diferente até agora. Equivale a "desde que" ou "a partir do momento em que".

A pessoa destaca uma mudança grande e duradoura. Por exemplo, "desde que meu filho nasceu, minha vida mudou completamente".

É uma expressão um pouco formal e emotiva.""",
st="""Verbo (forma て) + からというもの""",
no="""É parecido com て以来, mas てからというもの destaca mais a emoção e a mudança.

A segunda parte descreve um estado que continua, não uma ação única.""",
bf="てからというもの",
rx="てからというもの|でからというもの",
tk=["て", "から", "という", "もの"],
va=["てからというもの", "でからというもの"],
E=[
("子供が生まれてからというもの、生活が一変した。", "こどもがうまれてからというもの、せいかつがいっぺんした。", "Desde que meu filho nasceu, minha vida mudou completamente."),
("彼女に出会ってからというもの、毎日が楽しい。", "かのじょにであってからというもの、まいにちがたのしい。", "Desde que a conheci, todos os dias são divertidos."),
("日本に来てからというもの、和食ばかり食べている。", "にほんにきてからというもの、わしょくばかりたべている。", "Desde que vim ao Japão, só como comida japonesa."),
("犬を飼い始めてからというもの、毎朝散歩している。", "いぬをかいはじめてからというもの、まいあささんぽしている。", "Desde que comecei a ter um cachorro, caminho toda manhã."),
("父が亡くなってからというもの、母は元気がない。", "ちちがなくなってからというもの、はははげんきがない。", "Desde que meu pai faleceu, minha mãe anda desanimada."),
],
R=[
("たばこをやめ____、体の調子がいい。", "Desde que parei de fumar, me sinto bem.", ["てからというもの"]),
("スマホを買っ____、本を読まなくなった。", "Desde que comprei um smartphone, parei de ler livros.", ["てからというもの"]),
("あの事故があっ____、彼は車を運転しなくなった。", "Desde aquele acidente, ele parou de dirigir.", ["てからというもの"]),
("ヨガを始め____、よく眠れるようになった。", "Desde que comecei a fazer ioga, passei a dormir bem.", ["てからというもの"]),
("彼が転校し____、クラスが静かになった。", "Desde que ele mudou de escola, a turma ficou quieta.", ["てからというもの"]),
],
),
dict(
n=187,
jp="〜てみせる",
rd="te miseru",
tr="Vou conseguir / Vou provar / Mostrar como se faz",
ex="""てみせる tem dois usos principais.

O primeiro expressa uma determinação forte de fazer algo, muitas vezes para provar algo aos outros. Equivale a "vou conseguir" ou "vou provar". Por exemplo, "da próxima vez, vou ganhar com certeza".

O segundo indica mostrar a alguém como se faz algo, como uma demonstração. Equivale a "mostrar como se faz". Por exemplo, "o professor mostrou como se faz o exercício".""",
st="""Verbo (forma て) + みせる (determinação)
Verbo (forma て) + みせる (demonstração)""",
no="""No uso de determinação, costuma vir com 必ず, 絶対に ou きっと.

O sujeito do uso de determinação é a primeira pessoa.""",
bf="てみせる",
rx="てみせる|でみせる|てみせた|でみせた|てみせます|でみせます|てみせて",
tk=["て", "みせる"],
va=["てみせる", "てみせます", "てみせた"],
E=[
("次の試合では、必ず勝ってみせる。", "つぎのしあいでは、かならずかってみせる。", "Na próxima partida, vou ganhar com certeza."),
("いつか絶対に有名になってみせます。", "いつかぜったいにゆうめいになってみせます。", "Um dia vou ficar famoso, pode apostar."),
("先生は生徒たちに泳いでみせた。", "せんせいはせいとたちにおよいでみせた。", "O professor mostrou aos alunos como se nada."),
("今度こそ合格してみせる。", "こんどこそごうかくしてみせる。", "Desta vez vou passar, pode ter certeza."),
("母は料理の作り方をやってみせてくれた。", "はははりょうりのつくりかたをやってみせてくれた。", "Minha mãe me mostrou como se faz a comida."),
],
R=[
("馬鹿にされたけど、絶対に成功し____。", "Zombaram de mim, mas vou ter sucesso, pode apostar.", ["てみせる", "てみせます"]),
("この記録は、必ず破っ____。", "Vou quebrar este recorde, com certeza.", ["てみせる", "てみせます"]),
("コーチは正しいフォームを見せるために、自分で投げ____。", "Para mostrar a forma correta, o técnico arremessou ele mesmo.", ["てみせた"]),
("来年こそ、彼女を振り向かせ____。", "No ano que vem, vou fazer ela me notar, pode ter certeza.", ["てみせる", "てみせます"]),
("どんなに難しくても、やり遂げ____。", "Por mais difícil que seja, vou conseguir até o fim.", ["てみせる", "てみせます"]),
],
),
dict(
n=188,
jp="〜てしかるべきだ",
rd="te shikarubeki da",
tr="Deveria / Seria natural que / É justo que",
ex="""てしかるべきだ indica que algo deveria ser feito, porque é natural ou justo. Equivale a "deveria" ou "seria natural que".

Muitas vezes a pessoa critica o fato de algo não ter sido feito. Por exemplo, "o governo deveria ter agido mais cedo" ou "um esforço desses merece reconhecimento".

É uma expressão formal.""",
st="""Verbo (forma て) + しかるべきだ
Adjetivo い (sem い) + くてしかるべきだ
Adjetivo な / Substantivo + でしかるべきだ""",
no="""É parecido com べきだ e のが当然だ, mas てしかるべきだ é mais formal.

A forma しかるべき, antes de substantivos, significa "adequado", como しかるべき処置.""",
bf="てしかるべきだ",
rx="てしかるべき|でしかるべき",
tk=["て", "しかるべき", "だ"],
va=["てしかるべきだ", "てしかるべきです", "でしかるべきだ"],
E=[
("彼の努力は、もっと評価されてしかるべきだ。", "かれのどりょくは、もっとひょうかされてしかるべきだ。", "O esforço dele deveria ser mais reconhecido."),
("事故の責任者は、謝罪してしかるべきだ。", "じこのせきにんしゃは、しゃざいしてしかるべきだ。", "O responsável pelo acidente deveria pedir desculpas."),
("この問題は、もっと早く解決されてしかるべきだった。", "このもんだいは、もっとはやくかいけつされてしかるべきだった。", "Este problema deveria ter sido resolvido mais cedo."),
("これだけ働いたのだから、給料はもっと高くてしかるべきだ。", "これだけはたらいたのだから、きゅうりょうはもっとたかくてしかるべきだ。", "Trabalhando tanto assim, o salário deveria ser mais alto."),
("子供の意見も尊重されてしかるべきです。", "こどものいけんもそんちょうされてしかるべきです。", "A opinião das crianças também deveria ser respeitada."),
],
R=[
("ミスをしたのだから、彼は謝っ____。", "Ele errou, então deveria pedir desculpas.", ["てしかるべきだ", "てしかるべきです"]),
("彼女の才能は、もっと注目され____。", "O talento dela deveria receber mais atenção.", ["てしかるべきだ", "てしかるべきです"]),
("国はこの問題に対策をとっ____。", "O país deveria tomar medidas contra este problema.", ["てしかるべきだ", "てしかるべきです"]),
("お世話になったのだから、お礼を言っ____。", "Já que te ajudaram, você deveria agradecer.", ["てしかるべきだ", "てしかるべきです"]),
("社員の意見も聞かれ____。", "A opinião dos funcionários também deveria ser ouvida.", ["てしかるべきだ", "てしかるべきです"]),
],
),
dict(
n=189,
jp="〜て済むことではない",
rd="te sumu koto dewa nai",
tr="Não se resolve com / Não basta / Não é algo que se resolva",
ex="""て済むことではない indica que uma situação é tão grave que não pode ser resolvida de forma simples. Equivale a "não se resolve com" ou "não basta".

Muitas vezes é usado quando alguém tenta resolver um problema sério apenas pedindo desculpas ou pagando. Por exemplo, "isso não se resolve só pedindo desculpas".

O tom é de crítica forte.""",
st="""Verbo (forma て) + 済むことではない
Verbo (forma て) + 済む問題ではない""",
no="""Expressões comuns são 謝って済むことではない e お金で済む問題ではない.

É parecido com では済まない.""",
bf="て済むことではない",
rx="て済むことではない|て済む問題ではない|て済むことじゃない|て済む話ではない|てすむことではない",
tk=["て", "済む", "こと", "では", "ない"],
va=["て済むことではない", "て済む問題ではない", "て済むことじゃない"],
E=[
("人を傷つけておいて、謝って済むことではない。", "ひとをきずつけておいて、あやまってすむことではない。", "Machucar alguém não é algo que se resolva só pedindo desculpas."),
("これはお金を払って済む問題ではない。", "これはおかねをはらってすむもんだいではない。", "Isso não é um problema que se resolva pagando."),
("知らなかったと言って済むことではない。", "しらなかったといってすむことではない。", "Não basta dizer que não sabia."),
("ごめんと言って済むことじゃないよ。", "ごめんといってすむことじゃないよ。", "Não basta dizer desculpa."),
("会社の信用を失ったのは、謝って済む話ではない。", "かいしゃのしんようをうしなったのは、あやまってすむはなしではない。", "Perder a confiança na empresa não se resolve só pedindo desculpas."),
],
R=[
("約束を破っておいて、謝っ____。", "Quebrar a promessa não é algo que se resolva só pedindo desculpas.", ["て済むことではない", "て済む問題ではない", "て済むことじゃない"]),
("命に関わることだ。笑っ____。", "É algo que envolve vidas. Não se resolve com risadas.", ["て済むことではない", "て済む問題ではない", "て済むことじゃない"]),
("反省していると言っ____。", "Não basta dizer que está arrependido.", ["て済むことではない", "て済む問題ではない", "て済むことじゃない"]),
("この被害は、お金で弁償し____。", "Estes danos não se resolvem só indenizando com dinheiro.", ["て済むことではない", "て済む問題ではない"]),
("ミスを隠そうとしたのは、忘れていたと言っ____。", "Tentar esconder o erro não se resolve dizendo que esqueceu.", ["て済むことではない", "て済む問題ではない", "て済むことじゃない"]),
],
),
dict(
n=190,
jp="〜てやまない",
rd="te yamanai",
tr="Sinceramente / Do fundo do coração / Não deixar de",
ex="""てやまない indica um sentimento forte e contínuo, que não para. Equivale a "sinceramente" ou "do fundo do coração".

Costuma vir com verbos de sentimento ou desejo, como desejar, esperar, amar e respeitar. Por exemplo, "desejo sinceramente o seu sucesso".

É uma expressão muito formal, usada em discursos, cartas e mensagens.""",
st="""Verbo (forma て) + やまない""",
no="""Combinações comuns são 願ってやまない, 祈ってやまない, 愛してやまない e 期待してやまない.

O sujeito costuma ser a primeira pessoa.""",
bf="てやまない",
rx="てやまない|てやまなかった|でやまない|てやみません",
tk=["て", "やまない"],
va=["てやまない", "てやみません"],
E=[
("皆様のご健康を願ってやみません。", "みなさまのごけんこうをねがってやみません。", "Desejo sinceramente saúde a todos."),
("世界の平和を祈ってやまない。", "せかいのへいわをいのってやまない。", "Rezo do fundo do coração pela paz no mundo."),
("彼は故郷を愛してやまなかった。", "かれはこきょうをあいしてやまなかった。", "Ele amava profundamente sua terra natal."),
("君の活躍を期待してやまない。", "きみのかつやくをきたいしてやまない。", "Espero sinceramente o seu sucesso."),
("多くの人が尊敬してやまない先生だ。", "おおくのひとがそんけいしてやまないせんせいだ。", "É um professor que muitas pessoas respeitam profundamente."),
],
R=[
("お二人の幸せを願っ____。", "Desejo do fundo do coração a felicidade de vocês dois.", ["てやまない", "てやみません"]),
("被災地の一日も早い復興を祈っ____。", "Rezo sinceramente pela rápida recuperação das áreas atingidas.", ["てやまない", "てやみません"]),
("若い世代の成長を期待し____。", "Espero sinceramente o crescimento da nova geração.", ["てやまない", "てやみません"]),
("彼女は音楽を愛し____人だった。", "Ela era uma pessoa que amava profundamente a música.", ["てやまない"]),
("皆様のご成功を祈っ____。", "Desejo sinceramente o sucesso de todos.", ["てやまない", "てやみません"]),
],
),
]
