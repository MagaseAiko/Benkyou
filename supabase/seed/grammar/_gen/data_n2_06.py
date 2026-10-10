G = [
dict(
n=51,
jp="〜からして",
rd="kara shite",
tr="A começar por / Já pelo / Só de ver",
ex="""からして tem dois usos principais.

O primeiro é dar um exemplo inicial, geralmente o mais básico ou óbvio, para mostrar que algo é assim. Equivale a "a começar por" ou "até mesmo". Por exemplo, "o próprio presidente se atrasa, então é natural que os funcionários também se atrasem". O tom costuma ser de crítica.

O segundo é indicar uma base para julgar algo, com o sentido de "já pelo..." ou "só de ver...". A pessoa observa um detalhe, como a aparência, o nome ou o jeito de falar, e chega a uma conclusão. Por exemplo, "só pela fachada, já parece cara".

Ele vem diretamente depois de substantivos.""",
st="""Substantivo (exemplo inicial) + からして + Frase (crítica / avaliação)
Substantivo (detalhe observado) + からして、 + Julgamento""",
no="""No primeiro uso, からして costuma apontar alguém que deveria dar o exemplo, como um chefe ou professor.

No segundo uso, é parecido com からすると, mas からして destaca um detalhe inicial ou superficial.

É uma expressão comum em conversas e textos de opinião.""",
bf="からして",
rx="からして",
tk=["から", "して"],
va=["からして"],
E=[
("この店は、外観からして高そうだ。", "このみせは、がいかんからしてたかそうだ。", "Só pela fachada, esta loja já parece cara."),
("彼は話し方からして、真面目な人だとわかる。", "かれははなしかたからして、まじめなひとだとわかる。", "Já pelo jeito de falar, dá para ver que ele é uma pessoa séria."),
("この映画は、タイトルからしておもしろそうだ。", "このえいがは、タイトルからしておもしろそうだ。", "Só pelo título, este filme já parece interessante."),
("社長からして遅刻するのだから、社員が遅れるのも当然だ。", "しゃちょうからしてちこくするのだから、しゃいんがおくれるのもとうぜんだ。", "A começar pelo presidente, que se atrasa, é natural que os funcionários também se atrasem."),
("あの態度からして、彼は反省していない。", "あのたいどからして、かれははんせいしていない。", "Só por aquela atitude, dá para ver que ele não está arrependido."),
],
R=[
("この料理は、におい____おいしそうだ。", "Esta comida, só pelo cheiro, já parece gostosa.", ["からして"]),
("彼の服装____、お金持ちのようだ。", "Só pelas roupas, ele parece ser rico.", ["からして"]),
("先生____ルールを守らないのだから、学生が守るはずがない。", "A começar pelo professor, que não segue as regras, é óbvio que os alunos também não vão seguir.", ["からして"]),
("その顔____、何かあったようだね。", "Só pela sua cara, parece que aconteceu alguma coisa, hein.", ["からして"]),
("名前____、強そうな犬だ。", "Só pelo nome, parece ser um cachorro forte.", ["からして"]),
],
),
dict(
n=52,
jp="〜からすると",
rd="kara suru to",
tr="A julgar por / Do ponto de vista de / Para",
ex="""からすると tem dois usos principais.

O primeiro é fazer uma suposição a partir de algo observado. Equivale a "a julgar por". A pessoa observa uma pista, como a expressão de alguém, o céu ou pegadas, e chega a uma conclusão provável. A frase costuma terminar com ようだ, らしい, だろう ou そうだ.

O segundo é indicar o ponto de vista de alguém ou de um grupo. Equivale a "do ponto de vista de" ou "para". Por exemplo, "do ponto de vista dos pais, a segurança dos filhos é o mais importante".

A forma からすれば tem o mesmo sentido.""",
st="""Substantivo (pista observada) + からすると、 + Suposição + ようだ / らしい / だろう
Substantivo (pessoa / grupo / posição) + からすると / からすれば、 + Opinião""",
no="""No uso de suposição, からすると é parecido com からして e から見ると.

No uso de ponto de vista, からすれば é um pouco mais comum.

É uma expressão muito usada em deduções e em discussões sobre diferentes pontos de vista.""",
bf="からすると",
rx="からすると|からすれば",
tk=["から", "すると"],
va=["からすると", "からすれば"],
E=[
("彼の表情からすると、試験はうまくいったようだ。", "かれのひょうじょうからすると、しけんはうまくいったようだ。", "A julgar pela expressão dele, parece que a prova foi bem."),
("親の立場からすると、子供の安全が一番だ。", "おやのたちばからすると、こどものあんぜんがいちばんだ。", "Do ponto de vista dos pais, a segurança dos filhos é o mais importante."),
("この空からすると、午後は雨になりそうだ。", "このそらからすると、ごごはあめになりそうだ。", "A julgar por este céu, parece que vai chover à tarde."),
("日本人からすれば、当たり前のことかもしれない。", "にほんじんからすれば、あたりまえのことかもしれない。", "Para os japoneses, talvez seja algo óbvio."),
("彼の話し方からすると、関西の人だろう。", "かれのはなしかたからすると、かんさいのひとだろう。", "A julgar pelo jeito de falar, ele deve ser da região de Kansai."),
],
R=[
("彼女の様子____、何か心配事があるようだ。", "A julgar pelo jeito dela, parece que há alguma preocupação.", ["からすると", "からすれば"]),
("子供の立場____、親の言うことは厳しすぎる。", "Do ponto de vista das crianças, o que os pais dizem é rígido demais.", ["からすると", "からすれば"]),
("足跡____、犯人は男性だろう。", "A julgar pelas pegadas, o culpado deve ser um homem.", ["からすると", "からすれば"]),
("専門家____、この計画は無理がある。", "Do ponto de vista dos especialistas, este plano é inviável.", ["からすると", "からすれば"]),
("彼の顔色____、体調が悪いみたいだ。", "A julgar pela cor do rosto dele, parece que não está bem.", ["からすると", "からすれば"]),
],
),
dict(
n=53,
jp="〜からと言って",
rd="kara to itte",
tr="Só porque / Não é porque... que",
ex="""からと言って é usado para dizer que um motivo não justifica necessariamente uma conclusão. Equivale a "só porque..." ou "não é porque... que...".

A primeira parte apresenta um fato que poderia levar a uma conclusão, e a segunda nega essa conclusão. Por isso, a segunda parte costuma terminar com expressões negativas ou de correção, como とは限らない, わけではない, てはいけない ou必要はない.

Por exemplo, "só porque é caro, não significa que seja bom" ou "não é porque falhou que deve desistir".

Na fala casual, からと言って costuma virar からって.""",
st="""Frase (forma simples) + からと言って、 + Negação
… + とは限らない / わけではない / てはいけない / 必要はない

Fala: からって
Escrita: からと言って / からといって""",
no="""からと言って é uma ótima forma de corrigir generalizações e preconceitos.

A segunda parte quase nunca é afirmativa simples. Ela corrige ou nega a conclusão esperada.

Em conselhos, からと言って aparece para dizer que algo não é desculpa: 忙しいからと言って、連絡しないのはよくない.""",
bf="からと言って",
rx="からと言って|からといって|からって",
tk=["から", "と", "言って"],
va=["からと言って", "からといって", "からって"],
E=[
("高いからと言って、いい物とは限らない。", "たかいからといって、いいものとはかぎらない。", "Só porque é caro, não significa que seja bom."),
("日本人だからと言って、みんな敬語が上手なわけではない。", "にほんじんだからといって、みんなけいごがじょうずなわけではない。", "Não é porque é japonês que todos são bons em linguagem honorífica."),
("一度失敗したからと言って、あきらめてはいけない。", "いちどしっぱいしたからといって、あきらめてはいけない。", "Não é porque falhou uma vez que deve desistir."),
("忙しいからと言って、連絡しないのはよくない。", "いそがしいからといって、れんらくしないのはよくない。", "Estar ocupado não justifica não dar notícias."),
("嫌いだからって、食べないのはだめだよ。", "きらいだからって、たべないのはだめだよ。", "Só porque não gosta, não pode deixar de comer."),
],
R=[
("お金がある____、幸せとは限らない。", "Só porque tem dinheiro, não significa que seja feliz.", ["からと言って", "からといって"]),
("若い____、無理をしてはいけない。", "Não é porque é jovem que pode exagerar.", ["からと言って", "からといって"]),
("一度失敗した____、才能がないわけではない。", "Só porque falhou uma vez, não significa que não tenha talento.", ["からと言って", "からといって"]),
("安い____、たくさん買う必要はない。", "Só porque é barato, não precisa comprar muito.", ["からと言って", "からといって"]),
("先生だ____、何でも知っているわけではない。", "Não é porque é professor que sabe de tudo.", ["からと言って", "からといって"]),
],
),
dict(
n=54,
jp="〜っこない",
rd="kkonai",
tr="Não tem como / Jamais / De jeito nenhum",
ex="""っこない é uma expressão casual que nega uma possibilidade com muita força. Equivale a "não tem como", "jamais" ou "de jeito nenhum".

Ele vem depois do verbo na forma ます sem ます, geralmente com verbos potenciais ou verbos de resultado, como わかる, 勝てる, 終わる e 間に合う.

Por exemplo, "uma questão tão difícil, não tem como entender" ou "de jeito nenhum dá para ganhar dele".

O sentido é parecido com わけがない e はずがない, mas っこない é bem mais coloquial e emocional. Por isso, é usado com amigos e família, e não em situações formais.""",
st="""Verbo na forma ます sem ます + っこない
Verbo potencial sem ます + っこない (できっこない / 勝てっこない)""",
no="""っこない é muito comum entre jovens e em conversas informais.

Em situações formais, use わけがない ou はずがない.

Às vezes, っこない expressa desânimo ou falta de confiança, como em できっこない ("não vou conseguir de jeito nenhum").""",
bf="っこない",
rx="っこない|っこありません",
tk=["っこない"],
va=["っこない"],
E=[
("こんな難しい問題、わかりっこない。", "こんなむずかしいもんだい、わかりっこない。", "Uma questão tão difícil assim, não tem como entender."),
("一日でこの仕事が終わりっこない。", "いちにちでこのしごとがおわりっこない。", "Não tem como este trabalho terminar em um dia."),
("あんなに強い人に勝てっこないよ。", "あんなにつよいひとにかてっこないよ。", "De jeito nenhum dá para ganhar de alguém tão forte."),
("そんな話、誰も信じっこない。", "そんなはなし、だれもしんじっこない。", "Uma história dessas, ninguém vai acreditar jamais."),
("今から走っても、間に合いっこない。", "いまからはしっても、まにあいっこない。", "Mesmo correndo agora, não tem como chegar a tempo."),
],
R=[
("一人でこんなに食べられ____。", "Não tem como comer tudo isso sozinho.", ["っこない"]),
("あんなに怒っていたから、彼女が許してくれ____。", "Ela estava tão brava que jamais vai me perdoar.", ["っこない"]),
("そんな高い車、買え____。", "Um carro tão caro assim, não tem como comprar.", ["っこない"]),
("今から勉強しても、合格でき____。", "Mesmo estudando a partir de agora, não tem como passar.", ["っこない"]),
("こんな難しい話、子供にわかり____。", "Uma conversa tão difícil, criança nenhuma entende.", ["っこない"]),
],
),
dict(
n=55,
jp="〜ことだ（忠告）",
rd="koto da (chuukoku)",
tr="O melhor é / O certo é / O importante é",
ex="""Nesse uso, ことだ é usado para dar um conselho ou uma recomendação forte, dizendo qual é a melhor coisa a fazer em uma situação. Equivale a "o melhor é", "o certo é" ou "o importante é".

Ele vem depois do verbo na forma de dicionário ou na forma ない. Muitas vezes, a primeira parte apresenta um objetivo com たいなら, たければ ou ば: "se quer melhorar o japonês, o melhor é falar todo dia".

O tom é de quem tem experiência ou autoridade para aconselhar, como um professor, um pai ou um superior. Por isso, não é usado para aconselhar pessoas mais velhas ou de posição superior.

Na forma educada, usa-se ことです.""",
st="""(〜たいなら / 〜たければ、) + Verbo na forma de dicionário + ことだ
Verbo na forma ない + ことだ (o melhor é não...)

Educado: ことです""",
no="""ことだ é diferente de ほうがいい: ことだ soa mais firme e assertivo, como uma recomendação decisiva.

Com superiores, ことだ pode soar arrogante. Prefira ほうがいいと思います.

Não confunda com outros usos de ことだ, como "é algo que..." em frases explicativas.""",
bf="ことだ",
rx="ことだ|ことです",
tk=["こと", "だ"],
va=["ことだ", "ことです", "ないことだ"],
E=[
("日本語が上手になりたいなら、毎日話すことだ。", "にほんごがじょうずになりたいなら、まいにちはなすことだ。", "Se quer melhorar o japonês, o melhor é falar todo dia."),
("健康になりたければ、よく寝ることです。", "けんこうになりたければ、よくねることです。", "Se quer ficar saudável, o importante é dormir bem."),
("風邪を早く治したいなら、無理をしないことだ。", "かぜをはやくなおしたいなら、むりをしないことだ。", "Se quer se curar logo do resfriado, o melhor é não exagerar."),
("わからないことがあれば、先生に聞くことだ。", "わからないことがあれば、せんせいにきくことだ。", "Se tiver alguma dúvida, o certo é perguntar ao professor."),
("合格したければ、もっと勉強することだ。", "ごうかくしたければ、もっとべんきょうすることだ。", "Se quer passar, o melhor é estudar mais."),
],
R=[
("痩せたいなら、甘い物を食べない____。", "Se quer emagrecer, o melhor é não comer doces.", ["ことだ", "ことです"]),
("試験に受かりたければ、過去問を解く____。", "Se quer passar na prova, o melhor é resolver provas anteriores.", ["ことだ", "ことです"]),
("友達を作りたいなら、自分から話しかける____。", "Se quer fazer amigos, o melhor é puxar conversa você mesmo.", ["ことだ", "ことです"]),
("疲れているなら、ゆっくり休む____。", "Se está cansado, o melhor é descansar bem.", ["ことだ", "ことです"]),
("成功したければ、あきらめない____。", "Se quer ter sucesso, o importante é não desistir.", ["ことだ", "ことです"]),
],
),
dict(
n=56,
jp="〜ことだから",
rd="koto dakara",
tr="Como se trata de / Conhecendo / Sendo quem é",
ex="""ことだから é usado para fazer uma suposição baseada no que se conhece sobre uma pessoa, geralmente sobre o caráter ou os hábitos dela. Equivale a "como se trata de...", "conhecendo..." ou "sendo quem é...".

A estrutura é Pessoa + の + ことだから. Muitas vezes, antes da pessoa vem uma descrição, como 真面目な彼 (ele, que é sério) ou いつも遅刻する彼 (ele, que sempre se atrasa).

A segunda parte é uma suposição, geralmente com だろう, に違いない, はずだ ou きっと.

Por exemplo, "conhecendo ele, que é tão sério, com certeza vai cumprir a promessa" ou "como se trata de uma criança, logo vai esquecer".

A suposição pode ser positiva ou negativa, dependendo do que se sabe da pessoa.""",
st="""(Descrição +) Pessoa + の + ことだから、 + Suposição + だろう / に違いない / はずだ""",
no="""ことだから quase sempre é usado com pessoas, e não com objetos.

A estrutura mostra que quem fala conhece bem a pessoa e confia nesse conhecimento para prever o comportamento dela.

É comum em conversas entre amigos e família.""",
bf="ことだから",
rx="ことだから",
tk=["こと", "だから"],
va=["ことだから"],
E=[
("真面目な彼のことだから、きっと約束を守るだろう。", "まじめなかれのことだから、きっとやくそくをまもるだろう。", "Conhecendo ele, que é tão sério, com certeza vai cumprir a promessa."),
("子供のことだから、すぐ忘れるだろう。", "こどものことだから、すぐわすれるだろう。", "Como se trata de uma criança, logo vai esquecer."),
("いつも遅刻する彼のことだから、今日も遅れるだろう。", "いつもちこくするかれのことだから、きょうもおくれるだろう。", "Sendo ele, que sempre se atrasa, hoje também deve chegar atrasado."),
("料理上手な母のことだから、おいしい料理を作ってくれるだろう。", "りょうりじょうずなははのことだから、おいしいりょうりをつくってくれるだろう。", "Conhecendo minha mãe, que cozinha tão bem, ela deve fazer uma comida deliciosa."),
("優しい田中さんのことだから、手伝ってくれるはずだ。", "やさしいたなかさんのことだから、てつだってくれるはずだ。", "Conhecendo o Tanaka, que é tão gentil, ele deve ajudar."),
],
R=[
("頭のいい彼女の____、きっと合格するだろう。", "Conhecendo ela, que é tão inteligente, com certeza vai passar.", ["ことだから"]),
("忙しい部長の____、今日も帰りが遅くなるだろう。", "Sendo o gerente tão ocupado, hoje também deve voltar tarde.", ["ことだから"]),
("心配性の母の____、何度も電話してくるだろう。", "Conhecendo minha mãe, que se preocupa tanto, ela deve ligar várias vezes.", ["ことだから"]),
("忘れっぽい彼の____、また約束を忘れているに違いない。", "Sendo ele tão esquecido, com certeza esqueceu o compromisso de novo.", ["ことだから"]),
("正直な彼の____、うそはつかないだろう。", "Conhecendo ele, que é tão honesto, não deve mentir.", ["ことだから"]),
],
),
dict(
n=57,
jp="〜ことか",
rd="koto ka",
tr="Quanto! / Como! / Quantas vezes!",
ex="""ことか é usado no fim de uma frase para expressar um sentimento muito forte, com o sentido de exclamação. Equivale a "quanto...!", "como...!" ou "quantas vezes...!".

Ele aparece quase sempre junto com palavras de grau ou quantidade, como どんなに, どれほど, どれだけ e 何度. A ideia é que o sentimento ou a quantidade foi tão grande que não dá nem para medir.

Por exemplo, "como fiquei feliz ao saber que passei!" ou "quantas vezes eu te avisei!".

Apesar de terminar com か, não é uma pergunta. É uma exclamação emocional.

A forma ことだろう tem o mesmo sentido e soa um pouco mais suave.""",
st="""どんなに / どれほど / どれだけ / 何度 + … + ことか
… + ことだろう (mais suave)""",
no="""ことか é típico de textos escritos e de falas emocionadas.

Sem palavras como どんなに ou 何度, a frase com ことか fica estranha.

É comum em cartas, discursos e relatos de emoções intensas, como saudade e alívio.""",
bf="ことか",
rx="ことか|ことだろう",
tk=["こと", "か"],
va=["ことか", "ことだろう"],
E=[
("合格したと聞いて、どんなにうれしかったことか。", "ごうかくしたときいて、どんなにうれしかったことか。", "Como fiquei feliz ao saber que passei!"),
("この日をどれほど待ったことか。", "このひをどれほどまったことか。", "Quanto eu esperei por este dia!"),
("同じことを何度注意したことか。", "おなじことをなんどちゅういしたことか。", "Quantas vezes eu avisei sobre a mesma coisa!"),
("一人暮らしは、どんなに寂しいことか。", "ひとりぐらしは、どんなにさびしいことか。", "Como é solitário morar sozinho!"),
("家族に会えて、どれだけ安心したことだろう。", "かぞくにあえて、どれだけあんしんしたことだろう。", "Quanto alívio eu senti ao ver minha família!"),
],
R=[
("あなたに会えて、どんなにうれしい____。", "Como estou feliz por te ver!", ["ことか"]),
("子供のころ、何度この川で遊んだ____。", "Quantas vezes brinquei neste rio quando era criança!", ["ことか"]),
("彼の言葉に、どれだけ救われた____。", "Quanto as palavras dele me salvaram!", ["ことか"]),
("試験の結果を、どれほど心配した____。", "Como me preocupei com o resultado da prova!", ["ことか"]),
("留学中、母の料理がどんなに恋しかった____。", "Como senti falta da comida da minha mãe durante o intercâmbio!", ["ことか"]),
],
),
dict(
n=58,
jp="〜ことなく",
rd="koto naku",
tr="Sem / Sem jamais / Nem uma vez",
ex="""ことなく é usado para dizer que algo é feito sem que outra coisa aconteça. Equivale a "sem" ou "sem jamais".

Ele vem depois do verbo na forma de dicionário. O sentido é o mesmo de ないで e ずに, mas ことなく soa mais formal e literário.

Muitas vezes, indica uma ação que seria natural ou esperada, mas que não aconteceu nem uma vez. Por exemplo, "ele trabalhou sem parar" ou "perseguiu o sonho sem desistir nem uma vez".

É muito usado em textos escritos, notícias, discursos e narrativas, especialmente para descrever persistência ou continuidade.""",
st="""Verbo na forma de dicionário + ことなく + Verbo
一度も + Verbo + ことなく (sem nem uma vez)

Variação: こともなく""",
no="""Na conversa do dia a dia, ないで ou ずに são mais naturais.

ことなく aparece muito em frases sobre persistência, como 休むことなく e あきらめることなく.

Em textos sobre tradição, 変わることなく ("sem mudar") é comum para falar de algo que se mantém.""",
bf="ことなく",
rx="ことなく|こともなく",
tk=["こと", "なく"],
va=["ことなく", "こともなく"],
E=[
("彼は休むことなく働き続けた。", "かれはやすむことなくはたらきつづけた。", "Ele continuou trabalhando sem parar."),
("一度もあきらめることなく、夢を追い続けた。", "いちどもあきらめることなく、ゆめをおいつづけた。", "Perseguiu o sonho sem desistir nem uma vez."),
("誰にも知られることなく、彼は町を出た。", "だれにもしられることなく、かれはまちをでた。", "Ele deixou a cidade sem que ninguém soubesse."),
("彼女は迷うことなく、その仕事を選んだ。", "かのじょはまようことなく、そのしごとをえらんだ。", "Ela escolheu esse trabalho sem hesitar."),
("雨は止むことなく降り続いた。", "あめはやむことなくふりつづいた。", "A chuva continuou caindo sem parar."),
],
R=[
("彼女は一日も休む____、学校に通った。", "Ela frequentou a escola sem faltar nem um dia.", ["ことなく"]),
("彼は誰にも相談する____、一人で決めた。", "Ele decidiu sozinho, sem consultar ninguém.", ["ことなく"]),
("失敗を恐れる____、挑戦してください。", "Tente sem ter medo de errar.", ["ことなく"]),
("彼は振り返る____、去っていった。", "Ele foi embora sem olhar para trás.", ["ことなく"]),
("この店は、百年間変わる____昔の味を守っている。", "Esta loja mantém o sabor de antigamente há cem anos, sem mudar.", ["ことなく"]),
],
),
dict(
n=59,
jp="〜ことに",
rd="koto ni",
tr="Para minha surpresa / Infelizmente / Felizmente",
ex="""ことに é usado no começo de uma frase para expressar o sentimento de quem fala sobre o que vai ser dito. Ele aparece depois de adjetivos ou verbos de sentimento.

As formas mais comuns são:
• 驚いたことに: para minha surpresa.
• うれしいことに: para minha alegria, felizmente.
• 残念なことに: infelizmente.
• 不思議なことに: curiosamente.
• 幸いなことに: por sorte, felizmente.
• 困ったことに: para piorar, o problema é que.

A ideia é: "o que é surpreendente / triste / bom é que...". O sentimento vem primeiro, e o fato vem depois.

Ele vem depois de adjetivos い, adjetivos な com な e verbos na forma た.""",
st="""Adjetivo い (sentimento) + ことに、 + Fato
Adjetivo な + な + ことに、 + Fato
Verbo de sentimento na forma た + ことに、 + Fato""",
no="""ことに soa um pouco formal e aparece muito em textos, notícias e relatos.

Na conversa, as pessoas costumam dizer simplesmente 驚いたけど ou 残念だけど.

幸いなことに é muito comum em notícias, como em "felizmente, não houve feridos".""",
bf="ことに",
rx="ことに",
tk=["こと", "に"],
va=["ことに"],
E=[
("驚いたことに、彼は試験に合格した。", "おどろいたことに、かれはしけんにごうかくした。", "Para minha surpresa, ele passou na prova."),
("うれしいことに、来週友達が遊びに来る。", "うれしいことに、らいしゅうともだちがあそびにくる。", "Para minha alegria, um amigo vem me visitar semana que vem."),
("残念なことに、雨で試合は中止になった。", "ざんねんなことに、あめでしあいはちゅうしになった。", "Infelizmente, a partida foi cancelada por causa da chuva."),
("不思議なことに、誰もそのことを覚えていなかった。", "ふしぎなことに、だれもそのことをおぼえていなかった。", "Curiosamente, ninguém se lembrava disso."),
("幸いなことに、けが人はいなかった。", "さいわいなことに、けがにんはいなかった。", "Felizmente, não houve feridos."),
],
R=[
("残念な____、彼はパーティーに来られなかった。", "Infelizmente, ele não pôde vir à festa.", ["ことに"]),
("驚いた____、彼女は一人で全部やった。", "Para minha surpresa, ela fez tudo sozinha.", ["ことに"]),
("困った____、財布を忘れてしまった。", "O problema é que acabei esquecendo a carteira.", ["ことに"]),
("うれしい____、試験に合格した。", "Para minha alegria, passei na prova.", ["ことに"]),
("面白い____、二人は同じ日に生まれた。", "Curiosamente, os dois nasceram no mesmo dia.", ["ことに"]),
],
),
dict(
n=60,
jp="〜ことにはならない",
rd="koto ni wa naranai",
tr="Não significa que / Não equivale a / Não conta como",
ex="""ことにはならない é usado para dizer que uma ação não é suficiente para ser considerada outra coisa. Equivale a "não significa que", "não equivale a" ou "não conta como".

A ideia é corrigir uma conclusão apressada. Por exemplo, "só assistir uma vez não significa que você entendeu" ou "comprar o livro não conta como estudar".

Muitas vezes, a primeira parte usa だけでは ou ただ, mostrando que aquilo é pouco para chegar à conclusão.

Ele vem depois da forma た do verbo (ou da forma simples) + ことにはならない. Também é comum a forma ということにはならない.""",
st="""… + だけでは、 + Verbo na forma た + ことにはならない
Frase + ということにはならない

Educado: ことにはなりません""",
no="""Essa estrutura é muito útil em argumentos e conselhos, para mostrar que algo é insuficiente.

Compare com ことになる (fica decidido / resulta em), que é a forma afirmativa.

É comum em falas de professores e pais: 謝ればいいということにはならない ("pedir desculpas não resolve tudo").""",
bf="ことにはならない",
rx="ことにはならない|ことにはなりません|ことにならない",
tk=["こと", "に", "は", "ならない"],
va=["ことにはならない", "ことにはなりません", "ということにはならない"],
E=[
("一度見ただけでは、理解したことにはならない。", "いちどみただけでは、りかいしたことにはならない。", "Só ter visto uma vez não significa que você entendeu."),
("謝っただけでは、責任を取ったことにはならない。", "あやまっただけでは、せきにんをとったことにはならない。", "Só pedir desculpas não equivale a assumir a responsabilidade."),
("本を買っただけでは、勉強したことにはならない。", "ほんをかっただけでは、べんきょうしたことにはならない。", "Só comprar o livro não conta como estudar."),
("黙っていても、問題を解決したことにはならない。", "だまっていても、もんだいをかいけつしたことにはならない。", "Ficar calado não significa que o problema foi resolvido."),
("一回勝っただけでは、強いということにはならない。", "いっかいかっただけでは、つよいということにはならない。", "Vencer uma vez só não significa que você é forte."),
],
R=[
("授業に出ただけでは、勉強した____。", "Só ir à aula não significa que você estudou.", ["ことにはならない", "ことにはなりません"]),
("計画を立てただけでは、実行した____。", "Só fazer o plano não equivale a executá-lo.", ["ことにはならない", "ことにはなりません"]),
("知っているだけでは、できる____。", "Só saber não significa conseguir fazer.", ["ことにはならない", "ことにはなりません"]),
("謝れば許される____。", "Pedir desculpas não significa que você será perdoado.", ["ことにはならない", "ことにはなりません"]),
("一度話しただけで、友達になった____。", "Ter conversado uma vez não significa que viraram amigos.", ["ことにはならない", "ことにはなりません"]),
],
),
]
