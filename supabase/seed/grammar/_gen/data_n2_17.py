G = [
dict(
n=161,
jp="〜ては / 〜では",
rd="te wa / de wa",
tr="Se for assim / Se continuar / Desse jeito",
ex="""ては ou では, no meio da frase, indica uma condição que leva a um resultado ruim ou indesejado. Equivale a "se for assim..." ou "desse jeito...".

A primeira parte mostra uma situação, e a segunda mostra que, nessa condição, algo fica difícil, impossível ou problemático. Por exemplo, "com tanto barulho, não dá para estudar".

A segunda parte costuma ser negativa, como できない, 困る ou だめだ.""",
st="""Verbo (forma て) + は + Resultado negativo
Adjetivo い (sem い) + くては + Resultado negativo
Adjetivo な / Substantivo + では + Resultado negativo""",
no="""Na fala, ては vira ちゃ e では vira じゃ.

É parecido com たら e ば, mas ては quase sempre leva a um resultado negativo.

Também é a base de expressões como てはいけない e てはならない.""",
bf="ては",
rx="ては|では|くては",
tk=["て", "は"],
va=["ては", "では", "くては", "ちゃ", "じゃ"],
E=[
("こんなにうるさくては、勉強できない。", "こんなにうるさくては、べんきょうできない。", "Com tanto barulho, não dá para estudar."),
("毎日雨では、洗濯物が乾かない。", "まいにちあめでは、せんたくものがかわかない。", "Chovendo todo dia, a roupa não seca."),
("そんなに急がされては、いい仕事ができない。", "そんなにいそがされては、いいしごとができない。", "Se me apressarem tanto, não consigo fazer um bom trabalho."),
("こんな成績では、大学に入れない。", "こんなせいせきでは、だいがくにはいれない。", "Com notas assim, não vou entrar na universidade."),
("今やめられては困ります。", "いまやめられてはこまります。", "Se você desistir agora, vou ficar em apuros."),
],
R=[
("こんなに暑く____、眠れない。", "Com este calor, não dá para dormir.", ["ては"]),
("その服装____、会社に行けないよ。", "Com essa roupa, não dá para ir à empresa.", ["では"]),
("君に来られなく____、困る。", "Se você não puder vir, fico em apuros.", ["ては"]),
("この給料____、生活できない。", "Com este salário, não dá para viver.", ["では"]),
("そんなに泣かれ____、何も言えない。", "Se você chorar tanto, não consigo dizer nada.", ["ては"]),
],
),
dict(
n=162,
jp="〜てはいられない",
rd="te wa irarenai",
tr="Não dá para ficar / Não posso continuar / Não há tempo para",
ex="""てはいられない indica que a pessoa não pode continuar em um estado ou fazendo algo, por causa da situação. Equivale a "não dá para ficar..." ou "não posso continuar...".

Muitas vezes há uma urgência ou um motivo que obriga a pessoa a mudar de atitude. Por exemplo, "o prazo está chegando, não dá para ficar parado".

Mostra a vontade de agir ou a pressão da situação.""",
st="""Verbo (forma て) + はいられない
Verbo (forma て) + もいられない""",
no="""Uma expressão comum é じっとしてはいられない, "não dá para ficar parado".

É parecido com てばかりはいられない, que destaca que a pessoa só fazia aquilo.

Na fala, aparece como てらんない.""",
bf="てはいられない",
rx="てはいられない|ではいられない|てもいられない|てはいられません|ではいられません",
tk=["て", "は", "いられない"],
va=["てはいられない", "ではいられない", "てもいられない", "てはいられません"],
E=[
("締め切りが近いので、休んではいられない。", "しめきりがちかいので、やすんではいられない。", "O prazo está chegando, não dá para ficar descansando."),
("子供が病気なのに、じっとしてはいられない。", "こどもがびょうきなのに、じっとしてはいられない。", "Meu filho está doente, não dá para ficar parado."),
("もう時間がないから、迷ってはいられない。", "もうじかんがないから、まよってはいられない。", "Já não há tempo, não dá para ficar hesitando."),
("こんなところで負けてはいられません。", "こんなところでまけてはいられません。", "Não posso perder num lugar como este."),
("心配で、いてもたってもいられない。", "しんぱいで、いてもたってもいられない。", "Estou tão preocupado que não consigo ficar quieto."),
],
R=[
("試合は明日だ。のんびりし____。", "A partida é amanhã. Não dá para ficar de bobeira.", ["てはいられない", "てはいられません"]),
("みんなが頑張っているのに、私だけ寝____。", "Todos estão se esforçando, não dá para só eu ficar dormindo.", ["てはいられない", "てはいられません"]),
("もう大人なのだから、親に甘え____。", "Já sou adulto, então não dá para continuar dependendo dos meus pais.", ["てはいられない", "てはいられません"]),
("ライバルが追いついてきた。止まっ____。", "O rival está alcançando. Não dá para parar.", ["てはいられない", "てはいられません"]),
("こんなに忙しいときに、遊ん____。", "Num momento tão corrido, não dá para ficar brincando.", ["ではいられない", "ではいられません"]),
],
),
dict(
n=163,
jp="〜てはならない",
rd="te wa naranai",
tr="Não se deve / É proibido / Não pode",
ex="""てはならない indica uma proibição forte, baseada em regras, moral ou bom senso. Equivale a "não se deve" ou "é proibido".

É mais formal que てはいけない e aparece em leis, regras, discursos e textos sérios. Por exemplo, "não se deve esquecer as lições da guerra".

Também é usado para falar de coisas que nunca deveriam acontecer.""",
st="""Verbo (forma て) + はならない
Verbo (forma て) + はなりません""",
no="""É mais forte e formal que てはいけない.

A forma てはならぬ é ainda mais antiga e formal.

Uma expressão comum é あってはならない, "algo que não pode acontecer".""",
bf="てはならない",
rx="てはならない|ではならない|てはなりません|ではなりません|てはならぬ",
tk=["て", "は", "ならない"],
va=["てはならない", "ではならない", "てはなりません", "てはならぬ"],
E=[
("戦争の悲劇を忘れてはならない。", "せんそうのひげきをわすれてはならない。", "Não se deve esquecer a tragédia da guerra."),
("ここでたばこを吸ってはなりません。", "ここでたばこをすってはなりません。", "É proibido fumar aqui."),
("このような事故は二度と起こってはならない。", "このようなじこはにどとおこってはならない。", "Um acidente como este não pode acontecer nunca mais."),
("人の心を傷つけてはならない。", "ひとのこころをきずつけてはならない。", "Não se deve magoar o coração das pessoas."),
("この部屋に入ってはならない。", "このへやにはいってはならない。", "É proibido entrar nesta sala."),
],
R=[
("約束を破っ____。", "Não se deve quebrar promessas.", ["てはならない", "てはなりません"]),
("試験中に話し____。", "É proibido conversar durante a prova.", ["てはならない", "てはなりません"]),
("医者はミスをし____。", "Um médico não pode cometer erros.", ["てはならない", "てはなりません"]),
("このことを誰にも話し____。", "Não se deve contar isto a ninguém.", ["てはならない", "てはなりません"]),
("ここで泳い____。", "É proibido nadar aqui.", ["ではならない", "ではなりません"]),
],
),
dict(
n=164,
jp="〜ては〜ては",
rd="te wa ~ te wa",
tr="Ora... ora / Faz... e então / Repetidamente",
ex="""ては〜ては indica que duas ações se repetem várias vezes, uma depois da outra. Equivale a "faz... e então..., faz... e então..." ou "ora... ora...".

Por exemplo, "escrevia e apagava, escrevia e apagava" ou "comia e dormia, comia e dormia".

Também aparece com uma única ação, ては, seguida de outra, para mostrar uma repetição, como "toda vez que chovia, o rio transbordava".""",
st="""Verbo A (forma て) + は + Verbo B (forma ます sem ます)、Verbo A (forma て) + は + Verbo B
Verbo A (forma て) + は + Verbo B (repetição)""",
no="""É uma expressão que dá ritmo à frase e mostra repetição.

Na fala, também aparece como ちゃ〜ちゃ.""",
bf="ては〜ては",
rx="ては|では",
tk=["て", "は"],
va=["ては〜ては", "では〜では"],
E=[
("手紙を書いては消し、書いては消しした。", "てがみをかいてはけし、かいてはけしした。", "Escrevia a carta e apagava, escrevia e apagava."),
("休みの日は、食べては寝、食べては寝ている。", "やすみのひは、たべてはね、たべてはねている。", "Nos dias de folga, como e durmo, como e durmo."),
("雨が降っては止み、降っては止みしている。", "あめがふってはやみ、ふってはやみしている。", "A chuva cai e para, cai e para."),
("彼は失敗しては立ち上がった。", "かれはしっぱいしてはたちあがった。", "Ele falhava e se levantava de novo."),
("読んでは考え、考えては読んだ。", "よんではかんがえ、かんがえてはよんだ。", "Lia e pensava, pensava e lia."),
],
R=[
("子供は転ん____起き、転んでは起きした。", "A criança caía e se levantava, caía e se levantava.", ["では"]),
("彼女は服を着____脱ぎ、着ては脱ぎした。", "Ela vestia a roupa e tirava, vestia e tirava.", ["ては"]),
("波が寄せ____返す。", "As ondas vêm e voltam.", ["ては"]),
("考えては書き、書い____考えた。", "Pensava e escrevia, escrevia e pensava.", ["ては"]),
("夜中に何度も目が覚め____眠った。", "Acordei e dormi várias vezes durante a noite.", ["ては"]),
],
),
dict(
n=165,
jp="〜と同時に",
rd="to douji ni",
tr="Ao mesmo tempo que / Assim que / Junto com",
ex="""と同時に tem dois usos principais.

O primeiro indica que duas coisas acontecem ao mesmo tempo ou logo em seguida. Equivale a "assim que" ou "no mesmo instante em que". Por exemplo, "assim que o sinal tocou, os alunos saíram".

O segundo indica que algo tem duas características ao mesmo tempo, muitas vezes opostas. Equivale a "ao mesmo tempo que". Por exemplo, "este trabalho é difícil, mas ao mesmo tempo é gratificante".""",
st="""Verbo (forma dicionário) + と同時に
Substantivo + と同時に
Adjetivo / Substantivo + である + と同時に""",
no="""No primeiro uso, é parecido com とたんに, mas と同時に é mais neutro.

No segundo uso, é parecido com 一方で.""",
bf="と同時に",
rx="と同時に|とどうじに|と同時",
tk=["と", "同時", "に"],
va=["と同時に", "と同時"],
E=[
("ベルが鳴ると同時に、生徒たちは教室を出た。", "ベルがなるとどうじに、せいとたちはきょうしつをでた。", "Assim que o sinal tocou, os alunos saíram da sala."),
("卒業と同時に、結婚した。", "そつぎょうとどうじに、けっこんした。", "Me casei logo depois da formatura."),
("この仕事は大変だと同時に、やりがいがある。", "このしごとはたいへんだとどうじに、やりがいがある。", "Este trabalho é difícil, mas ao mesmo tempo é gratificante."),
("彼は医者であると同時に、作家でもある。", "かれはいしゃであるとどうじに、さっかでもある。", "Ele é médico e, ao mesmo tempo, escritor."),
("ドアが開くと同時に、客が店に入ってきた。", "ドアがあくとどうじに、きゃくがみせにはいってきた。", "Assim que a porta abriu, os clientes entraram na loja."),
],
R=[
("家に着く____、雨が降り出した。", "Assim que cheguei em casa, começou a chover.", ["と同時に", "とどうじに"]),
("就職____、一人暮らしを始めた。", "Junto com o primeiro emprego, comecei a morar sozinho.", ["と同時に", "とどうじに"]),
("合格してうれしい____、少し不安もある。", "Estou feliz por ter passado, mas ao mesmo tempo um pouco inseguro.", ["と同時に", "とどうじに"]),
("彼女は母親である____、社長でもある。", "Ela é mãe e, ao mesmo tempo, presidente de empresa.", ["と同時に", "とどうじに"]),
("試合終了____、観客から大きな拍手が起こった。", "Assim que a partida terminou, o público aplaudiu muito.", ["と同時に", "とどうじに"]),
],
),
dict(
n=166,
jp="〜といった",
rd="to itta",
tr="Como / Tais como / Do tipo",
ex="""といった serve para listar exemplos de um grupo. Equivale a "como" ou "tais como".

A pessoa dá alguns exemplos e depois diz a que categoria eles pertencem. Por exemplo, "frutas como maçã e laranja".

Também aparece na forma といった + Substantivo + はない, que significa "não há nada de especial", como "não tenho nenhum hobby em especial".""",
st="""Substantivo + や + Substantivo + といった + Substantivo (categoria)
Substantivo + 、Substantivo + といった + Substantivo
これといった + Substantivo + はない""",
no="""É parecido com などの, mas といった é um pouco mais formal.

A expressão これといった〜はない significa "nada de especial".""",
bf="といった",
rx="といった",
tk=["と", "いった"],
va=["といった", "これといった"],
E=[
("りんごやみかんといった果物が好きだ。", "りんごやみかんといったくだものがすきだ。", "Gosto de frutas como maçã e laranja."),
("京都や奈良といった古い町を訪ねたい。", "きょうとやならといったふるいまちをたずねたい。", "Quero visitar cidades antigas como Kyoto e Nara."),
("サッカーや野球といったスポーツが人気だ。", "サッカーややきゅうといったスポーツがにんきだ。", "Esportes como futebol e beisebol são populares."),
("これといった趣味はありません。", "これといったしゅみはありません。", "Não tenho nenhum hobby em especial."),
("英語、中国語、韓国語といった言語を勉強している。", "えいご、ちゅうごくご、かんこくごといったげんごをべんきょうしている。", "Estudo línguas como inglês, chinês e coreano."),
],
R=[
("犬や猫____ペットを飼っている人が多い。", "Muitas pessoas têm animais de estimação como cães e gatos.", ["といった"]),
("寿司や天ぷら____日本料理が食べたい。", "Quero comer comida japonesa, como sushi e tempurá.", ["といった"]),
("これ____理由もなく、会社を辞めた。", "Saí da empresa sem nenhum motivo em especial.", ["といった"]),
("地震や台風____自然災害に備えよう。", "Vamos nos preparar para desastres naturais como terremotos e tufões.", ["といった"]),
("ピアノやバイオリン____楽器を習っている。", "Faço aulas de instrumentos como piano e violino.", ["といった"]),
],
),
dict(
n=167,
jp="〜というふうに",
rd="to iu fuu ni",
tr="Desta forma / Assim como / Do jeito que",
ex="""というふうに serve para mostrar a forma ou o modo como algo é feito, geralmente dando exemplos. Equivale a "desta forma" ou "do jeito que".

A pessoa explica um padrão ou uma maneira de fazer algo, muitas vezes listando exemplos. Por exemplo, "segunda é inglês, terça é matemática, desta forma estudo uma matéria por dia".

Também pode citar o que alguém disse ou pensou, como "ele disse que viria, desse jeito".""",
st="""Frase + というふうに + Verbo
Frase + というふうな / というふうだ""",
no="""É parecido com というように e のように.

Na fala, aparece muito como っていうふうに.""",
bf="というふうに",
rx="というふうに|というふうな|というように|っていうふうに",
tk=["と", "いう", "ふう", "に"],
va=["というふうに", "というふうな", "というように"],
E=[
("月曜日は英語、火曜日は数学というふうに、毎日違う科目を勉強している。", "げつようびはえいご、かようびはすうがくというふうに、まいにちちがうかもくをべんきょうしている。", "Segunda é inglês, terça é matemática, desta forma estudo uma matéria diferente por dia."),
("彼は来ないというふうに言っていた。", "かれはこないというふうにいっていた。", "Ele disse, desse jeito, que não viria."),
("朝はジョギング、夜はヨガというふうに、運動を続けている。", "あさはジョギング、よるはヨガというふうに、うんどうをつづけている。", "De manhã corrida, à noite ioga, desta forma continuo me exercitando."),
("一人が質問して、もう一人が答えるというふうに練習してください。", "ひとりがしつもんして、もうひとりがこたえるというふうにれんしゅうしてください。", "Pratiquem assim: um pergunta e o outro responde."),
("最初に予約して、次に支払うというふうに手続きを進めます。", "さいしょによやくして、つぎにしはらうというふうにてつづきをすすめます。", "O procedimento segue assim: primeiro reserva e depois paga."),
],
R=[
("一人ずつ順番に話す____、会議を進めよう。", "Vamos conduzir a reunião assim: cada um fala na sua vez.", ["というふうに", "というように"]),
("春は桜、秋は紅葉____、季節ごとに楽しめる。", "Na primavera as cerejeiras, no outono as folhas vermelhas, desta forma dá para aproveitar cada estação.", ["というふうに", "というように"]),
("先生は明日休む____言っていた。", "O professor disse que amanhã vai faltar.", ["というふうに", "というように"]),
("左手でこれを押さえて、右手で切る____してください。", "Faça assim: segure isto com a mão esquerda e corte com a direita.", ["というふうに", "というように"]),
("毎日少しずつ貯金する____、目標を立てた。", "Estabeleci uma meta desta forma: economizar um pouco todo dia.", ["というふうに", "というように"]),
],
),
dict(
n=168,
jp="〜ということは",
rd="to iu koto wa",
tr="Isso significa que / Então quer dizer que / Ou seja",
ex="""ということは serve para tirar uma conclusão a partir de uma informação. Equivale a "isso significa que" ou "então quer dizer que".

A pessoa recebe uma informação e interpreta o que ela implica. Por exemplo, "a luz está apagada. Isso significa que ele não está em casa".

Também é usado para explicar o sentido de algo, como "estudar significa...".""",
st="""Frase + ということは、 + Conclusão
Substantivo / Frase + ということは + Explicação""",
no="""A conclusão muitas vezes termina com ということだ, だろう ou わけだ.

Na fala, aparece como ってことは.""",
bf="ということは",
rx="ということは|ってことは",
tk=["と", "いう", "こと", "は"],
va=["ということは", "ってことは"],
E=[
("電気が消えている。ということは、彼は留守だ。", "でんきがきえている。ということは、かれはるすだ。", "A luz está apagada. Isso significa que ele não está em casa."),
("「明日は祝日です。」「ということは、会社は休みですね。」", "「あしたはしゅくじつです。」「ということは、かいしゃはやすみですね。」", "Amanhã é feriado. Então quer dizer que a empresa estará fechada, né?"),
("返事がないということは、まだ決まっていないのだろう。", "へんじがないということは、まだきまっていないのだろう。", "Não ter resposta significa que ainda não foi decidido."),
("「チケットが売り切れた。」「ってことは、行けないの？」", "「チケットがうりきれた。」「ってことは、いけないの？」", "Os ingressos esgotaram. Então quer dizer que não vamos poder ir?"),
("働くということは、責任を持つことだ。", "はたらくということは、せきにんをもつことだ。", "Trabalhar significa ter responsabilidade."),
],
R=[
("彼女が笑っている。____、試験はうまくいったのだろう。", "Ela está sorrindo. Isso significa que a prova deve ter ido bem.", ["ということは", "ってことは"]),
("「店が閉まっている。」「____、今日は定休日だね。」", "A loja está fechada. Então quer dizer que hoje é dia de folga, né?", ["ということは", "ってことは"]),
("連絡がない____、元気だということだ。", "Não ter notícias significa que está tudo bem.", ["ということは"]),
("「彼は来月転勤するそうだ。」「____、もう会えないね。」", "Dizem que ele vai ser transferido no mês que vem. Então quer dizer que não vamos mais nos ver, né?", ["ということは", "ってことは"]),
("親になる____、子供の人生に責任を持つことだ。", "Ser pai significa ter responsabilidade pela vida do filho.", ["ということは"]),
],
),
dict(
n=169,
jp="〜というものだ",
rd="to iu mono da",
tr="Isso é que é / É assim que é / É isso que se chama",
ex="""というものだ serve para dar uma opinião forte, apresentando algo como uma verdade geral ou como a definição de algo. Equivale a "isso é que é" ou "é assim que é".

A pessoa julga uma situação com base no bom senso. Por exemplo, "ajudar quem está em dificuldade, isso é que é amizade" ou "pedir isso a ele é um abuso".

É uma expressão de opinião, muitas vezes com tom de crítica ou de conclusão.""",
st="""Frase + というものだ
Substantivo + というものだ""",
no="""Na fala, aparece como ってもんだ.

Expressões comuns são それが人生というものだ e 無理というものだ.""",
bf="というものだ",
rx="というものだ|というものです|ってもんだ|というもんだ",
tk=["と", "いう", "もの", "だ"],
va=["というものだ", "というものです", "ってもんだ"],
E=[
("困っている人を助けるのが、友達というものだ。", "こまっているひとをたすけるのが、ともだちというものだ。", "Ajudar quem está em dificuldade, isso é que é ser amigo."),
("一日で全部覚えるのは無理というものだ。", "いちにちでぜんぶおぼえるのはむりというものだ。", "Decorar tudo em um dia é simplesmente impossível."),
("思い通りにいかないのが、人生というものだ。", "おもいどおりにいかないのが、じんせいというものだ。", "As coisas não saírem como queremos, assim é a vida."),
("約束を守らないのは、わがままというものだ。", "やくそくをまもらないのは、わがままというものだ。", "Não cumprir promessas é o que se chama de egoísmo."),
("苦労してこそ、喜びも大きいというものです。", "くろうしてこそ、よろこびもおおきいというものです。", "É justamente com sofrimento que a alegria é maior, assim que é."),
],
R=[
("子供に全部やらせるのは、かわいそう____。", "Fazer a criança fazer tudo sozinha é uma crueldade.", ["というものだ", "というものです"]),
("失敗から学ぶのが、成長____。", "Aprender com os erros, isso é que é crescer.", ["というものだ", "というものです"]),
("この値段でこの品質を求めるのは、ぜいたく____。", "Querer esta qualidade por este preço é pedir demais.", ["というものだ", "というものです"]),
("家族のために働くのが、親____。", "Trabalhar pela família, isso é que é ser pai.", ["というものだ", "というものです"]),
("人の物を勝手に使うのは、失礼____。", "Usar as coisas dos outros sem permissão é falta de educação.", ["というものだ", "というものです"]),
],
),
dict(
n=170,
jp="〜というものではない",
rd="to iu mono dewa nai",
tr="Não é bem assim que / Não é verdade que sempre / Não basta",
ex="""というものではない serve para negar uma ideia geral ou uma crença comum. Equivale a "não é bem assim que..." ou "não é verdade que sempre...".

A pessoa mostra que a ideia não está totalmente errada, mas que não vale para todos os casos. Por exemplo, "não é verdade que, quanto mais caro, melhor".

Muitas vezes vem com ば〜ほど ou com ばいい.""",
st="""Frase + というものではない
Verbo (forma ば) + いい + というものではない""",
no="""É parecido com わけではない, mas というものではない é usado para negar uma regra geral.

Na fala, aparece como ってもんじゃない.""",
bf="というものではない",
rx="というものではない|というものでもない|というものではありません|というものじゃない|ってもんじゃない",
tk=["と", "いう", "もの", "では", "ない"],
va=["というものではない", "というものでもない", "というものじゃない", "ってもんじゃない"],
E=[
("高ければいいというものではない。", "たかければいいというものではない。", "Não é verdade que, quanto mais caro, melhor."),
("勉強は長い時間すればいいというものではない。", "べんきょうはながいじかんすればいいというものではない。", "Não basta estudar por muitas horas."),
("お金があれば幸せというものでもない。", "おかねがあればしあわせというものでもない。", "Não é bem assim que ter dinheiro traz felicidade."),
("練習すればすぐに上手になるというものじゃない。", "れんしゅうすればすぐにじょうずになるというものじゃない。", "Não é verdade que, praticando, se melhora logo."),
("謝ればいいというものではありません。", "あやまればいいというものではありません。", "Não basta pedir desculpas."),
],
R=[
("人数が多ければいい____。", "Não é verdade que, quanto mais gente, melhor.", ["というものではない", "というものでもない", "というものではありません"]),
("薬はたくさん飲めば早く治る____。", "Não é verdade que tomar muito remédio faz sarar mais rápido.", ["というものではない", "というものでもない", "というものではありません"]),
("有名な大学を出れば成功する____。", "Não é bem assim que se formar numa universidade famosa garante sucesso.", ["というものではない", "というものでもない", "というものではありません"]),
("仕事は早ければいい____。", "No trabalho, não basta ser rápido.", ["というものではない", "というものでもない", "というものではありません"]),
("言葉は覚えれば話せる____。", "Não é verdade que basta decorar palavras para falar.", ["というものではない", "というものでもない", "というものではありません"]),
],
),
]
