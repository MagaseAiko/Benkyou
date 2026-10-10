G = [
dict(
n=21,
jp="〜必要がある",
rd="hitsuyou ga aru",
tr="É necessário / Precisar (fazer) / Ter que",
ex="""必要がある é usado para dizer que é necessário fazer uma ação. Equivale a "é necessário", "é preciso" ou "precisar fazer".

A estrutura junta o verbo na forma de dicionário com 必要がある. A ideia literal é "existe a necessidade de fazer isso".

Comparado a なければならない, 必要がある soa mais objetivo e menos pessoal. Ele apresenta a necessidade como um fato, e não como uma obrigação imposta. Por isso, é comum em explicações, instruções e textos formais.

Na forma negativa, 必要はない significa "não há necessidade" e é uma maneira educada de dizer que algo não precisa ser feito. Nesse caso, が costuma virar は.""",
st="""Verbo na forma de dicionário + 必要がある
Verbo na forma de dicionário + 必要があります (educado)

Negativo: Verbo + 必要はない / 必要はありません
Variação: 必要がない""",
no="""Para dizer que uma coisa é necessária, usa-se が必要. Para uma ação, usa-se 必要がある. A diferença é a palavra que vem antes: substantivo ou verbo.

A forma 必要はない é uma ótima opção para tranquilizar alguém, porque soa gentil e objetiva.

Em textos formais, também aparece a forma 必要があると考えられる, usada para fazer recomendações.""",
bf="必要がある",
rx="必要がある|必要があります|必要はない|必要はありません|必要がない|ひつようがある",
tk=["必要", "が", "ある"],
va=["必要がある", "必要があります", "必要はない", "必要はありません", "必要がない"],
E=[
("明日までにレポートを出す必要があります。", "あしたまでにレポートをだすひつようがあります。", "É necessário entregar o relatório até amanhã."),
("海外に行く前に、ビザを申請する必要がある。", "かいがいにいくまえに、ビザをしんせいするひつようがある。", "Antes de ir ao exterior, é preciso pedir o visto."),
("急ぐ必要はありませんよ。", "いそぐひつようはありませんよ。", "Não há necessidade de ter pressa."),
("もう一度確認する必要があると思います。", "もういちどかくにんするひつようがあるとおもいます。", "Acho que é preciso confirmar mais uma vez."),
("日本では、家に入るとき靴を脱ぐ必要があります。", "にほんでは、いえにはいるときくつをぬぐひつようがあります。", "No Japão, é preciso tirar os sapatos ao entrar em casa."),
],
R=[
("試験の前に、もっと勉強する____。", "Antes da prova, é preciso estudar mais.", ["必要があります", "必要がある"]),
("このことは、すぐ社長に報告する____。", "É necessário informar isso ao presidente imediatamente.", ["必要があります", "必要がある"]),
("そんなに心配する____。", "Não há necessidade de se preocupar tanto.", ["必要はありません", "必要はない"]),
("会議に出る前に、資料を読む____。", "Antes de participar da reunião, é preciso ler os documentos.", ["必要があります", "必要がある"]),
("もう払ったので、お金を持ってくる____。", "Já está pago, então não precisa trazer dinheiro.", ["必要はありません", "必要はない"]),
],
),
dict(
n=22,
jp="意向形（〜う・〜よう）",
rd="ikoukei",
tr="Vamos... / Vou... / Forma volitiva",
ex="""意向形 é a forma volitiva dos verbos. Ela expressa a vontade de fazer algo e tem dois usos principais.

O primeiro é convidar ou propor algo, de forma informal. É a versão casual de ましょう: "vamos comer", "vamos voltar".

O segundo é expressar a própria decisão ou intenção, muitas vezes falando consigo mesmo: "vou estudar a partir de hoje".

A formação depende do grupo do verbo. No grupo 1, o último som muda de "u" para "o" e recebe う. No grupo 2, tira-se る e acrescenta-se よう. Os irregulares ficam しよう e 来よう (こよう).

Com か no final, a forma volitiva vira uma sugestão em forma de pergunta, como "vamos descansar um pouco?". E ela é a base de outras gramáticas, como ようと思う e ようとする.""",
st="""Grupo 1: último som "u" → "o" + う (行く → 行こう / 飲む → 飲もう / 買う → 買おう)
Grupo 2: tire る + よう (食べる → 食べよう / 見る → 見よう)
Irregulares: する → しよう / 来る → 来よう (こよう)

Convite educado: ましょう
Sugestão: 〜う / 〜よう + か
Intenção: 〜う / 〜よう + と思う""",
no="""Com superiores, a forma volitiva sozinha soa informal demais. Nesses casos, use ましょう ou ましょうか.

Entre amigos, é comum acrescentar よ (行こうよ) para soar mais animado, ou か (行こうか) para soar mais suave.

Verbos como 帰る e 入る são do grupo 1, então ficam 帰ろう e 入ろう.""",
bf="う / よう",
rx="おう|こう|ごう|そう|とう|のう|ぼう|もう|ろう|よう",
tk=["う", "よう"],
va=["う", "よう", "おう", "こう", "しよう", "来よう"],
E=[
("もう遅いから、一緒に帰ろう。", "もうおそいから、いっしょにかえろう。", "Já está tarde, vamos voltar juntos."),
("明日は早いから、もう寝よう。", "あしたははやいから、もうねよう。", "Amanhã acordo cedo, vou dormir."),
("今度の休みに、海へ行こうよ。", "こんどのやすみに、うみへいこうよ。", "Na próxima folga, vamos à praia!"),
("疲れたね。ちょっと休もうか。", "つかれたね。ちょっとやすもうか。", "Cansamos, né. Vamos descansar um pouco?"),
("今日から毎日運動しよう。", "きょうからまいにちうんどうしよう。", "A partir de hoje, vou fazer exercício todo dia."),
],
R=[
("お腹がすいたね。何か食べ____。", "Estou com fome. Vamos comer alguma coisa.", ["よう"]),
("雨がやんだから、外で遊____。", "A chuva parou, vamos brincar lá fora.", ["ぼう"]),
("時間がないから、急____。", "Não temos tempo, vamos nos apressar.", ["ごう"]),
("じゃ、明日駅で会____。", "Então, vamos nos encontrar na estação amanhã.", ["おう"]),
("よし、今日こそ部屋を掃除し____。", "Muito bem, hoje sem falta vou limpar o quarto.", ["よう"]),
],
),
dict(
n=23,
jp="いらっしゃる",
rd="irassharu",
tr="Estar / Ir / Vir (respeitoso)",
ex="""いらっしゃる é o verbo respeitoso (尊敬語) usado no lugar de いる (estar), 行く (ir) e 来る (vir), quando o sujeito é alguém que merece respeito, como um cliente, um professor ou um chefe.

No 尊敬語, quem fala eleva a pessoa de quem se fala. Por isso, いらっしゃる nunca é usado para si mesmo.

O sentido exato, estar, ir ou vir, é entendido pelo contexto e pelas partículas da frase.

Na forma ます, ele é irregular: em vez de いらっしゃります, diz-se いらっしゃいます. A saudação いらっしゃいませ, usada em lojas para receber clientes, vem desse verbo.""",
st="""Pessoa respeitada + が / は + Lugar + に + いらっしゃる (estar)
Pessoa respeitada + が / は + Lugar + へ / に + いらっしゃる (ir / vir)

Educado: いらっしゃいます (forma irregular)
Passado: いらっしゃった / いらっしゃいました
Saudação: いらっしゃいませ""",
no="""Para falar de si mesmo ou da própria empresa em situações formais, usa-se a forma humilde: おる no lugar de いる, e 参る no lugar de 行く e 来る.

Também é muito comum a forma いらっしゃってください, para convidar alguém respeitosamente a vir.

Outras formas respeitosas com o mesmo sentido existem, como お越しになる, mais formal, e お見えになる, para "vir".""",
bf="いらっしゃる",
rx="いらっしゃ",
tk=["いらっしゃる"],
va=["いらっしゃる", "いらっしゃいます", "いらっしゃった", "いらっしゃいました", "いらっしゃいませ"],
E=[
("社長は今、会議室にいらっしゃいます。", "しゃちょうはいま、かいぎしつにいらっしゃいます。", "O presidente está na sala de reuniões agora."),
("先生は明日、京都へいらっしゃるそうです。", "せんせいはあした、きょうとへいらっしゃるそうです。", "Dizem que o professor vai a Kyoto amanhã."),
("いらっしゃいませ。何名様ですか。", "いらっしゃいませ。なんめいさまですか。", "Bem-vindo. Quantas pessoas?"),
("田中様がいらっしゃいました。", "たなかさまがいらっしゃいました。", "O senhor Tanaka chegou."),
("週末はどこかへいらっしゃいますか。", "しゅうまつはどこかへいらっしゃいますか。", "O senhor vai a algum lugar no fim de semana?"),
],
R=[
("部長は今、どちらに____か。", "Onde o gerente está agora?", ["いらっしゃいます"]),
("先ほど、先生がこちらに____。", "Há pouco, o professor veio aqui.", ["いらっしゃいました"]),
("社長は毎朝八時に会社に____。", "O presidente chega à empresa às oito toda manhã.", ["いらっしゃいます"]),
("お客様が____ので、お茶を出してください。", "Chegou um cliente, então sirva o chá, por favor.", ["いらっしゃった", "いらっしゃいました"]),
("「____ませ。」と店員が言った。", "\"Bem-vindo!\", disse o atendente.", ["いらっしゃい"]),
],
),
dict(
n=24,
jp="いたします",
rd="itashimasu",
tr="Fazer (humilde) / Farei",
ex="""いたします é a forma humilde (謙譲語) de します. Ela significa "fazer", mas quem fala se coloca em posição modesta para mostrar respeito ao ouvinte.

No 謙譲語, a ideia é rebaixar as próprias ações. Por isso, いたします é usado só para ações de quem fala ou do seu grupo, como a própria empresa. Nunca é usado para ações de clientes ou superiores.

É muito comum em situações de trabalho, atendimento ao cliente e anúncios. Também aparece em expressões fixas, como お願いいたします e 失礼いたします.

Com verbos do tipo "substantivo + する", basta trocar する por いたします. A combinação com お / ご, como em ご案内いたします, deixa a frase ainda mais humilde.""",
st="""Substantivo de ação + いたします
お / ご + Substantivo de ação + いたします

Passado: いたしました
Informal humilde: いたす

Expressões fixas: よろしくお願いいたします / 失礼いたします / 承知いたしました""",
no="""よろしくお願いいたします é uma das frases mais usadas em e-mails de trabalho no Japão. É mais formal que よろしくお願いします.

Para ações de outras pessoas que merecem respeito, a forma correta é a respeitosa なさる, e não いたします.

Na escrita, いたします costuma ser escrito em hiragana quando é auxiliar, e com o kanji 致します em alguns contextos.""",
bf="いたす",
rx="いたし|致し",
tk=["いたします"],
va=["いたします", "いたしました", "いたす", "致します"],
E=[
("会場まで私がご案内いたします。", "かいじょうまでわたしがごあんないいたします。", "Eu vou guiá-lo até o local."),
("今後ともよろしくお願いいたします。", "こんごともよろしくおねがいいたします。", "Conto com o seu apoio daqui em diante."),
("明日、こちらからお電話いたします。", "あした、こちらからおでんわいたします。", "Amanhã, nós ligamos para o senhor."),
("会議は十時から開始いたします。", "かいぎはじゅうじからかいしいたします。", "A reunião começará às dez."),
("先ほどは大変失礼いたしました。", "さきほどはたいへんしつれいいたしました。", "Peço desculpas pelo que aconteceu há pouco."),
],
R=[
("後ほどご連絡____。", "Entraremos em contato mais tarde.", ["いたします"]),
("お荷物は私がお持ち____。", "Eu carrego a sua bagagem.", ["いたします"]),
("どうぞよろしくお願い____。", "Muito prazer, conto com o senhor.", ["いたします"]),
("昨日は大変失礼____。", "Peço desculpas por ontem.", ["いたしました"]),
("それでは、会議を始めることに____。", "Então, daremos início à reunião.", ["いたします"]),
],
),
dict(
n=25,
jp="〜じゃないか",
rd="ja nai ka",
tr="Não é que...! / Ora / Eu não disse?",
ex="""じゃないか é uma expressão casual usada no final da frase para mostrar surpresa, chamar atenção para algo óbvio ou repreender alguém. Equivale a "ora!", "não é que...!" ou "eu não disse?".

Apesar de ter forma negativa, o sentido é afirmativo. Quem fala está, na verdade, afirmando algo com ênfase.

Os usos mais comuns são:
• Surpresa ao perceber algo: "ora, se não é o Tanaka!".
• Elogio inesperado: "nossa, é gostoso!".
• Lembrar ou repreender: "eu não te disse?", "você está atrasado!".

Ele é informal e soa um pouco masculino ou direto. A versão じゃないですか é mais educada e muito usada na conversa para buscar concordância.""",
st="""Substantivo / Adjetivo な + じゃないか
Adjetivo い + じゃないか
Verbo (forma simples) + じゃないか

Educado: じゃないですか
Forma escrita / formal: ではないか
Forma muito casual: じゃん""",
no="""Na fala dos jovens, じゃん é a forma mais curta e casual, muito usada no dia a dia.

じゃないですか às vezes é usado demais, para apresentar algo como se fosse óbvio para o outro. Em excesso, pode soar presunçoso.

A entonação é importante: descendo, é uma afirmação enfática; subindo, vira uma pergunta de confirmação.""",
bf="じゃないか",
rx="じゃないか|じゃないですか|じゃん",
tk=["じゃ", "ない", "か"],
va=["じゃないか", "じゃないですか", "じゃん"],
E=[
("あれ、田中じゃないか。", "あれ、たなかじゃないか。", "Ué, não é o Tanaka?"),
("このケーキ、おいしいじゃないか。", "このケーキ、おいしいじゃないか。", "Ora, este bolo é gostoso!"),
("だから言ったじゃないか。", "だからいったじゃないか。", "Eu não te disse?"),
("遅かったじゃないか。どうしたの？", "おそかったじゃないか。どうしたの？", "Você demorou, hein! O que aconteceu?"),
("いい天気じゃないですか。散歩しましょう。", "いいてんきじゃないですか。さんぽしましょう。", "Que dia bonito, não é? Vamos dar uma caminhada."),
],
R=[
("何だ、山田____。久しぶり。", "Ora, se não é o Yamada! Quanto tempo.", ["じゃないか"]),
("約束の時間はもう過ぎている____。", "Já passou da hora combinada, ora!", ["じゃないか"]),
("君の絵、上手____。", "Seu desenho é bom, hein!", ["じゃないか"]),
("危ない____。気をつけて。", "Que perigo! Tome cuidado.", ["じゃないか"]),
("前にも話した____。忘れたの？", "Eu já te falei antes, não falei? Esqueceu?", ["じゃないか", "じゃないですか"]),
],
),
dict(
n=26,
jp="〜かどうか",
rd="ka dou ka",
tr="Se... ou não",
ex="""かどうか é usado para incluir uma pergunta de "sim ou não" dentro de uma frase maior. Equivale a "se... ou não".

Ele aparece quando a pessoa não sabe, quer saber, vai verificar ou vai perguntar se algo é verdade. Por isso, combina muito com verbos como わかる, 知る, 聞く, 確認する e 調べる.

A frase antes de かどうか fica na forma simples. Com substantivos e adjetivos な, o だ desaparece.

Para perguntas com palavras interrogativas, como "onde", "quem" ou "quando", usa-se só か, sem どうか.""",
st="""Verbo (forma simples) + かどうか
Adjetivo い + かどうか
Adjetivo な (sem だ) + かどうか
Substantivo (sem だ) + かどうか

… かどうか + わからない / 知らない / 聞く / 確認する""",
no="""かどうか é a forma resumida de "か、〜ないか". Por isso, a estrutura A か A ないか tem o mesmo sentido.

Não use かどうか com palavras interrogativas: para "não sei onde ele está", usa-se どこにいるか.

Em pedidos formais, かどうか aparece em frases como "gostaria de saber se...", seguido de 教えていただけますか.""",
bf="かどうか",
rx="かどうか",
tk=["か", "どう", "か"],
va=["かどうか"],
E=[
("明日雨が降るかどうか、わかりません。", "あしたあめがふるかどうか、わかりません。", "Não sei se amanhã vai chover ou não."),
("彼が来るかどうか、聞いてみます。", "かれがくるかどうか、きいてみます。", "Vou perguntar se ele vem ou não."),
("この答えが正しいかどうか、確認してください。", "このこたえがただしいかどうか、かくにんしてください。", "Verifique se esta resposta está correta, por favor."),
("その店がおいしいかどうか、行ってみないとわからない。", "そのみせがおいしいかどうか、いってみないとわからない。", "Só indo lá para saber se a comida é boa ou não."),
("その話が本当かどうか、まだ誰も知らない。", "そのはなしがほんとうかどうか、まだだれもしらない。", "Ninguém sabe ainda se essa história é verdade."),
],
R=[
("パーティーに行ける____、まだわかりません。", "Ainda não sei se vou poder ir à festa.", ["かどうか"]),
("このサイズが合う____、着てみてください。", "Experimente para ver se este tamanho serve.", ["かどうか"]),
("一人暮らしの彼女が元気____、心配です。", "Estou preocupado se ela, que mora sozinha, está bem.", ["かどうか"]),
("試験に合格した____、来週わかります。", "Semana que vem vou saber se passei na prova.", ["かどうか"]),
("ドアの鍵を閉めた____、覚えていない。", "Não lembro se tranquei a porta ou não.", ["かどうか"]),
],
),
dict(
n=27,
jp="〜かしら",
rd="kashira",
tr="Será que...? / Fico me perguntando",
ex="""かしら é uma partícula de final de frase que expressa dúvida ou curiosidade, como "será que...?". Muitas vezes, a pessoa fala consigo mesma ou pensa em voz alta.

Ela tem o mesmo sentido de かな, mas é tradicionalmente associada à fala feminina. Por isso, aparece muito em falas de mulheres em filmes, novelas, livros e animes, principalmente de personagens mais maduras ou elegantes.

Também pode ser usada para fazer pedidos de forma delicada e indireta, principalmente com ないかしら, como "será que você não poderia...?".

A frase antes de かしら fica na forma simples. Com substantivos e adjetivos な, o だ costuma ser omitido.""",
st="""Verbo / Adjetivo い (forma simples) + かしら
Substantivo / Adjetivo な + かしら
Frase + のかしら
Verbo ない / てもらえない + かしら (pedido delicado)""",
no="""Hoje em dia, かしら é menos comum na fala das mulheres jovens, que preferem かな. Mesmo assim, é muito frequente em ficção.

Homens raramente usam かしら, exceto em contextos específicos ou para efeito de personagem.

O tom de かしら é suave e reflexivo, nunca agressivo.""",
bf="かしら",
rx="かしら",
tk=["かしら"],
va=["かしら"],
E=[
("明日は晴れるかしら。", "あしたははれるかしら。", "Será que amanhã vai fazer sol?"),
("田中さん、もう帰ったのかしら。", "たなかさん、もうかえったのかしら。", "Será que o Tanaka já foi embora?"),
("この服、私に似合うかしら。", "このふく、わたしににあうかしら。", "Será que esta roupa fica bem em mim?"),
("誰が来たのかしら。", "だれがきたのかしら。", "Quem será que veio?"),
("ちょっと手伝ってもらえないかしら。", "ちょっとてつだってもらえないかしら。", "Será que você poderia me ajudar um pouco?"),
],
R=[
("雨、早くやむ____。", "Será que a chuva vai parar logo?", ["かしら"]),
("あの人は誰____。", "Quem será aquela pessoa?", ["かしら"]),
("彼、私のこと覚えている____。", "Será que ele se lembra de mim?", ["かしら"]),
("ちょっと窓を開けてもいい____。", "Será que posso abrir um pouco a janela?", ["かしら"]),
("鍵、どこに置いたの____。", "Onde será que deixei a chave?", ["かしら"]),
],
),
dict(
n=28,
jp="〜かい",
rd="kai",
tr="Partícula de pergunta (casual)",
ex="""かい é uma partícula de pergunta usada no final da frase, na fala casual. Ela transforma a frase em uma pergunta de "sim ou não", com um tom amigável.

É associada principalmente à fala masculina e de pessoas mais velhas, como pais, avôs e professores falando com crianças ou jovens. Soa gentil e um pouco paternal.

Ela vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos e adjetivos な, sem だ.

Com perguntas que pedem explicação, aparece como のかい.""",
st="""Verbo / Adjetivo い (forma simples) + かい
Substantivo / Adjetivo な + かい
Frase + のかい""",
no="""かい é usado apenas em perguntas de "sim ou não". Em perguntas com palavras interrogativas, como "o que" ou "onde", usa-se だい, como em 何だい.

Na fala de jovens, かい é pouco usado; eles preferem a entonação subindo ou の.

Por ser casual, かい nunca é usado com superiores ou em situações formais.""",
bf="かい",
rx="かい",
tk=["かい"],
va=["かい", "のかい"],
E=[
("やあ、元気かい？", "やあ、げんきかい？", "E aí, tudo bem?"),
("もうご飯を食べたかい？", "もうごはんをたべたかい？", "Já comeu?"),
("明日、一緒に行くかい？", "あした、いっしょにいくかい？", "Quer ir junto amanhã?"),
("本当にそれでいいのかい？", "ほんとうにそれでいいのかい？", "Tem certeza de que está bom assim?"),
("君はここの学生かい？", "きみはここのがくせいかい？", "Você é aluno daqui?"),
],
R=[
("宿題はもう終わった____？", "Já terminou a lição?", ["かい"]),
("この本、読む____？", "Quer ler este livro?", ["かい"]),
("顔色が悪いね。疲れたの____？", "Você está pálido. Está cansado?", ["かい"]),
("その服で寒くない____？", "Não está com frio com essa roupa?", ["かい"]),
("みんな行くけど、君も行く____？", "Todo mundo vai. Você também vai?", ["かい"]),
],
),
dict(
n=29,
jp="〜かもしれない",
rd="kamo shirenai",
tr="Talvez / Pode ser que",
ex="""かもしれない é usado para dizer que algo é possível, mas sem certeza. Equivale a "talvez" ou "pode ser que".

O grau de certeza é baixo: mais ou menos 50% ou menos. Isso é diferente de だろう e でしょう, que indicam uma suposição mais forte, e de はずだ, que indica uma expectativa baseada em fatos.

Ele vem depois da forma simples de verbos e adjetivos. Com substantivos e adjetivos な, o だ desaparece.

Na forma educada, usa-se かもしれません. Na fala informal, é muito comum encurtar para かも.""",
st="""Verbo (forma simples) + かもしれない
Adjetivo い + かもしれない
Adjetivo な (sem だ) + かもしれない
Substantivo (sem だ) + かもしれない

Educado: かもしれません
Fala informal: かも""",
no="""Para reforçar a dúvida, é comum usar もしかしたら ou もしかすると no começo da frase.

かも sozinho, no final da frase, é muito usado por jovens e soa bem leve.

Com superiores, かもしれません é uma forma educada de não afirmar algo com certeza, o que é bem valorizado na comunicação japonesa.""",
bf="かもしれない",
rx="かもしれない|かもしれません|かもしれなかった|かも",
tk=["かも", "しれない"],
va=["かもしれない", "かもしれません", "かも"],
E=[
("午後から雨が降るかもしれません。", "ごごからあめがふるかもしれません。", "Talvez chova a partir da tarde."),
("彼はもう帰ったかもしれない。", "かれはもうかえったかもしれない。", "Pode ser que ele já tenha ido embora."),
("この問題は少し難しいかもしれません。", "このもんだいはすこしむずかしいかもしれません。", "Esta questão talvez seja um pouco difícil."),
("あの人は先生かもしれない。", "あのひとはせんせいかもしれない。", "Aquela pessoa talvez seja professora."),
("明日は忙しいから、行けないかも。", "あしたはいそがしいから、いけないかも。", "Amanhã estou ocupado, então talvez não consiga ir."),
],
R=[
("道が混んでいるから、少し遅れる____。", "O trânsito está ruim, então talvez eu me atrase um pouco.", ["かもしれません", "かもしれない", "かも"]),
("彼女は今日、来ない____。", "Talvez ela não venha hoje.", ["かもしれません", "かもしれない", "かも"]),
("その話は本当____。", "Essa história pode ser verdade.", ["かもしれません", "かもしれない", "かも"]),
("この服は私には少し大きい____。", "Esta roupa talvez seja um pouco grande para mim.", ["かもしれません", "かもしれない", "かも"]),
("財布はかばんの中にある____と思って、探しました。", "Achei que a carteira talvez estivesse na bolsa e procurei.", ["かもしれない"]),
],
),
dict(
n=30,
jp="〜かな",
rd="kana",
tr="Será que...? / Fico pensando se...",
ex="""かな é uma partícula de final de frase que expressa dúvida, curiosidade ou reflexão. Equivale a "será que...?" ou "fico pensando se...".

Muitas vezes, a pessoa fala consigo mesma, pensando em voz alta. Mas かな também pode ser usado numa conversa, para fazer uma pergunta de forma leve, sem pressionar o outro.

Com a forma volitiva, como 食べようかな, expressa uma decisão que ainda está sendo pensada: "acho que vou comer...".

Com ないかな, pode expressar um desejo ("tomara que...") ou um pedido indireto ("será que você não poderia...?").

かな é informal e usado por homens e mulheres. A versão かなあ é mais reflexiva.""",
st="""Verbo / Adjetivo い (forma simples) + かな
Substantivo / Adjetivo な + かな
Forma volitiva + かな (acho que vou...)
Verbo ない / てくれない + かな (desejo / pedido indireto)

Variação: かなあ""",
no="""かな tem o mesmo sentido de かしら, mas かな é neutro quanto ao gênero e muito mais comum hoje.

Em situações formais, o equivalente é でしょうか.

Usar かな numa pergunta direta a alguém deixa a frase mais suave e menos insistente.""",
bf="かな",
rx="かな|かなあ",
tk=["かな"],
va=["かな", "かなあ"],
E=[
("明日は晴れるかな。", "あしたははれるかな。", "Será que amanhã vai fazer sol?"),
("田中さんは来るかな。", "たなかさんはくるかな。", "Será que o Tanaka vem?"),
("このケーキ、おいしいかな。", "このケーキ、おいしいかな。", "Será que este bolo está gostoso?"),
("今日の昼ご飯は何を食べようかな。", "きょうのひるごはんはなにをたべようかな。", "O que será que eu como no almoço hoje?"),
("ちょっと手伝ってくれないかな。", "ちょっとてつだってくれないかな。", "Será que você poderia me ajudar um pouco?"),
],
R=[
("誕生日に何をもらえる____。", "O que será que vou ganhar de aniversário?", ["かな", "かなあ"]),
("この答えで合っている____。", "Será que esta resposta está certa?", ["かな", "かなあ"]),
("次の電車は何時に来る____。", "A que horas será que vem o próximo trem?", ["かな", "かなあ"]),
("週末、どこへ行こう____。", "Aonde será que eu vou no fim de semana?", ["かな", "かなあ"]),
("暑いね。窓を開けてくれない____。", "Está quente. Será que você poderia abrir a janela?", ["かな", "かなあ"]),
],
),
]
