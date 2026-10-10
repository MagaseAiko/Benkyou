G = [
dict(
n=31,
jp="〜ごとき / 〜ごとく / 〜ごとし",
rd="gotoki / gotoku / gotoshi",
tr="Como / Tal qual / Igual a",
ex="""ごとき, ごとく e ごとし são formas antigas e formais de ような, ように e ようだ. Equivalem a "como" ou "tal qual".

ごとく funciona como advérbio, como em "o tempo passou como uma flecha". ごとき vem antes de substantivos, como em "uma pessoa como ele". ごとし fica no fim da frase, como em "a vida é como um sonho".

ごとき também pode expressar desprezo ou modéstia, como em "alguém como eu" ou "uma coisa dessas".""",
st="""Substantivo + の + ごとく + Verbo
Substantivo + の + ごとき + Substantivo
Substantivo + の + ごとし
Verbo (forma simples) + が + ごとく""",
no="""São usadas principalmente na escrita, em provérbios e em textos literários.

Expressões comuns são 例のごとく, 前述のごとく e 光陰矢のごとし.

Na fala, ごとき aparece com tom de desprezo, como 私ごとき ou お前ごとき.""",
bf="ごとく",
rx="ごとく|ごとき|ごとし",
tk=["ごとく"],
va=["ごとく", "ごとき", "ごとし"],
E=[
("時間は矢のごとく過ぎていく。", "じかんはやのごとくすぎていく。", "O tempo passa como uma flecha."),
("例のごとく、彼は遅れてきた。", "れいのごとく、かれはおくれてきた。", "Como de costume, ele chegou atrasado."),
("私ごときに、そんな大役は務まりません。", "わたしごときに、そんなたいやくはつとまりません。", "Alguém como eu não daria conta de um papel tão importante."),
("人生は夢のごとし。", "じんせいはゆめのごとし。", "A vida é como um sonho."),
("彼は何事もなかったかのごとく笑っていた。", "かれはなにごともなかったかのごとくわらっていた。", "Ele ria como se nada tivesse acontecido."),
],
R=[
("前述の____、この計画には問題がある。", "Como mencionado anteriormente, este plano tem problemas.", ["ごとく"]),
("彼女は花の____美しい。", "Ela é bela como uma flor.", ["ごとく"]),
("お前____に負けるはずがない。", "Não tenho como perder para alguém como você.", ["ごとき"]),
("光陰矢の____。", "O tempo voa como uma flecha.", ["ごとし"]),
("彼は自分が王である____振る舞った。", "Ele agiu como se fosse um rei.", ["かのごとく"]),
],
),
dict(
n=32,
jp="〜ぐるみ",
rd="gurumi",
tr="Inteiro / Todo o / Junto com",
ex="""ぐるみ indica que algo envolve um grupo inteiro, incluindo todos os seus membros. Equivale a "inteiro" ou "todo o".

Por exemplo, 家族ぐるみ significa "envolvendo toda a família", e 町ぐるみ significa "a cidade inteira".

Também pode significar "junto com", como em 身ぐるみ, "tudo o que se tem no corpo".""",
st="""Substantivo (grupo) + ぐるみ + で / の""",
no="""Expressões comuns são 家族ぐるみの付き合い, 町ぐるみ, 会社ぐるみ e 身ぐるみはがされる.

会社ぐるみ costuma aparecer em notícias sobre fraudes que envolvem a empresa inteira.""",
bf="ぐるみ",
rx="ぐるみ",
tk=["ぐるみ"],
va=["ぐるみ", "ぐるみで", "ぐるみの"],
E=[
("彼とは家族ぐるみの付き合いをしている。", "かれとはかぞくぐるみのつきあいをしている。", "Nossa amizade com ele envolve a família inteira."),
("町ぐるみで祭りの準備をした。", "まちぐるみでまつりのじゅんびをした。", "A cidade inteira preparou o festival."),
("会社ぐるみの不正が発覚した。", "かいしゃぐるみのふせいがはっかくした。", "Foi descoberta uma fraude envolvendo a empresa inteira."),
("旅行先で身ぐるみはがされた。", "りょこうさきでみぐるみはがされた。", "No destino da viagem, me roubaram tudo o que eu tinha."),
("地域ぐるみで子供たちを見守っている。", "ちいきぐるみでこどもたちをみまもっている。", "A comunidade inteira cuida das crianças."),
],
R=[
("家族____でキャンプに行った。", "Fomos acampar com a família inteira.", ["ぐるみ"]),
("村____の反対運動が起こった。", "Surgiu um movimento de oposição envolvendo a vila inteira.", ["ぐるみ"]),
("学校____で、ボランティア活動をしている。", "A escola inteira faz trabalho voluntário.", ["ぐるみ"]),
("組織____の犯罪だった。", "Foi um crime envolvendo a organização inteira.", ["ぐるみ"]),
("彼らは家族____で仲がいい。", "Eles se dão bem com as famílias inteiras.", ["ぐるみ"]),
],
),
dict(
n=33,
jp="〜羽目になる",
rd="hame ni naru",
tr="Acabar tendo que / Ser obrigado a / Ir parar em",
ex="""羽目になる indica que alguém acabou numa situação ruim ou difícil, geralmente como consequência de algo. Equivale a "acabar tendo que" ou "ir parar em".

A pessoa não queria aquilo, mas não teve escolha. Por exemplo, "por causa de um erro, acabei tendo que fazer hora extra".

É uma expressão coloquial, com tom de lamento ou reclamação.""",
st="""Verbo (forma dicionário) + 羽目になる
Verbo (forma dicionário) + 羽目に陥る""",
no="""Também é escrito はめになる.

Costuma estar no passado, como 羽目になった.

É parecido com ことになる, mas 羽目になる sempre indica algo indesejado.""",
bf="羽目になる",
rx="羽目になる|羽目になった|羽目に|はめになる|はめになった",
tk=["羽目", "に", "なる"],
va=["羽目になる", "羽目になった", "羽目に陥る"],
E=[
("寝坊したせいで、タクシーで行く羽目になった。", "ねぼうしたせいで、タクシーでいくはめになった。", "Por ter dormido demais, acabei tendo que ir de táxi."),
("友達の保証人になって、借金を払う羽目になった。", "ともだちのほしょうにんになって、しゃっきんをはらうはめになった。", "Fui fiador de um amigo e acabei tendo que pagar a dívida."),
("一人で全部やる羽目になった。", "ひとりでぜんぶやるはめになった。", "Acabei tendo que fazer tudo sozinho."),
("断れなくて、幹事をする羽目になった。", "ことわれなくて、かんじをするはめになった。", "Não consegui recusar e acabei tendo que organizar a festa."),
("財布を忘れて、歩いて帰る羽目になった。", "さいふをわすれて、あるいてかえるはめになった。", "Esqueci a carteira e acabei tendo que voltar a pé."),
],
R=[
("ミスをして、徹夜で直す____。", "Errei e acabei tendo que corrigir virando a noite.", ["羽目になった", "はめになった"]),
("傘を持っていなかったので、雨の中を走る____。", "Como não tinha guarda-chuva, acabei tendo que correr na chuva.", ["羽目になった", "はめになった"]),
("嘘がばれて、みんなに謝る____。", "A mentira foi descoberta e acabei tendo que pedir desculpas a todos.", ["羽目になった", "はめになった"]),
("終電を逃して、駅で一晩過ごす____。", "Perdi o último trem e acabei tendo que passar a noite na estação.", ["羽目になった", "はめになった"]),
("準備を怠ると、後で苦労する____よ。", "Se descuidar da preparação, vai acabar sofrendo depois.", ["羽目になる", "はめになる"]),
],
),
dict(
n=34,
jp="〜ほどのことではない",
rd="hodo no koto dewa nai",
tr="Não é para tanto / Não chega a ser / Não precisa",
ex="""ほどのことではない indica que algo não é tão grave ou importante a ponto de justificar uma reação. Equivale a "não é para tanto" ou "não chega a ser".

A pessoa minimiza a situação. Por exemplo, "é um resfriado leve, não é para ir ao hospital" ou "não é algo para se preocupar".

É usado para tranquilizar alguém ou para mostrar que algo é simples.""",
st="""Verbo (forma dicionário) + ほどのことではない
Verbo (forma dicionário) + ほどのことでもない""",
no="""Na fala, aparece como ほどのことじゃない.

É parecido com までもない, que significa "nem é preciso".""",
bf="ほどのことではない",
rx="ほどのことではない|ほどのことでもない|ほどのことじゃない|ほどのことではありません",
tk=["ほど", "の", "こと", "では", "ない"],
va=["ほどのことではない", "ほどのことでもない", "ほどのことじゃない"],
E=[
("軽い風邪だから、病院に行くほどのことではない。", "かるいかぜだから、びょういんにいくほどのことではない。", "É um resfriado leve, não é para ir ao hospital."),
("そんなに心配するほどのことではないよ。", "そんなにしんぱいするほどのことではないよ。", "Não é para se preocupar tanto."),
("わざわざ電話するほどのことでもない。", "わざわざでんわするほどのことでもない。", "Não chega a ser motivo para ligar."),
("怒るほどのことじゃないでしょう。", "おこるほどのことじゃないでしょう。", "Não é para ficar bravo, né?"),
("人に話すほどのことではありません。", "ひとにはなすほどのことではありません。", "Não é algo que valha a pena contar aos outros."),
],
R=[
("小さな傷だから、薬をつける____。", "É um machucado pequeno, não precisa passar remédio.", ["ほどのことではない", "ほどのことでもない", "ほどのことじゃない", "ほどのことではありません"]),
("これは会議で話し合う____。", "Isto não chega a ser assunto para discutir na reunião.", ["ほどのことではない", "ほどのことでもない", "ほどのことじゃない", "ほどのことではありません"]),
("お礼を言われる____。", "Não é para me agradecer.", ["ほどのことではない", "ほどのことでもない", "ほどのことじゃない", "ほどのことではありません"]),
("泣く____よ。元気出して。", "Não é para chorar. Anime-se.", ["ほどのことではない", "ほどのことでもない", "ほどのことじゃない"]),
("専門家に相談する____。", "Não chega a ser preciso consultar um especialista.", ["ほどのことではない", "ほどのことでもない", "ほどのことじゃない", "ほどのことではありません"]),
],
),
dict(
n=35,
jp="〜ほうがましだ",
rd="hou ga mashi da",
tr="Seria melhor / Antes / Prefiro",
ex="""ほうがましだ indica que, entre duas opções ruins, uma é um pouco menos ruim. Equivale a "seria melhor" ou "antes...".

A pessoa não acha a opção boa, mas a considera mais aceitável que a outra. Por exemplo, "antes ficar sozinho do que trabalhar com ele".

Muitas vezes vem junto com くらいなら, como "se for para..., antes...".""",
st="""Verbo (forma dicionário / forma た) + ほうがましだ
Substantivo + の + ほうがましだ
〜くらいなら、〜ほうがましだ""",
no="""ましだ significa "menos ruim", não "bom".

É parecido com ほうがいい, mas ほうがましだ mostra que as duas opções são ruins.""",
bf="ほうがましだ",
rx="ほうがましだ|ほうがまし|方がまし",
tk=["ほう", "が", "まし", "だ"],
va=["ほうがましだ", "ほうがましです", "方がましだ"],
E=[
("彼と一緒に働くくらいなら、一人でやるほうがましだ。", "かれといっしょにはたらくくらいなら、ひとりでやるほうがましだ。", "Se for para trabalhar com ele, antes fazer sozinho."),
("こんなにまずいなら、食べないほうがましだ。", "こんなにまずいなら、たべないほうがましだ。", "Se é tão ruim assim, seria melhor não comer."),
("嘘をつくより、本当のことを言ったほうがましだ。", "うそをつくより、ほんとうのことをいったほうがましだ。", "Seria melhor dizer a verdade do que mentir."),
("満員電車に乗るより、歩いたほうがましです。", "まんいんでんしゃにのるより、あるいたほうがましです。", "Prefiro andar a pegar um trem lotado."),
("こんな仕事なら、辞めたほうがましだ。", "こんなしごとなら、やめたほうがましだ。", "Se o trabalho é assim, seria melhor sair."),
],
R=[
("謝るくらいなら、黙っている____。", "Se for para pedir desculpas, antes ficar calado.", ["ほうがましだ", "方がましだ"]),
("こんな店で食べるより、家で作った____。", "Seria melhor cozinhar em casa do que comer numa loja dessas.", ["ほうがましだ", "方がましだ"]),
("二時間待つより、別の店に行く____。", "Seria melhor ir a outra loja do que esperar duas horas.", ["ほうがましだ", "方がましだ"]),
("あんな人に頼むくらいなら、自分でする____。", "Se for para pedir a uma pessoa daquelas, prefiro fazer eu mesmo.", ["ほうがましだ", "方がましだ"]),
("中途半端にやるより、やらない____。", "Seria melhor não fazer do que fazer pela metade.", ["ほうがましだ", "方がましだ"]),
],
),
dict(
n=36,
jp="〜放題",
rd="houdai",
tr="À vontade / Sem limite / Do jeito que quiser",
ex="""放題 indica que algo é feito livremente, sem limite. Equivale a "à vontade" ou "sem limite".

Tem dois usos. O primeiro é positivo, como em 食べ放題 e 飲み放題, que significam "coma à vontade" e "beba à vontade" em restaurantes.

O segundo é negativo e indica que algo foi deixado sem controle, como "deixar o jardim abandonado" ou "fazer o que bem entende".""",
st="""Verbo (forma ます sem ます) + 放題
Adjetivo な / Substantivo + 放題
Verbo (forma たい) + 放題""",
no="""Expressões comuns são 食べ放題, 飲み放題, 言いたい放題, やりたい放題 e 荒れ放題.

No uso negativo, mostra crítica à falta de controle.""",
bf="放題",
rx="放題|ほうだい",
tk=["放題"],
va=["放題", "食べ放題", "やりたい放題"],
E=[
("この店は二千円で食べ放題だ。", "このみせはにせんえんでたべほうだいだ。", "Nesta loja, por dois mil ienes, você come à vontade."),
("彼は言いたい放題言って帰った。", "かれはいいたいほうだいいってかえった。", "Ele disse tudo o que quis e foi embora."),
("庭は荒れ放題になっている。", "にわはあれほうだいになっている。", "O jardim está completamente abandonado."),
("子供たちはやりたい放題だ。", "こどもたちはやりたいほうだいだ。", "As crianças fazem o que bem entendem."),
("このプランは飲み放題がついている。", "このプランはのみほうだいがついている。", "Este plano inclui bebida à vontade."),
],
R=[
("ケーキが食べ____の店に行った。", "Fui a uma loja de bolo à vontade.", ["放題"]),
("彼女は髪を伸び____にしている。", "Ela deixa o cabelo crescer sem cuidar.", ["放題"]),
("親がいないので、子供はしたい____だ。", "Como os pais não estão, a criança faz o que quer.", ["放題"]),
("このアプリは月千円で音楽が聴き____だ。", "Com este aplicativo, por mil ienes por mês, dá para ouvir música à vontade.", ["放題"]),
("ネットで言いたい____書く人がいる。", "Tem gente que escreve na internet tudo o que bem entende.", ["放題"]),
],
),
dict(
n=37,
jp="〜いかんだ / 〜いかんでは / 〜いかんによっては",
rd="ikan da / ikan dewa / ikan ni yotte wa",
tr="Depende de / Dependendo de / Conforme",
ex="""いかん indica que algo depende de uma condição. Equivale a "depende de" ou "dependendo de".

いかんだ fica no fim da frase, como "o resultado depende do seu esforço". いかんでは e いかんによっては indicam que, dependendo da condição, algo especial pode acontecer, como "dependendo do resultado, o plano pode ser cancelado".

É uma expressão muito formal, usada em documentos, notícias e discursos.""",
st="""Substantivo + いかんだ
Substantivo + の + いかんでは / いかんによっては
Substantivo + いかんで""",
no="""É uma forma formal de 次第だ e によって.

Expressões comuns são 結果いかん, 努力いかん e 対応いかん.""",
bf="いかんだ",
rx="いかんだ|いかんでは|いかんによっては|いかんによって|いかんで|いかんです",
tk=["いかん", "だ"],
va=["いかんだ", "いかんでは", "いかんによっては", "いかんで"],
E=[
("合格できるかどうかは、本人の努力いかんだ。", "ごうかくできるかどうかは、ほんにんのどりょくいかんだ。", "Passar ou não depende do esforço da própria pessoa."),
("結果いかんでは、計画を中止することもある。", "けっかいかんでは、けいかくをちゅうしすることもある。", "Dependendo do resultado, o plano pode ser cancelado."),
("天候のいかんによっては、試合が延期されます。", "てんこうのいかんによっては、しあいがえんきされます。", "Dependendo do tempo, a partida será adiada."),
("今後の対応いかんで、会社の評価が決まる。", "こんごのたいおういかんで、かいしゃのひょうかがきまる。", "A avaliação da empresa será definida conforme a resposta daqui em diante."),
("成功するかどうかは準備いかんです。", "せいこうするかどうかはじゅんびいかんです。", "Ter sucesso ou não depende da preparação."),
],
R=[
("勝敗は選手の体調____。", "A vitória ou derrota depende da condição física dos atletas.", ["いかんだ", "いかんです"]),
("成績の____、奨学金がもらえないこともある。", "Dependendo das notas, pode ser que não receba a bolsa.", ["いかんでは", "いかんによっては"]),
("交渉の結果____、値段が変わる。", "O preço muda conforme o resultado da negociação.", ["いかんで", "いかんによって"]),
("参加者数の____、会場を変更します。", "Dependendo do número de participantes, mudaremos o local.", ["いかんでは", "いかんによっては"]),
("この計画が成功するかは、資金____。", "Se este plano terá sucesso depende dos recursos.", ["いかんだ", "いかんです"]),
],
),
dict(
n=38,
jp="〜いかんを問わず",
rd="ikan wo towazu",
tr="Independentemente de / Seja qual for / Sem levar em conta",
ex="""いかんを問わず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "seja qual for".

É uma expressão muito formal, usada principalmente em regras, contratos e avisos oficiais. Por exemplo, "independentemente do motivo, não é possível devolver o valor".

As formas いかんによらず e いかんにかかわらず têm o mesmo sentido.""",
st="""Substantivo + の + いかんを問わず
Substantivo + の + いかんによらず
Substantivo + の + いかんにかかわらず""",
no="""É uma forma ainda mais formal de に関わらず e を問わず.

Expressões comuns são 理由のいかんを問わず e 結果のいかんにかかわらず.""",
bf="いかんを問わず",
rx="いかんを問わず|いかんをとわず|いかんによらず|いかんにかかわらず|いかんに関わらず",
tk=["いかん", "を", "問わず"],
va=["いかんを問わず", "いかんによらず", "いかんにかかわらず"],
E=[
("理由のいかんを問わず、返金はいたしません。", "りゆうのいかんをとわず、へんきんはいたしません。", "Independentemente do motivo, não faremos reembolso."),
("結果のいかんにかかわらず、報告してください。", "けっかのいかんにかかわらず、ほうこくしてください。", "Seja qual for o resultado, faça o relatório."),
("国籍のいかんによらず、応募できます。", "こくせきのいかんによらず、おうぼできます。", "É possível se candidatar independentemente da nacionalidade."),
("事情のいかんを問わず、遅刻は認めません。", "じじょうのいかんをとわず、ちこくはみとめません。", "Seja qual for a circunstância, atrasos não serão aceitos."),
("年齢のいかんを問わず、誰でも参加できる。", "ねんれいのいかんをとわず、だれでもさんかできる。", "Qualquer pessoa pode participar, independentemente da idade."),
],
R=[
("理由の____、無断欠席は許されない。", "Seja qual for o motivo, faltar sem avisar não é permitido.", ["いかんを問わず", "いかんをとわず", "いかんによらず", "いかんにかかわらず"]),
("性別の____、採用します。", "Contratamos sem levar em conta o sexo.", ["いかんを問わず", "いかんをとわず", "いかんによらず", "いかんにかかわらず"]),
("天候の____、イベントは予定通り行います。", "Independentemente do tempo, o evento será realizado conforme previsto.", ["いかんを問わず", "いかんをとわず", "いかんによらず", "いかんにかかわらず"]),
("経験の____、やる気のある方を歓迎します。", "Independentemente da experiência, damos as boas-vindas a quem tem vontade.", ["いかんを問わず", "いかんをとわず", "いかんによらず", "いかんにかかわらず"]),
("結果の____、全力を尽くすことが大切だ。", "Seja qual for o resultado, o importante é dar o seu melhor.", ["いかんを問わず", "いかんをとわず", "いかんによらず", "いかんにかかわらず"]),
],
),
dict(
n=39,
jp="いかなる",
rd="ikanaru",
tr="Qualquer / Que tipo de / Seja qual for",
ex="""いかなる é uma forma formal de どんな. Equivale a "qualquer", "que tipo de" ou "seja qual for".

Costuma vir antes de substantivos e junto com expressões como でも, であれ ou a negação, reforçando que não há exceção. Por exemplo, "em qualquer situação, mantenha a calma" ou "não há motivo algum que justifique isso".

É usada em textos formais, regras, discursos e notícias.""",
st="""いかなる + Substantivo + でも / であれ / であろうと
いかなる + Substantivo + も + Frase negativa""",
no="""É bem mais formal que どんな.

Expressões comuns são いかなる場合も, いかなる理由があっても e いかなる困難にも.""",
bf="いかなる",
rx="いかなる",
tk=["いかなる"],
va=["いかなる"],
E=[
("いかなる場合でも、冷静に行動してください。", "いかなるばあいでも、れいせいにこうどうしてください。", "Em qualquer situação, aja com calma."),
("いかなる理由があっても、暴力は許されない。", "いかなるりゆうがあっても、ぼうりょくはゆるされない。", "Seja qual for o motivo, a violência não é perdoável."),
("彼はいかなる困難にも負けなかった。", "かれはいかなるこんなんにもまけなかった。", "Ele não se rendeu a dificuldade alguma."),
("いかなる人であれ、法律は守らなければならない。", "いかなるひとであれ、ほうりつはまもらなければならない。", "Seja quem for, é preciso respeitar a lei."),
("いかなる質問にもお答えします。", "いかなるしつもんにもおこたえします。", "Responderemos a qualquer pergunta."),
],
R=[
("____状況でも、あきらめてはいけない。", "Em qualquer situação, não se deve desistir.", ["いかなる"]),
("____事情があろうと、約束は守るべきだ。", "Sejam quais forem as circunstâncias, deve-se cumprir a promessa.", ["いかなる"]),
("当社は____責任も負いません。", "Nossa empresa não assume responsabilidade alguma.", ["いかなる"]),
("____方法を使っても、彼を説得するのは無理だ。", "Seja qual for o método, é impossível convencê-lo.", ["いかなる"]),
("____時も、笑顔を忘れないでほしい。", "Quero que você nunca esqueça de sorrir, em qualquer momento.", ["いかなる"]),
],
),
dict(
n=40,
jp="いかに",
rd="ikani",
tr="Como / Quão / Por mais que",
ex="""いかに é uma forma formal de どのように e どんなに. Tem alguns usos.

O primeiro é perguntar ou pensar sobre o modo de fazer algo, com o sentido de "como". Por exemplo, "o importante é como viver".

O segundo é destacar o grau de algo, com o sentido de "quão". Por exemplo, "percebi quão importante é a saúde".

O terceiro, com ても ou とも, significa "por mais que", como "por mais que seja difícil, não vou desistir".""",
st="""いかに + Verbo (modo)
いかに + Adjetivo + か (grau)
いかに + Verbo / Adjetivo + ても / とも (por mais que)""",
no="""É bem mais formal que どう e どんなに.

É comum em textos, discursos e títulos de livros, como いかに生きるか.""",
bf="いかに",
rx="いかに",
tk=["いかに"],
va=["いかに", "いかに〜ても"],
E=[
("大切なのは、いかに生きるかだ。", "たいせつなのは、いかにいきるかだ。", "O importante é como viver."),
("病気になって、健康がいかに大切かわかった。", "びょうきになって、けんこうがいかにたいせつかわかった。", "Ao ficar doente, percebi quão importante é a saúde."),
("いかに忙しくても、食事はきちんととるべきだ。", "いかにいそがしくても、しょくじはきちんととるべきだ。", "Por mais ocupado que esteja, deve comer direito."),
("いかに説明しても、彼は理解しなかった。", "いかにせつめいしても、かれはりかいしなかった。", "Por mais que eu explicasse, ele não entendeu."),
("いかにして問題を解決するか考えよう。", "いかにしてもんだいをかいけつするかかんがえよう。", "Vamos pensar em como resolver o problema."),
],
R=[
("この本は、時間を____使うかについて書かれている。", "Este livro fala sobre como usar o tempo.", ["いかに"]),
("____努力しても、才能には勝てないこともある。", "Por mais que se esforce, às vezes não dá para vencer o talento.", ["いかに"]),
("親になって、親が____大変かわかった。", "Ao me tornar pai, entendi quão difícil é ser pai.", ["いかに"]),
("____高くても、必要なものは買う。", "Por mais caro que seja, compro o que é necessário.", ["いかに"]),
("____すれば売り上げが伸びるか考えている。", "Estou pensando em como aumentar as vendas.", ["いかに"]),
],
),
]
