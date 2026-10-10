G = [
dict(
n=171,
jp="〜と考えられる",
rd="to kangaerareru",
tr="Acredita-se que / Pode-se considerar que / É provável que",
ex="""と考えられる expressa uma opinião ou conclusão de forma objetiva, como se fosse uma avaliação geral e não só pessoal. Equivale a "acredita-se que" ou "pode-se considerar que".

É muito usado em textos acadêmicos, relatórios, notícias e análises. Por exemplo, "acredita-se que a causa do acidente foi descuido".

A forma passiva de 考える dá um tom mais neutro e menos pessoal.""",
st="""Frase (forma simples) + と考えられる
Substantivo / Adjetivo な + だ + と考えられる""",
no="""É parecido com と思われる, que também é usado em textos formais.

と考えられる dá a ideia de uma conclusão baseada em lógica ou dados.""",
bf="と考えられる",
rx="と考えられる|と考えられます|と考えられて|とかんがえられる",
tk=["と", "考えられる"],
va=["と考えられる", "と考えられます", "と考えられている"],
E=[
("事故の原因は不注意だと考えられる。", "じこのげんいんはふちゅういだとかんがえられる。", "Acredita-se que a causa do acidente foi descuido."),
("この遺跡は千年前のものと考えられている。", "このいせきはせんねんまえのものとかんがえられている。", "Acredita-se que estas ruínas são de mil anos atrás."),
("今後、高齢者はさらに増えると考えられます。", "こんご、こうれいしゃはさらにふえるとかんがえられます。", "É provável que o número de idosos aumente ainda mais no futuro."),
("この結果から、薬の効果があると考えられる。", "このけっかから、くすりのこうかがあるとかんがえられる。", "A partir deste resultado, pode-se considerar que o remédio faz efeito."),
("犯人はまだ近くにいると考えられる。", "はんにんはまだちかくにいるとかんがえられる。", "Acredita-se que o culpado ainda está por perto."),
],
R=[
("景気はゆっくり回復する____。", "É provável que a economia se recupere aos poucos.", ["と考えられる", "と考えられます"]),
("この病気の原因はストレスだ____。", "Acredita-se que a causa desta doença é o estresse.", ["と考えられる", "と考えられます"]),
("火事は電気の故障によるもの____。", "Acredita-se que o incêndio foi causado por uma falha elétrica.", ["と考えられる", "と考えられます"]),
("この絵は有名な画家が描いた____。", "Pode-se considerar que este quadro foi pintado por um pintor famoso.", ["と考えられる", "と考えられます"]),
("人口は今後減っていく____。", "É provável que a população diminua daqui em diante.", ["と考えられる", "と考えられます"]),
],
),
dict(
n=172,
jp="〜とか（で）",
rd="toka (de)",
tr="Ouvi dizer que / Parece que / Disseram que",
ex="""とか, no fim de uma frase, indica que a informação foi ouvida de alguém, mas sem total certeza. Equivale a "ouvi dizer que" ou "parece que".

É uma forma mais vaga e suave de transmitir uma informação, parecida com そうだ. Por exemplo, "ouvi dizer que ele vai se casar".

Na forma とかで, explica um motivo que a pessoa ouviu, como "disseram que estava doente, por isso faltou".""",
st="""Frase (forma simples) + とか
Frase (forma simples) + とかで、 + Resultado""",
no="""É mais vago e coloquial que そうだ.

Às vezes vem junto com 何でも ou 確か, como 何でも〜とか.""",
bf="とか",
rx="とかで|とか",
tk=["とか"],
va=["とか", "とかで"],
E=[
("彼は来月結婚するとか。", "かれはらいげつけっこんするとか。", "Ouvi dizer que ele vai se casar no mês que vem."),
("田中さんは風邪をひいたとかで、今日は休みです。", "たなかさんはかぜをひいたとかで、きょうはやすみです。", "Disseram que o Tanaka pegou resfriado, por isso faltou hoje."),
("あの店は来週閉店するとか。", "あのみせはらいしゅうへいてんするとか。", "Parece que aquela loja vai fechar na semana que vem."),
("電車が止まったとかで、彼は遅れてきた。", "でんしゃがとまったとかで、かれはおくれてきた。", "Ele chegou atrasado porque disseram que o trem parou."),
("明日は雪が降るとか。", "あしたはゆきがふるとか。", "Ouvi dizer que vai nevar amanhã."),
],
R=[
("駅前に新しいカフェができた____。", "Ouvi dizer que abriu um café novo em frente à estação.", ["とか"]),
("用事がある____、彼女は先に帰った。", "Disseram que tinha um compromisso, então ela foi embora antes.", ["とかで"]),
("あの二人は付き合っている____。", "Parece que aqueles dois estão namorando.", ["とか"]),
("家族が入院した____、彼は急いで帰国した。", "Disseram que alguém da família foi internado, então ele voltou às pressas para o país.", ["とかで"]),
("今年の夏は特に暑くなる____。", "Ouvi dizer que este verão vai ser especialmente quente.", ["とか"]),
],
),
dict(
n=173,
jp="とっくに",
rd="tokku ni",
tr="Há muito tempo / Já faz tempo / Faz tempo que",
ex="""とっくに indica que algo aconteceu muito antes do que se imagina. Equivale a "há muito tempo" ou "já faz tempo".

Muitas vezes mostra surpresa ou impaciência, porque a outra pessoa não sabia ou está atrasada. Por exemplo, "o trem já partiu faz tempo".

É uma expressão coloquial, comum na fala.""",
st="""とっくに + Verbo (forma た / ている)
とっくに + Verbo (forma ている)""",
no="""É mais coloquial e enfático que もう e すでに.

A forma とっくの昔に significa "há muitíssimo tempo".""",
bf="とっくに",
rx="とっくに|とっくの",
tk=["とっくに"],
va=["とっくに", "とっくの昔に"],
E=[
("電車はとっくに出発した。", "でんしゃはとっくにしゅっぱつした。", "O trem já partiu faz tempo."),
("その仕事ならとっくに終わっているよ。", "そのしごとならとっくにおわっているよ。", "Esse trabalho já terminou faz tempo."),
("彼女はとっくに家に帰りました。", "かのじょはとっくにいえにかえりました。", "Ela foi para casa há muito tempo."),
("締め切りはとっくに過ぎている。", "しめきりはとっくにすぎている。", "O prazo já passou faz tempo."),
("その話ならとっくの昔に知っていた。", "そのはなしならとっくのむかしにしっていた。", "Essa história eu já sabia há muitíssimo tempo."),
],
R=[
("映画は____始まっているよ。", "O filme já começou faz tempo.", ["とっくに"]),
("宿題なら____終わった。", "A lição de casa eu terminei faz tempo.", ["とっくに"]),
("そのニュースは____みんな知っている。", "Todo mundo já sabe dessa notícia faz tempo.", ["とっくに"]),
("彼は____会社を辞めていた。", "Ele já tinha saído da empresa há muito tempo.", ["とっくに"]),
("お店は____閉まっている時間だ。", "É um horário em que a loja já fechou faz tempo.", ["とっくに"]),
],
),
dict(
n=174,
jp="〜ところだった",
rd="tokoro datta",
tr="Por pouco não / Quase / Estive a ponto de",
ex="""ところだった indica que algo quase aconteceu, mas no fim não aconteceu. Equivale a "por pouco não" ou "quase".

Geralmente é usado para coisas ruins que a pessoa evitou por pouco, o que traz alívio. Por exemplo, "por pouco não perdi o trem".

Muitas vezes aparece junto com もう少しで, 危うく ou あやうく.""",
st="""Verbo (forma dicionário) + ところだった
Verbo (forma ない) + ところだった""",
no="""É comum usar もう少しで ou 危うく no começo da frase para reforçar.

Também pode aparecer em frases com ば ou たら, como "se você não tivesse avisado, eu teria esquecido".""",
bf="ところだった",
rx="ところだった|ところでした",
tk=["ところ", "だった"],
va=["ところだった", "ところでした"],
E=[
("もう少しで電車に乗り遅れるところだった。", "もうすこしででんしゃにのりおくれるところだった。", "Por pouco não perdi o trem."),
("危うく車にひかれるところだった。", "あやうくくるまにひかれるところだった。", "Quase fui atropelado por um carro."),
("あなたが言ってくれなかったら、忘れるところだった。", "あなたがいってくれなかったら、わすれるところだった。", "Se você não tivesse dito, eu teria esquecido."),
("もう少しで大事な書類を捨てるところでした。", "もうすこしでだいじなしょるいをすてるところでした。", "Por pouco não joguei fora um documento importante."),
("目覚ましがなかったら、遅刻するところだった。", "めざましがなかったら、ちこくするところだった。", "Sem o despertador, eu teria me atrasado."),
],
R=[
("危うく階段から落ちる____。", "Quase caí da escada.", ["ところだった", "ところでした"]),
("もう少しで試験に間に合わない____。", "Por pouco não cheguei a tempo da prova.", ["ところだった", "ところでした"]),
("注意されなかったら、間違える____。", "Se não tivessem me avisado, eu teria errado.", ["ところだった", "ところでした"]),
("もう少しで財布をなくす____。", "Por pouco não perdi a carteira.", ["ところだった", "ところでした"]),
("あと一秒遅かったら、ぶつかる____。", "Se fosse um segundo mais tarde, teria batido.", ["ところだった", "ところでした"]),
],
),
dict(
n=175,
jp="〜ところに",
rd="tokoro ni",
tr="Justo quando / Bem na hora em que / No momento em que",
ex="""ところに indica que algo inesperado aconteceu bem no momento em que a pessoa estava fazendo algo ou estava em determinada situação. Equivale a "justo quando" ou "bem na hora em que".

O acontecimento pode ser bom ou ruim, mas costuma interromper ou afetar a situação. Por exemplo, "justo quando eu ia sair, um amigo chegou".

As formas ところへ e ところを são parecidas.""",
st="""Verbo (forma dicionário / ている / た) + ところに
Adjetivo い + ところに
Substantivo + の + ところに""",
no="""ところへ é quase igual a ところに.

ところを é usado em expressões educadas, como お忙しいところを, e quando alguém é pego fazendo algo.""",
bf="ところに",
rx="ところに|ところへ",
tk=["ところ", "に"],
va=["ところに", "ところへ"],
E=[
("出かけようとしているところに、友達が来た。", "でかけようとしているところに、ともだちがきた。", "Justo quando eu ia sair, um amigo chegou."),
("お風呂に入っているところに、電話がかかってきた。", "おふろにはいっているところに、でんわがかかってきた。", "Bem na hora em que eu estava no banho, o telefone tocou."),
("困っているところに、彼が助けに来てくれた。", "こまっているところに、かれがたすけにきてくれた。", "Justo quando eu estava em apuros, ele veio me ajudar."),
("ちょうど話していたところへ、本人が現れた。", "ちょうどはなしていたところへ、ほんにんがあらわれた。", "Bem na hora em que falávamos dele, a própria pessoa apareceu."),
("寝ようとしたところに、地震が起きた。", "ねようとしたところに、じしんがおきた。", "Justo quando eu ia dormir, houve um terremoto."),
],
R=[
("食事をしている____、お客さんが来た。", "Bem na hora em que estávamos comendo, chegou uma visita.", ["ところに", "ところへ"]),
("帰ろうとした____、部長に呼ばれた。", "Justo quando eu ia embora, o gerente me chamou.", ["ところに", "ところへ"]),
("お腹がすいている____、母がケーキを持ってきた。", "Justo quando eu estava com fome, minha mãe trouxe um bolo.", ["ところに", "ところへ"]),
("家を出た____、雨が降ってきた。", "No momento em que saí de casa, começou a chover.", ["ところに", "ところへ"]),
("悩んでいる____、先生がアドバイスをくれた。", "Justo quando eu estava indeciso, o professor me deu um conselho.", ["ところに", "ところへ"]),
],
),
dict(
n=176,
jp="〜ところを見ると",
rd="tokoro wo miru to",
tr="A julgar por / Pelo visto / Já que",
ex="""ところを見ると indica que a pessoa faz uma suposição com base em algo que observou. Equivale a "a julgar por" ou "pelo visto".

A primeira parte é o fato observado, e a segunda é a conclusão provável. A frase costuma terminar com らしい, ようだ, だろう ou に違いない. Por exemplo, "a julgar pelo sorriso dela, deve ter passado na prova".

É uma expressão de dedução baseada em evidências.""",
st="""Verbo (forma simples) + ところを見ると + Suposição
Adjetivo い + ところを見ると + Suposição
Adjetivo な + な + ところを見ると + Suposição""",
no="""É parecido com からすると e ことから, mas ところを見ると se baseia em algo visto diretamente.

A forma ところを見れば tem o mesmo sentido.""",
bf="ところを見ると",
rx="ところを見ると|ところをみると|ところを見れば",
tk=["ところ", "を", "見る", "と"],
va=["ところを見ると", "ところをみると", "ところを見れば"],
E=[
("彼女が笑っているところを見ると、試験に合格したらしい。", "かのじょがわらっているところをみると、しけんにごうかくしたらしい。", "A julgar pelo sorriso dela, parece que passou na prova."),
("電気がついていないところを見ると、誰もいないようだ。", "でんきがついていないところをみると、だれもいないようだ。", "Pelo visto, como a luz está apagada, não tem ninguém."),
("毎日来るところを見ると、この店が気に入ったのだろう。", "まいにちくるところをみると、このみせがきにいったのだろう。", "Já que vem todo dia, deve ter gostado desta loja."),
("何も言わないところを見ると、怒っているに違いない。", "なにもいわないところをみると、おこっているにちがいない。", "A julgar pelo silêncio, com certeza está bravo."),
("道がぬれているところを見ると、雨が降ったようだ。", "みちがぬれているところをみると、あめがふったようだ。", "A julgar pela rua molhada, parece que choveu."),
],
R=[
("たくさん食べている____、おいしいのだろう。", "Já que está comendo bastante, deve estar gostoso.", ["ところを見ると", "ところをみると"]),
("彼が急いでいる____、約束があるらしい。", "A julgar pela pressa dele, parece que tem um compromisso.", ["ところを見ると", "ところをみると"]),
("行列ができている____、人気の店なのだろう。", "A julgar pela fila, deve ser uma loja popular.", ["ところを見ると", "ところをみると"]),
("返事が来ない____、忙しいようだ。", "Pelo visto, como a resposta não chega, deve estar ocupado.", ["ところを見ると", "ところをみると"]),
("彼女が元気な____、病気は治ったらしい。", "A julgar pela disposição dela, parece que a doença sarou.", ["ところを見ると", "ところをみると"]),
],
),
dict(
n=177,
jp="〜とも",
rd="tomo",
tr="Por mais que / Mesmo que / No mínimo",
ex="""とも tem alguns usos importantes.

O primeiro, depois da forma volitiva ou de くとも, significa "mesmo que" ou "por mais que". É uma forma escrita e formal. Por exemplo, "por mais que seja difícil, não vou desistir".

O segundo vem com adjetivos de quantidade, como 遅くとも ou 少なくとも, e significa "no mínimo" ou "no máximo". Por exemplo, "no máximo até amanhã".

Também aparece no fim de frase, como もちろんですとも, para concordar com força, com o sentido de "claro que sim".""",
st="""Verbo (forma volitiva) + とも
Adjetivo い (sem い) + くとも
Adjetivo de quantidade (sem い) + くとも
Frase + とも (concordância forte)""",
no="""Expressões comuns são 遅くとも, 少なくとも, 多くとも e 何があろうとも.

O uso no fim da frase é um pouco antiquado, mas ainda aparece na fala.""",
bf="とも",
rx="とも",
tk=["とも"],
va=["とも", "くとも", "うとも", "ようとも"],
E=[
("どんなに辛くとも、最後まで頑張る。", "どんなにつらくとも、さいごまでがんばる。", "Por mais difícil que seja, vou me esforçar até o fim."),
("遅くとも明日までに返事をください。", "おそくともあしたまでにへんじをください。", "Responda no máximo até amanhã."),
("何があろうとも、あなたの味方だ。", "なにがあろうとも、あなたのみかただ。", "Aconteça o que acontecer, estou do seu lado."),
("「手伝ってくれる？」「いいとも。」", "「てつだってくれる？」「いいとも。」", "Pode me ajudar? Claro que sim."),
("誰が反対しようとも、私は行く。", "だれがはんたいしようとも、わたしはいく。", "Mesmo que alguém se oponha, eu vou."),
],
R=[
("遅く____、九時には着きたい。", "No máximo, quero chegar às nove.", ["とも"]),
("どんなに苦しく____、あきらめない。", "Por mais doloroso que seja, não vou desistir.", ["とも"]),
("何を言われよう____、気にしない。", "Digam o que disserem, não me importo.", ["とも"]),
("少なく____、三日はかかるだろう。", "Vai levar no mínimo três dias.", ["とも"]),
("「一緒に行ってもいい？」「もちろんです____。」", "Posso ir junto? Claro que sim.", ["とも"]),
],
),
dict(
n=178,
jp="〜としても",
rd="to shite mo",
tr="Mesmo que / Ainda que / Mesmo se",
ex="""としても indica uma suposição, e mostra que, mesmo que ela seja verdade, o resultado não muda. Equivale a "mesmo que" ou "ainda que".

A situação pode ser real ou apenas imaginada. Por exemplo, "mesmo que eu ganhe na loteria, vou continuar trabalhando".

Muitas vezes vem junto com たとえ ou 仮に no começo da frase.""",
st="""Verbo (forma simples) + としても
Adjetivo い + としても
Adjetivo な / Substantivo + だ + としても""",
no="""É parecido com ても, mas としても destaca mais que a situação é uma suposição.

A forma にしても tem um sentido próximo.

Não se confunde com として, que significa "como" ou "na qualidade de".""",
bf="としても",
rx="としても",
tk=["と", "しても"],
va=["としても", "たとえ〜としても"],
E=[
("たとえ宝くじが当たったとしても、仕事は続ける。", "たとえたからくじがあたったとしても、しごとはつづける。", "Mesmo que eu ganhe na loteria, vou continuar trabalhando."),
("今から急いだとしても、間に合わないだろう。", "いまからいそいだとしても、まにあわないだろう。", "Mesmo que corra agora, provavelmente não vai dar tempo."),
("冗談だとしても、言っていいことではない。", "じょうだんだとしても、いっていいことではない。", "Mesmo que seja brincadeira, não é algo que se possa dizer."),
("高いとしても、この品質なら買う価値がある。", "たかいとしても、このひんしつならかうかちがある。", "Mesmo sendo caro, com esta qualidade vale a pena comprar."),
("仮に彼が来なかったとしても、計画は進める。", "かりにかれがこなかったとしても、けいかくはすすめる。", "Mesmo que ele não venha, vamos seguir com o plano."),
],
R=[
("たとえ反対された____、私の気持ちは変わらない。", "Mesmo que sejam contra, meu sentimento não vai mudar.", ["としても"]),
("雨が降った____、試合は行われる。", "Mesmo que chova, a partida será realizada.", ["としても"]),
("本当だ____、信じられない。", "Mesmo que seja verdade, não consigo acreditar.", ["としても"]),
("今から勉強した____、合格は難しい。", "Mesmo que estude a partir de agora, será difícil passar.", ["としても"]),
("失敗した____、後悔はしない。", "Mesmo que eu falhe, não vou me arrepender.", ["としても"]),
],
),
dict(
n=179,
jp="〜つつ",
rd="tsutsu",
tr="Enquanto / Embora / Mesmo",
ex="""つつ tem dois usos principais.

O primeiro indica que duas ações acontecem ao mesmo tempo. Equivale a "enquanto". É uma forma mais formal de ながら. Por exemplo, "pensando no futuro, escolhi o trabalho".

O segundo, muitas vezes como つつも, indica contraste. Equivale a "embora" ou "mesmo". A pessoa sabe ou sente algo, mas faz o contrário. Por exemplo, "embora saiba que faz mal, continuo fumando".""",
st="""Verbo (forma ます sem ます) + つつ
Verbo (forma ます sem ます) + つつも""",
no="""No primeiro uso, o sujeito das duas ações é o mesmo.

No segundo uso, expressões comuns são 悪いと知りつつ, 思いつつ e 言いつつ.

É mais formal que ながら e aparece mais na escrita.""",
bf="つつ",
rx="つつ",
tk=["つつ"],
va=["つつ", "つつも"],
E=[
("体に悪いと知りつつ、たばこをやめられない。", "からだにわるいとしりつつ、たばこをやめられない。", "Embora saiba que faz mal, não consigo parar de fumar."),
("将来のことを考えつつ、仕事を選んだ。", "しょうらいのことをかんがえつつ、しごとをえらんだ。", "Escolhi o trabalho pensando no futuro."),
("早く寝ようと思いつつも、つい夜更かししてしまう。", "はやくねようとおもいつつも、ついよふかししてしまう。", "Embora pense em dormir cedo, acabo ficando acordado até tarde."),
("景色を楽しみつつ、山道を歩いた。", "けしきをたのしみつつ、やまみちをあるいた。", "Caminhei pela trilha enquanto apreciava a paisagem."),
("悪いと思いつつ、彼の手紙を読んでしまった。", "わるいとおもいつつ、かれのてがみをよんでしまった。", "Mesmo achando errado, acabei lendo a carta dele."),
],
R=[
("いけないと知り____、うそをついてしまった。", "Mesmo sabendo que não devia, acabei mentindo.", ["つつ", "つつも"]),
("音楽を聞き____、勉強する。", "Estudo enquanto ouço música.", ["つつ"]),
("やせたいと思い____、ケーキを食べてしまう。", "Embora queira emagrecer, acabo comendo bolo.", ["つつ", "つつも"]),
("みんなの意見を聞き____、計画を進める。", "Vamos avançar com o plano ouvindo a opinião de todos.", ["つつ"]),
("返事をしなければと思い____、まだ書いていない。", "Embora pense que preciso responder, ainda não escrevi.", ["つつ", "つつも"]),
],
),
dict(
n=180,
jp="〜つつある",
rd="tsutsu aru",
tr="Estar em processo de / Vir + gerúndio / Pouco a pouco",
ex="""つつある indica que uma mudança está acontecendo agora, aos poucos, em uma direção. Equivale a "estar em processo de" ou "vir + gerúndio", como "vem diminuindo".

É usado com verbos de mudança, como aumentar, diminuir, mudar, melhorar e desaparecer. Por exemplo, "a população vem diminuindo".

É uma expressão formal, comum em notícias e textos.""",
st="""Verbo (forma ます sem ます) + つつある""",
no="""É parecido com ている, mas つつある destaca que a mudança ainda está em andamento.

Não se usa com verbos que não indicam mudança, como 読む ou 食べる.""",
bf="つつある",
rx="つつある|つつあります|つつあった",
tk=["つつ", "ある"],
va=["つつある", "つつあります", "つつあった"],
E=[
("日本の人口は減りつつある。", "にほんのじんこうはへりつつある。", "A população do Japão vem diminuindo."),
("景気は回復しつつあります。", "けいきはかいふくしつつあります。", "A economia está em processo de recuperação."),
("地球の気温は上がりつつある。", "ちきゅうのきおんはあがりつつある。", "A temperatura da Terra vem subindo."),
("古い習慣が消えつつある。", "ふるいしゅうかんがきえつつある。", "Os costumes antigos estão desaparecendo pouco a pouco."),
("彼の病気はよくなりつつある。", "かれのびょうきはよくなりつつある。", "A doença dele vem melhorando."),
],
R=[
("この町は大きく変わり____。", "Esta cidade vem mudando muito.", ["つつある", "つつあります"]),
("外国人観光客が増え____。", "O número de turistas estrangeiros vem aumentando.", ["つつある", "つつあります"]),
("森林が失われ____。", "As florestas estão sendo perdidas pouco a pouco.", ["つつある", "つつあります"]),
("台風が近づき____。", "O tufão está se aproximando.", ["つつある", "つつあります"]),
("新しい技術が広まり____。", "A nova tecnologia vem se espalhando.", ["つつある", "つつあります"]),
],
),
]
