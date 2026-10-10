G = [
dict(
n=141,
jp="〜と言うと",
rd="to iu to",
tr="Falando de / Quando se fala em / Quer dizer que",
ex="""と言うと tem dois usos principais.

O primeiro é associar uma palavra à imagem mais comum ligada a ela. Equivale a "falando de..." ou "quando se fala em...". Por exemplo, "quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi". Esse uso é parecido com と言えば.

O segundo é retomar algo que o outro disse, para pedir mais detalhes ou confirmar uma conclusão. Equivale a "e então...?", "quer dizer que...?". Por exemplo, alguém diz "amanhã é folga", e você responde "quer dizer que a reunião foi cancelada?".

Nesse segundo uso, と言うと pode até aparecer sozinho, no começo da frase, sem repetir a palavra: "と言うと、どういうこと？".""",
st="""Substantivo + と言うと、 + Associação típica
(Retomando a fala do outro) Palavra + と言うと、 + Pergunta
と言うと、 + Pergunta (quer dizer que...?)

Variações: というと / って言うと""",
no="""と言うと e と言えば são muito parecidos no uso de associação. と言うと é mais comum quando se pede mais detalhes.

A resposta と言うと？ sozinha significa "como assim?" e pede uma explicação.

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: というと.""",
bf="と言うと",
rx="と言うと|というと|って言うと",
tk=["と", "言うと"],
va=["と言うと", "というと", "って言うと"],
E=[
("日本料理と言うと、まずすしを思い浮かべる。", "にほんりょうりというと、まずすしをおもいうかべる。", "Quando se fala em culinária japonesa, a primeira coisa que vem à mente é sushi."),
("「来週、北海道に行くんだ。」「北海道と言うと、雪がすごいでしょう。」", "「らいしゅう、ほっかいどうにいくんだ。」「ほっかいどうというと、ゆきがすごいでしょう。」", "\"Semana que vem vou a Hokkaido.\" \"Falando de Hokkaido, deve ter muita neve, né?\""),
("「明日は休みです。」「と言うと、会議は中止ですか。」", "「あしたはやすみです。」「というと、かいぎはちゅうしですか。」", "\"Amanhã é folga.\" \"Quer dizer que a reunião foi cancelada?\""),
("京都と言うと、お寺や神社が有名ですね。", "きょうとというと、おてらやじんじゃがゆうめいですね。", "Falando de Kyoto, os templos e santuários são famosos, né?"),
("「問題がある」と言うと、どんな問題ですか。", "「もんだいがある」というと、どんなもんだいですか。", "Quando você diz que há um problema, que tipo de problema é?"),
],
R=[
("夏____、何を思い出しますか。", "Quando se fala em verão, do que você se lembra?", ["と言うと", "というと"]),
("「彼は来ないよ。」「____、パーティーは中止？」", "\"Ele não vem.\" \"Quer dizer que a festa foi cancelada?\"", ["と言うと", "というと"]),
("イタリア____、パスタとピザだね。", "Falando de Itália, é massa e pizza, né?", ["と言うと", "というと"]),
("「お祭りがあるんだ。」「お祭り____、いつ？」", "\"Vai ter um festival.\" \"Festival? Quando?\"", ["と言うと", "というと"]),
("「彼女は先生です。」「先生____、何の先生ですか。」", "\"Ela é professora.\" \"Professora de quê?\"", ["と言うと", "というと"]),
],
),
dict(
n=142,
jp="〜というより",
rd="to iu yori",
tr="Mais do que / Mais propriamente / Não tanto... mas sim",
ex="""というより é usado para corrigir ou ajustar uma descrição, dizendo que outra palavra é mais adequada. Equivale a "mais do que...", "mais propriamente" ou "não tanto... mas sim...".

A primeira parte apresenta uma descrição possível, e a segunda, uma descrição mais precisa. Por exemplo, "hoje não está tanto quente, está é calor" ou "ele é menos um professor e mais um amigo".

É muito útil para expressar nuances e ser mais exato ao descrever pessoas, sentimentos e situações.

Com むしろ, a estrutura というより、むしろ reforça a correção.

Ele vem depois de substantivos, adjetivos (sem だ para な) e da forma simples de verbos.""",
st="""A + というより + B (mais B do que A)
A + というより、むしろ + B
Verbo / Adjetivo (forma simples) + というより

Variações: と言うより / っていうより""",
no="""というより é diferente de より (comparação simples). Aqui, a ideia não é "mais que", e sim "uma descrição mais correta seria".

É muito comum em conversas para expressar sentimentos com precisão: 怒っているというより悲しい.

Com adjetivos な, não se usa だ antes: 静かというより.""",
bf="というより",
rx="というより|と言うより|っていうより",
tk=["と", "いう", "より"],
va=["というより", "と言うより", "っていうより"],
E=[
("今日は暖かいというより、暑い。", "きょうはあたたかいというより、あつい。", "Hoje não está tanto quentinho, está é calor."),
("彼は先生というより、友達のような存在だ。", "かれはせんせいというより、ともだちのようなそんざいだ。", "Ele é menos um professor e mais um amigo."),
("この料理は、料理というより芸術だ。", "このりょうりは、りょうりというよりげいじゅつだ。", "Esta comida é mais arte do que comida."),
("彼女はきれいというより、かわいいタイプだ。", "かのじょはきれいというより、かわいいタイプだ。", "Ela é mais fofa do que bonita."),
("彼は怒っているというより、悲しんでいるようだった。", "かれはおこっているというより、かなしんでいるようだった。", "Ele parecia mais triste do que bravo."),
],
R=[
("この部屋は狭い____、使いにくい。", "Este quarto não é tanto pequeno, é mais difícil de usar.", ["というより"]),
("彼は話し上手____、聞き上手だ。", "Ele é mais um bom ouvinte do que um bom falante.", ["というより"]),
("それは忘れた____、最初から知らなかったんだ。", "Não é que eu tenha esquecido; na verdade, eu nem sabia.", ["というより"]),
("昨日の雨は雨____、嵐だった。", "A chuva de ontem foi mais uma tempestade do que uma chuva.", ["というより"]),
("彼のことは好き____、尊敬している。", "Mais do que gostar dele, eu o admiro.", ["というより"]),
],
),
dict(
n=143,
jp="〜とみえる・〜とみえて",
rd="to mieru / to miete",
tr="Parece que / Pelo visto / Ao que tudo indica",
ex="""とみえる e とみえて são usados para fazer uma suposição baseada em algo que se observa. Equivalem a "parece que", "pelo visto" ou "ao que tudo indica".

A primeira parte é a suposição (o que a pessoa deduz), e a segunda parte, com とみえて, é a evidência observada que levou a essa conclusão. Por exemplo, "ele devia estar muito cansado, pelo visto, porque dormiu na hora".

Com とみえる no fim da frase, a dedução vem depois da evidência: "a rua está molhada. Parece que choveu de madrugada".

O sujeito costuma ser outra pessoa ou uma situação, e não quem fala, porque a ideia é deduzir algo a partir do que se vê.

É uma expressão um pouco formal e literária, comum em narrativas.""",
st="""Frase (suposição, forma simples) + とみえて、 + Evidência observada
Evidência (com ponto final) + Frase (suposição) + とみえる

Escrita: とみえる / と見える""",
no="""とみえる é parecido com らしい e ようだ, mas soa mais literário.

A palavra よほど (muito, bastante) aparece muito junto: よほど疲れていたとみえて.

Não confunda com に見える (parecer, pela aparência), que descreve como algo parece visualmente.""",
bf="とみえる",
rx="とみえる|とみえて|と見える|と見えて|とみえ|と見え",
tk=["と", "みえる"],
va=["とみえる", "とみえて", "と見える", "と見えて"],
E=[
("彼はよほど疲れていたとみえて、すぐに寝てしまった。", "かれはよほどつかれていたとみえて、すぐにねてしまった。", "Pelo visto ele estava muito cansado, porque dormiu na hora."),
("道が濡れている。夜中に雨が降ったとみえる。", "みちがぬれている。よなかにあめがふったとみえる。", "A rua está molhada. Parece que choveu de madrugada."),
("彼女は何かいいことがあったとみえて、ずっと笑っている。", "かのじょはなにかいいことがあったとみえて、ずっとわらっている。", "Pelo visto aconteceu algo bom com ela, porque não para de sorrir."),
("子供たちはお腹がすいていたとみえて、全部食べてしまった。", "こどもたちはおなかがすいていたとみえて、ぜんぶたべてしまった。", "As crianças, pelo visto, estavam com fome, porque comeram tudo."),
("この店は人気があるとみえて、いつも行列ができている。", "このみせはにんきがあるとみえて、いつもぎょうれつができている。", "Ao que tudo indica esta loja é popular, porque sempre tem fila."),
],
R=[
("彼は急いでいた____、挨拶もしないで出て行った。", "Pelo visto ele estava com pressa, porque saiu sem nem cumprimentar.", ["とみえて", "と見えて"]),
("犬は散歩に行きたい____、ドアの前で待っている。", "O cachorro, pelo visto, quer passear, porque está esperando na porta.", ["とみえて", "と見えて"]),
("電気が消えている。みんなもう寝た____。", "As luzes estão apagadas. Parece que todos já foram dormir.", ["とみえる", "と見える"]),
("彼女はその映画が気に入った____、三回も見た。", "Pelo visto ela gostou desse filme, porque viu três vezes.", ["とみえて", "と見えて"]),
("彼は勉強しなかった____、試験の点が悪かった。", "Pelo visto ele não estudou, porque tirou nota baixa na prova.", ["とみえて", "と見えて"]),
],
),
dict(
n=144,
jp="〜とすれば・〜としたら",
rd="to sureba / to shitara",
tr="Se / Supondo que / Caso",
ex="""とすれば e としたら são usados para apresentar uma hipótese ou suposição, e depois falar das consequências ou fazer uma pergunta sobre ela. Equivalem a "se", "supondo que" ou "caso".

A ideia literal é "se considerarmos que...". A condição pode ser algo imaginário ("se você tivesse cem milhões de ienes"), algo incerto ("se essa história for verdade") ou um plano ("se for fazer intercâmbio, qual país seria bom?").

としたら é mais comum na conversa, e とすれば soa um pouco mais formal e lógico. A forma とすると também existe, com sentido parecido.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.""",
st="""Frase (forma simples) + とすれば / としたら / とすると、 + Consequência / Pergunta
Substantivo / Adjetivo な + だ + とすれば / としたら""",
no="""Comparado a たら e ば, とすれば e としたら destacam que a condição é uma suposição, e não algo certo.

Perguntas do tipo 生まれ変わるとしたら, 何になりたい？ ("se você renascesse, o que gostaria de ser?") são muito comuns em conversas.

Em textos lógicos, とすれば aparece para tirar conclusões a partir de uma premissa.""",
bf="とすれば",
rx="とすれば|としたら|とすると",
tk=["と", "すれば"],
va=["とすれば", "としたら", "とすると"],
E=[
("明日雨が降るとすれば、試合は中止だ。", "あしたあめがふるとすれば、しあいはちゅうしだ。", "Se chover amanhã, a partida será cancelada."),
("一億円あるとしたら、何をしますか。", "いちおくえんあるとしたら、なにをしますか。", "Supondo que você tivesse cem milhões de ienes, o que faria?"),
("彼の話が本当だとすれば、大変なことだ。", "かれのはなしがほんとうだとすれば、たいへんなことだ。", "Se a história dele for verdade, é algo grave."),
("今から出発するとすると、何時に着きますか。", "いまからしゅっぱつするとすると、なんじにつきますか。", "Se sairmos agora, a que horas chegaremos?"),
("留学するとすれば、どの国がいいですか。", "りゅうがくするとすれば、どのくにがいいですか。", "Se fosse fazer intercâmbio, qual país seria bom?"),
],
R=[
("生まれ変わる____、何になりたいですか。", "Se você renascesse, o que gostaria de ser?", ["とすれば", "としたら"]),
("その噂が本当だ____、困ったことになる。", "Se esse boato for verdade, vamos ter problemas.", ["とすれば", "としたら"]),
("今度旅行に行く____、どこへ行きたい？", "Se você fosse viajar da próxima vez, aonde gostaria de ir?", ["とすれば", "としたら"]),
("一人で行く____、電車が一番便利だ。", "Se for sozinho, o trem é o mais prático.", ["とすれば", "としたら"]),
("彼が犯人だ____、動機は何だろう。", "Se ele for o culpado, qual seria o motivo?", ["とすれば", "としたら"]),
],
),
dict(
n=145,
jp="〜と共に",
rd="to tomo ni",
tr="Junto com / À medida que / Ao mesmo tempo que",
ex="""と共に é uma expressão formal com três usos principais.

O primeiro é "junto com": fazer algo com outra pessoa ou grupo, como "receber o ano novo junto com a família". É uma forma mais formal de と一緒に.

O segundo é "à medida que" ou "com": uma mudança acompanha outra, como "com o passar dos tempos, a vida das pessoas também mudou". Nesse uso, é parecido com につれて.

O terceiro é "ao mesmo tempo que": algo acontece simultaneamente a outra coisa, como "com a chegada da primavera, as cerejeiras começaram a florir". Também pode indicar que alguém tem duas qualidades ao mesmo tempo: "ele é cantor e, ao mesmo tempo, ator".

Por ser formal, と共に aparece muito em discursos, notícias e textos escritos.""",
st="""Substantivo (pessoa) + と共に + Verbo (junto com)
Substantivo / Verbo (forma de dicionário) + と共に + Mudança (à medida que)
Substantivo + の + Acontecimento + と共に (ao mesmo tempo)
Substantivo + であると共に + Substantivo + でもある

Escrita: と共に / とともに""",
no="""Em cartas e discursos formais, frases como 皆様と共に ("junto com todos vocês") são comuns.

No uso de "à medida que", と共に soa mais formal que につれて.

Na conversa do dia a dia, prefira と一緒に para "junto com".""",
bf="と共に",
rx="と共に|とともに",
tk=["と", "共に"],
va=["と共に", "とともに"],
E=[
("家族と共に、新しい年を迎えた。", "かぞくとともに、あたらしいとしをむかえた。", "Recebi o ano novo junto com a família."),
("時代と共に、人々の生活も変わった。", "じだいとともに、ひとびとのせいかつもかわった。", "Com o passar dos tempos, a vida das pessoas também mudou."),
("年をとると共に、体力が落ちてきた。", "としをとるとともに、たいりょくがおちてきた。", "À medida que envelheço, minha força física vem diminuindo."),
("春の訪れと共に、桜が咲き始めた。", "はるのおとずれとともに、さくらがさきはじめた。", "Com a chegada da primavera, as cerejeiras começaram a florir."),
("彼は歌手であると共に、俳優でもある。", "かれはかしゅであるとともに、はいゆうでもある。", "Ele é cantor e, ao mesmo tempo, ator."),
],
R=[
("仲間____、山に登った。", "Subi a montanha junto com os companheiros.", ["と共に", "とともに"]),
("経済の発展____、生活が豊かになった。", "Com o desenvolvimento da economia, a vida ficou mais próspera.", ["と共に", "とともに"]),
("彼女は結婚する____、仕事をやめた。", "Ela saiu do emprego ao mesmo tempo que se casou.", ["と共に", "とともに"]),
("技術の進歩____、便利な世の中になった。", "Com o progresso da tecnologia, o mundo ficou mais prático.", ["と共に", "とともに"]),
("彼女は医者である____、母親でもある。", "Ela é médica e, ao mesmo tempo, mãe.", ["と共に", "とともに"]),
],
),
dict(
n=146,
jp="〜途中で",
rd="tochuu de",
tr="No meio do caminho / No meio de / A caminho de",
ex="""途中で significa "no meio do caminho" ou "no meio de". Ele indica que algo acontece enquanto uma ação ou um deslocamento ainda não terminou.

Ele tem dois usos principais. O primeiro é no deslocamento: "a caminho da escola, encontrei um amigo". Nesse caso, vem depois do verbo na forma de dicionário, como 行く途中で ou 帰る途中で.

O segundo é no meio de uma atividade ou evento: "no meio do filme, peguei no sono" ou "no meio da conversa, o telefone tocou". Nesse caso, vem depois de substantivos com の.

Com に, 途中に indica um lugar ou parada no meio do trajeto, como "passei numa loja de conveniência no caminho de volta".

Sozinho, antes de um verbo, 途中で significa "pela metade", como em "desistir do trabalho pela metade".""",
st="""Verbo na forma de dicionário + 途中で / 途中に (no caminho)
Substantivo + の + 途中で (no meio de)
途中で + Verbo (pela metade: 途中でやめる)

Escrita: 途中 / とちゅう""",
no="""途中で降りる significa "descer no meio do caminho", por exemplo, de um trem.

途中まで significa "até a metade": 途中まで一緒に行こう (vamos juntos até o meio do caminho).

Comparado a 最中に, 途中で é mais neutro e não tem necessariamente a ideia de interrupção desagradável.""",
bf="途中で",
rx="途中で|途中に|とちゅう",
tk=["途中", "で"],
va=["途中で", "途中に", "途中まで"],
E=[
("学校へ行く途中で、友達に会った。", "がっこうへいくとちゅうで、ともだちにあった。", "A caminho da escola, encontrei um amigo."),
("疲れていて、映画の途中で寝てしまった。", "つかれていて、えいがのとちゅうでねてしまった。", "Estava cansado e acabei dormindo no meio do filme."),
("話の途中で、電話が鳴った。", "はなしのとちゅうで、でんわがなった。", "O telefone tocou no meio da conversa."),
("帰る途中に、コンビニに寄った。", "かえるとちゅうに、コンビニによった。", "No caminho de volta, passei numa loja de conveniência."),
("仕事を途中でやめてはいけない。", "しごとをとちゅうでやめてはいけない。", "Não se deve largar o trabalho pela metade."),
],
R=[
("駅へ行く____、雨が降り出した。", "A caminho da estação, começou a chover.", ["途中で", "途中に"]),
("サッカーの試合の____、けがをした。", "Me machuquei no meio da partida de futebol.", ["途中で"]),
("家に帰る____、本屋に寄りました。", "No caminho de casa, passei numa livraria.", ["途中で", "途中に"]),
("足が痛くなって、マラソンを____やめてしまった。", "Meu pé começou a doer e acabei desistindo da maratona no meio.", ["途中で"]),
("授業の____、先生が教室を出た。", "No meio da aula, o professor saiu da sala.", ["途中で"]),
],
),
dict(
n=147,
jp="ところで",
rd="tokoro de",
tr="A propósito / Mudando de assunto / Por falar nisso",
ex="""ところで é uma conjunção usada para mudar de assunto de repente, introduzindo um tema novo. Equivale a "a propósito" ou "mudando de assunto".

Ela fica no começo da frase e avisa o ouvinte de que o tema da conversa vai mudar. Muitas vezes, o novo assunto não tem relação direta com o anterior.

É muito usada em conversas, cartas e e-mails, depois de cumprimentos ou de terminar um assunto. Por exemplo, "que dia bonito, né? A propósito, como vai o trabalho?".

Comparado a さて, que passa para a próxima etapa de algo planejado, ところで muda o assunto de forma mais livre e repentina.""",
st="""Frase 1 (com ponto final) + ところで、 + Novo assunto
ところで、 + Pergunta""",
no="""Usar ところで com muita frequência pode parecer que você não está prestando atenção no que o outro diz.

Em e-mails, ところで é usado para introduzir um segundo assunto depois do principal.

そういえば ("por falar nisso") também muda de assunto, mas a partir de algo que lembra a conversa anterior.""",
bf="ところで",
rx="ところで",
tk=["ところで"],
va=["ところで"],
E=[
("ところで、明日の会議は何時からですか。", "ところで、あしたのかいぎはなんじからですか。", "A propósito, a reunião de amanhã é a partir de que horas?"),
("いい天気ですね。ところで、お仕事は順調ですか。", "いいてんきですね。ところで、おしごとはじゅんちょうですか。", "Que dia bonito, né? A propósito, como vai o trabalho?"),
("ところで、田中さんは元気？", "ところで、たなかさんはげんき？", "A propósito, o Tanaka está bem?"),
("この話はここまで。ところで、来週の予定は？", "このはなしはここまで。ところで、らいしゅうのよていは？", "Este assunto termina aqui. Mudando de assunto, quais são os planos para a semana que vem?"),
("ところで、あの本はもう読みましたか。", "ところで、あのほんはもうよみましたか。", "Por falar nisso, você já leu aquele livro?"),
],
R=[
("今日は楽しかったね。____、次はいつ会える？", "Hoje foi divertido, né? A propósito, quando podemos nos ver de novo?", ["ところで"]),
("____、この前の話はどうなりましたか。", "A propósito, o que aconteceu com aquele assunto de outro dia?", ["ところで"]),
("仕事の話はこれで終わります。____、皆さん週末は何をしますか。", "O assunto de trabalho termina aqui. Mudando de assunto, o que vocês vão fazer no fim de semana?", ["ところで"]),
("____、お昼ご飯はもう食べた？", "A propósito, você já almoçou?", ["ところで"]),
("そうなんですか。____、田中さんを見ませんでしたか。", "É mesmo? A propósito, você não viu o Tanaka?", ["ところで"]),
],
),
dict(
n=148,
jp="ところが",
rd="tokoro ga",
tr="Mas / No entanto / Só que (inesperado)",
ex="""ところが é uma conjunção que introduz um resultado inesperado, contrário ao que se esperava. Equivale a "mas", "no entanto" ou "só que".

A primeira frase apresenta uma expectativa ou uma ação, e a segunda, iniciada por ところが, mostra que a realidade foi diferente e surpreendente. Por exemplo, "achei que seria fácil. No entanto, foi muito difícil".

A diferença em relação a しかし e でも é o elemento de surpresa. ところが destaca que o resultado foi inesperado para quem fala.

Por isso, a segunda parte é um fato que aconteceu, e não uma opinião, um pedido ou uma intenção.""",
st="""Frase 1 (expectativa / ação, com ponto final) + ところが、 + Resultado inesperado""",
no="""ところが é muito comum em narrativas, histórias e relatos pessoais.

A segunda parte geralmente está no passado e descreve algo que de fato aconteceu.

Não confunda com ところで (a propósito), que muda de assunto, nem com ところ (lugar, momento).""",
bf="ところが",
rx="ところが",
tk=["ところが"],
va=["ところが"],
E=[
("天気予報では晴れだった。ところが、午後から雨が降った。", "てんきよほうでははれだった。ところが、ごごからあめがふった。", "A previsão era de sol. No entanto, choveu a partir da tarde."),
("簡単だと思った。ところが、とても難しかった。", "かんたんだとおもった。ところが、とてもむずかしかった。", "Achei que seria fácil. Só que foi muito difícil."),
("急いで駅に行った。ところが、電車はもう出ていた。", "いそいでえきにいった。ところが、でんしゃはもうでていた。", "Fui correndo para a estação. Mas o trem já tinha saído."),
("彼は来ると言っていた。ところが、結局来なかった。", "かれはくるといっていた。ところが、けっきょくこなかった。", "Ele disse que viria. No entanto, no fim não veio."),
("安いと思って買った。ところが、すぐに壊れた。", "やすいとおもってかった。ところが、すぐにこわれた。", "Comprei achando que estava barato. Só que quebrou logo."),
],
R=[
("ケーキを買いに店に行った。____、休みだった。", "Fui à loja comprar um bolo. Mas estava fechada.", ["ところが"]),
("試験は簡単だと聞いていた。____、全然できなかった。", "Tinha ouvido que a prova era fácil. No entanto, não consegui fazer nada.", ["ところが"]),
("彼に電話した。____、誰も出なかった。", "Liguei para ele. Mas ninguém atendeu.", ["ところが"]),
("晴れると思って傘を持たずに出かけた。____、雨が降り出した。", "Saí sem guarda-chuva achando que ia fazer sol. Só que começou a chover.", ["ところが"]),
("早く寝ようと思った。____、なかなか眠れなかった。", "Pensei em dormir cedo. No entanto, não consegui pegar no sono.", ["ところが"]),
],
),
dict(
n=149,
jp="〜とおりに",
rd="toori ni",
tr="Do jeito que / Conforme / Exatamente como",
ex="""とおりに é usado para dizer que algo é feito exatamente como foi indicado, dito, mostrado ou planejado. Equivale a "do jeito que", "conforme" ou "exatamente como".

Ele vem depois de verbos (na forma de dicionário ou た) e de substantivos com の. Com substantivos, também existe a forma どおりに, sem の, como em 予定どおりに (conforme o planejado).

Por exemplo, "monte conforme o manual", "fiz do jeito que o professor disse" ou "partimos conforme o planejado".

Sem に, とおり também aparece no começo de frases, como 思ったとおり ("como eu pensava"), indicando que algo aconteceu exatamente como se esperava.""",
st="""Verbo (forma de dicionário / た) + とおりに + Verbo
Substantivo + の + とおりに + Verbo
Substantivo + どおりに + Verbo (予定どおりに / 計画どおりに)
思ったとおり、 + Frase (como eu pensava)

Escrita: とおり / 通り""",
no="""Com substantivos, どおり (sem の) é muito comum em expressões como 予定どおり, 計画どおり e 時間どおり.

A expressão おっしゃるとおりです ("é exatamente como o senhor diz") é uma forma educada de concordar.

Não confunda com 通り (とおり) de rua, como em 大通り (avenida).""",
bf="とおりに",
rx="とおりに|通りに|どおりに|とおり|通り",
tk=["とおり", "に"],
va=["とおりに", "通りに", "どおりに", "とおり"],
E=[
("説明書のとおりに組み立ててください。", "せつめいしょのとおりにくみたててください。", "Monte conforme o manual, por favor."),
("先生が言ったとおりにやってみた。", "せんせいがいったとおりにやってみた。", "Tentei fazer do jeito que o professor disse."),
("飛行機は予定どおりに出発した。", "ひこうきはよていどおりにしゅっぱつした。", "O avião partiu conforme o planejado."),
("思ったとおり、彼は来なかった。", "おもったとおり、かれはこなかった。", "Como eu pensava, ele não veio."),
("私が書くとおりに書いてください。", "わたしがかくとおりにかいてください。", "Escreva exatamente como eu escrever, por favor."),
],
R=[
("地図の____行けば、駅に着きます。", "Se seguir conforme o mapa, você chega à estação.", ["とおりに", "通りに"]),
("母が教えてくれた____料理を作った。", "Fiz a comida do jeito que minha mãe me ensinou.", ["とおりに", "通りに"]),
("言われた____すれば、大丈夫です。", "Se fizer do jeito que mandaram, vai dar tudo certo.", ["とおりに", "通りに"]),
("仕事は計画____進んでいる。", "O trabalho está avançando conforme o plano.", ["どおりに", "通りに"]),
("見た____話してください。", "Conte exatamente como você viu, por favor.", ["とおりに", "通りに"]),
],
),
dict(
n=150,
jp="〜通す",
rd="toosu",
tr="Fazer até o fim / Continuar sem parar / Manter até o fim",
ex="""通す, ligado a outro verbo, indica que uma ação foi feita do começo ao fim, sem interrupção, mesmo com dificuldades. Equivale a "fazer até o fim", "continuar sem parar" ou "manter até o fim".

A estrutura junta o verbo na forma ます sem ます com 通す. O resultado funciona como um verbo do grupo 1.

A ideia é de persistência: correr a prova inteira, trabalhar a noite toda, manter a própria opinião até o fim, ler um livro longo do início ao fim.

Comparado a 切る, que indica conclusão total, 通す destaca a continuidade e o esforço para não parar no meio.

Também pode ter sentido negativo, como 嘘をつき通す (manter a mentira até o fim).""",
st="""Verbo na forma ます sem ます + 通す

Passado: 通した / 通しました
Desejo: 通したい

Combinações comuns: やり通す / 走り通す / 働き通す / 言い通す / 守り通す / 読み通す""",
no="""やり通す (levar até o fim) é muito usado em frases de determinação e incentivo.

守り通す significa "proteger até o fim" ou "cumprir até o fim", como uma promessa.

Sozinho, 通す significa "deixar passar" ou "fazer passar", como em 人を通す (deixar alguém passar).""",
bf="通す",
rx="通し|通す|とおし|とおす",
tk=["通す"],
va=["通す", "通した", "通しました", "通したい"],
E=[
("彼は最後まで走り通した。", "かれはさいごまではしりとおした。", "Ele correu até o fim sem parar."),
("昨日は一晩中働き通した。", "きのうはひとばんじゅうはたらきとおした。", "Ontem trabalhei a noite inteira sem parar."),
("彼女は自分の意見を最後まで言い通した。", "かのじょはじぶんのいけんをさいごまでいいとおした。", "Ela manteve a própria opinião até o fim."),
("この長い小説を一日で読み通した。", "このながいしょうせつをいちにちでよみとおした。", "Li este romance longo inteiro em um dia."),
("一度決めたことは、最後までやり通したい。", "いちどきめたことは、さいごまでやりとおしたい。", "O que eu decidi fazer, quero levar até o fim."),
],
R=[
("大変だったが、最後までやり____。", "Foi difícil, mas levei até o fim.", ["通した", "通しました"]),
("彼はそのことについて、最後までうそをつき____。", "Ele manteve a mentira sobre isso até o fim.", ["通した", "通しました"]),
("十キロを休まずに歩き____。", "Andei dez quilômetros sem parar até o fim.", ["通した", "通しました"]),
("三日間、寝ないで働き____。", "Trabalhei três dias seguidos sem dormir.", ["通した", "通しました"]),
("一度始めたことは、やり____べきだ。", "O que se começa deve ser levado até o fim.", ["通す"]),
],
),
]
