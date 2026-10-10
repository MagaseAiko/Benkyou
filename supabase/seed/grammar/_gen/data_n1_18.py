G = [
dict(
n=171,
jp="〜損なう / 〜損ねる / 〜損じる",
rd="sokonau / sokoneru / sonjiru",
tr="Deixar de / Falhar em / Perder a chance de",
ex="""損なう, 損ねる e 損じる, depois de outro verbo, indicam que a pessoa falhou em fazer algo ou perdeu a chance de fazer. Equivalem a "deixar de", "falhar em" ou "perder a chance de".

Por exemplo, "perdi o trem" ou "deixei de ver o filme". Também pode indicar que algo foi feito de forma errada, como "escrevi errado".

A expressão 死に損なう significa "escapar da morte por pouco".""",
st="""Verbo (forma ます sem ます) + 損なう
Verbo (forma ます sem ます) + 損ねる
Verbo (forma ます sem ます) + 損じる""",
no="""Combinações comuns são 見損なう, 乗り損ねる, 言い損なう, 聞き損じる e 書き損じる.

見損なう também significa "decepcionar-se com alguém", como 君を見損なった.""",
bf="損なう",
rx="損なう|損なった|損ねる|損ねた|損ねて|損じる|損じた|損なって|そこなう|そこねた",
tk=["損なう"],
va=["損なう", "損ねる", "損じる", "損ねた"],
E=[
("寝坊して、電車に乗り損ねた。", "ねぼうして、でんしゃにのりそこねた。", "Dormi demais e perdi o trem."),
("忙しくて、その映画を見損なった。", "いそがしくて、そのえいがをみそこなった。", "Estava ocupado e deixei de ver esse filme."),
("大事なことを言い損ねてしまった。", "だいじなことをいいそこねてしまった。", "Acabei deixando de dizer algo importante."),
("君を見損なったよ。", "きみをみそこなったよ。", "Você me decepcionou."),
("手紙を書き損じたので、もう一枚ください。", "てがみをかきそんじたので、もういちまいください。", "Errei ao escrever a carta, me dê mais uma folha."),
],
R=[
("チャンスをつかみ____。", "Perdi a chance de agarrar a oportunidade.", ["損ねた", "損なった"]),
("最終バスに乗り____、タクシーで帰った。", "Perdi o último ônibus e voltei de táxi.", ["損ねて", "損なって"]),
("先生の説明を聞き____。", "Deixei de ouvir a explicação do professor.", ["損ねた", "損なった", "損じた"]),
("ボールを受け____、点を取られた。", "Falhei em pegar a bola e levamos um ponto.", ["損ねて", "損なって"]),
("あの選手は記録を作り____。", "Aquele atleta falhou em bater o recorde.", ["損ねた", "損なった"]),
],
),
dict(
n=172,
jp="〜術がない",
rd="sube ga nai",
tr="Não há como / Não há meio de / Não tem jeito de",
ex="""術がない indica que não existe nenhum meio ou método para fazer algo. Equivale a "não há como" ou "não há meio de".

A pessoa se sente impotente diante da situação. Por exemplo, "não havia como ajudá-lo" ou "não tenho meio de contatá-lo".

É uma expressão formal e literária.""",
st="""Verbo (forma dicionário) + 術がない
Verbo (forma dicionário) + 術もない""",
no="""Também é escrito すべがない.

Expressões comuns são なす術がない, 知る術がない e 連絡する術がない.

なす術もなく significa "sem poder fazer nada".""",
bf="術がない",
rx="術がない|術もない|術もなく|術がなかった|術もなかった|すべがない|すべもなく",
tk=["術", "が", "ない"],
va=["術がない", "術もない", "術もなく", "すべがない"],
E=[
("大きな災害の前に、人々はなす術がなかった。", "おおきなさいがいのまえに、ひとびとはなすすべがなかった。", "Diante do grande desastre, as pessoas não tinham o que fazer."),
("彼の居場所を知る術がない。", "かれのいばしょをしるすべがない。", "Não há como saber onde ele está."),
("電話もメールも通じず、連絡する術がない。", "でんわもメールもつうじず、れんらくするすべがない。", "Nem telefone nem e-mail funcionam, não há meio de entrar em contato."),
("強い相手に、なす術もなく負けた。", "つよいあいてに、なすすべもなくまけた。", "Perdemos para o adversário forte sem poder fazer nada."),
("今となっては、確かめる術もない。", "いまとなっては、たしかめるすべもない。", "A esta altura, não há mais como confirmar."),
],
R=[
("火の勢いが強く、消防士もなす____。", "O fogo estava tão forte que nem os bombeiros tinham o que fazer.", ["術がなかった", "術もなかった"]),
("昔のことなので、真実を知る____。", "Como é coisa antiga, não há como saber a verdade.", ["術がない", "術もない", "すべがない"]),
("彼の気持ちを変える____。", "Não há meio de mudar o sentimento dele.", ["術がない", "術もない", "すべがない"]),
("病気が進んで、医者もなす____。", "A doença avançou e nem o médico tinha o que fazer.", ["術がなかった", "術もなかった"]),
("チームは相手の攻撃に、なす____敗れた。", "O time perdeu para o ataque do adversário sem poder fazer nada.", ["術もなく", "すべもなく"]),
],
),
dict(
n=173,
jp="〜すら / 〜ですら",
rd="sura / desura",
tr="Nem mesmo / Até mesmo / Nem sequer",
ex="""すら e ですら destacam um exemplo extremo para mostrar que algo é surpreendente. Equivalem a "nem mesmo" ou "até mesmo".

Com frases negativas, mostram que nem o mínimo foi feito, como "não tenho nem tempo para dormir". Com frases afirmativas, mostram que até o caso mais improvável acontece, como "até as crianças sabem disso".

É uma forma mais formal e literária de さえ.""",
st="""Substantivo + すら / ですら
Substantivo + に + すら
Verbo (forma ます sem ます) + すら + しない""",
no="""É parecido com さえ, mas すら é mais formal e enfático.

Com partículas, também aparece como にすら ou とすら.""",
bf="すら",
rx="すら|ですら",
tk=["すら"],
va=["すら", "ですら", "にすら"],
E=[
("忙しくて、寝る時間すらない。", "いそがしくて、ねるじかんすらない。", "Estou tão ocupado que não tenho nem tempo para dormir."),
("そんなことは子供ですら知っている。", "そんなことはこどもですらしっている。", "Até as crianças sabem disso."),
("彼は自分の名前すら書けなかった。", "かれはじぶんのなまえすらかけなかった。", "Ele não conseguia escrever nem o próprio nome."),
("先生ですら、この問題は解けなかった。", "せんせいですら、このもんだいはとけなかった。", "Nem mesmo o professor conseguiu resolver este problema."),
("彼女は私に挨拶すらしない。", "かのじょはわたしにあいさつすらしない。", "Ela nem sequer me cumprimenta."),
],
R=[
("疲れて、立つこと____できなかった。", "Estava tão cansado que nem conseguia ficar de pé.", ["すら"]),
("専門家____、この現象は説明できない。", "Nem mesmo os especialistas conseguem explicar este fenômeno.", ["ですら"]),
("彼はお礼の言葉____言わなかった。", "Ele nem sequer disse uma palavra de agradecimento.", ["すら"]),
("この漢字は、日本人____読めない人が多い。", "Muitos japoneses, até mesmo eles, não conseguem ler este kanji.", ["ですら"]),
("一円____持っていない。", "Não tenho nem um iene.", ["すら"]),
],
),
dict(
n=174,
jp="〜た弾みに / 〜た拍子に",
rd="ta hazumi ni / ta hyoushi ni",
tr="No impulso de / No momento em que / Com o movimento de",
ex="""た弾みに e た拍子に indicam que, no exato momento de uma ação, algo inesperado aconteceu como consequência. Equivalem a "no momento em que" ou "com o movimento de".

O resultado costuma ser um acidente ou algo não intencional. Por exemplo, "quando caí, quebrei os óculos" ou "no momento em que me levantei, bati a cabeça".

São expressões comuns para descrever acidentes.""",
st="""Verbo (forma た) + 弾みに / 拍子に
Substantivo + の + 弾みで""",
no="""Também aparecem como 弾みで e 拍子で.

A expressão 何かの弾みで significa "por algum motivo inesperado".""",
bf="た弾みに",
rx="弾みに|拍子に|弾みで|拍子で|はずみに|ひょうしに",
tk=["た", "弾み", "に"],
va=["た弾みに", "た拍子に", "弾みで"],
E=[
("転んだ弾みに、眼鏡が壊れた。", "ころんだはずみに、めがねがこわれた。", "Quando caí, os óculos quebraram."),
("立ち上がった拍子に、頭をぶつけた。", "たちあがったひょうしに、あたまをぶつけた。", "No momento em que me levantei, bati a cabeça."),
("車が急に止まった弾みで、荷物が落ちた。", "くるまがきゅうにとまったはずみで、にもつがおちた。", "Com a freada brusca do carro, a bagagem caiu."),
("くしゃみをした拍子に、腰を痛めた。", "くしゃみをしたひょうしに、こしをいためた。", "No momento em que espirrei, machuquei as costas."),
("何かの弾みで、ドアが開いてしまった。", "なにかのはずみで、ドアがあいてしまった。", "Por algum motivo inesperado, a porta acabou abrindo."),
],
R=[
("ぶつかった____、コーヒーをこぼしてしまった。", "No momento em que esbarrei, derrubei o café.", ["弾みに", "拍子に"]),
("振り向いた____、財布を落とした。", "No momento em que me virei, deixei cair a carteira.", ["弾みに", "拍子に"]),
("電車が揺れた____、隣の人の足を踏んだ。", "Com o balanço do trem, pisei no pé de quem estava ao lado.", ["弾みに", "拍子に", "弾みで"]),
("ボールを蹴った____、靴が飛んでいった。", "No momento em que chutei a bola, o sapato saiu voando.", ["弾みに", "拍子に"]),
("座った____、椅子が壊れた。", "No momento em que sentei, a cadeira quebrou.", ["弾みに", "拍子に"]),
],
),
dict(
n=175,
jp="〜たことにする / 〜たことになる",
rd="ta koto ni suru / ta koto ni naru",
tr="Fazer de conta que / Considerar que / Ser considerado como",
ex="""たことにする e たことになる tratam algo como se tivesse acontecido, mesmo que não seja totalmente verdade.

たことにする indica que a pessoa decide considerar algo de uma forma, muitas vezes fingindo. Equivale a "fazer de conta que". Por exemplo, "vamos fazer de conta que não ouvimos nada".

たことになる indica que, por algum critério, algo passa a ser considerado assim. Equivale a "ser considerado como". Por exemplo, "se você não avisar, será considerado como ausente".""",
st="""Verbo (forma た / なかった) + ことにする
Verbo (forma た / なかった) + ことになる""",
no="""A forma なかったことにする é muito usada, com o sentido de "esquecer o que aconteceu".

Também pode indicar um cálculo, como "isso significa que...".""",
bf="たことにする",
rx="たことにする|たことにします|たことにして|たことにしよう|たことになる|たことになります|だことになる|だことになります",
tk=["た", "こと", "に", "する"],
va=["たことにする", "たことになる", "なかったことにする"],
E=[
("今の話は聞かなかったことにします。", "いまのはなしはきかなかったことにします。", "Vou fazer de conta que não ouvi o que acabou de dizer."),
("この件は、なかったことにしよう。", "このけんは、なかったことにしよう。", "Vamos fazer de conta que isso não aconteceu."),
("連絡しなければ、欠席したことになる。", "れんらくしなければ、けっせきしたことになる。", "Se não avisar, será considerado como ausente."),
("書類を出せば、申し込んだことになります。", "しょるいをだせば、もうしこんだことになります。", "Entregando os documentos, a inscrição será considerada feita."),
("彼が来たことにして、話を進めよう。", "かれがきたことにして、はなしをすすめよう。", "Vamos fazer de conta que ele veio e continuar a conversa."),
],
R=[
("今日のことは、見なかった____。", "Vou fazer de conta que não vi o que aconteceu hoje.", ["ことにする", "ことにします"]),
("この約束は、なかった____。", "Vamos considerar que esta promessa nunca existiu.", ["ことにしよう", "ことにする"]),
("十時までに来なければ、遅刻した____。", "Se não chegar até as dez, será considerado atrasado.", ["ことになる", "ことになります"]),
("サインをすれば、契約に同意した____。", "Assinando, será considerado que concordou com o contrato.", ["ことになる", "ことになります"]),
("私が払った____、みんなで食べよう。", "Façam de conta que eu paguei e vamos comer todos juntos.", ["ことにして"]),
],
),
dict(
n=176,
jp="〜たところで",
rd="ta tokoro de",
tr="Mesmo que / Por mais que / Não adianta",
ex="""たところで indica que, mesmo que alguém faça algo, o resultado esperado não vai acontecer. Equivale a "mesmo que" ou "não adianta".

A segunda parte costuma ser negativa ou mostrar que algo é inútil. Por exemplo, "mesmo que corra agora, não vai dar tempo".

Muitas vezes vem com palavras interrogativas, como どんなに ou いくら.""",
st="""Verbo (forma た) + ところで + Resultado negativo
Palavra interrogativa + Verbo (forma た) + ところで""",
no="""É parecido com ても, mas たところで destaca que a ação é inútil.

Não se confunde com たところ, que significa "quando fiz...".""",
bf="たところで",
rx="たところで|だところで",
tk=["た", "ところ", "で"],
va=["たところで", "だところで"],
E=[
("今から急いだところで、間に合わない。", "いまからいそいだところで、まにあわない。", "Mesmo que corra agora, não vai dar tempo."),
("彼に説明したところで、わかってくれないだろう。", "かれにせつめいしたところで、わかってくれないだろう。", "Mesmo que eu explique, ele provavelmente não vai entender."),
("いくら悩んだところで、答えは出ない。", "いくらなやんだところで、こたえはでない。", "Por mais que se angustie, não vai encontrar a resposta."),
("謝ったところで、許してもらえないだろう。", "あやまったところで、ゆるしてもらえないだろう。", "Mesmo que peça desculpas, provavelmente não vai ser perdoado."),
("どんなに頼んだところで、彼は手伝わない。", "どんなにたのんだところで、かれはてつだわない。", "Por mais que eu peça, ele não vai ajudar."),
],
R=[
("今さら後悔し____、もう遅い。", "Mesmo que se arrependa agora, já é tarde.", ["たところで"]),
("一人で頑張っ____、この仕事は終わらない。", "Mesmo se esforçando sozinho, este trabalho não vai terminar.", ["たところで"]),
("文句を言っ____、何も変わらない。", "Não adianta reclamar, nada vai mudar.", ["たところで"]),
("いくら読ん____、この本は理解できない。", "Por mais que eu leia, não consigo entender este livro.", ["だところで"]),
("彼に頼んで____、無駄だよ。", "Mesmo que peça a ele, é inútil.", ["みたところで"]),
],
),
dict(
n=177,
jp="〜たつもりはない",
rd="ta tsumori wa nai",
tr="Não tive a intenção de / Não foi minha intenção / Não acho que",
ex="""たつもりはない indica que a pessoa não teve a intenção de fazer algo, ou não acha que fez algo, mesmo que os outros pensem o contrário. Equivale a "não tive a intenção de" ou "não acho que fiz".

Muitas vezes é usado para se defender ou explicar um mal-entendido. Por exemplo, "não tive a intenção de magoá-la".

É uma expressão comum na fala.""",
st="""Verbo (forma た) + つもりはない
Verbo (forma た) + つもりはありません""",
no="""É diferente de つもりはない com a forma dicionário, que significa "não pretendo fazer".

A forma たつもりだ significa "acho que fiz" ou "fiz de conta que".""",
bf="たつもりはない",
rx="たつもりはない|たつもりはありません|だつもりはない|たつもりはなかった",
tk=["た", "つもり", "は", "ない"],
va=["たつもりはない", "たつもりはありません", "たつもりはなかった"],
E=[
("彼女を傷つけたつもりはない。", "かのじょをきずつけたつもりはない。", "Não tive a intenção de magoá-la."),
("失礼なことを言ったつもりはありません。", "しつれいなことをいったつもりはありません。", "Não foi minha intenção dizer algo rude."),
("嘘をついたつもりはなかったんです。", "うそをついたつもりはなかったんです。", "Não tive a intenção de mentir."),
("怒ったつもりはないけど、そう見えたかな。", "おこったつもりはないけど、そうみえたかな。", "Não acho que fiquei bravo, mas será que pareceu?"),
("彼をだましたつもりはない。", "かれをだましたつもりはない。", "Não tive a intenção de enganá-lo."),
],
R=[
("悪口を言っ____。", "Não tive a intenção de falar mal.", ["たつもりはない", "たつもりはありません"]),
("あなたを責め____。", "Não foi minha intenção culpar você.", ["たつもりはない", "たつもりはありません"]),
("命令し____が、そう聞こえたらごめんなさい。", "Não tive a intenção de dar uma ordem, mas me desculpe se soou assim.", ["たつもりはない"]),
("ばかにし____んです。", "Não tive a intenção de fazer pouco caso.", ["たつもりはなかった"]),
("約束を破っ____。", "Não acho que quebrei a promessa.", ["たつもりはない", "たつもりはありません"]),
],
),
dict(
n=178,
jp="ただ〜のみだ",
rd="tada ~ nomi da",
tr="Só resta / Apenas / Não há nada a fazer senão",
ex="""ただ〜のみだ indica que só resta uma única ação ou possibilidade. Equivale a "só resta" ou "apenas".

É usado para mostrar determinação ou resignação. Por exemplo, "agora só resta esperar o resultado" ou "só resta dar o meu melhor".

É uma expressão formal, mais forte que だけだ.""",
st="""ただ + Verbo (forma dicionário) + のみだ
ただ + Substantivo + のみだ""",
no="""É uma forma formal de ただ〜だけだ.

Também aparece como ただ〜のみである, ainda mais formal.""",
bf="ただ〜のみだ",
rx="のみだ|のみです|のみである",
tk=["ただ", "のみ", "だ"],
va=["ただ〜のみだ", "ただ〜のみです", "ただ〜のみである"],
E=[
("準備はすべて終わった。あとはただ待つのみだ。", "じゅんびはすべておわった。あとはただまつのみだ。", "Os preparativos terminaram. Agora só resta esperar."),
("ここまで来たら、ただ前に進むのみだ。", "ここまできたら、ただまえにすすむのみだ。", "Chegando até aqui, só resta seguir em frente."),
("結果はわからない。ただ全力を尽くすのみです。", "けっかはわからない。ただぜんりょくをつくすのみです。", "Não sei o resultado. Só resta dar o meu melhor."),
("今はただ、彼の無事を祈るのみだ。", "いまはただ、かれのぶじをいのるのみだ。", "Agora só resta rezar para que ele esteja bem."),
("残された道は、ただ一つのみである。", "のこされたみちは、ただひとつのみである。", "Resta apenas um único caminho."),
],
R=[
("できることはやった。あとはただ結果を待つ____。", "Fiz o que podia. Agora só resta esperar o resultado.", ["のみだ", "のみです"]),
("試合まであと一日。ただ練習する____。", "Falta um dia para a partida. Só resta treinar.", ["のみだ", "のみです"]),
("今の私にできるのは、ただ謝る____。", "A única coisa que posso fazer agora é pedir desculpas.", ["のみだ", "のみです"]),
("もう迷わない。ただ夢に向かって進む____。", "Não vou mais hesitar. Só resta seguir rumo ao meu sonho.", ["のみだ", "のみです"]),
("ここではただ静かに見守る____。", "Aqui só resta observar em silêncio.", ["のみだ", "のみです"]),
],
),
dict(
n=179,
jp="〜ためしがない",
rd="tameshi ga nai",
tr="Nunca / Jamais aconteceu / Nem uma vez",
ex="""ためしがない indica que algo nunca aconteceu, nem uma única vez, até agora. Equivale a "nunca" ou "jamais aconteceu".

O tom é de crítica ou insatisfação, geralmente sobre o comportamento de alguém. Por exemplo, "ele nunca chegou no horário".

É uma expressão coloquial.""",
st="""Verbo (forma た) + ためしがない""",
no="""É parecido com たことがない, mas ためしがない tem um tom de crítica.

Também é escrito 試しがない, mas a forma em hiragana é mais comum.""",
bf="ためしがない",
rx="ためしがない|試しがない|ためしがありません",
tk=["ためし", "が", "ない"],
va=["ためしがない", "試しがない"],
E=[
("彼は約束の時間に来たためしがない。", "かれはやくそくのじかんにきたためしがない。", "Ele nunca chegou no horário combinado."),
("宝くじを買っても、当たったためしがない。", "たからくじをかっても、あたったためしがない。", "Mesmo comprando bilhetes de loteria, nunca ganhei."),
("天気予報が当たったためしがない。", "てんきよほうがあたったためしがない。", "A previsão do tempo nunca acertou."),
("弟は部屋を片付けたためしがない。", "おとうとはへやをかたづけたためしがない。", "Meu irmão nunca arrumou o quarto."),
("彼女は人の話を最後まで聞いたためしがない。", "かのじょはひとのはなしをさいごまできいたためしがない。", "Ela nunca ouviu ninguém até o fim."),
],
R=[
("夫は家事を手伝った____。", "Meu marido nunca ajudou nas tarefas de casa.", ["ためしがない", "試しがない"]),
("この店で待たずに入れた____。", "Nunca consegui entrar nesta loja sem esperar.", ["ためしがない", "試しがない"]),
("彼が自分から謝った____。", "Ele nunca pediu desculpas por conta própria.", ["ためしがない", "試しがない"]),
("ダイエットが成功した____。", "Minhas dietas nunca deram certo.", ["ためしがない", "試しがない"]),
("あのチームが勝った____。", "Aquele time nunca ganhou.", ["ためしがない", "試しがない"]),
],
),
dict(
n=180,
jp="〜たら最後 / 〜たが最後",
rd="tara saigo / ta ga saigo",
tr="Uma vez que / Se... acabou / Depois que... não tem volta",
ex="""たら最後 e たが最後 indicam que, uma vez que algo acontece, a situação fica ruim e não tem mais volta. Equivale a "uma vez que..." ou "se..., acabou".

A segunda parte costuma mostrar uma consequência negativa ou algo que não pode ser parado. Por exemplo, "uma vez que ele começa a falar, não para mais".

たら最後 é mais coloquial, e たが最後 é mais formal.""",
st="""Verbo (forma たら) + 最後
Verbo (forma た) + が最後""",
no="""A segunda parte costuma ter expressões como 止まらない, 戻れない ou 終わりだ.

É uma expressão enfática.""",
bf="たら最後",
rx="たら最後|たが最後|だら最後|だが最後",
tk=["たら", "最後"],
va=["たら最後", "たが最後"],
E=[
("彼は話し始めたら最後、止まらない。", "かれははなしはじめたらさいご、とまらない。", "Uma vez que ele começa a falar, não para mais."),
("この本を読み始めたが最後、朝まで眠れない。", "このほんをよみはじめたがさいご、あさまでねむれない。", "Uma vez que você começa a ler este livro, não dorme até de manhã."),
("一度嘘をついたら最後、信用を失う。", "いちどうそをついたらさいご、しんようをうしなう。", "Uma vez que se mente, perde-se a confiança."),
("あの店に入ったが最後、何か買ってしまう。", "あのみせにはいったがさいご、なにかかってしまう。", "Uma vez que entro naquela loja, acabo comprando alguma coisa."),
("ここで負けたら最後、もう後がない。", "ここでまけたらさいご、もうあとがない。", "Se perdermos aqui, acabou, não há mais chance."),
],
R=[
("父は怒っ____、誰も止められない。", "Uma vez que meu pai fica bravo, ninguém consegue pará-lo.", ["たら最後", "たが最後"]),
("このゲームは始め____、やめられない。", "Uma vez que você começa este jogo, não consegue parar.", ["たら最後", "たが最後"]),
("一度秘密を話し____、元には戻れない。", "Uma vez que se conta o segredo, não tem volta.", ["たら最後", "たが最後"]),
("あの犬は一度かみつい____、離さない。", "Uma vez que aquele cachorro morde, não solta mais.", ["たら最後", "たが最後"]),
("彼女に見つかっ____、全部話さなければならない。", "Se ela me descobrir, acabou, vou ter que contar tudo.", ["たら最後", "たが最後"]),
],
),
]
