G = [
dict(
n=101,
jp="〜際に",
rd="sai ni",
tr="Quando / Na ocasião de / No momento de",
ex="""際に é uma forma formal de dizer "quando" ou "na ocasião de". Ele indica um momento ou uma situação específica em que algo acontece ou deve ser feito.

É muito usado em avisos, instruções, anúncios e textos de trabalho, principalmente para situações especiais ou importantes, como emergências, pagamentos, embarques e visitas.

Ele vem depois de substantivos com の e da forma simples dos verbos (dicionário ou た).

Com は, 際は dá um tom de instrução ou regra: "no momento de descer, cuidado com os pés". Com には, reforça o destaque.

Comparado a とき, 際に soa bem mais formal e quase não é usado na conversa casual.""",
st="""Substantivo + の + 際に / 際は / 際には
Verbo (forma de dicionário / た) + 際に / 際は
お / ご + Substantivo + の + 際は (muito educado)

Escrita: 際 / さい""",
no="""Em trens e lojas, avisos como お降りの際は e お支払いの際は são extremamente comuns.

Nas formas escritas, também aparece 際、 com vírgula, sem に.

Para uso cotidiano, prefira とき. 際に soa como linguagem de documento ou de anúncio.""",
bf="際に",
rx="際に|際は|際には|際、|さいに",
tk=["際", "に"],
va=["際に", "際は", "際には"],
E=[
("日本に来た際に、富士山に登りました。", "にほんにきたさいに、ふじさんにのぼりました。", "Quando vim ao Japão, subi o Monte Fuji."),
("お降りの際は、足元にご注意ください。", "おおりのさいは、あしもとにごちゅういください。", "Ao descer, cuidado com os pés."),
("会議の際に、資料を配ります。", "かいぎのさいに、しりょうをくばります。", "Na ocasião da reunião, distribuiremos os documentos."),
("地震の際には、エレベーターを使わないでください。", "じしんのさいには、エレベーターをつかわないでください。", "Em caso de terremoto, não use o elevador."),
("申し込みの際、身分証明書が必要です。", "もうしこみのさい、みぶんしょうめいしょがひつようです。", "No momento da inscrição, é necessário um documento de identidade."),
],
R=[
("部屋を出る____、電気を消してください。", "Ao sair do quarto, apague a luz, por favor.", ["際に", "際は"]),
("出張で東京に行った____、友達に会った。", "Quando fui a Tóquio a trabalho, encontrei um amigo.", ["際に"]),
("非常の____、このボタンを押してください。", "Em caso de emergência, aperte este botão.", ["際は", "際に"]),
("お支払いの____、カードもご利用いただけます。", "No momento do pagamento, também é possível usar cartão.", ["際は", "際に"]),
("次回お越しの____、このチケットをお持ちください。", "Na próxima visita, traga este ingresso, por favor.", ["際は", "際に"]),
],
),
dict(
n=102,
jp="〜最中に",
rd="saichuu ni",
tr="Bem no meio de / Justo quando / Em pleno",
ex="""最中に é usado para dizer que algo aconteceu bem no meio de outra ação ou evento, geralmente atrapalhando ou interrompendo. Equivale a "bem no meio de", "justo quando" ou "em pleno".

最中 significa "o auge", "o ponto central" de uma ação. Assim, a estrutura destaca que o acontecimento veio exatamente na hora em que a outra coisa estava em andamento.

Ele vem depois de substantivos com の e de verbos na forma ている.

A segunda parte costuma ser algo inesperado ou indesejado, como o telefone tocar no meio da reunião ou um terremoto durante a refeição.

Na forma 最中だ ou 最中です, no fim da frase, indica que a pessoa está no meio de algo e não pode ser interrompida.""",
st="""Substantivo + の + 最中に + Acontecimento
Verbo na forma ている + 最中に + Acontecimento
… + 最中だ / 最中です (estou no meio de...)

Escrita: 最中 / さいちゅう""",
no="""Comparado a 間に e 中に, 最中に destaca mais o momento crítico e a interrupção.

A leitura é さいちゅう. A leitura もなか existe, mas é o nome de um doce japonês.

A segunda parte geralmente não é uma ação planejada por quem fala, e sim um imprevisto.""",
bf="最中に",
rx="最中に|最中だ|最中です|さいちゅう",
tk=["最中", "に"],
va=["最中に", "最中だ", "最中です"],
E=[
("会議の最中に、電話が鳴った。", "かいぎのさいちゅうに、でんわがなった。", "O telefone tocou bem no meio da reunião."),
("食事の最中に、地震が起きた。", "しょくじのさいちゅうに、じしんがおきた。", "Houve um terremoto justo durante a refeição."),
("試合の最中に、雨が降り出した。", "しあいのさいちゅうに、あめがふりだした。", "Começou a chover em plena partida."),
("今、勉強している最中だから、静かにして。", "いま、べんきょうしているさいちゅうだから、しずかにして。", "Estou bem no meio dos estudos, então faça silêncio."),
("お風呂に入っている最中に、停電した。", "おふろにはいっているさいちゅうに、ていでんした。", "A luz acabou justo quando eu estava no banho."),
],
R=[
("授業の____、携帯が鳴ってしまった。", "O celular tocou bem no meio da aula.", ["最中に"]),
("スピーチの____、言葉を忘れた。", "Esqueci as palavras em pleno discurso.", ["最中に"]),
("料理をしている____、友達が来た。", "Um amigo chegou justo quando eu estava cozinhando.", ["最中に"]),
("今、話し合いの____から、後で来てください。", "Agora estamos no meio de uma discussão, então venha mais tarde.", ["最中だ", "最中です"]),
("映画を見ている____、寝てしまった。", "Acabei dormindo bem no meio do filme.", ["最中に"]),
],
),
dict(
n=103,
jp="さらに",
rd="sara ni",
tr="Ainda mais / Além disso / Mais ainda",
ex="""さらに é um advérbio com dois usos principais.

O primeiro é indicar que algo aumentou ou se intensificou: "ainda mais". Por exemplo, "a chuva ficou ainda mais forte" ou "depois de praticar, fiquei ainda melhor".

O segundo é acrescentar uma informação nova, no começo de uma frase: "além disso". Por exemplo, "esta loja é barata. Além disso, o atendimento é bom".

さらに soa um pouco mais formal que もっと e é muito usado em textos, notícias, apresentações e propagandas.

Antes de expressões de quantidade, como 多くの, indica um aumento: "ainda mais pessoas".""",
st="""さらに + Adjetivo / Verbo de mudança (ainda mais)
Frase 1 (com ponto final) + さらに、 + Frase 2 (além disso)
さらに + 多くの / 大きな + Substantivo

Escrita: さらに / 更に""",
no="""Comparado a もっと, さらに indica que algo já era alto e aumentou ainda mais.

Em propagandas, さらに aparece muito para apresentar vantagens extras: "e mais...".

Para listar argumentos em textos, さらに funciona como "além disso" ou "ademais".""",
bf="さらに",
rx="さらに|更に",
tk=["さらに"],
va=["さらに", "更に"],
E=[
("夜になって、雨はさらに強くなった。", "よるになって、あめはさらにつよくなった。", "À noite, a chuva ficou ainda mais forte."),
("たくさん練習して、さらに上手になった。", "たくさんれんしゅうして、さらにじょうずになった。", "Pratiquei bastante e fiquei ainda melhor."),
("この店は安い。さらに、サービスもいい。", "このみせはやすい。さらに、サービスもいい。", "Esta loja é barata. Além disso, o atendimento é bom."),
("来年は、さらに多くの観光客が来るだろう。", "らいねんは、さらにおおくのかんこうきゃくがくるだろう。", "No ano que vem, devem vir ainda mais turistas."),
("説明を聞いて、さらにわからなくなった。", "せつめいをきいて、さらにわからなくなった。", "Ouvi a explicação e fiquei ainda mais confuso."),
],
R=[
("夜になって、寒さが____厳しくなった。", "À noite, o frio ficou ainda mais rigoroso.", ["さらに", "更に"]),
("この部屋は広い。____、日当たりもいい。", "Este quarto é amplo. Além disso, recebe bastante sol.", ["さらに", "更に"]),
("薬を飲んだら、____悪くなった。", "Depois de tomar o remédio, piorei ainda mais.", ["さらに", "更に"]),
("新しい店は、前の店より____大きい。", "A loja nova é ainda maior que a anterior.", ["さらに", "更に"]),
("来月から、料金が____上がる予定です。", "A partir do mês que vem, a tarifa vai subir ainda mais.", ["さらに", "更に"]),
],
),
dict(
n=104,
jp="さて",
rd="sate",
tr="Bem / Então / Agora",
ex="""さて é uma palavra usada para mudar de assunto, começar algo novo ou passar para a próxima etapa. Equivale a "bem", "então" ou "agora".

Ela aparece muito no começo de frases, em três situações principais:
• Começar algo: em aulas, reuniões e discursos, para iniciar o assunto principal.
• Passar para o próximo ponto: depois de terminar uma parte, para ir à seguinte.
• Falar consigo mesmo: quando a pessoa está decidindo o que fazer, como "bem, o que eu faço agora?".

Em cartas e e-mails formais, さて aparece depois das saudações iniciais, para introduzir o assunto da mensagem.

O tom é neutro e serve tanto para situações formais quanto informais.""",
st="""さて、 + Frase (início / mudança de assunto)
さて、 + Pergunta para si mesmo (どうしようか)""",
no="""Em cartas formais japonesas, a estrutura tradicional é: saudação de estação do ano, depois さて, e então o assunto principal.

さて é diferente de ところで, que muda de assunto de forma mais repentina, como "a propósito".

Falado com uma pausa, さて… soa como alguém se preparando para agir.""",
bf="さて",
rx="さて",
tk=["さて"],
va=["さて"],
E=[
("さて、今日の授業を始めましょう。", "さて、きょうのじゅぎょうをはじめましょう。", "Bem, vamos começar a aula de hoje."),
("さて、次の問題に移ります。", "さて、つぎのもんだいにうつります。", "Agora, vamos passar para a próxima questão."),
("食事も終わったし、さて、帰ろうか。", "しょくじもおわったし、さて、かえろうか。", "Já terminamos de comer, então, vamos embora?"),
("さて、これからどうしようか。", "さて、これからどうしようか。", "Bem, e agora, o que eu faço?"),
("皆さん、こんにちは。さて、本日は新商品を紹介します。", "みなさん、こんにちは。さて、ほんじつはしんしょうひんをしょうかいします。", "Boa tarde a todos. Bem, hoje vamos apresentar um novo produto."),
],
R=[
("皆さん、そろったようですね。____、会議を始めます。", "Parece que todos chegaram. Bem, vamos começar a reunião.", ["さて"]),
("前置きはこのくらいにして、____、本題に入りましょう。", "Chega de introdução. Agora, vamos ao assunto principal.", ["さて"]),
("____、何から始めようかな。", "Bem, por onde será que eu começo?", ["さて"]),
("宿題が終わった。____、ゲームでもしよう。", "Terminei a lição. Bem, vou jogar um pouco de videogame.", ["さて"]),
("お待たせしました。____、次は皆さんお待ちかねの抽選会です。", "Obrigado pela espera. Agora, o momento que todos esperavam: o sorteio.", ["さて"]),
],
),
dict(
n=105,
jp="〜せいで",
rd="sei de",
tr="Por culpa de / Por causa de (negativo)",
ex="""せいで é usado para indicar a causa de um resultado negativo. Equivale a "por culpa de" ou "por causa de".

A primeira parte mostra a causa, e a segunda, o resultado ruim. Muitas vezes, há um tom de culpa, reclamação ou responsabilidade. Por exemplo, "por causa da chuva, a partida foi cancelada" ou "por culpa dele, o plano fracassou".

Ele vem depois de substantivos com の e da forma simples de verbos e adjetivos.

Na forma せいだ ou せいです, no fim da frase, indica diretamente de quem é a culpa: "a culpa é minha".

O oposto, para causas positivas, é おかげで.""",
st="""Substantivo + の + せいで + Resultado negativo
Verbo / Adjetivo (forma simples) + せいで + Resultado negativo
Adjetivo な + な + せいで
… + のは + 〜のせいだ / せいです""",
no="""Usar せいで com pessoas é uma forma direta de culpar alguém. Deve ser usado com cuidado.

Para assumir a responsabilidade com educação, a frase 私のせいです ("a culpa é minha") é comum.

A forma せいか (N2) indica uma causa provável: "talvez por causa de...".""",
bf="せいで",
rx="せいで|せいだ|せいです|所為で",
tk=["せい", "で"],
va=["せいで", "せいだ", "せいです"],
E=[
("雨のせいで、試合が中止になった。", "あめのせいで、しあいがちゅうしになった。", "Por causa da chuva, a partida foi cancelada."),
("寝坊したせいで、遅刻してしまった。", "ねぼうしたせいで、ちこくしてしまった。", "Por ter dormido demais, acabei chegando atrasado."),
("彼のせいで、計画が失敗した。", "かれのせいで、けいかくがしっぱいした。", "Por culpa dele, o plano fracassou."),
("甘い物を食べすぎたせいで、太った。", "あまいものをたべすぎたせいで、ふとった。", "Engordei por ter comido doce demais."),
("失敗したのは、私のせいです。", "しっぱいしたのは、わたしのせいです。", "A culpa pelo fracasso é minha."),
],
R=[
("事故の____、電車が遅れた。", "Por causa do acidente, o trem atrasou.", ["せいで"]),
("風邪をひいた____、声が出ない。", "Por causa do resfriado, estou sem voz.", ["せいで"]),
("道が混んでいた____、約束の時間に間に合わなかった。", "Por causa do trânsito, não cheguei a tempo para o compromisso.", ["せいで"]),
("彼がうそをついた____、みんなが困った。", "Por culpa da mentira dele, todos ficaram em apuros.", ["せいで"]),
("寝不足の____、頭が痛い。", "Por falta de sono, estou com dor de cabeça.", ["せいで"]),
],
),
dict(
n=106,
jp="せいぜい",
rd="seizei",
tr="No máximo / Quando muito / Na melhor das hipóteses",
ex="""せいぜい é um advérbio que indica o limite máximo de algo, geralmente com a ideia de que não é muito. Equivale a "no máximo", "quando muito" ou "na melhor das hipóteses".

Ele aparece muito com quantidades, tempos e preços, mostrando que o valor é pequeno ou limitado: "até a estação, a pé, são no máximo dez minutos" ou "virão no máximo umas vinte pessoas".

Também pode indicar o máximo que alguém consegue fazer, com modéstia ou resignação: "o máximo que posso fazer é isso".

O tom costuma ser de "não é grande coisa" ou de cálculo realista.""",
st="""せいぜい + Quantidade / Tempo / Preço + だ / ぐらいだ
せいぜい + … + だろう (estimativa)
Sujeito + にできるのは + せいぜい + … + だ

Escrita: せいぜい / 精々""",
no="""Em um uso mais antigo e irônico, せいぜい頑張って significa algo como "boa sorte aí" com tom de desdém. Cuidado com esse sentido.

Comparado a 多くても (no máximo), せいぜい soa mais natural na conversa.

O oposto, para "no mínimo", é 少なくとも.""",
bf="せいぜい",
rx="せいぜい|精々",
tk=["せいぜい"],
va=["せいぜい", "精々"],
E=[
("駅まで歩いても、せいぜい十分だ。", "えきまであるいても、せいぜいじゅっぷんだ。", "Mesmo a pé, até a estação são no máximo dez minutos."),
("この仕事なら、せいぜい一時間で終わるだろう。", "このしごとなら、せいぜいいちじかんでおわるだろう。", "Este trabalho deve levar no máximo uma hora."),
("パーティーに来るのは、せいぜい二十人ぐらいだ。", "パーティーにくるのは、せいぜいにじゅうにんぐらいだ。", "Para a festa, devem vir no máximo umas vinte pessoas."),
("私にできるのは、せいぜいこのくらいです。", "わたしにできるのは、せいぜいこのくらいです。", "O máximo que eu consigo fazer é isso."),
("給料が上がっても、せいぜい五千円だろう。", "きゅうりょうがあがっても、せいぜいごせんえんだろう。", "Mesmo que o salário aumente, será no máximo cinco mil ienes."),
],
R=[
("この古い車なら、売っても____十万円だろう。", "Um carro velho desses, mesmo vendendo, vai dar no máximo cem mil ienes.", ["せいぜい"]),
("夏休みと言っても、____一週間しかない。", "Férias de verão, que nada: são no máximo uma semana.", ["せいぜい"]),
("忙しくて、練習は____一日一時間しかできない。", "Estou ocupado e consigo treinar no máximo uma hora por dia.", ["せいぜい"]),
("この部屋に入れるのは、____五人だ。", "Neste quarto cabem no máximo cinco pessoas.", ["せいぜい"]),
("明日は雨が降っても、____小雨程度でしょう。", "Mesmo que chova amanhã, deve ser no máximo uma garoa.", ["せいぜい"]),
],
),
dict(
n=107,
jp="しばらく",
rd="shibaraku",
tr="Um pouco / Por um tempo / Por algum tempo",
ex="""しばらく é um advérbio que indica um período de tempo, que pode ser curto ou relativamente longo, dependendo do contexto. Equivale a "um pouco", "por um tempo" ou "por algum tempo".

Os usos mais comuns são:
• Pedir que alguém espere um pouco: しばらくお待ちください, muito usado no atendimento.
• Falar de um período sem algo acontecer: "faz tempo que não nos vemos".
• Indicar que algo aconteceu depois de um tempo: しばらくして / しばらくすると (depois de um tempo).
• Planos temporários: しばらくの間 (por algum tempo).

O tamanho do período é vago: pode ser alguns minutos ou alguns meses. O contexto mostra qual é.""",
st="""しばらく + Verbo (por um tempo)
しばらく + Verbo negativo (faz tempo que não...)
しばらくして / しばらくすると (depois de um tempo)
しばらくの間 + … (por algum tempo)

Escrita: しばらく / 暫く""",
no="""A saudação しばらくですね significa "quanto tempo!", parecida com 久しぶりですね, mas um pouco mais formal.

しばらくお待ちください soa mais formal que ちょっと待ってください.

Em mensagens de ausência, しばらく留守にします significa "vou ficar fora por um tempo".""",
bf="しばらく",
rx="しばらく|暫く",
tk=["しばらく"],
va=["しばらく", "暫く"],
E=[
("しばらくお待ちください。", "しばらくおまちください。", "Aguarde um momento, por favor."),
("しばらく会わないうちに、背が伸びたね。", "しばらくあわないうちに、せがのびたね。", "Faz um tempo que não te vejo, e você cresceu, hein."),
("仕事が忙しくて、しばらく休みが取れない。", "しごとがいそがしくて、しばらくやすみがとれない。", "Estou com o trabalho corrido e não vou conseguir tirar folga por um tempo."),
("しばらくして、雨がやんだ。", "しばらくして、あめがやんだ。", "Depois de um tempo, a chuva parou."),
("しばらくの間、この町に住む予定です。", "しばらくのあいだ、このまちにすむよていです。", "Pretendo morar nesta cidade por algum tempo."),
],
R=[
("____休んでから、また始めましょう。", "Vamos descansar um pouco e depois recomeçar.", ["しばらく"]),
("彼とは____連絡を取っていない。", "Faz um tempo que não falo com ele.", ["しばらく"]),
("駅で待っていると、____すると、電車が来た。", "Esperei na estação e, depois de um tempo, o trem chegou.", ["しばらく"]),
("来週から、____の間、留守にします。", "A partir da semana que vem, vou ficar fora por algum tempo.", ["しばらく"]),
("会議室は今使っていますので、____お待ちください。", "A sala de reunião está ocupada agora, então aguarde um pouco, por favor.", ["しばらく"]),
],
),
dict(
n=108,
jp="〜しかない",
rd="shika nai",
tr="Não ter outra opção a não ser / Só resta",
ex="""しかない, depois de um verbo na forma de dicionário, indica que não existe outra opção: aquela é a única coisa que se pode fazer. Equivale a "não há outra opção a não ser" ou "só resta".

A ideia vem de しか〜ない ("só"), aplicada a ações. Ou seja, "só fazer isso é possível".

Ela costuma aparecer em situações difíceis, quando a pessoa aceita a realidade com resignação ou determinação. Por exemplo, "não tem trem, então o jeito é voltar a pé" ou "se chegamos até aqui, só resta nos esforçar".

No passado, しかなかった significa "não tive outra opção a não ser...".""",
st="""Verbo na forma de dicionário + しかない
Verbo + しかありません (educado)
Verbo + しかなかった (não tive outra opção)""",
no="""Com substantivos, しか〜ない tem o sentido comum de "só": 千円しかない (só tenho mil ienes). Com verbos na forma de dicionário, o sentido é "não há outra opção".

ほかない tem o mesmo sentido, mas soa mais formal e escrito.

A frase やるしかない ("o jeito é fazer") é muito usada para se motivar diante de um desafio.""",
bf="しかない",
rx="しかない|しかありません|しかなかった",
tk=["しか", "ない"],
va=["しかない", "しかありません", "しかなかった"],
E=[
("電車がないので、歩いて帰るしかない。", "でんしゃがないので、あるいてかえるしかない。", "Não tem trem, então o jeito é voltar a pé."),
("誰も手伝ってくれないなら、一人でやるしかない。", "だれもてつだってくれないなら、ひとりでやるしかない。", "Se ninguém vai me ajudar, só resta fazer sozinho."),
("約束したのだから、行くしかありません。", "やくそくしたのだから、いくしかありません。", "Eu prometi, então não tenho outra opção a não ser ir."),
("お金がないので、あきらめるしかなかった。", "おかねがないので、あきらめるしかなかった。", "Como não tinha dinheiro, não tive outra opção a não ser desistir."),
("ここまで来たら、もう頑張るしかない。", "ここまできたら、もうがんばるしかない。", "Já que chegamos até aqui, só resta nos esforçar."),
],
R=[
("雨がやまないので、待つ____。", "A chuva não para, então o jeito é esperar.", ["しかない", "しかありません"]),
("薬がないなら、病院に行く____。", "Se não tem remédio, só resta ir ao hospital.", ["しかない", "しかありません"]),
("間違えたのは私だから、謝る____。", "Quem errou fui eu, então só resta pedir desculpas.", ["しかない", "しかありません"]),
("昨日は終電を逃したので、タクシーで帰る____。", "Ontem perdi o último trem, então não tive outra opção a não ser voltar de táxi.", ["しかなかった"]),
("試験に合格するには、勉強する____。", "Para passar na prova, não há outra opção a não ser estudar.", ["しかない", "しかありません"]),
],
),
dict(
n=109,
jp="そのために",
rd="sono tame ni",
tr="Por isso / Por esse motivo / Para isso",
ex="""そのために é uma expressão de ligação usada no começo de uma frase, que retoma o que foi dito antes. Ela tem dois sentidos, dependendo do contexto.

O primeiro é causa: "por isso", "por esse motivo". A frase anterior explica o motivo, e a frase com そのために mostra a consequência. Por exemplo, "nevou muito. Por isso, os trens pararam".

O segundo é objetivo: "para isso". A frase anterior apresenta um objetivo, e a frase com そのために mostra o que se faz para alcançá-lo. Por exemplo, "quero trabalhar no Japão. Para isso, estou estudando japonês".

A forma そのため, sem に, é mais comum no sentido de causa e soa formal. Ela aparece muito em notícias e textos explicativos.""",
st="""Frase 1 (motivo, com ponto final) + そのために / そのため、 + Consequência
Frase 1 (objetivo, com ponto final) + そのために、 + Ação para alcançá-lo""",
no="""O contexto mostra se é causa ou objetivo: se a primeira frase é um acontecimento, é causa; se é um desejo ou meta, é objetivo.

Em notícias, そのため aparece com muita frequência para explicar consequências de desastres e mudanças.

Na conversa casual, os japoneses costumam usar だから ou それで para causa.""",
bf="そのために",
rx="そのために|そのため",
tk=["その", "ために"],
va=["そのために", "そのため"],
E=[
("大雪が降った。そのために、電車が止まった。", "おおゆきがふった。そのために、でんしゃがとまった。", "Nevou muito. Por isso, os trens pararam."),
("私は日本で働きたい。そのために、日本語を勉強している。", "わたしはにほんではたらきたい。そのために、にほんごをべんきょうしている。", "Quero trabalhar no Japão. Para isso, estou estudando japonês."),
("道が混んでいた。そのため、会議に遅れた。", "みちがこんでいた。そのため、かいぎにおくれた。", "O trânsito estava ruim. Por esse motivo, me atrasei para a reunião."),
("来月試験がある。そのために、毎日図書館に通っている。", "らいげつしけんがある。そのために、まいにちとしょかんにかよっている。", "Tenho prova no mês que vem. Para isso, vou à biblioteca todo dia."),
("台風が近づいている。そのため、学校は休みになった。", "たいふうがちかづいている。そのため、がっこうはやすみになった。", "Um tufão está se aproximando. Por isso, as aulas foram canceladas."),
],
R=[
("彼は留学したい。____、アルバイトでお金を貯めている。", "Ele quer fazer intercâmbio. Para isso, está juntando dinheiro com trabalho de meio período.", ["そのために", "そのため"]),
("昨日は熱があった。____、学校を休んだ。", "Ontem eu estava com febre. Por isso, faltei à escola.", ["そのために", "そのため"]),
("高速道路で事故があった。____、道路が渋滞している。", "Houve um acidente na rodovia. Por isso, o trânsito está congestionado.", ["そのために", "そのため"]),
("健康になりたい。____、毎日運動している。", "Quero ficar saudável. Para isso, faço exercício todo dia.", ["そのために", "そのため"]),
("電車が遅れた。____、面接に間に合わなかった。", "O trem atrasou. Por isso, não cheguei a tempo para a entrevista.", ["そのために", "そのため"]),
],
),
dict(
n=110,
jp="それとも",
rd="soretomo",
tr="Ou / Ou então",
ex="""それとも é uma conjunção usada para apresentar alternativas em perguntas. Equivale a "ou" ou "ou então".

Ela liga duas perguntas ou duas opções, para que a outra pessoa escolha uma. Por exemplo, "vai querer café? Ou chá?".

Diferente de または, que pode ser usada em afirmações, それとも é usada principalmente em perguntas, ou em frases de dúvida, como "não sei se ele está bravo ou triste".

Ela pode aparecer no começo de uma nova frase ou depois de uma vírgula, entre as duas opções.""",
st="""Pergunta A + か (com ponto final) + それとも + Pergunta B + か
Pergunta A + か、 + それとも + Pergunta B + か
A + のか、 + それとも + B + のか (dúvida)""",
no="""Em afirmações e instruções, como "escreva com caneta preta ou azul", usa-se または ou か, e não それとも.

Na fala casual, as perguntas costumam terminar sem か, com entonação de pergunta: 電車で行く？それとも、バス？

それとも é muito comum em restaurantes e lojas, quando o atendente oferece opções.""",
bf="それとも",
rx="それとも",
tk=["それとも"],
va=["それとも"],
E=[
("コーヒーにしますか。それとも紅茶にしますか。", "コーヒーにしますか。それともこうちゃにしますか。", "Vai querer café? Ou chá?"),
("電車で行く？それとも、バスで行く？", "でんしゃでいく？それとも、バスでいく？", "Vamos de trem? Ou de ônibus?"),
("会議は今日にしますか、それとも明日にしますか。", "かいぎはきょうにしますか、それともあしたにしますか。", "A reunião vai ser hoje ou amanhã?"),
("晩ご飯は家で食べる？それとも外で食べる？", "ばんごはんはいえでたべる？それともそとでたべる？", "Vamos jantar em casa? Ou fora?"),
("彼は来ないのか、それとも来られないのか。", "かれはこないのか、それともこられないのか。", "Será que ele não quer vir ou não pode vir?"),
],
R=[
("肉にしますか。____魚にしますか。", "Vai querer carne? Ou peixe?", ["それとも"]),
("週末、映画を見る？____、買い物に行く？", "No fim de semana, vamos ver um filme? Ou fazer compras?", ["それとも"]),
("現金で払いますか、____カードで払いますか。", "Vai pagar em dinheiro ou com cartão?", ["それとも"]),
("このまま続けますか、____少し休みますか。", "Vamos continuar assim ou descansar um pouco?", ["それとも"]),
("彼は怒っているのか、____悲しいのか、わからない。", "Não sei se ele está bravo ou triste.", ["それとも"]),
],
),
]
