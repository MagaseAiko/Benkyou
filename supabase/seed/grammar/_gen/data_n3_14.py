G = [
dict(
n=131,
jp="〜ている場合じゃない",
rd="te iru baai ja nai",
tr="Não é hora de / Não dá para ficar",
ex="""ている場合じゃない é usado para dizer que, na situação atual, não é momento de fazer certa coisa, porque há algo mais urgente ou importante. Equivale a "não é hora de..." ou "não dá para ficar...".

Ele junta a forma ている com 場合 (situação, ocasião) e じゃない (não é). A ideia literal é "não é situação de estar fazendo isso".

O tom é de urgência, alerta ou repreensão, para si mesmo ou para outra pessoa. Por exemplo, "amanhã tem prova, não é hora de ficar brincando" ou "não adianta chorar, temos que fazer alguma coisa".

A forma ている場合ではない é mais formal, e てる場合じゃない é a versão falada.""",
st="""Verbo na forma ている + 場合じゃない
Verbo na forma ている + 場合ではない (formal)
Verbo na forma てる + 場合じゃない (fala)""",
no="""Com substantivos, a estrutura também existe: 今はけんかしている場合じゃない ou 今は冗談を言う場合じゃない.

É muito comum em mangás e animes, em momentos de tensão.

Às vezes, a frase vem seguida do que realmente deve ser feito, como 早く〜しないと.""",
bf="ている場合じゃない",
rx="ている場合じゃない|ている場合ではない|てる場合じゃない|でいる場合じゃない|でいる場合ではない|ている場合ではありません",
tk=["ている", "場合", "じゃない"],
va=["ている場合じゃない", "ている場合ではない", "てる場合じゃない"],
E=[
("明日は試験だから、遊んでいる場合じゃない。", "あしたはしけんだから、あそんでいるばあいじゃない。", "Amanhã tem prova, então não é hora de ficar brincando."),
("寝ている場合ではない。早く準備しなさい。", "ねているばあいではない。はやくじゅんびしなさい。", "Não é hora de dormir. Vá se preparar logo."),
("泣いている場合じゃない。何とかしないと。", "ないているばあいじゃない。なんとかしないと。", "Não dá para ficar chorando. Temos que fazer alguma coisa."),
("みんな真剣なんだから、今は笑っている場合ではありません。", "みんなしんけんなんだから、いまはわらっているばあいではありません。", "Todos estão sérios, então agora não é hora de rir."),
("宿題が終わっていないのに、のんびりテレビを見ている場合じゃないよ。", "しゅくだいがおわっていないのに、のんびりテレビをみているばあいじゃないよ。", "Você nem terminou a lição, não é hora de ficar vendo TV tranquilo."),
],
R=[
("締め切りは明日だ。休ん____。", "O prazo é amanhã. Não é hora de descansar.", ["でいる場合じゃない", "でいる場合ではない"]),
("電車が来る！のんびり話し____。", "O trem está chegando! Não dá para ficar conversando com calma.", ["ている場合じゃない", "ている場合ではない"]),
("火事だ！写真を撮っ____。", "É um incêndio! Não é hora de tirar fotos.", ["ている場合じゃない", "ている場合ではない"]),
("試験が近いから、ゲームをし____。", "A prova está chegando, então não é hora de jogar videogame.", ["ている場合じゃない", "ている場合ではない"]),
("もう時間がない。迷っ____。", "Não temos mais tempo. Não dá para ficar em dúvida.", ["ている場合じゃない", "ている場合ではない"]),
],
),
dict(
n=132,
jp="〜的",
rd="teki",
tr="Sufixo -ico / Sufixo -al / Do ponto de vista de",
ex="""的 é um sufixo que transforma substantivos (geralmente de origem chinesa) em adjetivos な. Ele corresponde a terminações do português como "-ico" e "-al", como em 伝統的 (tradicional), 経済的 (econômico) e 国際的 (internacional).

O resultado funciona como um adjetivo な:
• Antes de substantivo: 的な, como 伝統的な料理 (comida tradicional).
• Como advérbio: 的に, como 経済的に難しい (economicamente difícil).
• No fim da frase: 的だ.

Com に e は, a forma 的には indica um ponto de vista: 個人的には significa "pessoalmente", "do meu ponto de vista".

的 é muito usado em textos formais, notícias, discussões e na linguagem acadêmica.""",
st="""Substantivo + 的な + Substantivo (伝統的な / 国際的な)
Substantivo + 的に + Verbo / Adjetivo (経済的に / 積極的に)
Substantivo + 的だ / 的です
Substantivo + 的には (do ponto de vista de)""",
no="""Nem todo substantivo aceita 的. Ele é usado principalmente com palavras de dois kanji de origem chinesa.

Na fala jovem, 的 aparece de forma criativa, como 私的には ("pra mim"), com tom bem casual.

Palavras como 積極的 (proativo) e 消極的 (passivo) são muito usadas para descrever personalidades.""",
bf="的",
rx="的",
tk=["的"],
va=["的", "的な", "的に", "的には"],
E=[
("彼は積極的な性格だ。", "かれはせっきょくてきなせいかくだ。", "Ele tem uma personalidade proativa."),
("この計画は経済的に難しい。", "このけいかくはけいざいてきにむずかしい。", "Este plano é economicamente difícil."),
("日本の伝統的な料理を食べたい。", "にほんのでんとうてきなりょうりをたべたい。", "Quero comer comida tradicional japonesa."),
("彼女は国際的に有名な歌手だ。", "かのじょはこくさいてきにゆうめいなかしゅだ。", "Ela é uma cantora internacionalmente famosa."),
("個人的には、この意見に賛成です。", "こじんてきには、このいけんにさんせいです。", "Pessoalmente, concordo com esta opinião."),
],
R=[
("京都には伝統____な建物が多い。", "Kyoto tem muitos prédios tradicionais.", ["的"]),
("彼の説明はとても論理____だ。", "A explicação dele é muito lógica.", ["的"]),
("個人____には、この映画が好きです。", "Pessoalmente, eu gosto deste filme.", ["的"]),
("この計画は経済____に無理だ。", "Este plano é economicamente inviável.", ["的"]),
("彼女は会議でいつも積極____に意見を言う。", "Ela sempre dá opiniões de forma proativa nas reuniões.", ["的"]),
],
),
dict(
n=133,
jp="〜ても始まらない",
rd="te mo hajimaranai",
tr="Não adianta / Não leva a nada",
ex="""ても始まらない é usado para dizer que fazer algo não serve para nada, porque não vai mudar a situação. Equivale a "não adianta" ou "não leva a nada".

A ideia literal é "mesmo fazendo isso, nada começa", ou seja, a ação não leva a nenhum avanço.

É muito usado com ações como chorar, reclamar, se arrepender ou ficar preocupado sozinho. O tom é de conselho ou consolo, incentivando a pessoa a parar e fazer algo mais útil.

Por exemplo, "não adianta se arrepender agora" ou "não adianta ficar se preocupando sozinho, vamos pedir conselho".

O sentido é muito parecido com てもしょうがない.""",
st="""Verbo na forma て + も始まらない
Verbo na forma て + も始まりません (educado)

Escrita: 始まらない / はじまらない""",
no="""A expressão 今さら〜ても始まらない ("a esta altura, não adianta...") é muito comum.

Comparado a てもしょうがない, ても始まらない destaca que a ação não leva a nenhum progresso.

Muitas vezes, a frase continua com uma sugestão positiva, como "vamos pensar no próximo passo".""",
bf="ても始まらない",
rx="ても始まらない|でも始まらない|てもはじまらない|でもはじまらない|ても始まりません|でも始まりません",
tk=["ても", "始まらない"],
va=["ても始まらない", "でも始まらない", "ても始まりません"],
E=[
("今さら後悔しても始まらない。", "いまさらこうかいしてもはじまらない。", "A esta altura, não adianta se arrepender."),
("泣いても始まらないよ。次を頑張ろう。", "ないてもはじまらないよ。つぎをがんばろう。", "Não adianta chorar. Vamos nos esforçar na próxima."),
("ここで文句を言っても始まらない。", "ここでもんくをいってもはじまらない。", "Não adianta reclamar aqui."),
("一人で悩んでも始まらないから、相談しよう。", "ひとりでなやんでもはじまらないから、そうだんしよう。", "Não adianta ficar se preocupando sozinho, vamos pedir conselho."),
("過去のことを気にしても始まりません。", "かこのことをきにしてもはじまりません。", "Não adianta se preocupar com o passado."),
],
R=[
("終わったことを考え____。", "Não adianta pensar no que já passou.", ["ても始まらない", "ても始まりません"]),
("怒っ____から、落ち着いて。", "Não adianta ficar bravo, então se acalme.", ["ても始まらない"]),
("一人で悩ん____よ。", "Não adianta ficar se preocupando sozinho.", ["でも始まらない"]),
("今さら謝っ____。", "A esta altura, não adianta pedir desculpas.", ["ても始まらない", "ても始まりません"]),
("ここで待っ____から、探しに行こう。", "Não adianta ficar esperando aqui, vamos procurar.", ["ても始まらない"]),
],
),
dict(
n=134,
jp="〜てもかまわない",
rd="te mo kamawanai",
tr="Pode / Não tem problema / Não me importo",
ex="""てもかまわない é usado para dar ou pedir permissão, ou para dizer que algo não é um problema. Equivale a "pode", "não tem problema" ou "não me importo".

かまう significa "se importar". Assim, かまわない é "não me importo". A ideia literal é "mesmo que faça isso, não me importo".

O sentido é parecido com てもいい, mas てもかまわない soa um pouco mais formal e educado. Por isso, é comum em situações de trabalho e com pessoas desconhecidas.

Com a forma ない, なくてもかまわない significa "não precisa".

Também pode expressar flexibilidade em relação às próprias preferências, como "pode ser caro, não me importo".""",
st="""Verbo na forma て + もかまわない / もかまいません
Verbo na forma ない sem い + くてもかまわない (não precisa)
Adjetivo い sem い + くてもかまわない
Substantivo / Adjetivo な + でもかまわない

Pergunta: 〜てもかまいませんか
Escrita: かまわない / 構わない""",
no="""Em perguntas educadas, てもかまいませんか é uma alternativa mais formal a てもいいですか.

A expressão 気にしなくてかまいません ("não precisa se preocupar") é comum em atendimento ao cliente.

Responder かまいませんよ é uma forma educada de dizer "pode, sim".""",
bf="てもかまわない",
rx="てもかまわない|でもかまわない|ても構わない|でも構わない|てもかまいません|でもかまいません",
tk=["ても", "かまわない"],
va=["てもかまわない", "てもかまいません", "でもかまわない", "なくてもかまわない"],
E=[
("すみません、ここに座ってもかまいませんか。", "すみません、ここにすわってもかまいませんか。", "Com licença, posso me sentar aqui?"),
("明日は来なくてもかまわない。", "あしたはこなくてもかまわない。", "Amanhã você não precisa vir."),
("この書類は鉛筆で書いてもかまいません。", "このしょるいはえんぴつでかいてもかまいません。", "Este documento pode ser preenchido a lápis."),
("少しぐらい遅れてもかまわないよ。", "すこしぐらいおくれてもかまわないよ。", "Não tem problema se atrasar um pouquinho."),
("高くてもかまわないから、いい物を買いたい。", "たかくてもかまわないから、いいものをかいたい。", "Não me importo se for caro, quero comprar algo bom."),
],
R=[
("この部屋を使っ____か。", "Posso usar esta sala?", ["てもかまいません"]),
("忙しければ、手伝わなく____。", "Se estiver ocupado, não precisa ajudar.", ["てもかまわない", "てもかまいません"]),
("質問には英語で答え____。", "Pode responder às perguntas em inglês.", ["てもかまいません", "てもかまわない"]),
("部屋は駅に近ければ、狭くても____。", "Se o apartamento for perto da estação, não me importo que seja pequeno.", ["かまわない", "かまいません"]),
("少しぐらい高く____から、この店で買おう。", "Não me importo se for um pouco mais caro, vamos comprar nesta loja.", ["てもかまわない"]),
],
),
dict(
n=135,
jp="〜てもしょうがない",
rd="te mo shou ga nai",
tr="Não adianta / Não tem jeito / Não serve de nada",
ex="""てもしょうがない é usado para dizer que fazer algo é inútil, porque não vai mudar a situação. Equivale a "não adianta", "não tem jeito" ou "não serve de nada".

しょうがない significa "não há jeito" ou "não há remédio". Assim, a estrutura diz "mesmo fazendo isso, não há jeito".

Ela é muito usada para consolar alguém ou para se resignar diante de algo que já aconteceu, como se arrepender, ficar bravo ou se preocupar.

O sentido é parecido com ても始まらない. A forma てもしかたがない tem exatamente o mesmo sentido e é um pouco mais formal.""",
st="""Verbo na forma て + もしょうがない
Verbo na forma て + もしょうがありません (educado)

Variação: てもしかたがない / てもしかたない""",
no="""しょうがない sozinho é uma expressão muito comum, como "fazer o quê" ou "não tem jeito", aceitando a situação.

Não confunda com てしょうがない (sem も), que significa "muito", "demais" e expressa um sentimento forte.

A diferença é só o も: ても = "não adianta"; て = "demais".""",
bf="てもしょうがない",
rx="てもしょうがない|でもしょうがない|てもしかたがない|でもしかたがない|てもしょうがありません",
tk=["ても", "しょうがない"],
va=["てもしょうがない", "てもしかたがない", "てもしょうがありません"],
E=[
("今さら後悔してもしょうがない。", "いまさらこうかいしてもしょうがない。", "A esta altura, não adianta se arrepender."),
("一人で悩んでもしょうがないよ。", "ひとりでなやんでもしょうがないよ。", "Não adianta ficar se preocupando sozinho."),
("彼に文句を言ってもしょうがない。", "かれにもんくをいってもしょうがない。", "Não adianta reclamar com ele."),
("もう終わったことだから、泣いてもしかたがない。", "もうおわったことだから、ないてもしかたがない。", "Já passou, então não adianta chorar."),
("過ぎたことを考えてもしょうがありません。", "すぎたことをかんがえてもしょうがありません。", "Não adianta ficar pensando no que já passou."),
],
R=[
("そんなことで怒っ____。", "Não adianta ficar bravo por uma coisa dessas.", ["てもしょうがない", "てもしかたがない"]),
("今心配し____から、もう寝よう。", "Não adianta se preocupar agora, então vamos dormir.", ["てもしょうがない", "てもしかたがない"]),
("電車はもう出たから、今から急い____。", "O trem já saiu, então não adianta correr agora.", ["でもしょうがない", "でもしかたがない"]),
("彼を責め____。", "Não adianta culpá-lo.", ["てもしょうがない", "てもしかたがない"]),
("天気のことは気にし____。", "Não adianta se preocupar com o tempo.", ["てもしょうがない", "てもしかたがない"]),
],
),
dict(
n=136,
jp="〜と言えば",
rd="to ieba",
tr="Falando de / Por falar em / Quando se pensa em",
ex="""と言えば tem dois usos principais.

O primeiro é associar uma palavra à coisa mais típica ou famosa ligada a ela. Equivale a "falando de..." ou "quando se pensa em...". Por exemplo, "falando de Japão, a primeira coisa é o Monte Fuji" ou "quando se pensa em inverno, é comida de panela".

O segundo é retomar algo que alguém disse e mudar um pouco o assunto. Equivale a "por falar em...". Por exemplo, alguém menciona o Tanaka, e você responde "por falar no Tanaka, dizem que ele vai se casar".

A forma と言ったら tem sentido parecido e é um pouco mais enfática.""",
st="""Substantivo + と言えば、 + Associação típica
(Retomando a fala do outro) Substantivo + と言えば、 + Novo assunto

Variações: といえば / と言ったら / といったら""",
no="""そう言えば (por falar nisso) é uma expressão muito comum para lembrar de algo de repente.

と言えば aparece muito em perguntas como 日本と言えば何ですか ("o que vem à mente quando se fala de Japão?").

Na escrita, quando o sentido é abstrato, costuma-se usar hiragana: といえば.""",
bf="と言えば",
rx="と言えば|といえば|と言ったら|といったら",
tk=["と", "言えば"],
va=["と言えば", "といえば", "と言ったら", "といったら"],
E=[
("日本と言えば、富士山ですね。", "にほんといえば、ふじさんですね。", "Falando de Japão, o Monte Fuji é o que vem à mente, né?"),
("夏と言えば、海に行きたくなる。", "なつといえば、うみにいきたくなる。", "Quando se pensa em verão, dá vontade de ir à praia."),
("京都と言えば、お寺が有名だ。", "きょうとといえば、おてらがゆうめいだ。", "Falando de Kyoto, os templos são famosos."),
("田中さんと言えば、来月結婚するそうですよ。", "たなかさんといえば、らいげつけっこんするそうですよ。", "Por falar no Tanaka, dizem que ele vai se casar no mês que vem."),
("冬と言えば、やっぱり鍋料理だ。", "ふゆといえば、やっぱりなべりょうりだ。", "Quando se pensa em inverno, é comida de panela, claro."),
],
R=[
("北海道____、雪とラーメンだ。", "Falando de Hokkaido, é neve e ramen.", ["と言えば", "といえば"]),
("ブラジル____、サッカーとサンバが有名だ。", "Falando de Brasil, futebol e samba são famosos.", ["と言えば", "といえば"]),
("「旅行の話をしよう。」「旅行____、来月どこに行くの？」", "\"Vamos falar de viagem.\" \"Por falar em viagem, aonde você vai no mês que vem?\"", ["と言えば", "といえば"]),
("春____、桜ですね。", "Falando de primavera, são as cerejeiras, né?", ["と言えば", "といえば"]),
("日本の食べ物____、すしでしょう。", "Falando de comida japonesa, deve ser sushi.", ["と言えば", "といえば"]),
],
),
dict(
n=137,
jp="〜といい・〜たらいい",
rd="to ii / tara ii",
tr="Tomara que / Seria bom se / É bom (fazer)",
ex="""といい e たらいい têm dois usos principais.

O primeiro é expressar um desejo ou esperança: "tomara que..." ou "seria bom se...". Muitas vezes, aparece com ね, なあ ou のに no final. Por exemplo, "tomara que amanhã faça sol" ou "seria bom se eu passasse na prova".

O segundo é dar um conselho ou recomendação: "é bom fazer..." ou "é recomendável...". Por exemplo, "se não entender, é bom perguntar ao professor".

といい vem depois do verbo na forma de dicionário ou na forma ない. たらいい usa a forma たら. Os sentidos são muito parecidos, e ばいい também pode ser usado em muitos casos.

Com のに, といいのに expressa um desejo sobre algo que não está acontecendo, com um tom de lamento.""",
st="""Verbo (forma de dicionário / ない) + といい + ね / なあ / のに (desejo)
Verbo na forma た + らいい + なあ (desejo)
Verbo (forma de dicionário) + といい + ですよ (conselho)""",
no="""Para falar do desejo de outra pessoa, é comum dizer といいですね, mostrando que você também torce por ela.

Com o sujeito sendo você mesmo e uma ação que você controla, essas formas soam como conselho a si mesmo.

ばいい, といい e たらいい podem ser trocados em muitos contextos, mas といい soa natural em conselhos gerais.""",
bf="といい",
rx="といい|たらいい|だらいい|ばいい",
tk=["と", "いい"],
va=["といい", "たらいい", "ばいい", "といいのに"],
E=[
("明日、晴れるといいですね。", "あした、はれるといいですね。", "Tomara que faça sol amanhã, né?"),
("早く元気になるといいね。", "はやくげんきになるといいね。", "Tomara que você melhore logo."),
("わからないことは、先生に聞くといいですよ。", "わからないことは、せんせいにきくといいですよ。", "É bom perguntar ao professor o que você não entende."),
("試験に合格できたらいいなあ。", "しけんにごうかくできたらいいなあ。", "Seria ótimo se eu passasse na prova."),
("疲れたときは、温かいお風呂に入るといい。", "つかれたときは、あたたかいおふろにはいるといい。", "Quando estiver cansado, é bom tomar um banho quente de banheira."),
],
R=[
("旅行の日、雨が降らない____ですね。", "Tomara que não chova no dia da viagem, né?", ["といい"]),
("彼女がパーティーに来てくれ____なあ。", "Seria bom se ela viesse à festa.", ["たらいい"]),
("京都に行くなら、金閣寺を見る____ですよ。", "Se for a Kyoto, é bom ver o Kinkaku-ji.", ["といい"]),
("早く夏休みになる____のに。", "Como seria bom se as férias de verão chegassem logo.", ["といい"]),
("宝くじが当たっ____なあ。", "Seria ótimo se eu ganhasse na loteria.", ["たらいい"]),
],
),
dict(
n=138,
jp="〜といっても",
rd="to itte mo",
tr="Embora se diga que / Na verdade / É... mas",
ex="""といっても é usado para corrigir ou limitar uma impressão que a frase anterior poderia dar. Equivale a "embora se diga que..., na verdade..." ou "é..., mas...".

A primeira parte apresenta algo que poderia soar impressionante ou importante, e a segunda mostra que a realidade é mais simples, menor ou diferente do esperado.

Por exemplo, "sei cozinhar, mas só coisas simples", "sou presidente, mas a empresa só tem três funcionários" ou "folga, mas só de dois dias".

O tom costuma ser de modéstia, honestidade ou de ajuste da expectativa do ouvinte.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.""",
st="""Substantivo + といっても、 + Realidade mais simples
Verbo / Adjetivo (forma simples) + といっても、 + Realidade

Escrita: といっても / と言っても""",
no="""といっても é diferente de と言ってもいい (pode-se dizer que), que reforça uma afirmação.

É muito útil para falar de si mesmo com modéstia, evitando parecer que está se gabando.

Na fala, também se usa って言っても com o mesmo sentido.""",
bf="といっても",
rx="といっても|と言っても",
tk=["と", "いって", "も"],
va=["といっても", "と言っても"],
E=[
("料理ができるといっても、簡単なものだけです。", "りょうりができるといっても、かんたんなものだけです。", "Sei cozinhar, mas só coisas simples."),
("休みといっても、二日だけだ。", "やすみといっても、ふつかだけだ。", "Folga, sim, mas só de dois dias."),
("日本語が話せるといっても、日常会話程度です。", "にほんごがはなせるといっても、にちじょうかいわていどです。", "Falo japonês, mas só o nível de conversa do dia a dia."),
("社長といっても、社員は三人しかいない。", "しゃちょうといっても、しゃいんはさんにんしかいない。", "Sou presidente, mas a empresa só tem três funcionários."),
("この町は寒いといっても、雪は降らない。", "このまちはさむいといっても、ゆきはふらない。", "Esta cidade é fria, mas não chega a nevar."),
],
R=[
("旅行____、近くの温泉に行っただけだ。", "Viagem, sim, mas só fui a uma fonte termal aqui perto.", ["といっても", "と言っても"]),
("英語ができる____、少しだけです。", "Sei inglês, mas só um pouco.", ["といっても", "と言っても"]),
("仕事が忙しい____、毎日ではない。", "O trabalho é corrido, mas não todos os dias.", ["といっても", "と言っても"]),
("家____、小さなアパートです。", "Casa, sim, mas é um apartamento pequeno.", ["といっても", "と言っても"]),
("夏休み____、宿題がたくさんある。", "São férias de verão, mas tem muita lição.", ["といっても", "と言っても"]),
],
),
dict(
n=139,
jp="〜ということだ",
rd="to iu koto da",
tr="Dizem que / Quer dizer que / Isso significa que",
ex="""ということだ tem dois usos principais.

O primeiro é repassar uma informação que se ouviu ou leu, de forma um pouco formal. Equivale a "dizem que" ou "segundo informações". É comum junto com によると ou の話では. Por exemplo, "segundo a previsão, amanhã vai chover".

O segundo é tirar uma conclusão a partir de algo que se observou ou ouviu. Equivale a "quer dizer que" ou "isso significa que". Por exemplo, "as luzes estão apagadas. Quer dizer que não tem mais ninguém".

Com つまり, a estrutura つまり〜ということですね é muito usada para confirmar se você entendeu algo corretamente.

Ele vem depois da forma simples completa. Com substantivos e adjetivos な, usa-se だ antes.""",
st="""Fonte + によると、 + Frase (forma simples) + ということだ (dizem que)
Fato observado (com ponto final) + Frase + ということだ (conclusão)
つまり、 + Frase + ということですね (confirmação)

Educado: ということです
Fala casual: ってことだ""",
no="""No uso de "dizem que", ということだ soa mais formal que そうだ.

No uso de conclusão, a frase muitas vezes começa com つまり ou それは.

Diferente de ということ (o fato de que), aqui a expressão termina a frase com だ ou です.""",
bf="ということだ",
rx="ということだ|ということです|ってことだ",
tk=["という", "こと", "だ"],
va=["ということだ", "ということです", "ってことだ"],
E=[
("天気予報によると、明日は雨が降るということだ。", "てんきよほうによると、あしたはあめがふるということだ。", "Segundo a previsão do tempo, amanhã vai chover."),
("先生の話では、試験は来週だということです。", "せんせいのはなしでは、しけんはらいしゅうだということです。", "Pelo que o professor disse, a prova é na semana que vem."),
("新聞によると、来年から物価が上がるということだ。", "しんぶんによると、らいねんからぶっかがあがるということだ。", "Segundo o jornal, os preços vão subir a partir do ano que vem."),
("電気が消えている。もう誰もいないということだ。", "でんきがきえている。もうだれもいないということだ。", "As luzes estão apagadas. Quer dizer que não tem mais ninguém."),
("つまり、彼は来ないということですね。", "つまり、かれはこないということですね。", "Então, quer dizer que ele não vem, certo?"),
],
R=[
("ニュースによると、大きな台風が来る____。", "Segundo o noticiário, vem um grande tufão.", ["ということだ", "ということです"]),
("田中さんの話では、部長は来月退職する____。", "Pelo que o Tanaka disse, o gerente vai se aposentar no mês que vem.", ["ということだ", "ということです"]),
("返事がないのは、反対だ____。", "Não ter resposta quer dizer que ele é contra.", ["ということだ", "ということです"]),
("地図によると、この道をまっすぐ行けばいい____。", "Segundo o mapa, basta seguir reto por esta rua.", ["ということだ", "ということです"]),
("つまり、明日は休みだ____ね。", "Então, quer dizer que amanhã é folga, né?", ["ということです"]),
],
),
dict(
n=140,
jp="〜というのは",
rd="to iu no wa",
tr="O que se chama de... é / Significa / Quanto a",
ex="""というのは é usado para apresentar uma palavra, uma expressão ou uma ideia que vai ser explicada, definida ou comentada. Equivale a "o que se chama de... é", "... significa" ou "quanto a...".

O uso mais comum é definir palavras e conceitos. A frase costuma terminar com ことです ou という意味です. Por exemplo, "tsundoku é comprar livros e não ler".

Também é usado para pedir ou dar explicações sobre algo que alguém disse, como "é verdade que você não pode ir amanhã?" (literalmente, "isso de você não poder ir, é verdade?").

Na fala, というのは costuma virar っていうのは. Em textos formais, também aparece とは, com o mesmo sentido.""",
st="""Palavra / Expressão + というのは、 + Definição + ことだ / という意味だ
Frase (forma simples) + というのは、 + Comentário / Pergunta

Fala casual: っていうのは
Formal: 〜とは""",
no="""Para perguntar o significado de uma palavra, 〜というのは何ですか ou 〜って何ですか são muito úteis.

Em textos acadêmicos e dicionários, とは é a forma mais comum: 「花見」とは….

というのは também pode introduzir um motivo no começo de uma frase, com sentido de "é que...", num uso mais avançado.""",
bf="というのは",
rx="というのは|っていうのは|とは",
tk=["という", "の", "は"],
va=["というのは", "っていうのは", "とは"],
E=[
("「積読」というのは、本を買って読まないことです。", "「つんどく」というのは、ほんをかってよまないことです。", "\"Tsundoku\" é comprar livros e não ler."),
("親友というのは、何でも話せる友達のことだ。", "しんゆうというのは、なんでもはなせるともだちのことだ。", "Melhor amigo é aquele com quem se pode falar sobre tudo."),
("明日行けないというのは、本当ですか。", "あしたいけないというのは、ほんとうですか。", "É verdade que você não pode ir amanhã?"),
("彼が来ないというのは、何か理由があるのだろう。", "かれがこないというのは、なにかりゆうがあるのだろう。", "Se ele não vem, deve haver algum motivo."),
("「JR」というのは、日本の鉄道会社のことです。", "「ジェイアール」というのは、にほんのてつどうがいしゃのことです。", "\"JR\" é uma companhia ferroviária japonesa."),
],
R=[
("「花見」____、桜を見ながら食事をすることです。", "\"Hanami\" é comer e beber enquanto se admiram as cerejeiras.", ["というのは"]),
("彼女が結婚した____、本当ですか。", "É verdade que ela se casou?", ["というのは"]),
("「お疲れ様」____、仕事の後にする挨拶です。", "\"Otsukaresama\" é um cumprimento usado depois do trabalho.", ["というのは"]),
("外国に留学する____、簡単なことではない。", "Fazer intercâmbio no exterior não é algo simples.", ["というのは"]),
("自由____、何でもしていいという意味ではない。", "Liberdade não significa poder fazer qualquer coisa.", ["というのは"]),
],
),
]
