-- n2-grammar-01 — 〜あげく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-01',
    'grammar',
    'N2',
    $$〜あげく$$,
    $$ageku$$,
    $$Depois de muito... acabou / No fim de tudo / Ao final de$$,
    $$あげく é usado para dizer que, depois de um processo longo e difícil, a situação terminou em um resultado, geralmente negativo ou decepcionante. Equivale a "depois de muito..., acabou..." ou "no fim de tudo".

A primeira parte descreve algo que durou bastante e exigiu esforço, como ficar em dúvida, discutir, procurar ou sofrer. A segunda mostra o desfecho, muitas vezes frustrante.

Por exemplo, "depois de ficar em dúvida por muito tempo, acabei não comprando nada" ou "depois de muito discutir, o plano foi cancelado".

Ele vem depois do verbo na forma た e de substantivos com の.

Expressões como さんざん, いろいろ e 長い間 combinam muito com あげく, porque reforçam a ideia de um processo longo.$$,
    $$あげく tem um tom quase sempre negativo. Para resultados positivos depois de esforço, usa-se 末に, que também aparece no N2.

あげくの果てに é uma expressão ainda mais forte, como "e, para piorar tudo...".

A segunda parte descreve um fato que já aconteceu, e não uma vontade ou um pedido.$$,
    $$Verbo na forma た + あげく(に)、 + Resultado
Substantivo + の + あげく(に)、 + Resultado

Escrita: あげく / 挙げ句 / 挙句$$,
    $$あげく$$,
    $$あげく|挙げ句|挙句$$,
    ARRAY['あげく']::text[],
    ARRAY['あげく', 'あげくに', '挙げ句']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-01', $$さんざん迷ったあげく、何も買わなかった。$$, $$さんざんまよったあげく、なにもかわなかった。$$, $$Depois de ficar muito tempo em dúvida, acabei não comprando nada.$$),
    ('n2-grammar-01', $$長い間話し合ったあげく、計画は中止になった。$$, $$ながいあいだはなしあったあげく、けいかくはちゅうしになった。$$, $$Depois de muito discutir, o plano acabou sendo cancelado.$$),
    ('n2-grammar-01', $$彼は悩んだあげく、会社をやめることにした。$$, $$かれはなやんだあげく、かいしゃをやめることにした。$$, $$Depois de muito sofrer com a decisão, ele resolveu sair da empresa.$$),
    ('n2-grammar-01', $$道に迷ったあげく、約束の時間に遅れてしまった。$$, $$みちにまよったあげく、やくそくのじかんにおくれてしまった。$$, $$Me perdi e, no fim, acabei chegando atrasado ao compromisso.$$),
    ('n2-grammar-01', $$何度も喧嘩したあげく、二人は別れた。$$, $$なんどもけんかしたあげく、ふたりはわかれた。$$, $$Depois de brigarem várias vezes, os dois se separaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一時間も待たされた____、会議は中止になった。$$, $$Depois de nos fazerem esperar uma hora inteira, a reunião foi cancelada.$$),
        (2, $$散々考えた____、留学をあきらめた。$$, $$Depois de pensar muito, desisti do intercâmbio.$$),
        (3, $$色々な店を回った____、最初の店で買った。$$, $$Depois de rodar várias lojas, no fim comprei na primeira.$$),
        (4, $$何度も失敗した____、彼はついに諦めた。$$, $$Depois de fracassar muitas vezes, ele finalmente desistiu.$$),
        (5, $$長い議論の____、結論は出なかった。$$, $$Ao final de uma longa discussão, não se chegou a nenhuma conclusão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-01', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あげく$$),
        (2, $$あげく$$),
        (3, $$あげく$$),
        (4, $$あげく$$),
        (5, $$あげく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-02 — あるいは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-02',
    'grammar',
    'N2',
    $$あるいは$$,
    $$aruiwa$$,
    $$Ou / Ou então / Talvez$$,
    $$あるいは é uma conjunção formal que significa "ou". Ela apresenta alternativas, das quais uma é escolhida.

Ela é muito usada em textos escritos, avisos, formulários, documentos e notícias. Na conversa, os japoneses costumam usar か ou それか.

Por exemplo, "entre em contato por telefone ou e-mail" ou "amanhã vai chover ou nevar".

Além de "ou", あるいは também pode significar "talvez", no começo de uma frase, com かもしれない: "talvez o que ele diz esteja certo". Nesse uso, ela é parecida com もしかすると.

あるいは é um pouco mais formal e literária que または.$$,
    $$または e あるいは são muito parecidas. あるいは soa mais escrito e é comum em textos jornalísticos.

No uso de "talvez", あるいは deixa a suposição mais suave e literária.

Em formulários, frases como 本人あるいは家族 ("a própria pessoa ou um familiar") aparecem com frequência.$$,
    $$A + あるいは + B (A ou B)
A、 + あるいは + B
あるいは、 + Frase + かもしれない (talvez)

Escrita: あるいは / 或いは$$,
    $$あるいは$$,
    $$あるいは|或いは$$,
    ARRAY['あるいは']::text[],
    ARRAY['あるいは', '或いは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-02', $$電話あるいはメールで連絡してください。$$, $$でんわあるいはメールでれんらくしてください。$$, $$Entre em contato por telefone ou e-mail.$$),
    ('n2-grammar-02', $$明日は雨、あるいは雪になるでしょう。$$, $$あしたはあめ、あるいはゆきになるでしょう。$$, $$Amanhã deve chover ou nevar.$$),
    ('n2-grammar-02', $$申し込みは、インターネットあるいは郵送で受け付けます。$$, $$もうしこみは、インターネットあるいはゆうそうでうけつけます。$$, $$As inscrições são aceitas pela internet ou pelo correio.$$),
    ('n2-grammar-02', $$彼はもう帰ったか、あるいはまだ会議中かもしれない。$$, $$かれはもうかえったか、あるいはまだかいぎちゅうかもしれない。$$, $$Talvez ele já tenha ido embora, ou então ainda esteja em reunião.$$),
    ('n2-grammar-02', $$あるいは、彼の言うことが正しいのかもしれない。$$, $$あるいは、かれのいうことがただしいのかもしれない。$$, $$Talvez o que ele diz esteja certo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$黒____青のペンで記入してください。$$, $$Preencha com caneta preta ou azul.$$),
        (2, $$来週の月曜日、____火曜日に伺います。$$, $$Irei visitá-lo na segunda ou na terça da semana que vem.$$),
        (3, $$本人____家族の方が来てください。$$, $$Venha a própria pessoa ou um familiar.$$),
        (4, $$____、それが正しい答えかもしれない。$$, $$Talvez essa seja a resposta correta.$$),
        (5, $$現金____クレジットカードでお支払いください。$$, $$Pague em dinheiro ou com cartão de crédito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-02', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$あるいは$$),
        (2, $$あるいは$$),
        (3, $$あるいは$$),
        (4, $$あるいは$$),
        (5, $$あるいは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-03 — 〜ばかり（数量）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-03',
    'grammar',
    'N2',
    $$〜ばかり（数量）$$,
    $$bakari (suuryou)$$,
    $$Cerca de / Mais ou menos / Uns$$,
    $$Depois de números e quantidades, ばかり indica uma quantidade aproximada. Equivale a "cerca de", "mais ou menos" ou "uns".

Por exemplo, "andei cerca de dez minutos" ou "tirei uns dias de folga".

É parecido com ぐらい e ほど, mas soa um pouco mais formal e literário.

Também aparece em expressões como 少しばかり, que significa "um pouquinho" e é usada com modéstia, como ao pedir algo emprestado ou ao oferecer um presente.

Esse uso é diferente do ばかり de "só" e do たばかり de "acabou de".$$,
    $$Na conversa do dia a dia, ぐらい é mais comum. ばかり com números soa mais escrito.

少しばかりですが ("é só uma lembrancinha") é uma frase humilde usada ao dar presentes.

O contexto mostra qual ばかり é: depois de números, é quantidade aproximada.$$,
    $$Número + Contador + ばかり
Número + Contador + ばかり + の + Substantivo
少しばかり (um pouquinho)$$,
    $$ばかり$$,
    $$ばかり$$,
    ARRAY['ばかり']::text[],
    ARRAY['ばかり', '少しばかり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-03', $$駅まで十分ばかり歩いた。$$, $$えきまでじゅっぷんばかりあるいた。$$, $$Andei cerca de dez minutos até a estação.$$),
    ('n2-grammar-03', $$一週間ばかり休みをもらった。$$, $$いっしゅうかんばかりやすみをもらった。$$, $$Tirei mais ou menos uma semana de folga.$$),
    ('n2-grammar-03', $$すまないが、千円ばかり貸してくれないか。$$, $$すまないが、せんえんばかりかしてくれないか。$$, $$Desculpe, mas você poderia me emprestar uns mil ienes?$$),
    ('n2-grammar-03', $$三日ばかり旅行に行ってきます。$$, $$みっかばかりりょこうにいってきます。$$, $$Vou viajar por uns três dias.$$),
    ('n2-grammar-03', $$会場には十人ばかりの人が集まった。$$, $$かいじょうにはじゅうにんばかりのひとがあつまった。$$, $$Cerca de dez pessoas se reuniram no local.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅で一時間____待った。$$, $$Esperei cerca de uma hora na estação.$$),
        (2, $$祖母は五日____入院していた。$$, $$Minha avó ficou internada por uns cinco dias.$$),
        (3, $$すみません、少し____お金を貸してください。$$, $$Desculpe, poderia me emprestar um pouquinho de dinheiro?$$),
        (4, $$説明会には二十人____の学生が参加した。$$, $$Cerca de vinte estudantes participaram da reunião informativa.$$),
        (5, $$去年、一か月____日本を旅行した。$$, $$No ano passado, viajei pelo Japão por cerca de um mês.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-03', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかり$$),
        (2, $$ばかり$$),
        (3, $$ばかり$$),
        (4, $$ばかり$$),
        (5, $$ばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-04 — 〜ばかりだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-04',
    'grammar',
    'N2',
    $$〜ばかりだ$$,
    $$bakari da$$,
    $$Só piorar / Só aumentar / Cada vez mais$$,
    $$ばかりだ, depois de um verbo de mudança na forma de dicionário, indica que uma situação muda continuamente em uma única direção, quase sempre para pior. Equivale a "só piora", "só aumenta" ou "fica cada vez mais...".

Por exemplo, "a doença só piora" ou "os preços só sobem, e o salário não aumenta".

O sentido é muito parecido com 一方だ (N3). As duas formas indicam uma tendência que não para. ばかりだ costuma ter um tom ainda mais negativo e preocupado.

Ela é usada com verbos como 悪くなる, 増える, 減る, 上がる e 下がる.

Na forma ばかりで, liga a tendência a uma consequência negativa.$$,
    $$ばかりだ, nesse sentido, quase nunca é usado para mudanças positivas. Para algo bom que só aumenta, prefira 一方だ ou ていく.

Não confunda com ばかり de "só / nada além de", que vem depois de substantivos.

Em notícias sobre economia e meio ambiente, essa estrutura aparece com frequência.$$,
    $$Verbo de mudança (forma de dicionário) + ばかりだ / ばかりです
Verbo de mudança + ばかりで、 + Consequência
Passado: ばかりだった$$,
    $$ばかりだ$$,
    $$ばかりだ|ばかりです|ばかりで$$,
    ARRAY['ばかり', 'だ']::text[],
    ARRAY['ばかりだ', 'ばかりです', 'ばかりで', 'ばかりだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-04', $$祖父の病気は悪くなるばかりだ。$$, $$そふのびょうきはわるくなるばかりだ。$$, $$A doença do meu avô só piora.$$),
    ('n2-grammar-04', $$物価は上がるばかりで、給料は上がらない。$$, $$ぶっかはあがるばかりで、きゅうりょうはあがらない。$$, $$Os preços só sobem, e o salário não aumenta.$$),
    ('n2-grammar-04', $$彼との関係は悪化するばかりだ。$$, $$かれとのかんけいはあっかするばかりだ。$$, $$A relação com ele só piora.$$),
    ('n2-grammar-04', $$この町の人口は減るばかりです。$$, $$このまちのじんこうはへるばかりです。$$, $$A população desta cidade só diminui.$$),
    ('n2-grammar-04', $$カードを使いすぎて、借金は増えるばかりだった。$$, $$カードをつかいすぎて、しゃっきんはふえるばかりだった。$$, $$Usei demais o cartão, e a dívida só aumentava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜になって、雨は強くなる____。$$, $$À noite, a chuva só fica mais forte.$$),
        (2, $$仕事は増える____で、休めない。$$, $$O trabalho só aumenta, e não consigo descansar.$$),
        (3, $$最近、彼の成績は下がる____。$$, $$Ultimamente, as notas dele só caem.$$),
        (4, $$一人で考えていると、心配は大きくなる____です。$$, $$Quando penso sozinho, a preocupação só aumenta.$$),
        (5, $$けんかの後、二人の関係は悪くなる____だった。$$, $$Depois da briga, a relação dos dois só piorava.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-04', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりだ$$),
        (1, $$ばかりです$$),
        (2, $$ばかり$$),
        (3, $$ばかりだ$$),
        (3, $$ばかりです$$),
        (4, $$ばかり$$),
        (5, $$ばかり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-05 — 〜ばかりか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-05',
    'grammar',
    'N2',
    $$〜ばかりか$$,
    $$bakari ka$$,
    $$Não só... como até / Não apenas... mas também$$,
    $$ばかりか é usado para dizer que, além de uma coisa, existe outra ainda mais surpreendente ou extrema. Equivale a "não só..., como até" ou "não apenas..., mas também".

A primeira parte apresenta algo, e a segunda acrescenta algo a mais, geralmente com も, まで ou さえ, que reforçam a ideia de "até mesmo".

Por exemplo, "ele não só não pediu desculpas, como até reclamou" ou "não só choveu, como até começou a trovejar".

Pode ser usado para coisas positivas ou negativas. O ponto principal é que a segunda parte vai além da primeira.

Comparado a ばかりでなく e だけでなく, ばかりか é mais enfático e soa mais formal.$$,
    $$ばかりか não é usado com pedidos ou ordens na segunda parte. Ela descreve fatos.

まで e さえ na segunda parte deixam a surpresa ainda mais evidente.

É comum em textos escritos e narrativas, para mostrar uma situação que foi se agravando ou melhorando além do esperado.$$,
    $$Substantivo + ばかりか、 + … + も / まで / さえ
Verbo / Adjetivo い (forma simples) + ばかりか
Adjetivo な + な + ばかりか$$,
    $$ばかりか$$,
    $$ばかりか$$,
    ARRAY['ばかり', 'か']::text[],
    ARRAY['ばかりか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-05', $$彼は英語ばかりか、フランス語も話せる。$$, $$かれはえいごばかりか、フランスごもはなせる。$$, $$Ele fala não só inglês, como também francês.$$),
    ('n2-grammar-05', $$この店は安いばかりか、味もいい。$$, $$このみせはやすいばかりか、あじもいい。$$, $$Esta loja não só é barata, como também é gostosa.$$),
    ('n2-grammar-05', $$彼は謝らないばかりか、文句まで言った。$$, $$かれはあやまらないばかりか、もんくまでいった。$$, $$Ele não só não pediu desculpas, como até reclamou.$$),
    ('n2-grammar-05', $$雨ばかりか、雷まで鳴り出した。$$, $$あめばかりか、かみなりまでなりだした。$$, $$Não só choveu, como até começou a trovejar.$$),
    ('n2-grammar-05', $$彼女は勉強ばかりか、スポーツも得意だ。$$, $$かのじょはべんきょうばかりか、スポーツもとくいだ。$$, $$Ela vai bem não só nos estudos, como também nos esportes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、大人もこのゲームに夢中だ。$$, $$Não só as crianças, como até os adultos estão viciados neste jogo.$$),
        (2, $$彼は約束を忘れた____、うそまでついた。$$, $$Ele não só esqueceu o compromisso, como até mentiu.$$),
        (3, $$この薬は効かない____、副作用もある。$$, $$Este remédio não só não funciona, como ainda tem efeitos colaterais.$$),
        (4, $$旅行中、財布____、パスポートまでなくした。$$, $$Na viagem, perdi não só a carteira, como até o passaporte.$$),
        (5, $$彼女は料理が上手な____、裁縫も得意だ。$$, $$Ela não só cozinha bem, como também é ótima na costura.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-05', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりか$$),
        (2, $$ばかりか$$),
        (3, $$ばかりか$$),
        (4, $$ばかりか$$),
        (5, $$ばかりか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-06 — 〜ばかりに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-06',
    'grammar',
    'N2',
    $$〜ばかりに$$,
    $$bakari ni$$,
    $$Só por causa de / Simplesmente porque / Por um simples$$,
    $$ばかりに é usado para dizer que um único motivo, muitas vezes pequeno, causou um resultado ruim. Equivale a "só por causa de", "simplesmente porque" ou "por um simples...".

O tom é de arrependimento ou lamento: se não fosse aquele motivo, tudo teria dado certo. Por exemplo, "só porque dormi demais, me atrasei para a prova" ou "por ter dito uma palavra a mais, acabei deixando ela brava".

A segunda parte é sempre negativa ou indesejada.

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な e de substantivos com である.$$,
    $$Com たい, a forma たいばかりに significa "só por querer muito...", mostrando que a pessoa fez algo extremo por um desejo forte: 会いたいばかりに.

A diferença em relação a せいで é que ばかりに destaca que o motivo foi pequeno ou único, o que torna o resultado ainda mais lamentável.

A segunda parte não pode ser uma vontade ou um pedido.$$,
    $$Verbo / Adjetivo い (forma simples) + ばかりに、 + Resultado negativo
Adjetivo な + な + ばかりに
Substantivo + である + ばかりに$$,
    $$ばかりに$$,
    $$ばかりに$$,
    ARRAY['ばかり', 'に']::text[],
    ARRAY['ばかりに', 'たいばかりに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-06', $$寝坊したばかりに、試験に遅れた。$$, $$ねぼうしたばかりに、しけんにおくれた。$$, $$Só porque dormi demais, me atrasei para a prova.$$),
    ('n2-grammar-06', $$一言言ったばかりに、彼女を怒らせてしまった。$$, $$ひとこといったばかりに、かのじょをおこらせてしまった。$$, $$Por uma simples palavra, acabei deixando ela brava.$$),
    ('n2-grammar-06', $$お金がないばかりに、大学に行けなかった。$$, $$おかねがないばかりに、だいがくにいけなかった。$$, $$Só por falta de dinheiro, não pude ir para a faculdade.$$),
    ('n2-grammar-06', $$確認しなかったばかりに、大きな失敗をした。$$, $$かくにんしなかったばかりに、おおきなしっぱいをした。$$, $$Só por não ter conferido, cometi um grande erro.$$),
    ('n2-grammar-06', $$背が低いばかりに、モデルになれなかった。$$, $$せがひくいばかりに、モデルになれなかった。$$, $$Só por ser baixa, não consegui ser modelo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$傘を忘れた____、びしょ濡れになった。$$, $$Só por ter esquecido o guarda-chuva, fiquei encharcado.$$),
        (2, $$一度うそをついた____、信用をなくした。$$, $$Só por ter mentido uma vez, perdi a confiança.$$),
        (3, $$英語ができない____、チャンスを逃した。$$, $$Só por não saber inglês, perdi a oportunidade.$$),
        (4, $$ほんの少し遅れた____、電車に乗れなかった。$$, $$Só por ter me atrasado um pouquinho, não consegui pegar o trem.$$),
        (5, $$余計なことを言った____、けんかになった。$$, $$Só por ter falado o que não devia, virou briga.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-06', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりに$$),
        (2, $$ばかりに$$),
        (3, $$ばかりに$$),
        (4, $$ばかりに$$),
        (5, $$ばかりに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-07 — ちなみに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-07',
    'grammar',
    'N2',
    $$ちなみに$$,
    $$chinami ni$$,
    $$A propósito / Aliás / Por curiosidade$$,
    $$ちなみに é usado para acrescentar uma informação extra, relacionada ao que acabou de ser dito. Equivale a "a propósito", "aliás" ou "por curiosidade".

A informação acrescentada não é a principal, mas é útil ou interessante. Por exemplo, "a reunião é às três. Aliás, o local é no terceiro andar" ou "sou de Tóquio. A propósito, minha esposa é de Osaka".

A diferença em relação a ところで é importante. ところで muda de assunto completamente. ちなみに continua no mesmo assunto, só acrescentando um detalhe.

É muito usado em apresentações, explicações, e-mails e conversas do dia a dia.$$,
    $$Na internet, ちなみに é muito usado para acrescentar curiosidades ou observações.

Para mudar de assunto, use ところで ou さて, e não ちなみに.

ちなみに deixa a informação com um tom leve, como "só para você saber".$$,
    $$Frase 1 (com ponto final) + ちなみに、 + Informação extra relacionada

Escrita: ちなみに / 因みに$$,
    $$ちなみに$$,
    $$ちなみに|因みに$$,
    ARRAY['ちなみに']::text[],
    ARRAY['ちなみに', '因みに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-07', $$会議は三時からです。ちなみに、場所は三階です。$$, $$かいぎはさんじからです。ちなみに、ばしょはさんがいです。$$, $$A reunião é a partir das três. Aliás, o local é no terceiro andar.$$),
    ('n2-grammar-07', $$私は東京出身です。ちなみに、妻は大阪出身です。$$, $$わたしはとうきょうしゅっしんです。ちなみに、つまはおおさかしゅっしんです。$$, $$Eu sou de Tóquio. A propósito, minha esposa é de Osaka.$$),
    ('n2-grammar-07', $$この本はおもしろいよ。ちなみに、作者は私の先生なんだ。$$, $$このほんはおもしろいよ。ちなみに、さくしゃはわたしのせんせいなんだ。$$, $$Este livro é interessante. Por curiosidade, o autor é meu professor.$$),
    ('n2-grammar-07', $$このケーキは千円です。ちなみに、昨日は半額でした。$$, $$このケーキはせんえんです。ちなみに、きのうははんがくでした。$$, $$Este bolo custa mil ienes. Aliás, ontem estava pela metade do preço.$$),
    ('n2-grammar-07', $$今日は雨ですね。ちなみに、明日の天気は晴れだそうです。$$, $$きょうはあめですね。ちなみに、あしたのてんきははれだそうです。$$, $$Hoje está chovendo, né? A propósito, dizem que amanhã vai fazer sol.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私の趣味は料理です。____、得意料理はカレーです。$$, $$Meu hobby é cozinhar. Aliás, meu prato especial é curry.$$),
        (2, $$次の試験は来週です。____、範囲は十課までです。$$, $$A próxima prova é na semana que vem. A propósito, a matéria vai até a lição dez.$$),
        (3, $$この店はおいしい。____、値段も安い。$$, $$Esta loja é gostosa. Aliás, o preço também é barato.$$),
        (4, $$田中さんは医者です。____、お兄さんも医者だそうです。$$, $$O Tanaka é médico. A propósito, dizem que o irmão dele também é.$$),
        (5, $$パーティーは七時からです。____、会費は三千円です。$$, $$A festa começa às sete. Aliás, a taxa é de três mil ienes.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-07', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ちなみに$$),
        (2, $$ちなみに$$),
        (3, $$ちなみに$$),
        (4, $$ちなみに$$),
        (5, $$ちなみに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-08 — ちっとも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-08',
    'grammar',
    'N2',
    $$ちっとも〜ない$$,
    $$chittomo ~ nai$$,
    $$Nem um pouco / Nada / Absolutamente nada$$,
    $$ちっとも〜ない é usado para negar algo completamente, com ênfase. Equivale a "nem um pouco", "nada" ou "absolutamente nada".

ちっとも vem antes do verbo ou do adjetivo, e a frase fica sempre na forma negativa. O sentido é igual a 全然〜ない e 少しも〜ない.

A diferença é o tom: ちっとも é mais coloquial e costuma carregar um sentimento de frustração, reclamação ou decepção. Por exemplo, "estudei, mas não entendi nada" ou "ela não me dá notícias, nem um pouco".

Por ser casual, ちっとも é mais usado na fala do que na escrita formal.$$,
    $$Comparando: 全然〜ない é o mais comum; 少しも〜ない é um pouco mais formal; ちっとも〜ない é casual e emotivo.

ちっとも não é usado em frases afirmativas.

Muitas vezes aparece com のに, reforçando a frustração: 頑張っているのに、ちっとも上手にならない.$$,
    $$ちっとも + Verbo na forma negativa
ちっとも + Adjetivo い sem い + くない
ちっとも + Adjetivo な / Substantivo + じゃない$$,
    $$ちっとも$$,
    $$ちっとも$$,
    ARRAY['ちっとも', 'ない']::text[],
    ARRAY['ちっとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-08', $$彼の話はちっともおもしろくない。$$, $$かれのはなしはちっともおもしろくない。$$, $$A história dele não tem graça nenhuma.$$),
    ('n2-grammar-08', $$勉強したのに、ちっともわからなかった。$$, $$べんきょうしたのに、ちっともわからなかった。$$, $$Estudei, mas não entendi absolutamente nada.$$),
    ('n2-grammar-08', $$最近、ちっとも雨が降らない。$$, $$さいきん、ちっともあめがふらない。$$, $$Ultimamente não tem chovido nada.$$),
    ('n2-grammar-08', $$彼女はちっとも連絡をくれない。$$, $$かのじょはちっともれんらくをくれない。$$, $$Ela não me dá notícias, nem um pouco.$$),
    ('n2-grammar-08', $$このダイエットはちっとも効果がない。$$, $$このダイエットはちっともこうかがない。$$, $$Esta dieta não tem efeito nenhum.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日練習しているのに、____上手にならない。$$, $$Pratico todo dia, mas não melhoro nem um pouco.$$),
        (2, $$彼は____人の話を聞かない。$$, $$Ele não escuta nada do que os outros dizem.$$),
        (3, $$暖房をつけても、この部屋は____暖かくならない。$$, $$Mesmo com o aquecedor ligado, este quarto não esquenta nem um pouco.$$),
        (4, $$ずっと待っていたのに、バスは____来なかった。$$, $$Esperei muito tempo, mas o ônibus não apareceu de jeito nenhum.$$),
        (5, $$疲れていて、映画が____楽しめなかった。$$, $$Estava cansado e não consegui aproveitar o filme nem um pouco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-08', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ちっとも$$),
        (2, $$ちっとも$$),
        (3, $$ちっとも$$),
        (4, $$ちっとも$$),
        (5, $$ちっとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-09 — 〜だけあって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-09',
    'grammar',
    'N2',
    $$〜だけあって$$,
    $$dake atte$$,
    $$Como era de se esperar de / Não é à toa que / Por ser$$,
    $$だけあって é usado para dizer que um resultado positivo corresponde ao que se esperava de alguém ou de algo, por causa de uma qualidade, condição ou esforço. Equivale a "como era de se esperar de", "não é à toa que" ou "por ser...".

A primeira parte indica o motivo da expectativa: ser profissional, ter morado muito tempo no Japão, ser uma loja famosa, ter treinado muito. A segunda mostra que o resultado está à altura dessa expectativa.

Por exemplo, "como era de se esperar de um profissional, a comida é deliciosa" ou "não é à toa que é famosa: a loja está sempre cheia".

O tom é de admiração ou de reconhecimento. Por isso, é usado quase sempre para avaliações positivas.

さすが combina muito com だけあって, reforçando a ideia.$$,
    $$だけあって é parecido com だけに, mas だけに pode ter tom positivo ou negativo, enquanto だけあって é quase sempre positivo.

A forma だけのことはある (no fim da frase) tem um sentido parecido: "faz jus a...".

Em avaliações de restaurantes e produtos, だけあって aparece com frequência.$$,
    $$Substantivo + だけあって、 + Avaliação positiva
Verbo / Adjetivo い (forma simples) + だけあって
Adjetivo な + な + だけあって
さすが + … + だけあって$$,
    $$だけあって$$,
    $$だけあって|だけある$$,
    ARRAY['だけ', 'あって']::text[],
    ARRAY['だけあって', 'だけある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-09', $$さすがプロだけあって、料理がとてもおいしい。$$, $$さすがプロだけあって、りょうりがとてもおいしい。$$, $$Como era de se esperar de um profissional, a comida é deliciosa.$$),
    ('n2-grammar-09', $$彼は十年日本に住んでいただけあって、日本語がぺらぺらだ。$$, $$かれはじゅうねんにほんにすんでいただけあって、にほんごがぺらぺらだ。$$, $$Não é à toa que morou dez anos no Japão: fala japonês fluentemente.$$),
    ('n2-grammar-09', $$この店は有名なだけあって、いつも混んでいる。$$, $$このみせはゆうめいなだけあって、いつもこんでいる。$$, $$Não é à toa que esta loja é famosa: está sempre cheia.$$),
    ('n2-grammar-09', $$高いだけあって、このかばんは丈夫だ。$$, $$たかいだけあって、このかばんはじょうぶだ。$$, $$Por ser cara, esta bolsa é resistente, como era de se esperar.$$),
    ('n2-grammar-09', $$一生懸命練習しただけあって、彼は優勝した。$$, $$いっしょうけんめいれんしゅうしただけあって、かれはゆうしょうした。$$, $$Não é à toa que treinou tanto: ele foi campeão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日練習している____、彼女のピアノは上手だ。$$, $$Não é à toa que ela pratica todo dia: toca piano muito bem.$$),
        (2, $$有名なホテル____、サービスが素晴らしい。$$, $$Como era de se esperar de um hotel famoso, o serviço é excelente.$$),
        (3, $$値段が高い____、品質がいい。$$, $$Por ser caro, a qualidade é boa, como era de se esperar.$$),
        (4, $$元選手____、彼はルールに詳しい。$$, $$Não é à toa que é ex-atleta: conhece bem as regras.$$),
        (5, $$人気がある____、チケットがすぐに売り切れた。$$, $$Como era de se esperar de algo tão popular, os ingressos esgotaram na hora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-09', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけあって$$),
        (2, $$だけあって$$),
        (3, $$だけあって$$),
        (4, $$だけあって$$),
        (5, $$だけあって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-10 — 〜だけましだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-10',
    'grammar',
    'N2',
    $$〜だけましだ$$,
    $$dake mashi da$$,
    $$Pelo menos / Já é alguma coisa / Ainda bem que$$,
    $$だけましだ é usado para dizer que, apesar de uma situação ruim, existe algo que a torna menos grave. Equivale a "pelo menos", "já é alguma coisa" ou "ainda bem que".

まし significa "melhor (entre opções ruins)". Assim, a estrutura diz "só por isso, já está melhor".

A primeira parte costuma apresentar o problema, e a segunda, com だけましだ, mostra o lado menos ruim. Por exemplo, "o salário é baixo, mas pelo menos tenho emprego" ou "me machuquei, mas ainda bem que sobrevivi".

O tom é de consolo, conformismo ou otimismo realista.

Com まだ, a forma だけまだましだ reforça a ideia.$$,
    $$まし sozinho também é usado em comparações, como AよりBのほうがましだ ("B é menos ruim que A").

É uma expressão muito comum para consolar alguém depois de um problema.

O tom é realista: não diz que a situação é boa, apenas que poderia ser pior.$$,
    $$Verbo / Adjetivo (forma simples) + だけましだ
Adjetivo な + な + だけましだ
… + だけまだましだ (reforço)
… + だけでもましだ$$,
    $$だけましだ$$,
    $$だけましだ|だけまし|だけでもまし|だけまだまし$$,
    ARRAY['だけ', 'まし', 'だ']::text[],
    ARRAY['だけましだ', 'だけまだましだ', 'だけでもましだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-10', $$給料は安いが、仕事があるだけましだ。$$, $$きゅうりょうはやすいが、しごとがあるだけましだ。$$, $$O salário é baixo, mas pelo menos tenho emprego.$$),
    ('n2-grammar-10', $$けがはしたけど、命が助かっただけましだ。$$, $$けがはしたけど、いのちがたすかっただけましだ。$$, $$Me machuquei, mas ainda bem que sobrevivi.$$),
    ('n2-grammar-10', $$今日は雨だけど、雪じゃないだけましだ。$$, $$きょうはあめだけど、ゆきじゃないだけましだ。$$, $$Hoje está chovendo, mas pelo menos não é neve.$$),
    ('n2-grammar-10', $$狭い部屋だが、住む所があるだけまだましだ。$$, $$せまいへやだが、すむところがあるだけまだましだ。$$, $$O quarto é pequeno, mas pelo menos tenho onde morar.$$),
    ('n2-grammar-10', $$試合には負けたが、一点取れただけましだった。$$, $$しあいにはまけたが、いってんとれただけましだった。$$, $$Perdemos a partida, mas pelo menos marcamos um ponto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$財布は盗まれたが、カードが無事だった____。$$, $$Roubaram minha carteira, mas pelo menos os cartões estavam a salvo.$$),
        (2, $$熱はあるけど、食欲がある____。$$, $$Estou com febre, mas pelo menos tenho apetite.$$),
        (3, $$遅刻したけど、来た____。$$, $$Ele chegou atrasado, mas pelo menos veio.$$),
        (4, $$給料は少ないけど、もらえる____。$$, $$O salário é pouco, mas pelo menos recebo.$$),
        (5, $$寒いけど、風がない____。$$, $$Está frio, mas pelo menos não está ventando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-10', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけましだ$$),
        (2, $$だけましだ$$),
        (3, $$だけましだ$$),
        (4, $$だけましだ$$),
        (5, $$だけましだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-11 — 〜だけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-11',
    'grammar',
    'N2',
    $$〜だけに$$,
    $$dake ni$$,
    $$Justamente por / Exatamente porque / Como era de se esperar$$,
    $$だけに é usado para dizer que, justamente por causa de uma condição ou situação, o resultado é especialmente intenso. Equivale a "justamente por", "exatamente porque" ou "como era de se esperar de".

Ele tem dois tons principais.

O primeiro é de expectativa correspondida, parecido com だけあって: "por ter muita experiência, ele trabalha rápido".

O segundo, muito comum, é de intensificação de um sentimento: justamente porque havia expectativa ou esforço, a decepção ou a alegria é maior. Por exemplo, "justamente por ter esperado tanto, fiquei decepcionado" ou "justamente por ter me preparado tanto, a frustração de errar foi grande".

Diferente de だけあって, que é quase sempre positivo, だけに pode ter tom positivo ou negativo.$$,
    $$Com sentimentos negativos, だけに aparece muito com 残念, がっかり e 悔しい.

A frase だけに… sozinha às vezes é usada de forma humorística, depois de um trocadilho.

Comparando: だけあって = "faz jus a"; だけに = "justamente por isso, ainda mais".$$,
    $$Verbo / Adjetivo (forma simples) + だけに、 + Resultado intensificado
Adjetivo な + な + だけに
Substantivo + だけに / であるだけに$$,
    $$だけに$$,
    $$だけに$$,
    ARRAY['だけ', 'に']::text[],
    ARRAY['だけに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-11', $$期待していただけに、がっかりした。$$, $$きたいしていただけに、がっかりした。$$, $$Justamente por ter tanta expectativa, fiquei decepcionado.$$),
    ('n2-grammar-11', $$彼は経験が長いだけに、仕事が速い。$$, $$かれはけいけんがながいだけに、しごとがはやい。$$, $$Justamente por ter muita experiência, ele trabalha rápido.$$),
    ('n2-grammar-11', $$有名な店だけに、値段も高い。$$, $$ゆうめいなみせだけに、ねだんもたかい。$$, $$Como era de se esperar de uma loja famosa, o preço também é alto.$$),
    ('n2-grammar-11', $$一生懸命準備しただけに、失敗して悔しい。$$, $$いっしょうけんめいじゅんびしただけに、しっぱいしてくやしい。$$, $$Justamente por ter me preparado tanto, a frustração de errar é grande.$$),
    ('n2-grammar-11', $$若いだけに、回復が早い。$$, $$わかいだけに、かいふくがはやい。$$, $$Justamente por ser jovem, a recuperação é rápida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ずっと楽しみにしていた____、中止になって残念だ。$$, $$Justamente por estar esperando tanto, que pena que foi cancelado.$$),
        (2, $$彼は医者の息子な____、体のことに詳しい。$$, $$Justamente por ser filho de médico, ele entende bem de saúde.$$),
        (3, $$高かった____、壊れてショックだ。$$, $$Justamente por ter sido caro, fiquei chocado quando quebrou.$$),
        (4, $$毎日練習した____、勝ててうれしい。$$, $$Justamente por ter treinado todo dia, estou feliz por ter vencido.$$),
        (5, $$人気のある店な____、予約が取りにくい。$$, $$Como era de se esperar de uma loja popular, é difícil conseguir reserva.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-11', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけに$$),
        (2, $$だけに$$),
        (3, $$だけに$$),
        (4, $$だけに$$),
        (5, $$だけに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-12 — 〜だけのことはある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-12',
    'grammar',
    'N2',
    $$〜だけのことはある$$,
    $$dake no koto wa aru$$,
    $$Faz jus a / Vale o que / Não é à toa que$$,
    $$だけのことはある é usado para dizer que um resultado bom faz jus à condição, ao esforço ou ao preço. Equivale a "faz jus a", "vale o que..." ou "não é à toa que".

A ideia é que a qualidade observada corresponde exatamente ao que se esperava, ou ao que foi investido. Por exemplo, "este hotel faz jus ao preço: o serviço é ótimo" ou "não é à toa que treinou dez anos".

Ela fica geralmente no final da frase. Com て (だけのことはあって), liga-se à avaliação que vem em seguida.

O sentido é muito parecido com だけあって, mas だけのことはある costuma aparecer no fim da frase, como uma conclusão de admiração. さすが combina muito com essa expressão.$$,
    $$O tom é sempre positivo, de admiração ou elogio.

É comum depois de uma constatação: primeiro a pessoa vê o resultado, depois diz だけのことはある.

Em avaliações de produtos caros, 高いだけのことはある ("vale o preço") é muito comum.$$,
    $$Verbo / Adjetivo (forma simples) + だけのことはある
Substantivo + だけのことはある
… + だけのことはあって、 + Avaliação positiva
さすが + … + だけのことはある$$,
    $$だけのことはある$$,
    $$だけのことはあ$$,
    ARRAY['だけ', 'の', 'こと', 'は', 'ある']::text[],
    ARRAY['だけのことはある', 'だけのことはあって', 'だけのことはあります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-12', $$このホテルは高いだけのことはある。サービスが最高だ。$$, $$このホテルはたかいだけのことはある。サービスがさいこうだ。$$, $$Este hotel faz jus ao preço. O serviço é ótimo.$$),
    ('n2-grammar-12', $$すごい演奏だ。さすが十年も練習しただけのことはある。$$, $$すごいえんそうだ。さすがじゅうねんもれんしゅうしただけのことはある。$$, $$Que apresentação incrível. Não é à toa que treinou dez anos.$$),
    ('n2-grammar-12', $$有名な店だけのことはあって、とてもおいしい。$$, $$ゆうめいなみせだけのことはあって、とてもおいしい。$$, $$Faz jus à fama da loja: é muito gostoso.$$),
    ('n2-grammar-12', $$苦労しただけのことはあって、いい結果が出た。$$, $$くろうしただけのことはあって、いいけっかがでた。$$, $$Valeu todo o esforço: o resultado foi bom.$$),
    ('n2-grammar-12', $$見事なプレーだった。彼はプロだけのことはある。$$, $$みごとなプレーだった。かれはプロだけのことはある。$$, $$Foi uma jogada brilhante. Não é à toa que ele é profissional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この料理はおいしい。一流のシェフが作った____。$$, $$Esta comida é deliciosa. Faz jus a ter sido feita por um chef de primeira.$$),
        (2, $$彼女の英語は上手だ。アメリカに住んでいた____。$$, $$O inglês dela é ótimo. Não é à toa que morou nos Estados Unidos.$$),
        (3, $$景色が素晴らしい。三時間も山を登った____。$$, $$A paisagem é maravilhosa. Valeu as três horas de subida.$$),
        (4, $$この時計は丈夫だ。高かった____。$$, $$Este relógio é resistente. Faz jus ao preço que paguei.$$),
        (5, $$よく覚えているね。毎日勉強している____。$$, $$Você lembra muito bem, hein. Não é à toa que estuda todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-12', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけのことはある$$),
        (2, $$だけのことはある$$),
        (3, $$だけのことはある$$),
        (4, $$だけのことはある$$),
        (5, $$だけのことはある$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-13 — 〜だけは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-13',
    'grammar',
    'N2',
    $$〜だけは$$,
    $$dake wa$$,
    $$Pelo menos / Ao menos isso / Só isso (não)$$,
    $$だけは é usado para destacar uma única coisa como exceção ou como o mínimo garantido. Equivale a "pelo menos", "ao menos isso" ou "só isso".

Ele tem alguns usos principais:
• Destacar a única qualidade positiva: "ele não vai bem nos estudos, mas pelo menos é bom em esportes".
• Pedir ou proibir algo com ênfase: "isso, pelo menos, não esqueça" ou "só mentir eu não perdoo".
• Garantir o mínimo: "não sei o resultado, mas pelo menos fiz tudo o que podia" (やるだけはやった).

A ideia é: "o resto pode ser como for, mas isso aqui é diferente".$$,
    $$だけは é diferente de だけ (só). だけは destaca uma exceção em contraste com o resto.

Em pedidos, これだけはお願いします significa "pelo menos isto, por favor".

A forma やるだけはやった é comum para mostrar que a pessoa deu o seu máximo.$$,
    $$Substantivo + だけは + Frase
これ / それ + だけは + Pedido / Proibição
Verbo + だけは + Verbo (pelo menos fazer o máximo)
Verbo + ことだけは + Frase$$,
    $$だけは$$,
    $$だけは$$,
    ARRAY['だけ', 'は']::text[],
    ARRAY['だけは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-13', $$これだけは忘れないでください。$$, $$これだけはわすれないでください。$$, $$Isso, pelo menos, não esqueça.$$),
    ('n2-grammar-13', $$彼は勉強はできないが、スポーツだけは得意だ。$$, $$かれはべんきょうはできないが、スポーツだけはとくいだ。$$, $$Ele não vai bem nos estudos, mas pelo menos é bom em esportes.$$),
    ('n2-grammar-13', $$お金はないが、時間だけはある。$$, $$おかねはないが、じかんだけはある。$$, $$Não tenho dinheiro, mas tempo, pelo menos, eu tenho.$$),
    ('n2-grammar-13', $$試験の結果はわからないが、やるだけはやった。$$, $$しけんのけっかはわからないが、やるだけはやった。$$, $$Não sei o resultado da prova, mas pelo menos fiz tudo o que podia.$$),
    ('n2-grammar-13', $$嘘をつくことだけは許せない。$$, $$うそをつくことだけはゆるせない。$$, $$Só mentir eu não perdoo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$料理は苦手だが、カレー____作れる。$$, $$Não sou bom na cozinha, mas curry, pelo menos, eu sei fazer.$$),
        (2, $$このこと____誰にも言わないで。$$, $$Isso, pelo menos, não conte a ninguém.$$),
        (3, $$体力はないけど、元気____ある。$$, $$Não tenho muita força física, mas pelo menos tenho energia.$$),
        (4, $$他のことはいいが、遅刻____しないでください。$$, $$O resto tudo bem, mas atrasos, pelo menos, não admito.$$),
        (5, $$できることはやった。準備____十分した。$$, $$Fiz o que pude. A preparação, pelo menos, foi suficiente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-13', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だけは$$),
        (2, $$だけは$$),
        (3, $$だけは$$),
        (4, $$だけは$$),
        (5, $$だけは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-14 — だって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-14',
    'grammar',
    'N2',
    $$だって$$,
    $$datte$$,
    $$Mas é que / Porque / Até mesmo / Também$$,
    $$だって é uma palavra casual com dois usos principais.

O primeiro, no começo da frase, é dar uma desculpa ou justificativa, como "mas é que..." ou "porque...". É muito comum em respostas a perguntas como "por quê?", principalmente entre crianças e pessoas próximas. Muitas vezes, a frase termina com もん ou もの, que reforçam o tom de justificativa.

O segundo, depois de substantivos, significa "até mesmo" ou "também", como uma forma casual de でも ou も. Por exemplo, "até uma criança entende isso" ou "eu também queria ir".

Com palavras interrogativas, como いつ e 誰, だって significa "qualquer": いつだって (a qualquer hora, sempre), 誰だって (qualquer pessoa).$$,
    $$だって no começo da frase pode soar infantil ou teimoso se usado demais.

Em situações formais, use でも ou なぜなら no lugar de だって.

Não confunda com たって (mesmo que), que vem depois de verbos na forma た.$$,
    $$だって、 + Justificativa + もん / もの (desculpa)
Substantivo + だって (até mesmo / também)
Palavra interrogativa + だって (qualquer: いつだって / 誰だって)$$,
    $$だって$$,
    $$だって$$,
    ARRAY['だって']::text[],
    ARRAY['だって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-14', $$だって、知らなかったんだもん。$$, $$だって、しらなかったんだもん。$$, $$Mas é que eu não sabia!$$),
    ('n2-grammar-14', $$そんなこと、子供だってわかる。$$, $$そんなこと、こどもだってわかる。$$, $$Uma coisa dessas, até uma criança entende.$$),
    ('n2-grammar-14', $$私だって、行きたかったよ。$$, $$わたしだって、いきたかったよ。$$, $$Eu também queria ir, sabia?$$),
    ('n2-grammar-14', $$「どうして食べないの？」「だって、おいしくないんだもん。」$$, $$「どうしてたべないの？」「だって、おいしくないんだもん。」$$, $$"Por que você não come?" "Porque não está gostoso!"$$),
    ('n2-grammar-14', $$いつだって、君の味方だよ。$$, $$いつだって、きみのみかただよ。$$, $$Sempre vou estar do seu lado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「なんで遅れたの？」「____、電車が止まったんだもん。」$$, $$"Por que você se atrasou?" "Mas é que o trem parou!"$$),
        (2, $$先生____、間違えることはある。$$, $$Até os professores às vezes erram.$$),
        (3, $$私____、そのくらいできるよ。$$, $$Até eu consigo fazer isso.$$),
        (4, $$誰____、失敗はする。$$, $$Qualquer pessoa erra.$$),
        (5, $$「早く寝なさい。」「____、まだ眠くないんだもん。」$$, $$"Vá dormir." "Mas é que ainda não estou com sono!"$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-14', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$だって$$),
        (2, $$だって$$),
        (3, $$だって$$),
        (4, $$だって$$),
        (5, $$だって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-15 — 〜でしかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-15',
    'grammar',
    'N2',
    $$〜でしかない$$,
    $$de shika nai$$,
    $$Não passa de / É apenas / Não é mais do que$$,
    $$でしかない é usado para dizer que algo não passa de uma coisa simples ou de pouco valor. Equivale a "não passa de", "é apenas" ou "não é mais do que".

Ele vem diretamente depois de substantivos. A ideia é diminuir a importância daquilo, mostrando que é só aquilo e nada mais.

Por exemplo, "isso não passa de uma desculpa" ou "eu sou apenas um estudante".

O tom pode ser de crítica ("é só um boato"), de modéstia ("sou apenas um funcionário") ou de avaliação realista ("dinheiro é apenas uma ferramenta").

O sentido é parecido com にすぎない, que também aparece no N2.$$,
    $$でしかない é um pouco mais forte e expressivo que にすぎない.

É comum em reflexões e opiniões, como em ensaios e discursos.

Também aparece em frases de modéstia sobre a própria posição: 私は一社員でしかない.$$,
    $$Substantivo + でしかない
Substantivo + でしかありません (educado)
Passado: でしかなかった$$,
    $$でしかない$$,
    $$でしかない|でしかありません|でしかなかった$$,
    ARRAY['で', 'しか', 'ない']::text[],
    ARRAY['でしかない', 'でしかありません', 'でしかなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-15', $$それは言い訳でしかない。$$, $$それはいいわけでしかない。$$, $$Isso não passa de uma desculpa.$$),
    ('n2-grammar-15', $$私はただの学生でしかない。$$, $$わたしはただのがくせいでしかない。$$, $$Eu sou apenas um estudante.$$),
    ('n2-grammar-15', $$彼の話は噂でしかない。$$, $$かれのはなしはうわさでしかない。$$, $$O que ele diz não passa de boato.$$),
    ('n2-grammar-15', $$あの頃、この計画は夢でしかなかった。$$, $$あのころ、このけいかくはゆめでしかなかった。$$, $$Naquela época, este plano não passava de um sonho.$$),
    ('n2-grammar-15', $$お金は道具でしかない。$$, $$おかねはどうぐでしかない。$$, $$O dinheiro não é mais do que uma ferramenta.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$証拠がないなら、それは君の想像____。$$, $$Se não há provas, isso não passa de imaginação sua.$$),
        (2, $$私は一社員____から、決める権利はない。$$, $$Sou apenas um funcionário, então não tenho o direito de decidir.$$),
        (3, $$彼にとって、仕事はお金を稼ぐ手段____。$$, $$Para ele, o trabalho não passa de um meio para ganhar dinheiro.$$),
        (4, $$その考えはすばらしいが、理想____。$$, $$Essa ideia é maravilhosa, mas não passa de um ideal.$$),
        (5, $$子供のころ、優勝は夢____と思っていた。$$, $$Quando criança, eu achava que ser campeão não passava de um sonho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-15', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でしかない$$),
        (2, $$でしかない$$),
        (3, $$でしかない$$),
        (4, $$でしかない$$),
        (5, $$でしかない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-16 — 〜どころではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-16',
    'grammar',
    'N2',
    $$〜どころではない$$,
    $$dokoro de wa nai$$,
    $$Não é hora para / Não dá nem para pensar em / Longe de$$,
    $$どころではない é usado para dizer que, por causa de uma situação difícil, não há condições de fazer algo. Equivale a "não é hora para", "não dá nem para pensar em" ou "longe de".

A primeira parte da frase costuma explicar o problema (estar ocupado, doente, sem dinheiro), e どころではない mostra o que fica impossível ou fora de questão por causa disso.

Por exemplo, "estou tão ocupado que viajar está fora de questão" ou "estava com febre, então estudar não dava nem para pensar".

Ele vem depois de substantivos e de verbos na forma de dicionário.

Na fala, どころではない costuma virar どころじゃない.$$,
    $$どころではない é diferente de どころか. どころではない indica que algo é impossível na situação; どころか indica que a realidade é o oposto ou muito mais extrema.

O tom costuma ser de estresse ou urgência.

É muito usado em conversas sobre trabalho e problemas pessoais.$$,
    $$Substantivo + どころではない
Verbo na forma de dicionário + どころではない

Educado: どころではありません
Passado: どころではなかった
Fala: どころじゃない$$,
    $$どころではない$$,
    $$どころではない|どころじゃない|どころではありません|どころではなかった|どころじゃなかった$$,
    ARRAY['どころ', 'では', 'ない']::text[],
    ARRAY['どころではない', 'どころじゃない', 'どころではありません', 'どころではなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-16', $$忙しくて、旅行どころではない。$$, $$いそがしくて、りょこうどころではない。$$, $$Estou tão ocupado que viajar está fora de questão.$$),
    ('n2-grammar-16', $$明日は試験だから、遊ぶどころではない。$$, $$あしたはしけんだから、あそぶどころではない。$$, $$Amanhã tem prova, então não é hora para se divertir.$$),
    ('n2-grammar-16', $$熱があって、勉強どころではなかった。$$, $$ねつがあって、べんきょうどころではなかった。$$, $$Estava com febre, então estudar não dava nem para pensar.$$),
    ('n2-grammar-16', $$お金がなくて、結婚どころじゃない。$$, $$おかねがなくて、けっこんどころじゃない。$$, $$Estou sem dinheiro, então casamento nem pensar.$$),
    ('n2-grammar-16', $$歯が痛くて、食事どころではありません。$$, $$はがいたくて、しょくじどころではありません。$$, $$Estou com tanta dor de dente que comer está fora de questão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事が山ほどあって、休み____。$$, $$Tenho uma montanha de trabalho, então nem dá para pensar em folga.$$),
        (2, $$子供が泣いていて、テレビを見る____。$$, $$A criança está chorando, então não é hora de ver TV.$$),
        (3, $$事故があって、パーティー____。$$, $$Houve um acidente, então a festa ficou fora de questão.$$),
        (4, $$借金があって、旅行____。$$, $$Tenho dívidas, então viajar nem pensar.$$),
        (5, $$外は寒すぎて、散歩____。$$, $$Lá fora está frio demais, então passear está fora de questão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-16', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どころではない$$),
        (1, $$どころじゃない$$),
        (2, $$どころではない$$),
        (2, $$どころじゃない$$),
        (3, $$どころではなかった$$),
        (3, $$どころじゃなかった$$),
        (4, $$どころじゃない$$),
        (4, $$どころではない$$),
        (5, $$どころではない$$),
        (5, $$どころじゃない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-17 — 〜どころか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-17',
    'grammar',
    'N2',
    $$〜どころか$$,
    $$dokoro ka$$,
    $$Longe de / Muito pelo contrário / Nem sequer$$,
    $$どころか é usado para dizer que a realidade é muito diferente do esperado, geralmente o oposto ou algo ainda mais extremo. Equivale a "longe de", "muito pelo contrário" ou "nem sequer".

Ele tem dois usos principais.

O primeiro é contradizer a expectativa, mostrando o oposto: "longe de pedir desculpas, ele ficou bravo" ou "a chuva, longe de parar, ficou ainda mais forte".

O segundo é intensificar uma negação: "não sei escrever nem hiragana, quanto mais kanji" (漢字どころか、ひらがなも書けない). A coisa mais difícil vem antes de どころか, e a mais simples, depois.

Ele vem depois de substantivos e da forma simples de verbos e adjetivos.$$,
    $$どころか expressa surpresa ou frustração porque a realidade foi o contrário do esperado.

Compare com どころではない, que indica que algo está fora de questão por causa da situação.

É muito usado em conversas e textos para enfatizar contrastes fortes.$$,
    $$Substantivo + どころか、 + Oposto / Algo mais extremo
Verbo / Adjetivo (forma simples) + どころか
A + どころか、 + B + も / さえ + Negativo (nem B, quanto mais A)$$,
    $$どころか$$,
    $$どころか$$,
    ARRAY['どころ', 'か']::text[],
    ARRAY['どころか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-17', $$彼は謝るどころか、怒り出した。$$, $$かれはあやまるどころか、おこりだした。$$, $$Longe de pedir desculpas, ele começou a ficar bravo.$$),
    ('n2-grammar-17', $$雨はやむどころか、ますます強くなった。$$, $$あめはやむどころか、ますますつよくなった。$$, $$A chuva, longe de parar, ficou cada vez mais forte.$$),
    ('n2-grammar-17', $$今月は貯金どころか、借金がある。$$, $$こんげつはちょきんどころか、しゃっきんがある。$$, $$Este mês, longe de economizar, estou com dívidas.$$),
    ('n2-grammar-17', $$彼は漢字どころか、ひらがなも書けない。$$, $$かれはかんじどころか、ひらがなもかけない。$$, $$Ele não sabe escrever nem hiragana, quanto mais kanji.$$),
    ('n2-grammar-17', $$薬を飲んだら、よくなるどころか悪くなった。$$, $$くすりをのんだら、よくなるどころかわるくなった。$$, $$Tomei o remédio e, muito pelo contrário, piorei.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は手伝う____、邪魔ばかりする。$$, $$Longe de ajudar, ele só atrapalha.$$),
        (2, $$彼は英語____、日本語も話せない。$$, $$Ele não fala nem japonês, quanto mais inglês.$$),
        (3, $$ダイエットをしたのに、痩せる____、太ってしまった。$$, $$Fiz dieta e, longe de emagrecer, acabei engordando.$$),
        (4, $$親切にしたのに、感謝される____、怒られた。$$, $$Fui gentil e, muito pelo contrário de ser agradecido, levei bronca.$$),
        (5, $$最近は休み____、毎日残業している。$$, $$Ultimamente, longe de ter folga, faço hora extra todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-17', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どころか$$),
        (2, $$どころか$$),
        (3, $$どころか$$),
        (4, $$どころか$$),
        (5, $$どころか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-18 — どうやら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-18',
    'grammar',
    'N2',
    $$どうやら$$,
    $$dou yara$$,
    $$Parece que / Pelo visto / Ao que tudo indica$$,
    $$どうやら é um advérbio usado para fazer uma suposição com base no que se observa ou se percebe. Equivale a "parece que", "pelo visto" ou "ao que tudo indica".

Ele quase sempre aparece junto com らしい, ようだ, みたいだ ou そうだ no final da frase, reforçando a ideia de suposição.

Por exemplo, "pelo visto vai chover" ou "parece que errei o caminho".

O tom é de alguém chegando a uma conclusão aos poucos, a partir de pistas. Às vezes, também expressa alívio, como em "parece que vou conseguir chegar a tempo".$$,
    $$どうやら é parecido com たぶん (provavelmente), mas どうやら se baseia mais em evidências observadas.

Sem らしい ou ようだ no fim, どうやら soa incompleto.

É muito comum em narrativas e em monólogos internos.$$,
    $$どうやら + … + らしい / ようだ / みたいだ / そうだ$$,
    $$どうやら$$,
    $$どうやら$$,
    ARRAY['どうやら']::text[],
    ARRAY['どうやら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-18', $$空が暗くなってきた。どうやら雨が降りそうだ。$$, $$そらがくらくなってきた。どうやらあめがふりそうだ。$$, $$O céu está escurecendo. Pelo visto vai chover.$$),
    ('n2-grammar-18', $$どうやら彼は来ないらしい。$$, $$どうやらかれはこないらしい。$$, $$Ao que tudo indica, ele não vem.$$),
    ('n2-grammar-18', $$この景色は初めてだ。どうやら道を間違えたようだ。$$, $$このけしきははじめてだ。どうやらみちをまちがえたようだ。$$, $$Nunca vi esta paisagem. Parece que errei o caminho.$$),
    ('n2-grammar-18', $$喉が痛い。どうやら風邪をひいたみたいだ。$$, $$のどがいたい。どうやらかぜをひいたみたいだ。$$, $$Estou com dor de garganta. Pelo visto peguei um resfriado.$$),
    ('n2-grammar-18', $$急いだので、どうやら試験に間に合いそうだ。$$, $$いそいだので、どうやらしけんにまにあいそうだ。$$, $$Corri, então parece que vou chegar a tempo para a prova.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ポケットにない。____、財布を家に忘れてきたようだ。$$, $$Não está no bolso. Pelo visto esqueci a carteira em casa.$$),
        (2, $$返事がない。____彼女は怒っているらしい。$$, $$Ela não responde. Ao que tudo indica, está brava.$$),
        (3, $$空が明るくなってきた。____雪がやみそうだ。$$, $$O céu está clareando. Parece que a neve vai parar.$$),
        (4, $$シャッターが閉まっている。____この店は今日休みのようだ。$$, $$A porta de aço está fechada. Pelo visto esta loja está fechada hoje.$$),
        (5, $$みんなが言っているから、____彼の話は本当らしい。$$, $$Todos estão dizendo, então ao que tudo indica a história dele é verdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-18', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうやら$$),
        (2, $$どうやら$$),
        (3, $$どうやら$$),
        (4, $$どうやら$$),
        (5, $$どうやら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-19 — どうせ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-19',
    'grammar',
    'N2',
    $$どうせ$$,
    $$douse$$,
    $$De qualquer jeito / Já que vai / De todo modo$$,
    $$どうせ é um advérbio que expressa a ideia de que o resultado já está decidido e não vai mudar. Ele tem dois tons principais.

O primeiro é de resignação ou pessimismo: "de qualquer jeito, não vai dar tempo", "de todo modo, eu não consigo", "ele não vem mesmo". Muitas vezes, mostra desânimo ou falta de esperança.

O segundo é mais positivo, com なら: どうせ〜なら significa "já que vai... de qualquer jeito, então...". Por exemplo, "já que vou comprar, quero algo bom" ou "já que vamos fazer, vamos fazer com alegria".

Por isso, どうせ pode soar negativo ou motivador, dependendo da frase.$$,
    $$Usar どうせ demais, principalmente sobre si mesmo, pode soar autodepreciativo, como どうせ私なんか.

どうせ〜なら é uma expressão muito comum para tirar o melhor proveito de algo inevitável.

Comparado a どちらにしても (de qualquer forma), どうせ é mais emocional.$$,
    $$どうせ + Frase (resignação / pessimismo)
どうせ + Verbo + なら、 + Decisão (já que vai...)
どうせ + … + から、 + …$$,
    $$どうせ$$,
    $$どうせ$$,
    ARRAY['どうせ']::text[],
    ARRAY['どうせ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-19', $$どうせ間に合わないから、ゆっくり行こう。$$, $$どうせまにあわないから、ゆっくりいこう。$$, $$De qualquer jeito não vai dar tempo, então vamos com calma.$$),
    ('n2-grammar-19', $$どうせ私には無理だ。$$, $$どうせわたしにはむりだ。$$, $$De todo modo, isso é impossível para mim.$$),
    ('n2-grammar-19', $$どうせ買うなら、いい物を買いたい。$$, $$どうせかうなら、いいものをかいたい。$$, $$Já que vou comprar mesmo, quero algo bom.$$),
    ('n2-grammar-19', $$待っても無駄だよ。どうせ彼は来ないよ。$$, $$まってもむだだよ。どうせかれはこないよ。$$, $$Não adianta esperar. Ele não vem mesmo.$$),
    ('n2-grammar-19', $$どうせやるなら、楽しくやろう。$$, $$どうせやるなら、たのしくやろう。$$, $$Já que vamos fazer, vamos fazer com alegria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____失敗するなら、挑戦してみよう。$$, $$Se é para fracassar de qualquer jeito, vamos pelo menos tentar.$$),
        (2, $$____言っても、彼は聞かない。$$, $$De qualquer jeito, mesmo que eu fale, ele não escuta.$$),
        (3, $$____行くなら、早く行こう。$$, $$Já que vamos mesmo, vamos logo.$$),
        (4, $$____私なんか、誰も気にしない。$$, $$De qualquer jeito, ninguém liga para mim.$$),
        (5, $$____雨で出かけられないから、家で映画を見よう。$$, $$Já que não dá para sair com essa chuva, vamos ver um filme em casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-19', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$どうせ$$),
        (2, $$どうせ$$),
        (3, $$どうせ$$),
        (4, $$どうせ$$),
        (5, $$どうせ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-20 — 〜得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-20',
    'grammar',
    'N2',
    $$〜得ない$$,
    $$enai / uenai$$,
    $$Ser impossível / Não poder / Não haver como$$,
    $$得ない é usado para dizer que algo é impossível ou não pode acontecer. Equivale a "ser impossível", "não poder" ou "não haver como".

Ele vem depois do verbo na forma ます sem ます. É a forma negativa de 得る (ser possível), que aparece no próximo item.

A forma mais conhecida é あり得ない (ありえない), que significa "é impossível", "não pode ser" e é muito usada na fala, inclusive como expressão de choque: "não acredito!".

Em outros verbos, 得ない soa formal e escrito, como em 理解し得ない (não é possível compreender) ou 想像し得ない (inimaginável).

A leitura costuma ser えない. Em textos formais, うる / うない também aparecem em algumas formas.$$,
    $$ありえない é muito comum entre jovens para expressar indignação ou surpresa: "isso é absurdo!".

Não confunda com ざるを得ない (não ter escolha a não ser), que é outra gramática do N2.

Fora de あり得ない, 得ない aparece principalmente em textos formais.$$,
    $$Verbo na forma ます sem ます + 得ない (えない)
ある → あり得ない (impossível)
する → し得ない

Educado: 得ません
Escrita: 得ない / えない$$,
    $$得ない$$,
    $$得ない|えない|得ません$$,
    ARRAY['得ない']::text[],
    ARRAY['得ない', 'えない', 'あり得ない', '得ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-20', $$そんなことはあり得ない。$$, $$そんなことはありえない。$$, $$Isso é impossível.$$),
    ('n2-grammar-20', $$彼が犯人だなんて、考え得ない。$$, $$かれがはんにんだなんて、かんがええない。$$, $$É impossível pensar que ele seja o culpado.$$),
    ('n2-grammar-20', $$この問題は一人では解決し得ない。$$, $$このもんだいはひとりではかいけつしえない。$$, $$Este problema não pode ser resolvido por uma pessoa sozinha.$$),
    ('n2-grammar-20', $$人間の想像し得ないことが起きた。$$, $$にんげんのそうぞうしえないことがおきた。$$, $$Aconteceu algo que ninguém poderia imaginar.$$),
    ('n2-grammar-20', $$彼の行動は理解し得ない。$$, $$かれのこうどうはりかいしえない。$$, $$O comportamento dele é impossível de compreender.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女がうそをつくなんて、あり____。$$, $$Ela mentir? Isso é impossível.$$),
        (2, $$安全対策をしたので、このような事故は二度と起こり____。$$, $$Tomamos medidas de segurança, então um acidente desses não pode acontecer de novo.$$),
        (3, $$子供には理解し____内容だ。$$, $$É um conteúdo impossível de compreender para crianças.$$),
        (4, $$それは想像し____ほどの美しさだった。$$, $$Era de uma beleza inimaginável.$$),
        (5, $$一日でこの量を終わらせることはあり____。$$, $$Terminar esta quantidade em um dia é impossível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-20', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$得ない$$),
        (1, $$えない$$),
        (2, $$得ない$$),
        (3, $$得ない$$),
        (4, $$得ない$$),
        (5, $$得ない$$),
        (5, $$えない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-21 — 〜得る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-21',
    'grammar',
    'N2',
    $$〜得る$$,
    $$uru / eru$$,
    $$Ser possível / Poder acontecer / Possível$$,
    $$得る é usado para dizer que algo é possível ou pode acontecer. Equivale a "ser possível", "poder acontecer" ou, antes de substantivos, "possível".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 起こり得る (pode acontecer), あり得る (é possível), 考え得る (que se pode pensar).

Ele não indica habilidade pessoal, como a forma potencial (話せる, 食べられる). Indica possibilidade objetiva: algo que pode ocorrer em certas condições.

A leitura mais comum na forma de dicionário é うる, principalmente em linguagem formal (起こりうる, ありうる). Nas outras formas, como 得ます e 得た, a leitura é え.

É uma expressão formal, muito usada em textos, notícias, relatórios e discursos.$$,
    $$あり得る e あり得ない são as formas mais comuns na conversa: "é possível" e "é impossível".

得る não é usado para habilidades pessoais: para "sei nadar", usa-se 泳げる, e não 泳ぎ得る.

考え得る限り significa "tudo o que se pode imaginar" e aparece em textos formais.$$,
    $$Verbo na forma ます sem ます + 得る (うる / える)
ある → あり得る (ありうる)
Verbo sem ます + 得る + Substantivo (que pode...)

Negativo: 得ない (えない)
Passado: 得た (えた)$$,
    $$得る$$,
    $$得る|得ます|得た|うる$$,
    ARRAY['得る']::text[],
    ARRAY['得る', 'うる', 'える', 'あり得る']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-21', $$地震はいつでも起こり得る。$$, $$じしんはいつでもおこりうる。$$, $$Terremotos podem acontecer a qualquer momento.$$),
    ('n2-grammar-21', $$それは誰にでもあり得ることだ。$$, $$それはだれにでもありうることだ。$$, $$Isso é algo que pode acontecer com qualquer pessoa.$$),
    ('n2-grammar-21', $$考え得るすべての方法を試した。$$, $$かんがえうるすべてのほうほうをためした。$$, $$Tentei todos os métodos possíveis.$$),
    ('n2-grammar-21', $$事故は起こり得るものとして、準備しておくべきだ。$$, $$じこはおこりうるものとして、じゅんびしておくべきだ。$$, $$Devemos nos preparar considerando que acidentes podem acontecer.$$),
    ('n2-grammar-21', $$彼の失敗は十分予想し得た。$$, $$かれのしっぱいはじゅうぶんよそうしえた。$$, $$O fracasso dele era perfeitamente previsível.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$失敗は誰にでも起こり____。$$, $$O fracasso pode acontecer com qualquer um.$$),
        (2, $$それは十分あり____話だ。$$, $$Essa é uma história perfeitamente possível.$$),
        (3, $$考え____限りの手を尽くした。$$, $$Fizemos tudo o que era possível imaginar.$$),
        (4, $$このような問題は、どの会社でも起こり____。$$, $$Problemas como este podem acontecer em qualquer empresa.$$),
        (5, $$予想し____最悪の事態に備える。$$, $$Vamos nos preparar para a pior situação possível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-21', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$得る$$),
        (1, $$うる$$),
        (2, $$得る$$),
        (2, $$うる$$),
        (3, $$得る$$),
        (3, $$うる$$),
        (4, $$得る$$),
        (4, $$うる$$),
        (5, $$得る$$),
        (5, $$うる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-22 — 再び
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-22',
    'grammar',
    'N2',
    $$再び$$,
    $$futatabi$$,
    $$Novamente / De novo / Outra vez$$,
    $$再び é um advérbio que significa "novamente", "de novo" ou "outra vez". Ele indica que algo acontece uma segunda vez, depois de ter acontecido antes ou de ter parado.

O sentido é o mesmo de また e もう一度, mas 再び soa mais formal e escrito. Por isso, é comum em notícias, textos, discursos e narrativas.

Por exemplo, "ele visitou o Japão novamente" ou "a chuva voltou a cair".

Também aparece em frases sobre não repetir erros: "tomar cuidado para não cometer o mesmo erro outra vez".$$,
    $$Na conversa casual, また é mais natural. 再び soa solene ou jornalístico.

Palavras relacionadas são 再会 (reencontro) e 再開 (retomada), que usam o mesmo kanji 再.

Em notícias sobre desastres ou crises, 再び aparece para indicar que algo voltou a acontecer.$$,
    $$再び + Verbo

Escrita: 再び / ふたたび$$,
    $$再び$$,
    $$再び|ふたたび$$,
    ARRAY['再び']::text[],
    ARRAY['再び', 'ふたたび']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-22', $$彼は五年後、再び日本を訪れた。$$, $$かれはごねんご、ふたたびにほんをおとずれた。$$, $$Cinco anos depois, ele visitou o Japão novamente.$$),
    ('n2-grammar-22', $$一度やんだ雨が再び降り出した。$$, $$いちどやんだあめがふたたびふりだした。$$, $$A chuva, que tinha parado, voltou a cair.$$),
    ('n2-grammar-22', $$二人は十年後に再び会った。$$, $$ふたりはじゅうねんごにふたたびあった。$$, $$Os dois se reencontraram dez anos depois.$$),
    ('n2-grammar-22', $$再び同じ失敗をしないように注意する。$$, $$ふたたびおなじしっぱいをしないようにちゅういする。$$, $$Vou tomar cuidado para não cometer o mesmo erro outra vez.$$),
    ('n2-grammar-22', $$休憩の後、会議が再び始まった。$$, $$きゅうけいのあと、かいぎがふたたびはじまった。$$, $$Depois do intervalo, a reunião recomeçou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$治療の後、彼は____歩けるようになった。$$, $$Depois do tratamento, ele voltou a conseguir andar.$$),
        (2, $$一度やんだ雪が____降り始めた。$$, $$A neve, que tinha parado, começou a cair de novo.$$),
        (3, $$____この町に来られてうれしい。$$, $$Estou feliz por poder vir a esta cidade novamente.$$),
        (4, $$一度は落ちたが、彼は____試験に挑戦した。$$, $$Ele foi reprovado uma vez, mas tentou a prova outra vez.$$),
        (5, $$同じ事故が____起きないようにしたい。$$, $$Quero evitar que o mesmo acidente aconteça de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-22', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$再び$$),
        (1, $$ふたたび$$),
        (2, $$再び$$),
        (2, $$ふたたび$$),
        (3, $$再び$$),
        (3, $$ふたたび$$),
        (4, $$再び$$),
        (4, $$ふたたび$$),
        (5, $$再び$$),
        (5, $$ふたたび$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-23 — 〜ふうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-23',
    'grammar',
    'N2',
    $$〜ふうに$$,
    $$fuu ni$$,
    $$Deste jeito / Daquele jeito / Desta maneira$$,
    $$ふうに é usado para indicar a maneira ou o estilo de fazer algo. Equivale a "deste jeito", "daquele jeito" ou "desta maneira".

Ele aparece muito com こんな, そんな, あんな e どんな, formando こんなふうに (assim, deste jeito), あんなふうに (daquele jeito) e どんなふうに (de que jeito).

Também pode vir depois de verbos e com そういう, como em そういうふうに考えたことはなかった ("nunca pensei desse jeito").

Antes de um substantivo, usa-se ふうな: こんなふうな服 (uma roupa deste estilo).

É um pouco mais casual que のように e muito comum na conversa.$$,
    $$Em perguntas, どんなふうに pede detalhes sobre o modo: "como exatamente você fez?".

風 também aparece como sufixo em palavras como 和風 (estilo japonês) e 洋風 (estilo ocidental).

Comparado a ように, ふうに soa mais coloquial e descritivo.$$,
    $$こんな / そんな / あんな / どんな + ふうに + Verbo
そういう / こういう + ふうに + Verbo
Verbo (forma simples) + ふうに + Verbo
… + ふうな + Substantivo

Escrita: ふうに / 風に$$,
    $$ふうに$$,
    $$ふうに|風に|ふうな|風な$$,
    ARRAY['ふう', 'に']::text[],
    ARRAY['ふうに', '風に', 'ふうな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-23', $$こんなふうに書いてください。$$, $$こんなふうにかいてください。$$, $$Escreva deste jeito, por favor.$$),
    ('n2-grammar-23', $$彼はいつもあんなふうに笑う。$$, $$かれはいつもあんなふうにわらう。$$, $$Ele sempre ri daquele jeito.$$),
    ('n2-grammar-23', $$このケーキ、どんなふうに作ったんですか。$$, $$このケーキ、どんなふうにつくったんですか。$$, $$De que jeito você fez este bolo?$$),
    ('n2-grammar-23', $$先生が説明したふうに、やってみました。$$, $$せんせいがせつめいしたふうに、やってみました。$$, $$Tentei fazer do jeito que o professor explicou.$$),
    ('n2-grammar-23', $$そういうふうに考えたことはなかった。$$, $$そういうふうにかんがえたことはなかった。$$, $$Nunca tinha pensado desse jeito.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$野菜はこんな____切ってください。$$, $$Corte as verduras deste jeito, por favor.$$),
        (2, $$この機械はどんな____使えばいいですか。$$, $$De que jeito devo usar esta máquina?$$),
        (3, $$そういう____言われると、困ります。$$, $$Se você fala desse jeito, fico sem graça.$$),
        (4, $$彼女はいつもあんな____話す人だ。$$, $$Ela é uma pessoa que sempre fala daquele jeito.$$),
        (5, $$彼が言った____、もう一度やってみよう。$$, $$Vamos tentar mais uma vez do jeito que ele disse.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-23', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ふうに$$),
        (1, $$風に$$),
        (2, $$ふうに$$),
        (2, $$風に$$),
        (3, $$ふうに$$),
        (3, $$風に$$),
        (4, $$ふうに$$),
        (4, $$風に$$),
        (5, $$ふうに$$),
        (5, $$風に$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-24 — 〜がきっかけで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-24',
    'grammar',
    'N2',
    $$〜がきっかけで$$,
    $$ga kikkake de$$,
    $$Por causa de / A partir de / Motivado por$$,
    $$がきっかけで é usado para indicar o ponto de partida, o motivo ou a ocasião que deu início a algo. Equivale a "por causa de", "a partir de" ou "motivado por".

きっかけ significa "estímulo", "pontapé inicial" ou "oportunidade". A ideia é que um acontecimento específico levou a uma mudança, a um começo ou a uma decisão.

Por exemplo, "comecei a estudar japonês por causa de uma viagem" ou "uma pequena confusão deu início a uma briga".

A forma をきっかけに tem o mesmo sentido e aparece muito na escrita (veja também o item をきっかけに).

O resultado pode ser positivo ou negativo, mas costuma marcar uma mudança importante.$$,
    $$きっかけ é diferente de 原因 (causa). 原因 é a causa direta de um problema; きっかけ é o estímulo que deu início a algo.

Em entrevistas, perguntas como 日本語を勉強したきっかけは何ですか ("o que te levou a estudar japonês?") são muito comuns.

A segunda parte costuma indicar um começo ou uma mudança de hábito.$$,
    $$Substantivo + がきっかけで + Mudança / Início
Substantivo + がきっかけになって + …
Frase + のがきっかけで + …

Variação: Substantivo + をきっかけに$$,
    $$がきっかけで$$,
    $$がきっかけで|をきっかけに|きっかけで|きっかけに$$,
    ARRAY['が', 'きっかけ', 'で']::text[],
    ARRAY['がきっかけで', 'をきっかけに', 'がきっかけになって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-24', $$日本への旅行がきっかけで、日本語を勉強し始めた。$$, $$にほんへのりょこうがきっかけで、にほんごをべんきょうしはじめた。$$, $$Comecei a estudar japonês por causa de uma viagem ao Japão.$$),
    ('n2-grammar-24', $$一冊の本がきっかけで、作家になった。$$, $$いっさつのほんがきっかけで、さっかになった。$$, $$Um único livro foi o que me levou a ser escritor.$$),
    ('n2-grammar-24', $$友達の紹介がきっかけで、彼と知り合った。$$, $$ともだちのしょうかいがきっかけで、かれとしりあった。$$, $$Conheci-o a partir de uma apresentação de um amigo.$$),
    ('n2-grammar-24', $$病気がきっかけで、健康に気をつけるようになった。$$, $$びょうきがきっかけで、けんこうにきをつけるようになった。$$, $$Motivado por uma doença, passei a cuidar da saúde.$$),
    ('n2-grammar-24', $$小さな誤解がきっかけで、けんかになった。$$, $$ちいさなごかいがきっかけで、けんかになった。$$, $$Um pequeno mal-entendido deu início a uma briga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$アニメ____、日本に興味を持った。$$, $$Por causa dos animes, passei a me interessar pelo Japão.$$),
        (2, $$留学____、国際関係の仕事をしたいと思った。$$, $$O intercâmbio me fez querer trabalhar com relações internacionais.$$),
        (3, $$一つの出会い____、人生が変わった。$$, $$Um único encontro mudou a minha vida.$$),
        (4, $$一人暮らし____、料理を始めた。$$, $$Comecei a cozinhar por causa de morar sozinho.$$),
        (5, $$先生の一言____、医者を目指した。$$, $$Uma frase do professor me motivou a querer ser médico.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-24', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$がきっかけで$$),
        (2, $$がきっかけで$$),
        (3, $$がきっかけで$$),
        (4, $$がきっかけで$$),
        (5, $$がきっかけで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-25 — 〜げ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-25',
    'grammar',
    'N2',
    $$〜げ$$,
    $$ge$$,
    $$Com ar de / Parecendo / Com jeito de$$,
    $$げ é um sufixo que indica a aparência ou a impressão de um sentimento ou estado, a partir do que se observa. Equivale a "com ar de", "parecendo" ou "com jeito de".

Ele vem depois de adjetivos い (sem い), de alguns adjetivos な e da forma たい de verbos (sem い). Por exemplo, 寂しげ (com ar de tristeza), 楽しげ (parecendo se divertir), 言いたげ (com cara de quem quer dizer algo).

O resultado funciona como um adjetivo な: げな antes de substantivos, げに antes de verbos e げだ no fim da frase.

O sentido é parecido com そう (aparência), mas げ soa mais literário e é muito usado em textos, romances e descrições de expressões e emoções.$$,
    $$いい vira よさげ, e ない vira なさげ, como em 自信なさげ (com cara de inseguro).

Expressões como 自信ありげ (com ar de confiante) e 意味ありげ (com ar misterioso) são muito usadas.

Na fala do dia a dia, そう é mais comum que げ.$$,
    $$Adjetivo い sem い + げ (寂しげ / 楽しげ / 悲しげ)
Adjetivo な + げ (不安げ / 満足げ / 得意げ)
Verbo たい sem い + げ (言いたげ)
〜げな + Substantivo / 〜げに + Verbo / 〜げだ$$,
    $$げ$$,
    $$げな|げに|げだ|げです$$,
    ARRAY['げ']::text[],
    ARRAY['げ', 'げな', 'げに', 'げだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-25', $$彼女は寂しげな顔をしていた。$$, $$かのじょはさびしげなかおをしていた。$$, $$Ela estava com um ar triste.$$),
    ('n2-grammar-25', $$子供たちは楽しげに遊んでいる。$$, $$こどもたちはたのしげにあそんでいる。$$, $$As crianças estão brincando, parecendo se divertir.$$),
    ('n2-grammar-25', $$彼は何か言いたげだった。$$, $$かれはなにかいいたげだった。$$, $$Ele estava com cara de quem queria dizer algo.$$),
    ('n2-grammar-25', $$彼は自信ありげな態度で話した。$$, $$かれはじしんありげなたいどではなした。$$, $$Ele falou com um ar confiante.$$),
    ('n2-grammar-25', $$不安げな表情で、彼女は待っていた。$$, $$ふあんげなひょうじょうで、かのじょはまっていた。$$, $$Ela esperava com uma expressão de ansiedade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は悲し____な目で私を見た。$$, $$Ele me olhou com um olhar triste.$$),
        (2, $$料理を食べて、子供は満足____に笑った。$$, $$A criança comeu e sorriu, parecendo satisfeita.$$),
        (3, $$彼女は何か言いた____な顔をしていた。$$, $$Ela estava com cara de quem queria dizer alguma coisa.$$),
        (4, $$一人で留守番している犬が寂し____に鳴いている。$$, $$O cachorro, sozinho em casa, está latindo com um ar triste.$$),
        (5, $$彼は得意____な顔で自分の作品を見せた。$$, $$Ele mostrou o próprio trabalho com cara de orgulhoso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-25', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$げ$$),
        (2, $$げ$$),
        (3, $$げ$$),
        (4, $$げ$$),
        (5, $$げ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-26 — 逆に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-26',
    'grammar',
    'N2',
    $$逆に$$,
    $$gyaku ni$$,
    $$Pelo contrário / Ao contrário / Em vez disso$$,
    $$逆に é um advérbio que significa "pelo contrário" ou "ao contrário". Ele indica que o resultado foi o oposto do esperado, ou apresenta uma situação contrária a outra.

Ele tem dois usos principais.

O primeiro é mostrar um resultado oposto à intenção: "tomei o remédio e, pelo contrário, passei mal" ou "tentei ajudar e, ao contrário, levei bronca".

O segundo é contrastar duas situações opostas: "Tóquio tem muita gente; já o interior, ao contrário, tem pouca".

逆 significa "inverso" ou "contrário". Na conversa, 逆に também é usado para apresentar um ponto de vista diferente: "pelo contrário, acho que é melhor assim".$$,
    $$Na fala jovem, 逆に às vezes é usado de forma exagerada, só para dar ênfase, mesmo sem um contraste real.

Comparado a むしろ, 逆に destaca mais a inversão da situação.

A expressão 逆に言えば significa "por outro lado" ou "dito de outra forma".$$,
    $$Ação / Expectativa + 逆に + Resultado oposto
A + は〜が、 + 逆に + B + は〜 (contraste)

Escrita: 逆に / ぎゃくに$$,
    $$逆に$$,
    $$逆に|ぎゃくに$$,
    ARRAY['逆', 'に']::text[],
    ARRAY['逆に', 'ぎゃくに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-26', $$薬を飲んだら、逆に具合が悪くなった。$$, $$くすりをのんだら、ぎゃくにぐあいがわるくなった。$$, $$Tomei o remédio e, pelo contrário, passei mal.$$),
    ('n2-grammar-26', $$助けようとしたら、逆に怒られた。$$, $$たすけようとしたら、ぎゃくにおこられた。$$, $$Tentei ajudar e, ao contrário, levei bronca.$$),
    ('n2-grammar-26', $$安い物を買ったら、すぐ壊れて逆に高くついた。$$, $$やすいものをかったら、すぐこわれてぎゃくにたかくついた。$$, $$Comprei algo barato, quebrou logo e, no fim, saiu mais caro.$$),
    ('n2-grammar-26', $$東京は人が多いが、逆に地方は人が少ない。$$, $$とうきょうはひとがおおいが、ぎゃくにちほうはひとがすくない。$$, $$Tóquio tem muita gente; já o interior, ao contrário, tem pouca.$$),
    ('n2-grammar-26', $$休んだら、逆に疲れてしまった。$$, $$やすんだら、ぎゃくにつかれてしまった。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$慰めたつもりが、____彼女を泣かせてしまった。$$, $$Achei que estava consolando, mas, pelo contrário, fiz ela chorar.$$),
        (2, $$近道をしたら、____時間がかかった。$$, $$Peguei um atalho e, ao contrário, demorei mais.$$),
        (3, $$詳しい説明を聞いて、____わからなくなった。$$, $$Ouvi uma explicação detalhada e, pelo contrário, fiquei mais confuso.$$),
        (4, $$この地域は夏は暑いが、____冬はとても寒い。$$, $$Nesta região o verão é quente; já o inverno, ao contrário, é muito frio.$$),
        (5, $$急いだら、道を間違えて____遅くなった。$$, $$Corri, errei o caminho e, no fim, cheguei mais tarde.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-26', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$逆に$$),
        (1, $$ぎゃくに$$),
        (2, $$逆に$$),
        (2, $$ぎゃくに$$),
        (3, $$逆に$$),
        (3, $$ぎゃくに$$),
        (4, $$逆に$$),
        (4, $$ぎゃくに$$),
        (5, $$逆に$$),
        (5, $$ぎゃくに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-27 — 〜反面
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-27',
    'grammar',
    'N2',
    $$〜反面$$,
    $$hanmen$$,
    $$Por outro lado / Ao mesmo tempo / Mas em compensação$$,
    $$反面 é usado para mostrar que uma mesma coisa tem dois lados opostos: um positivo e um negativo. Equivale a "por outro lado", "ao mesmo tempo" ou "mas, em compensação".

A primeira parte apresenta uma característica, e a segunda mostra o lado oposto, da mesma coisa ou pessoa. Por exemplo, "este trabalho é pesado, mas, por outro lado, é gratificante" ou "a internet é prática, mas, ao mesmo tempo, tem riscos".

Ele vem depois da forma simples de verbos e adjetivos, de adjetivos な com な ou である, e de substantivos com である.

É uma expressão um pouco formal, muito comum em textos argumentativos, comparações e análises.$$,
    $$Comparado a 一方で, 反面 foca nos dois lados de uma mesma coisa. 一方で pode comparar coisas diferentes.

Em redações sobre prós e contras, 反面 aparece com muita frequência.

A palavra 反面教師 significa "um mau exemplo, com o qual se aprende o que não fazer".$$,
    $$Verbo / Adjetivo い (forma simples) + 反面、 + Lado oposto
Adjetivo な + な / である + 反面
Substantivo + である + 反面

Escrita: 反面 / 半面$$,
    $$反面$$,
    $$反面|はんめん|半面$$,
    ARRAY['反面']::text[],
    ARRAY['反面', '半面']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-27', $$この仕事は大変な反面、やりがいがある。$$, $$このしごとはたいへんなはんめん、やりがいがある。$$, $$Este trabalho é pesado, mas, por outro lado, é gratificante.$$),
    ('n2-grammar-27', $$都会の生活は便利な反面、ストレスも多い。$$, $$とかいのせいかつはべんりなはんめん、ストレスもおおい。$$, $$A vida na cidade grande é prática, mas, ao mesmo tempo, estressante.$$),
    ('n2-grammar-27', $$彼は優しい反面、厳しいところもある。$$, $$かれはやさしいはんめん、きびしいところもある。$$, $$Ele é gentil, mas, por outro lado, também tem um lado rigoroso.$$),
    ('n2-grammar-27', $$インターネットは便利な反面、危険もある。$$, $$インターネットはべんりなはんめん、きけんもある。$$, $$A internet é prática, mas, ao mesmo tempo, tem riscos.$$),
    ('n2-grammar-27', $$一人暮らしは自由な反面、寂しいこともある。$$, $$ひとりぐらしはじゆうなはんめん、さびしいこともある。$$, $$Morar sozinho dá liberdade, mas, em compensação, às vezes é solitário.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この薬はよく効く____、副作用もある。$$, $$Este remédio funciona bem, mas, por outro lado, tem efeitos colaterais.$$),
        (2, $$彼女はいつも明るい____、寂しがりやだ。$$, $$Ela é sempre alegre, mas, ao mesmo tempo, não gosta de ficar sozinha.$$),
        (3, $$この会社は給料が高い____、休みが少ない。$$, $$Esta empresa paga bem, mas, em compensação, tem poucas folgas.$$),
        (4, $$車は便利な____、事故の危険がある。$$, $$O carro é prático, mas, por outro lado, há o risco de acidentes.$$),
        (5, $$有名になると、うれしい____、自由がなくなる。$$, $$Ficar famoso é bom, mas, ao mesmo tempo, você perde a liberdade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-27', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$反面$$),
        (2, $$反面$$),
        (3, $$反面$$),
        (4, $$反面$$),
        (5, $$反面$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-28 — 果たして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-28',
    'grammar',
    'N2',
    $$果たして$$,
    $$hatashite$$,
    $$Será mesmo que / Afinal / Realmente / Como esperado$$,
    $$果たして é um advérbio com dois usos principais.

O primeiro, em perguntas e frases de dúvida, expressa incerteza ou ceticismo: "será mesmo que...?" ou "afinal...?". Ele costuma aparecer com だろうか, のか ou かどうか. Por exemplo, "será mesmo que ele vem?" ou "será que este plano vai mesmo dar certo?".

O segundo, em frases afirmativas, significa "como esperado" ou "de fato": algo aconteceu exatamente como se previa. Por exemplo, "como eu temia, choveu".

O primeiro uso é o mais comum e soa formal e um pouco dramático, típico de textos, notícias e narrativas.$$,
    $$果たして também é a forma て do verbo 果たす (cumprir), como em 約束を果たして (cumprindo a promessa). O contexto mostra qual é o sentido.

Em títulos de notícias, 果たして aparece para criar suspense: 果たして結果は?

Na conversa casual, os japoneses preferem 本当に〜かな.$$,
    $$果たして + … + だろうか / のか / かどうか (será mesmo que...?)
果たして + … + Verbo no passado (como esperado)

Escrita: 果たして / はたして$$,
    $$果たして$$,
    $$果たして|はたして$$,
    ARRAY['果たして']::text[],
    ARRAY['果たして', 'はたして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-28', $$果たして彼は来るだろうか。$$, $$はたしてかれはくるだろうか。$$, $$Será mesmo que ele vem?$$),
    ('n2-grammar-28', $$この計画は果たして成功するのだろうか。$$, $$このけいかくははたしてせいこうするのだろうか。$$, $$Será que este plano vai mesmo dar certo?$$),
    ('n2-grammar-28', $$心配していたが、果たして予想どおりの結果になった。$$, $$しんぱいしていたが、はたしてよそうどおりのけっかになった。$$, $$Eu estava preocupado e, como esperado, o resultado foi o previsto.$$),
    ('n2-grammar-28', $$果たしてそれは本当なのか。$$, $$はたしてそれはほんとうなのか。$$, $$Afinal, isso é verdade?$$),
    ('n2-grammar-28', $$果たして、彼の言ったとおりだった。$$, $$はたして、かれのいったとおりだった。$$, $$De fato, foi exatamente como ele disse.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____明日は晴れるだろうか。$$, $$Será mesmo que amanhã vai fazer sol?$$),
        (2, $$____この答えは正しいのか。$$, $$Afinal, esta resposta está correta?$$),
        (3, $$雨が心配だったが、____雨が降った。$$, $$Eu temia a chuva e, como esperado, choveu.$$),
        (4, $$____私に、そんなことができるだろうか。$$, $$Será mesmo que eu consigo fazer uma coisa dessas?$$),
        (5, $$____彼女は真実を話しているのだろうか。$$, $$Será mesmo que ela está dizendo a verdade?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-28', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$果たして$$),
        (1, $$はたして$$),
        (2, $$果たして$$),
        (2, $$はたして$$),
        (3, $$果たして$$),
        (3, $$はたして$$),
        (4, $$果たして$$),
        (4, $$はたして$$),
        (5, $$果たして$$),
        (5, $$はたして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-29 — 一応
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-29',
    'grammar',
    'N2',
    $$一応$$,
    $$ichiou$$,
    $$Por via das dúvidas / Mais ou menos / Pelo menos / Por enquanto$$,
    $$一応 é um advérbio muito comum na conversa, com alguns usos ligados à ideia de "não é perfeito, mas serve".

• Por via das dúvidas: fazer algo como precaução, mesmo sem ter certeza de que é necessário. Por exemplo, "vou levar o guarda-chuva, por via das dúvidas".
• Mais ou menos / de certa forma: algo está feito ou é verdade, mas não totalmente. Por exemplo, "terminei a lição, mais ou menos, mas não tenho confiança".
• Pelo menos formalmente: algo é assim no nome, mas não na prática. Por exemplo, "ele é professor, pelo menos no papel".

Também é usado para dar modéstia às respostas: "sei cozinhar, mais ou menos".$$,
    $$念のため também significa "por via das dúvidas" e é mais formal. 一応 é mais casual.

Usar 一応 em respostas pode deixar a frase mais humilde, mostrando que você não quer parecer convencido.

Em e-mails de trabalho, 一応ご確認ください significa "por favor, confira, por via das dúvidas".$$,
    $$一応 + Verbo (por via das dúvidas)
一応 + Verbo passado (mais ou menos feito)
一応 + Substantivo + だ (pelo menos no papel)

Escrita: 一応 / いちおう$$,
    $$一応$$,
    $$一応|いちおう$$,
    ARRAY['一応']::text[],
    ARRAY['一応', 'いちおう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-29', $$雨は降らないと思うけど、一応、傘を持っていこう。$$, $$あめはふらないとおもうけど、いちおう、かさをもっていこう。$$, $$Acho que não vai chover, mas vou levar o guarda-chuva por via das dúvidas.$$),
    ('n2-grammar-29', $$宿題は一応終わったけど、自信がない。$$, $$しゅくだいはいちおうおわったけど、じしんがない。$$, $$Terminei a lição, mais ou menos, mas não tenho confiança.$$),
    ('n2-grammar-29', $$一応、彼にも連絡しておきます。$$, $$いちおう、かれにもれんらくしておきます。$$, $$Por via das dúvidas, vou avisá-lo também.$$),
    ('n2-grammar-29', $$料理は一応できますが、上手ではありません。$$, $$りょうりはいちおうできますが、じょうずではありません。$$, $$Sei cozinhar mais ou menos, mas não muito bem.$$),
    ('n2-grammar-29', $$念のため、一応確認してください。$$, $$ねんのため、いちおうかくにんしてください。$$, $$Por via das dúvidas, confira, por favor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雨が降るかもしれないので、____傘を持っていく。$$, $$Pode ser que chova, então vou levar guarda-chuva por via das dúvidas.$$),
        (2, $$レポートは____書き終わった。$$, $$Terminei de escrever o relatório, mais ou menos.$$),
        (3, $$彼は____先生だが、あまり教えていない。$$, $$Ele é professor, pelo menos no papel, mas quase não dá aulas.$$),
        (4, $$大丈夫だと思うけど、____病院に行っておこう。$$, $$Acho que está tudo bem, mas vou ao hospital por via das dúvidas.$$),
        (5, $$英語は____話せますが、上手ではないです。$$, $$Falo inglês mais ou menos, mas não bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-29', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一応$$),
        (1, $$いちおう$$),
        (2, $$一応$$),
        (2, $$いちおう$$),
        (3, $$一応$$),
        (3, $$いちおう$$),
        (4, $$一応$$),
        (4, $$いちおう$$),
        (5, $$一応$$),
        (5, $$いちおう$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-30 — 〜以外
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-30',
    'grammar',
    'N2',
    $$〜以外$$,
    $$igai$$,
    $$Exceto / Além de / Fora$$,
    $$以外 é usado para indicar exceção: tudo, menos aquilo. Equivale a "exceto", "além de" ou "fora".

Ele vem depois de substantivos e, às vezes, de verbos na forma de dicionário. Por exemplo, "trabalho todo dia, exceto domingo" ou "ninguém veio além dele".

Com は, 以外は destaca a exceção: "fora o domingo, trabalho todo dia".

Antes de um substantivo, usa-se 以外の: 肉以外の料理 (pratos que não sejam de carne).

Com に e ない, 以外に方法がない significa "não há outro jeito além de...".$$,
    $$Não confunda 以外 (exceto) com 意外 (inesperado). As duas são lidas いがい, mas os kanji e os sentidos são diferentes.

関係者以外立入禁止 ("proibida a entrada de pessoas não autorizadas") é um aviso muito comum.

Para "além de" no sentido de "além disso, também", usa-se 以外にも: 東京以外にも行きたい.$$,
    $$Substantivo + 以外 + は / に / の
Verbo na forma de dicionário + 以外に + ない (não há outra opção além de)
Substantivo + 以外 + 誰も / 何も + Negativo

Escrita: 以外 / いがい$$,
    $$以外$$,
    $$以外|いがい$$,
    ARRAY['以外']::text[],
    ARRAY['以外', '以外は', '以外に', '以外の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-30', $$日曜日以外は毎日働いている。$$, $$にちようびいがいはまいにちはたらいている。$$, $$Trabalho todos os dias, exceto domingo.$$),
    ('n2-grammar-30', $$彼以外、誰も来なかった。$$, $$かれいがい、だれもこなかった。$$, $$Ninguém veio além dele.$$),
    ('n2-grammar-30', $$関係者以外は入れません。$$, $$かんけいしゃいがいははいれません。$$, $$Apenas pessoas autorizadas podem entrar.$$),
    ('n2-grammar-30', $$肉以外の料理を注文した。$$, $$にくいがいのりょうりをちゅうもんした。$$, $$Pedi um prato que não fosse de carne.$$),
    ('n2-grammar-30', $$電車が来ないなら、待つ以外に方法がない。$$, $$でんしゃがこないなら、まついがいにほうほうがない。$$, $$Se o trem não vem, não há outro jeito além de esperar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私____は、みんな賛成した。$$, $$Todos concordaram, exceto eu.$$),
        (2, $$魚____の物なら、何でも食べます。$$, $$Como qualquer coisa, menos peixe.$$),
        (3, $$日本語____の言葉は話せない。$$, $$Não falo nenhuma língua além do japonês.$$),
        (4, $$謝る____に、できることはない。$$, $$Não há nada que eu possa fazer além de pedir desculpas.$$),
        (5, $$この部屋は、社員____立ち入り禁止です。$$, $$A entrada nesta sala é proibida para quem não é funcionário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-30', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以外$$),
        (2, $$以外$$),
        (3, $$以外$$),
        (4, $$以外$$),
        (5, $$以外$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-31 — 〜以上に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-31',
    'grammar',
    'N2',
    $$〜以上に$$,
    $$ijou ni$$,
    $$Mais do que / Além do que / Acima de$$,
    $$以上に é usado para dizer que algo superou uma expectativa, uma previsão ou um ponto de comparação. Equivale a "mais do que" ou "além do que".

Ele aparece muito com palavras de expectativa, como 思った (pensei), 予想 (previsão), 想像 (imaginação) e 期待 (expectativa). Por exemplo, "a prova foi mais difícil do que eu pensava" ou "o trabalho é mais pesado do que eu imaginava".

Também é usado para comparar com um padrão anterior: "vou me esforçar ainda mais do que da última vez".

Antes de um substantivo, usa-se 以上の: 期待以上の結果 (um resultado acima das expectativas).

É parecido com より, mas 以上に destaca que a expectativa foi ultrapassada.$$,
    $$Não confunda com 以上は (já que), que tem outro sentido.

Em avaliações de produtos e serviços, 期待以上 ("acima das expectativas") é um elogio comum.

以上 sozinho também significa "acima de" em números, como 二十歳以上 (vinte anos ou mais).$$,
    $$Verbo (forma simples) + 以上に + Adjetivo / Verbo
Substantivo (予想 / 想像 / 期待 / 前回) + 以上に
… + 以上の + Substantivo$$,
    $$以上に$$,
    $$以上に|以上の$$,
    ARRAY['以上', 'に']::text[],
    ARRAY['以上に', '以上の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-31', $$試験は思った以上に難しかった。$$, $$しけんはおもったいじょうにむずかしかった。$$, $$A prova foi mais difícil do que eu pensava.$$),
    ('n2-grammar-31', $$彼は予想以上に早く来た。$$, $$かれはよそういじょうにはやくきた。$$, $$Ele chegou mais cedo do que o previsto.$$),
    ('n2-grammar-31', $$この仕事は想像以上に大変だ。$$, $$このしごとはそうぞういじょうにたいへんだ。$$, $$Este trabalho é mais pesado do que eu imaginava.$$),
    ('n2-grammar-31', $$次の大会では、前回以上に頑張ります。$$, $$つぎのたいかいでは、ぜんかいいじょうにがんばります。$$, $$No próximo campeonato, vou me esforçar ainda mais do que da última vez.$$),
    ('n2-grammar-31', $$みんなの努力で、期待以上の結果が出た。$$, $$みんなのどりょくで、きたいいじょうのけっかがでた。$$, $$Graças ao esforço de todos, o resultado foi acima das expectativas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$旅行は思った____楽しかった。$$, $$A viagem foi mais divertida do que eu pensava.$$),
        (2, $$実際に会った彼女は、想像____美しかった。$$, $$Pessoalmente, ela era mais bonita do que eu imaginava.$$),
        (3, $$今年の夏は去年____暑い。$$, $$Este verão está ainda mais quente do que o do ano passado.$$),
        (4, $$コンサートには予想____多くの人が集まった。$$, $$Muito mais gente do que o previsto foi ao show.$$),
        (5, $$それは期待____の成果だった。$$, $$Foi um resultado acima das expectativas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-31', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以上に$$),
        (2, $$以上に$$),
        (3, $$以上に$$),
        (4, $$以上に$$),
        (5, $$以上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-32 — 〜以上は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-32',
    'grammar',
    'N2',
    $$〜以上は$$,
    $$ijou wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$以上は é usado para dizer que, como uma situação é assim, existe uma obrigação, uma decisão ou uma consequência natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão já tomada (prometer, aceitar, participar, ser estudante). A segunda mostra o que, por isso, deve ser feito: uma obrigação, uma determinação ou uma conclusão firme.

Por exemplo, "já que prometi, tenho que cumprir" ou "uma vez que vou participar, quero vencer".

A segunda parte costuma ter べきだ, なければならない, つもりだ, たい ou expressões de determinação.

O sentido é muito parecido com からには e 上は. 以上は soa um pouco mais formal. A forma sem は (以上、) também é comum.$$,
    $$以上は, からには e 上は são praticamente sinônimos. からには é mais comum na conversa; 上は é o mais formal.

Não confunda com 以上に (mais do que) e com 以上 de números (acima de).

Em contratos e regras, 以上は aparece para indicar responsabilidade: 契約した以上は….$$,
    $$Verbo (forma simples) + 以上は / 以上、 + Obrigação / Decisão
Substantivo + である + 以上は$$,
    $$以上は$$,
    $$以上は|以上、$$,
    ARRAY['以上', 'は']::text[],
    ARRAY['以上は', '以上']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-32', $$約束した以上は、守らなければならない。$$, $$やくそくしたいじょうは、まもらなければならない。$$, $$Já que prometi, tenho que cumprir.$$),
    ('n2-grammar-32', $$引き受けた以上、最後までやるべきだ。$$, $$ひきうけたいじょう、さいごまでやるべきだ。$$, $$Uma vez que aceitou, deve ir até o fim.$$),
    ('n2-grammar-32', $$試合に出る以上は、勝ちたい。$$, $$しあいにでるいじょうは、かちたい。$$, $$Já que vou participar da partida, quero vencer.$$),
    ('n2-grammar-32', $$学生である以上、勉強するのは当然だ。$$, $$がくせいであるいじょう、べんきょうするのはとうぜんだ。$$, $$Visto que é estudante, é natural estudar.$$),
    ('n2-grammar-32', $$日本に住む以上は、日本の法律を守るべきだ。$$, $$にほんにすむいじょうは、にほんのほうりつをまもるべきだ。$$, $$Já que mora no Japão, deve respeitar as leis japonesas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$自分で決めた____、やるしかない。$$, $$Já que fui eu quem decidiu, não há outra opção a não ser fazer.$$),
        (2, $$お金をもらう____、ちゃんと働かなければならない。$$, $$Já que vou receber dinheiro, tenho que trabalhar direito.$$),
        (3, $$留学する____、その国の言葉を勉強すべきだ。$$, $$Uma vez que vai fazer intercâmbio, deve estudar a língua do país.$$),
        (4, $$参加すると言った____、休むわけにはいかない。$$, $$Já que disse que ia participar, não posso faltar.$$),
        (5, $$リーダーである____、責任を持たなければならない。$$, $$Visto que é o líder, tem que assumir a responsabilidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-32', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$以上は$$),
        (1, $$以上$$),
        (2, $$以上は$$),
        (2, $$以上$$),
        (3, $$以上は$$),
        (3, $$以上$$),
        (4, $$以上は$$),
        (4, $$以上$$),
        (5, $$以上は$$),
        (5, $$以上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-33 — いきなり
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-33',
    'grammar',
    'N2',
    $$いきなり$$,
    $$ikinari$$,
    $$De repente / Sem aviso / Do nada$$,
    $$いきなり é um advérbio que indica que algo aconteceu de repente, sem aviso nem preparação. Equivale a "de repente", "sem aviso" ou "do nada".

Ele é parecido com 急に e 突然, mas いきなり destaca que a ação pulou etapas ou aconteceu sem nenhum sinal prévio, muitas vezes de forma brusca ou inesperada.

Por exemplo, "ele ficou bravo do nada" ou "uma pessoa desconhecida puxou conversa comigo de repente".

Também é usado em conselhos, para dizer que não se deve começar algo de forma brusca: "é melhor não começar direto pelas questões difíceis".$$,
    $$Comparando: 急に destaca a rapidez; 突然 destaca a surpresa; いきなり destaca a falta de aviso ou de preparação.

いきなり é mais comum na conversa do que na escrita formal.

Em contextos de aprendizado, いきなり aparece em conselhos como "não comece direto pelo mais difícil".$$,
    $$いきなり + Verbo$$,
    $$いきなり$$,
    $$いきなり$$,
    ARRAY['いきなり']::text[],
    ARRAY['いきなり']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-33', $$彼はいきなり怒り出した。$$, $$かれはいきなりおこりだした。$$, $$Ele ficou bravo do nada.$$),
    ('n2-grammar-33', $$いきなりドアが開いて、びっくりした。$$, $$いきなりドアがあいて、びっくりした。$$, $$A porta se abriu de repente e levei um susto.$$),
    ('n2-grammar-33', $$駅で知らない人にいきなり話しかけられた。$$, $$えきでしらないひとにいきなりはなしかけられた。$$, $$Na estação, uma pessoa desconhecida puxou conversa comigo do nada.$$),
    ('n2-grammar-33', $$いきなり難しい問題から始めないほうがいい。$$, $$いきなりむずかしいもんだいからはじめないほうがいい。$$, $$É melhor não começar direto pelas questões difíceis.$$),
    ('n2-grammar-33', $$彼女は誰にも言わずに、いきなり会社をやめた。$$, $$かのじょはだれにもいわずに、いきなりかいしゃをやめた。$$, $$Ela saiu da empresa de repente, sem avisar ninguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$晴れていたのに、____雨が降ってきた。$$, $$Estava ensolarado, mas de repente começou a chover.$$),
        (2, $$角から犬が____飛び出してきた。$$, $$Um cachorro saiu correndo da esquina do nada.$$),
        (3, $$彼は____私の手を握った。$$, $$Ele segurou a minha mão de repente.$$),
        (4, $$準備もせずに、____本番はできない。$$, $$Sem preparação, não dá para ir direto para a apresentação.$$),
        (5, $$授業中に____名前を呼ばれて、驚いた。$$, $$Fui chamado pelo nome do nada durante a aula e levei um susto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-33', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いきなり$$),
        (2, $$いきなり$$),
        (3, $$いきなり$$),
        (4, $$いきなり$$),
        (5, $$いきなり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-34 — 一気に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-34',
    'grammar',
    'N2',
    $$一気に$$,
    $$ikki ni$$,
    $$De uma vez só / De um fôlego / Rapidamente$$,
    $$一気に é um advérbio que significa "de uma vez só" ou "de um fôlego". Ele indica que algo é feito sem parar, com rapidez e intensidade, ou que uma mudança acontece de forma súbita e grande.

Ele tem dois usos principais.

O primeiro é fazer algo sem pausa, até o fim: "bebeu a água de uma vez só", "li o romance inteiro de um fôlego", "resolvi o trabalho todo de uma vez".

O segundo é indicar uma mudança grande e rápida: "a temperatura caiu de repente", "a popularidade se espalhou rapidamente".

Comparado a 一度に (ao mesmo tempo, de uma vez), 一気に destaca a energia e a continuidade da ação.$$,
    $$一気飲み significa "beber de uma vez só", e em festas japonesas é desencorajado por razões de saúde.

Com verbos de leitura e trabalho, 一気に mostra que a pessoa estava muito envolvida.

Em notícias, 一気に aparece para mudanças bruscas em preços, temperatura e popularidade.$$,
    $$一気に + Verbo

Escrita: 一気に / いっきに$$,
    $$一気に$$,
    $$一気に|いっきに$$,
    ARRAY['一気', 'に']::text[],
    ARRAY['一気に', 'いっきに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-34', $$喉が渇いていたので、彼は水を一気に飲んだ。$$, $$のどがかわいていたので、かれはみずをいっきにのんだ。$$, $$Ele estava com sede e bebeu a água de uma vez só.$$),
    ('n2-grammar-34', $$おもしろくて、小説を一気に読んでしまった。$$, $$おもしろくて、しょうせつをいっきによんでしまった。$$, $$Era tão interessante que li o romance inteiro de um fôlego.$$),
    ('n2-grammar-34', $$週末に、たまった仕事を一気に片付けた。$$, $$しゅうまつに、たまったしごとをいっきにかたづけた。$$, $$No fim de semana, resolvi de uma vez todo o trabalho acumulado.$$),
    ('n2-grammar-34', $$夜になって、気温が一気に下がった。$$, $$よるになって、きおんがいっきにさがった。$$, $$À noite, a temperatura caiu de repente.$$),
    ('n2-grammar-34', $$彼は階段を一気に駆け上がった。$$, $$かれはかいだんをいっきにかけあがった。$$, $$Ele subiu a escada correndo, de uma vez só.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暑かったので、ビールを____飲み干した。$$, $$Estava quente, então bebi a cerveja de uma vez só.$$),
        (2, $$集中して、宿題を____終わらせた。$$, $$Me concentrei e terminei a lição de uma vez.$$),
        (3, $$暖かくなって、桜が____咲いた。$$, $$Esquentou e as cerejeiras floresceram todas de uma vez.$$),
        (4, $$テレビで紹介されて、その店の人気が____広がった。$$, $$Depois de aparecer na TV, a popularidade da loja se espalhou rapidamente.$$),
        (5, $$彼は坂を____走って上った。$$, $$Ele subiu a ladeira correndo, de uma vez só.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-34', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一気に$$),
        (1, $$いっきに$$),
        (2, $$一気に$$),
        (2, $$いっきに$$),
        (3, $$一気に$$),
        (3, $$いっきに$$),
        (4, $$一気に$$),
        (4, $$いっきに$$),
        (5, $$一気に$$),
        (5, $$いっきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-35 — 〜一方で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-35',
    'grammar',
    'N2',
    $$〜一方で$$,
    $$ippou de$$,
    $$Por outro lado / Enquanto / Ao mesmo tempo que$$,
    $$一方で é usado para contrastar duas situações ou para mostrar duas ações que acontecem ao mesmo tempo. Equivale a "por outro lado", "enquanto" ou "ao mesmo tempo que".

Ele tem três usos principais:
• Contraste entre dois lados de uma mesma coisa: "a cidade é prática, mas, por outro lado, o custo de vida é alto".
• Contraste entre duas coisas diferentes: "o número de crianças diminui, enquanto o de idosos aumenta".
• Duas atividades simultâneas: "ele trabalha e, ao mesmo tempo, faz faculdade".

No começo de uma frase, 一方、 (com vírgula) significa "por outro lado" e liga duas frases contrastantes.

É muito usado em textos, notícias e análises.$$,
    $$Compare: 一方だ (só aumenta / só piora) e 一方で (por outro lado) têm sentidos bem diferentes.

Comparado a 反面, 一方で é mais amplo e pode comparar coisas diferentes, e não só os dois lados de uma mesma coisa.

Em notícias com estatísticas, 一方 é usado para contrastar dados.$$,
    $$Verbo / Adjetivo (forma simples) + 一方で、 + Contraste / Ação simultânea
Adjetivo な + な / である + 一方で
Frase 1 (com ponto final) + 一方、 + Frase 2

Escrita: 一方で / いっぽうで$$,
    $$一方で$$,
    $$一方で|一方、|いっぽうで$$,
    ARRAY['一方', 'で']::text[],
    ARRAY['一方で', '一方']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-35', $$都会は便利な一方で、物価が高い。$$, $$とかいはべんりないっぽうで、ぶっかがたかい。$$, $$A cidade grande é prática, mas, por outro lado, o custo de vida é alto.$$),
    ('n2-grammar-35', $$兄は活発だ。一方、弟はおとなしい。$$, $$あにはかっぱつだ。いっぽう、おとうとはおとなしい。$$, $$O irmão mais velho é agitado. Por outro lado, o mais novo é quieto.$$),
    ('n2-grammar-35', $$彼は仕事をする一方で、大学にも通っている。$$, $$かれはしごとをするいっぽうで、だいがくにもかよっている。$$, $$Ele trabalha e, ao mesmo tempo, faz faculdade.$$),
    ('n2-grammar-35', $$子供の数が減る一方で、高齢者は増えている。$$, $$こどものかずがへるいっぽうで、こうれいしゃはふえている。$$, $$Enquanto o número de crianças diminui, o de idosos aumenta.$$),
    ('n2-grammar-35', $$輸出が増えた一方で、輸入は減った。$$, $$ゆしゅつがふえたいっぽうで、ゆにゅうはへった。$$, $$As exportações aumentaram, enquanto as importações diminuíram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この仕事は給料がいい____、休みが少ない。$$, $$Este trabalho paga bem, mas, por outro lado, tem poucas folgas.$$),
        (2, $$彼女は歌手として活動する____、女優もしている。$$, $$Ela trabalha como cantora e, ao mesmo tempo, como atriz.$$),
        (3, $$東京は人口が増える____、地方は減っている。$$, $$Enquanto a população de Tóquio aumenta, a do interior diminui.$$),
        (4, $$生活は便利になった____、失ったものもある。$$, $$A vida ficou mais prática, mas, por outro lado, também perdemos coisas.$$),
        (5, $$父は厳しい____、優しいところもある。$$, $$Meu pai é rigoroso, mas, ao mesmo tempo, também tem um lado gentil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-35', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$一方で$$),
        (2, $$一方で$$),
        (3, $$一方で$$),
        (4, $$一方で$$),
        (5, $$一方で$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-36 — いわゆる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-36',
    'grammar',
    'N2',
    $$いわゆる$$,
    $$iwayuru$$,
    $$O chamado / O que se chama de / Como se diz$$,
    $$いわゆる é usado antes de uma palavra ou expressão para indicar que ela é um termo conhecido, popular ou comumente usado. Equivale a "o chamado", "o que se chama de" ou "como se diz".

Ele mostra que quem fala está usando uma palavra que todo mundo conhece, às vezes uma gíria, um rótulo ou um conceito popular. Por exemplo, "ele é o que se chama de gênio" ou "trabalhei numa chamada 'empresa abusiva'".

Muitas vezes, a palavra que vem depois aparece entre aspas japonesas 「」, reforçando que é um termo específico.

いわゆる vem antes de substantivos e funciona como um adjetivo.$$,
    $$O kanji 所謂 é raro no dia a dia; o mais comum é escrever em hiragana.

いわゆる também é útil para explicar termos culturais japoneses a estrangeiros, como おもてなし e 帰国子女.

Às vezes, いわゆる tem um tom levemente distante ou crítico, como se quem fala não concordasse totalmente com o rótulo.$$,
    $$いわゆる + Substantivo
いわゆる + 「Termo」

Escrita: いわゆる / 所謂$$,
    $$いわゆる$$,
    $$いわゆる|所謂$$,
    ARRAY['いわゆる']::text[],
    ARRAY['いわゆる', '所謂']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-36', $$彼はいわゆる天才だ。$$, $$かれはいわゆるてんさいだ。$$, $$Ele é o que se chama de gênio.$$),
    ('n2-grammar-36', $$これがいわゆる日本の「おもてなし」です。$$, $$これがいわゆるにほんの「おもてなし」です。$$, $$Isto é o chamado "omotenashi", a hospitalidade japonesa.$$),
    ('n2-grammar-36', $$彼女はいわゆるお嬢様だ。$$, $$かのじょはいわゆるおじょうさまだ。$$, $$Ela é o que se chama de moça de família rica.$$),
    ('n2-grammar-36', $$以前、いわゆる「ブラック企業」で働いていた。$$, $$いぜん、いわゆる「ブラックきぎょう」ではたらいていた。$$, $$Antes, eu trabalhava numa chamada "empresa abusiva".$$),
    ('n2-grammar-36', $$彼はいわゆるオタクと呼ばれる人だ。$$, $$かれはいわゆるオタクとよばれるひとだ。$$, $$Ele é o que se costuma chamar de otaku.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は有名大学を出た、____エリートだ。$$, $$Ele se formou numa universidade famosa, é o que se chama de elite.$$),
        (2, $$これが____「和食」です。$$, $$Isto é o chamado "washoku", a culinária japonesa.$$),
        (3, $$海外で育った彼女は、____帰国子女だ。$$, $$Ela, que cresceu no exterior, é o que se chama de "kikoku shijo".$$),
        (4, $$最近、____「草食系男子」が増えている。$$, $$Ultimamente, estão aumentando os chamados "homens herbívoros".$$),
        (5, $$一日中ゲームをしている彼は、____ゲームオタクだ。$$, $$Ele joga videogame o dia inteiro: é o que se chama de viciado em games.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-36', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いわゆる$$),
        (2, $$いわゆる$$),
        (3, $$いわゆる$$),
        (4, $$いわゆる$$),
        (5, $$いわゆる$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-37 — いよいよ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-37',
    'grammar',
    'N2',
    $$いよいよ$$,
    $$iyoiyo$$,
    $$Finalmente / Enfim chegou / Cada vez mais$$,
    $$いよいよ é um advérbio com dois usos principais.

O primeiro, mais comum, indica que um momento esperado finalmente chegou ou está prestes a chegar. Equivale a "finalmente" ou "enfim chegou". O tom é de expectativa, emoção ou tensão. Por exemplo, "finalmente, amanhã é a prova" ou "enfim chegou o dia da partida".

O segundo indica que algo está se intensificando cada vez mais. Equivale a "cada vez mais". Por exemplo, "a chuva está ficando cada vez mais forte".

Comparado a ついに e やっと, いよいよ costuma se referir a algo que está acontecendo agora ou prestes a acontecer, com sensação de clímax.$$,
    $$いよいよ é muito usado em anúncios e programas: いよいよ最終回 ("finalmente, o último episódio").

Comparando: やっと = alívio depois de espera; ついに = finalmente aconteceu (após longo processo); いよいよ = o momento esperado está chegando.

No uso de intensificação, いよいよ é parecido com ますます.$$,
    $$いよいよ + Evento próximo / que começa
いよいよ + Adjetivo / Verbo de mudança (cada vez mais)$$,
    $$いよいよ$$,
    $$いよいよ$$,
    ARRAY['いよいよ']::text[],
    ARRAY['いよいよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-37', $$いよいよ明日は試験だ。$$, $$いよいよあしたはしけんだ。$$, $$Finalmente, amanhã é a prova.$$),
    ('n2-grammar-37', $$いよいよ夏休みが始まる。$$, $$いよいよなつやすみがはじまる。$$, $$Enfim, as férias de verão vão começar.$$),
    ('n2-grammar-37', $$雨がいよいよ強くなってきた。$$, $$あめがいよいよつよくなってきた。$$, $$A chuva está ficando cada vez mais forte.$$),
    ('n2-grammar-37', $$いよいよ出発の日が来た。$$, $$いよいよしゅっぱつのひがきた。$$, $$Enfim chegou o dia da partida.$$),
    ('n2-grammar-37', $$試合はいよいよ最後の五分になった。$$, $$しあいはいよいよさいごのごふんになった。$$, $$A partida finalmente chegou aos últimos cinco minutos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____来週から新しい仕事が始まる。$$, $$Finalmente, o novo trabalho começa na semana que vem.$$),
        (2, $$台風が近づいて、風が____強くなった。$$, $$Com a aproximação do tufão, o vento ficou cada vez mais forte.$$),
        (3, $$____結婚式の日がやってきた。$$, $$Enfim chegou o dia do casamento.$$),
        (4, $$このドラマも、____最終回です。$$, $$Esta novela finalmente chegou ao último episódio.$$),
        (5, $$試験まで____あと一日だ。$$, $$Finalmente, falta só um dia para a prova.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いよいよ$$),
        (2, $$いよいよ$$),
        (3, $$いよいよ$$),
        (4, $$いよいよ$$),
        (5, $$いよいよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-38 — 〜上（じょう）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-38',
    'grammar',
    'N2',
    $$〜上（じょう）$$,
    $$jou$$,
    $$Do ponto de vista de / Em termos de / Por razões de$$,
    $$上 (lido じょう), como sufixo depois de um substantivo, indica o ponto de vista, a área ou o aspecto a partir do qual algo é considerado. Equivale a "do ponto de vista de", "em termos de" ou "por razões de".

Por exemplo, 健康上 (do ponto de vista da saúde), 法律上 (em termos legais), 安全上 (por razões de segurança), 経験上 (pela experiência), 教育上 (do ponto de vista educacional).

Ele pode ser seguido de は, の, も ou de vírgula:
• 健康上の理由 (motivos de saúde).
• 法律上は問題ない (legalmente, não há problema).
• 安全上、〜してください (por segurança, faça...).

É uma expressão formal, muito usada em documentos, avisos, notícias e linguagem de negócios.$$,
    $$健康上の理由で ("por motivos de saúde") é uma forma educada e vaga de justificar ausências.

O mesmo kanji 上 tem outras leituras e usos, como うえ (em cima) e 上に / 上で, que são outras gramáticas.

Em contratos, 法律上 e 契約上 aparecem com frequência.$$,
    $$Substantivo + 上 (じょう) + の + Substantivo
Substantivo + 上 + は / も + Frase
Substantivo + 上、 + Frase

Exemplos: 健康上 / 法律上 / 安全上 / 経験上 / 教育上 / 歴史上$$,
    $$上$$,
    $$上は|上の|上、|上も|上で$$,
    ARRAY['上']::text[],
    ARRAY['上', '上の', '上は']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-38', $$健康上の理由で、会社を休んだ。$$, $$けんこうじょうのりゆうで、かいしゃをやすんだ。$$, $$Faltei ao trabalho por motivos de saúde.$$),
    ('n2-grammar-38', $$このやり方は、法律上は問題ない。$$, $$このやりかたは、ほうりつじょうはもんだいない。$$, $$Este método, do ponto de vista legal, não tem problema.$$),
    ('n2-grammar-38', $$安全上、ここに入らないでください。$$, $$あんぜんじょう、ここにはいらないでください。$$, $$Por razões de segurança, não entre aqui.$$),
    ('n2-grammar-38', $$経験上、この方法が一番いい。$$, $$けいけんじょう、このほうほうがいちばんいい。$$, $$Pela minha experiência, este método é o melhor.$$),
    ('n2-grammar-38', $$その番組は教育上、子供によくない。$$, $$そのばんぐみはきょういくじょう、こどもによくない。$$, $$Esse programa não é bom para as crianças do ponto de vista educacional.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康____の問題で、お酒をやめた。$$, $$Parei de beber por problemas de saúde.$$),
        (2, $$日本では法律____、二十歳になるまでお酒は飲めない。$$, $$No Japão, pela lei, não se pode beber antes dos vinte anos.$$),
        (3, $$安全____の理由で、イベントは中止になった。$$, $$O evento foi cancelado por razões de segurança.$$),
        (4, $$経験____、彼は時間どおりには来ないと思う。$$, $$Pela experiência, acho que ele não vai chegar no horário.$$),
        (5, $$この寺は歴史____、重要な場所だ。$$, $$Este templo é um lugar importante do ponto de vista histórico.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-38', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上$$),
        (2, $$上$$),
        (3, $$上$$),
        (4, $$上$$),
        (5, $$上$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-39 — 〜かのように
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-39',
    'grammar',
    'N2',
    $$〜かのように$$,
    $$ka no you ni$$,
    $$Como se / Como se fosse$$,
    $$かのように é usado para dizer que algo acontece ou é feito como se fosse outra coisa, mesmo que não seja verdade. Equivale a "como se" ou "como se fosse".

A parte antes de かのように descreve uma situação imaginária ou falsa. Por exemplo, "ele agiu como se não soubesse de nada" (mas sabia) ou "está quente como se a primavera tivesse chegado" (mas ainda não chegou).

Muitas vezes, aparece junto com まるで, que reforça a comparação.

Antes de um substantivo, usa-se かのような: 夢を見ているかのような顔 (uma cara de quem está sonhando).

No fim da frase, usa-se かのようだ.$$,
    $$Comparado a ように, かのように destaca mais que a situação é falsa ou imaginária.

A expressão 何もなかったかのように ("como se nada tivesse acontecido") é muito comum.

É um pouco literário e aparece muito em romances e descrições.$$,
    $$Verbo / Adjetivo (forma simples) + かのように + Verbo / Adjetivo
Substantivo + である + かのように
… + かのような + Substantivo
… + かのようだ
まるで + … + かのように$$,
    $$かのように$$,
    $$かのように|かのような|かのようだ$$,
    ARRAY['か', 'の', 'ように']::text[],
    ARRAY['かのように', 'かのような', 'かのようだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-39', $$彼は何も知らないかのように振る舞った。$$, $$かれはなにもしらないかのようにふるまった。$$, $$Ele agiu como se não soubesse de nada.$$),
    ('n2-grammar-39', $$彼女はまるで夢を見ているかのような顔をしていた。$$, $$かのじょはまるでゆめをみているかのようなかおをしていた。$$, $$Ela estava com uma cara de quem estava sonhando.$$),
    ('n2-grammar-39', $$まだ二月なのに、春が来たかのように暖かい。$$, $$まだにがつなのに、はるがきたかのようにあたたかい。$$, $$Ainda é fevereiro, mas está quente como se a primavera tivesse chegado.$$),
    ('n2-grammar-39', $$彼はまるで自分の家にいるかのようにくつろいでいる。$$, $$かれはまるでじぶんのいえにいるかのようにくつろいでいる。$$, $$Ele está à vontade como se estivesse na própria casa.$$),
    ('n2-grammar-39', $$何もなかったかのように、彼は笑った。$$, $$なにもなかったかのように、かれはわらった。$$, $$Ele riu como se nada tivesse acontecido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼はまるで社長である____話す。$$, $$Ele fala como se fosse o presidente.$$),
        (2, $$彼女は何も聞かなかった____、黙っていた。$$, $$Ela ficou calada como se não tivesse ouvido nada.$$),
        (3, $$十月なのに、夏が戻ってきた____暑い日だった。$$, $$Era outubro, mas foi um dia quente como se o verão tivesse voltado.$$),
        (4, $$彼は全部知っている____顔をしている。$$, $$Ele está com cara de quem sabe de tudo.$$),
        (5, $$まるで時間が止まった____静かだ。$$, $$Está tão silencioso como se o tempo tivesse parado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-39', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かのように$$),
        (2, $$かのように$$),
        (3, $$かのような$$),
        (4, $$かのような$$),
        (5, $$かのように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-40 — 〜かと思ったら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-40',
    'grammar',
    'N2',
    $$〜かと思ったら$$,
    $$ka to omottara$$,
    $$Mal... e já / Quando parecia que... de repente$$,
    $$かと思ったら é usado para dizer que, logo depois de algo acontecer, aconteceu outra coisa inesperada, muitas vezes o oposto. Equivale a "mal... e já..." ou "quando parecia que..., de repente...".

A primeira parte descreve uma ação ou mudança, e a segunda mostra algo que veio imediatamente depois, de forma surpreendente. Por exemplo, "mal começou a chover e já parou" ou "a criança mal chorou e já está rindo".

A ideia é de mudança rápida e inesperada. Por isso, ela é usada para descrever situações que surpreendem quem fala.

As formas かと思うと e かと思えば têm sentido parecido. かと思えば também pode mostrar alternância: "às vezes está quente, de repente fica frio".

Ela vem depois do verbo na forma た, e a segunda parte é um fato observado, não uma ação de quem fala.$$,
    $$Essa estrutura não é usada para as próprias ações de quem fala, porque descreve algo observado com surpresa.

Também existe o uso かと思ったら com o sentido de "eu achava que..., mas na verdade...", como em 誰かと思ったら、君か ("achei que fosse outra pessoa, mas era você").

É muito comum em descrições de crianças, do tempo e de comportamentos imprevisíveis.$$,
    $$Verbo na forma た + かと思ったら、 + Mudança inesperada
Verbo na forma た + かと思うと、 + …
Verbo / Adjetivo + かと思えば、 + … (alternância)$$,
    $$かと思ったら$$,
    $$かと思ったら|かと思うと|かと思えば$$,
    ARRAY['か', 'と', '思ったら']::text[],
    ARRAY['かと思ったら', 'かと思うと', 'かと思えば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-40', $$雨が降ったかと思ったら、すぐにやんだ。$$, $$あめがふったかとおもったら、すぐにやんだ。$$, $$Mal começou a chover e já parou.$$),
    ('n2-grammar-40', $$子供は泣いたかと思ったら、もう笑っている。$$, $$こどもはないたかとおもったら、もうわらっている。$$, $$A criança mal chorou e já está rindo.$$),
    ('n2-grammar-40', $$彼は帰ったかと思ったら、またすぐ戻ってきた。$$, $$かれはかえったかとおもったら、またすぐもどってきた。$$, $$Quando parecia que ele tinha ido embora, voltou logo em seguida.$$),
    ('n2-grammar-40', $$静かになったかと思うと、また騒ぎ始めた。$$, $$しずかになったかとおもうと、またさわぎはじめた。$$, $$Mal ficou quieto e já começou a fazer barulho de novo.$$),
    ('n2-grammar-40', $$最近の天気は、暑いかと思えば、急に寒くなる。$$, $$さいきんのてんきは、あついかとおもえば、きゅうにさむくなる。$$, $$Ultimamente o tempo está assim: parece quente e, de repente, esfria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$雷が鳴った____、大雨が降り出した。$$, $$Mal trovejou e já começou uma chuva forte.$$),
        (2, $$彼女は来た____、すぐに帰った。$$, $$Ela mal chegou e já foi embora.$$),
        (3, $$晴れた____、また曇ってきた。$$, $$Mal abriu o sol e já voltou a ficar nublado.$$),
        (4, $$赤ちゃんは寝た____、すぐ起きた。$$, $$O bebê mal dormiu e já acordou.$$),
        (5, $$彼は座った____、また立ち上がった。$$, $$Ele mal se sentou e já se levantou de novo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-40', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かと思ったら$$),
        (1, $$かと思うと$$),
        (2, $$かと思ったら$$),
        (2, $$かと思うと$$),
        (3, $$かと思ったら$$),
        (3, $$かと思うと$$),
        (4, $$かと思ったら$$),
        (4, $$かと思うと$$),
        (5, $$かと思ったら$$),
        (5, $$かと思うと$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-41 — 〜か〜ないかのうちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-41',
    'grammar',
    'N2',
    $$〜か〜ないかのうちに$$,
    $$ka ~ nai ka no uchi ni$$,
    $$Mal / Assim que / Nem bem$$,
    $$か〜ないかのうちに é usado para dizer que, quase no mesmo instante em que uma ação começa ou termina, outra coisa já acontece. Equivale a "mal...", "assim que..." ou "nem bem...".

A estrutura repete o mesmo verbo duas vezes: primeiro na forma de dicionário (ou た) + か, depois na forma ない + かのうちに. A ideia literal é "no momento em que nem se sabe se aconteceu ou não".

Por exemplo, "mal o sinal tocou, os alunos saíram da sala" ou "nem bem se sentou, ele já dormiu".

O tom é de algo extremamente rápido, quase simultâneo.

A segunda parte é um fato observado, geralmente no passado, e não uma ação planejada.$$,
    $$Essa estrutura é parecida com たとたん, mas destaca ainda mais que as duas ações quase se sobrepõem.

É um pouco literária e aparece muito em narrativas.

A segunda parte não pode ser uma vontade ou um pedido.$$,
    $$Verbo (forma de dicionário / た) + か + Verbo (forma ない) + かのうちに、 + Acontecimento imediato$$,
    $$か〜ないかのうちに$$,
    $$ないかのうちに$$,
    ARRAY['か', 'ない', 'か', 'の', 'うちに']::text[],
    ARRAY['か〜ないかのうちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-41', $$ベルが鳴るか鳴らないかのうちに、学生たちは教室を出た。$$, $$ベルがなるかならないかのうちに、がくせいたちはきょうしつをでた。$$, $$Mal o sinal tocou, os alunos já saíram da sala.$$),
    ('n2-grammar-41', $$彼は座るか座らないかのうちに、寝てしまった。$$, $$かれはすわるかすわらないかのうちに、ねてしまった。$$, $$Nem bem se sentou, ele já caiu no sono.$$),
    ('n2-grammar-41', $$電車が止まるか止まらないかのうちに、彼はドアに向かった。$$, $$でんしゃがとまるかとまらないかのうちに、かれはドアにむかった。$$, $$Mal o trem parou, ele já foi em direção à porta.$$),
    ('n2-grammar-41', $$夜が明けるか明けないかのうちに、出発した。$$, $$よるがあけるかあけないかのうちに、しゅっぱつした。$$, $$Partimos assim que o dia começou a clarear.$$),
    ('n2-grammar-41', $$試合が始まるか始まらないかのうちに、雨が降り出した。$$, $$しあいがはじまるかはじまらないかのうちに、あめがふりだした。$$, $$Mal a partida começou, já começou a chover.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は家に着くか着か____、また出かけた。$$, $$Ela mal chegou em casa e já saiu de novo.$$),
        (2, $$料理を出すか出さ____、子供たちは食べ始めた。$$, $$Mal servi a comida, as crianças já começaram a comer.$$),
        (3, $$疲れていて、横になるかなら____、眠ってしまった。$$, $$Estava tão cansado que, nem bem me deitei, já dormi.$$),
        (4, $$信号が青になるかなら____、車が走り出した。$$, $$Mal o sinal ficou verde, os carros já arrancaram.$$),
        (5, $$先生の話が終わるか終わら____、彼は質問した。$$, $$Mal o professor terminou de falar, ele já fez uma pergunta.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-41', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないかのうちに$$),
        (2, $$ないかのうちに$$),
        (3, $$ないかのうちに$$),
        (4, $$ないかのうちに$$),
        (5, $$ないかのうちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-42 — かえって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-42',
    'grammar',
    'N2',
    $$かえって$$,
    $$kaette$$,
    $$Pelo contrário / Ao invés disso / Até piorou$$,
    $$かえって é um advérbio que indica que o resultado foi o oposto do que se esperava, geralmente pior. Equivale a "pelo contrário", "ao invés disso" ou "até piorou".

A ideia é que uma ação feita para melhorar algo acabou tendo o efeito contrário. Por exemplo, "tomei o remédio e, pelo contrário, piorei" ou "fui de táxi e, ao invés de ganhar tempo, demorei mais".

Ela é muito parecida com 逆に, mas かえって destaca mais a frustração de uma tentativa que deu errado.

Também aparece em frases como "a explicação é tão detalhada que, ao invés de ajudar, fica mais difícil de entender".$$,
    $$かえって não é o verbo かえる (voltar). É um advérbio com sentido de inversão.

A frase かえってご迷惑をおかけしました ("acabei causando mais incômodo") é uma forma educada de pedir desculpas.

Comparado a むしろ, かえって costuma ter tom negativo, de resultado indesejado.$$,
    $$Ação (com intenção de melhorar) + かえって + Resultado oposto

Escrita: かえって / 却って$$,
    $$かえって$$,
    $$かえって|却って$$,
    ARRAY['かえって']::text[],
    ARRAY['かえって', '却って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-42', $$薬を飲んだら、かえって悪くなった。$$, $$くすりをのんだら、かえってわるくなった。$$, $$Tomei o remédio e, pelo contrário, piorei.$$),
    ('n2-grammar-42', $$手伝ったら、かえって邪魔になった。$$, $$てつだったら、かえってじゃまになった。$$, $$Tentei ajudar e, ao invés disso, acabei atrapalhando.$$),
    ('n2-grammar-42', $$渋滞で、タクシーで行ったら、かえって時間がかかった。$$, $$じゅうたいで、タクシーでいったら、かえってじかんがかかった。$$, $$Com o trânsito, fui de táxi e acabei demorando ainda mais.$$),
    ('n2-grammar-42', $$説明が詳しすぎて、かえってわかりにくい。$$, $$せつめいがくわしすぎて、かえってわかりにくい。$$, $$A explicação é tão detalhada que, ao invés de ajudar, fica difícil de entender.$$),
    ('n2-grammar-42', $$安い物を買ったら、すぐ壊れてかえって高くついた。$$, $$やすいものをかったら、すぐこわれてかえってたかくついた。$$, $$Comprei algo barato, quebrou logo e acabou saindo mais caro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$休んだら、____疲れた。$$, $$Descansei e, pelo contrário, fiquei mais cansado.$$),
        (2, $$急いだら、____遅くなった。$$, $$Corri e, ao invés de chegar antes, cheguei mais tarde.$$),
        (3, $$慰めたら、____彼女を泣かせてしまった。$$, $$Tentei consolar e, pelo contrário, fiz ela chorar.$$),
        (4, $$近道をしたら、____道に迷った。$$, $$Peguei um atalho e, ao invés disso, me perdi.$$),
        (5, $$親切にしたつもりが、____迷惑をかけた。$$, $$Achei que estava sendo gentil, mas acabei incomodando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-42', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かえって$$),
        (2, $$かえって$$),
        (3, $$かえって$$),
        (4, $$かえって$$),
        (5, $$かえって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-43 — 〜限り
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-43',
    'grammar',
    'N2',
    $$〜限り$$,
    $$kagiri$$,
    $$Enquanto / Na medida em que / Até onde / A menos que$$,
    $$限り tem vários usos, todos ligados à ideia de "limite".

• Enquanto uma condição durar: "enquanto eu tiver saúde, quero continuar trabalhando".
• Até onde vai o conhecimento ou a percepção: "até onde eu sei, ele não mente".
• O máximo possível: できる限り (o máximo possível), 時間が許す限り (enquanto o tempo permitir).
• Com a forma ない, "a menos que": "a menos que chova, a partida será realizada". Nesse uso, ない限り indica a única condição que mudaria o resultado.

Ele vem depois da forma simples de verbos, de adjetivos い, de adjetivos な com な ou である, e de substantivos com である ou の.$$,
    $$私の知る限り ("até onde eu sei") é uma expressão muito útil para dar informações com cautela.

限り também aparece em 今日限り (só hoje, a partir de hoje não mais) e 一回限り (uma única vez).

Comparado a うちは, 限り soa mais formal e mais firme.$$,
    $$Verbo / Adjetivo (forma simples) + 限り (enquanto)
知っている / 覚えている / 見た + 限り (até onde)
できる + 限り (o máximo possível)
Verbo na forma ない + 限り (a menos que)

Escrita: 限り / かぎり$$,
    $$限り$$,
    $$限り|かぎり$$,
    ARRAY['限り']::text[],
    ARRAY['限り', 'かぎり', 'ない限り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-43', $$体が元気な限り、働き続けたい。$$, $$からだがげんきなかぎり、はたらきつづけたい。$$, $$Enquanto eu tiver saúde, quero continuar trabalhando.$$),
    ('n2-grammar-43', $$私が知っている限り、彼はうそをつかない。$$, $$わたしがしっているかぎり、かれはうそをつかない。$$, $$Até onde eu sei, ele não mente.$$),
    ('n2-grammar-43', $$できる限り早く返事をください。$$, $$できるかぎりはやくへんじをください。$$, $$Responda o mais rápido possível, por favor.$$),
    ('n2-grammar-43', $$雨が降らない限り、試合は行われる。$$, $$あめがふらないかぎり、しあいはおこなわれる。$$, $$A menos que chova, a partida será realizada.$$),
    ('n2-grammar-43', $$努力しない限り、成功はない。$$, $$どりょくしないかぎり、せいこうはない。$$, $$Sem esforço, não há sucesso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$私が覚えている____、彼は一度も遅刻したことがない。$$, $$Até onde eu me lembro, ele nunca se atrasou.$$),
        (2, $$生きている____、夢をあきらめない。$$, $$Enquanto eu viver, não vou desistir do meu sonho.$$),
        (3, $$結果はともかく、できる____のことはした。$$, $$Independentemente do resultado, fiz tudo o que era possível.$$),
        (4, $$彼が謝らない____、許さない。$$, $$A menos que ele peça desculpas, não vou perdoar.$$),
        (5, $$時間が許す____、お手伝いします。$$, $$Enquanto o tempo permitir, vou ajudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-43', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$限り$$),
        (1, $$かぎり$$),
        (2, $$限り$$),
        (2, $$かぎり$$),
        (3, $$限り$$),
        (3, $$かぎり$$),
        (4, $$限り$$),
        (4, $$かぎり$$),
        (5, $$限り$$),
        (5, $$かぎり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-44 — 〜甲斐がある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-44',
    'grammar',
    'N2',
    $$〜甲斐がある$$,
    $$kai ga aru$$,
    $$Valer a pena / Ter valido o esforço$$,
    $$甲斐がある é usado para dizer que um esforço valeu a pena, porque trouxe o resultado esperado. Equivale a "valer a pena" ou "ter valido o esforço".

甲斐 (かい) significa "valor", "resultado do esforço". Assim, a estrutura indica que a ação feita teve um retorno positivo.

Ela vem depois do verbo na forma た e de substantivos com の. Na forma て (甲斐があって), liga-se ao resultado positivo: "estudei muito e valeu a pena: passei na prova".

Na forma negativa, 甲斐がない ou 甲斐もなく significa "não valeu a pena" ou "em vão".

Combinada com verbos, かい também forma palavras como 生きがい (razão de viver) e やりがい (motivação, algo que vale a pena fazer). Nesses casos, a leitura vira がい.$$,
    $$やりがいがある (ser gratificante) é muito usado para falar de trabalhos e atividades.

O kanji 甲斐 é difícil e muitas vezes é escrito em hiragana: かい.

甲斐もなく (N1) aparece em frases como 努力の甲斐もなく ("apesar de todo o esforço, em vão").$$,
    $$Verbo na forma た + 甲斐がある / 甲斐があった
Verbo た + 甲斐があって、 + Resultado positivo
Substantivo + の + 甲斐がある
Negativo: 甲斐がない / 甲斐もなく

Escrita: 甲斐 / かい$$,
    $$甲斐がある$$,
    $$甲斐があ|かいがあ|甲斐もな|かいもな|甲斐がな|かいがな$$,
    ARRAY['甲斐', 'が', 'ある']::text[],
    ARRAY['甲斐がある', '甲斐があった', '甲斐があって', 'かいがある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-44', $$一生懸命勉強した甲斐があって、合格できた。$$, $$いっしょうけんめいべんきょうしたかいがあって、ごうかくできた。$$, $$Estudei muito e valeu a pena: consegui passar.$$),
    ('n2-grammar-44', $$早起きした甲斐があって、きれいな日の出が見られた。$$, $$はやおきしたかいがあって、きれいなひのでがみられた。$$, $$Valeu a pena acordar cedo: vi um nascer do sol lindo.$$),
    ('n2-grammar-44', $$ついに完成した。苦労した甲斐があった。$$, $$ついにかんせいした。くろうしたかいがあった。$$, $$Finalmente ficou pronto. Todo o sofrimento valeu a pena.$$),
    ('n2-grammar-44', $$長い時間待った甲斐がなかった。$$, $$ながいじかんまったかいがなかった。$$, $$Não valeu a pena esperar tanto tempo.$$),
    ('n2-grammar-44', $$毎日練習した甲斐があって、試合に勝った。$$, $$まいにちれんしゅうしたかいがあって、しあいにかった。$$, $$Treinar todo dia valeu a pena: vencemos a partida.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一年間準備した____、イベントは成功した。$$, $$Um ano de preparação valeu a pena: o evento foi um sucesso.$$),
        (2, $$遠くまで来た____た。景色が最高だ。$$, $$Valeu a pena vir até aqui. A paisagem é incrível.$$),
        (3, $$頑張った____、昇進できた。$$, $$Me esforcei e valeu a pena: fui promovido.$$),
        (4, $$毎日ピアノを練習した____、上手になった。$$, $$Praticar piano todo dia valeu a pena: melhorei bastante.$$),
        (5, $$せっかく作ったのに、誰も食べなかった。作った____なかった。$$, $$Fiz com tanto cuidado, mas ninguém comeu. Não valeu a pena ter feito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-44', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$甲斐があって$$),
        (1, $$かいがあって$$),
        (2, $$甲斐があっ$$),
        (2, $$かいがあっ$$),
        (3, $$甲斐があって$$),
        (3, $$かいがあって$$),
        (4, $$甲斐があって$$),
        (4, $$かいがあって$$),
        (5, $$甲斐が$$),
        (5, $$かいが$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-45 — 〜かねない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-45',
    'grammar',
    'N2',
    $$〜かねない$$,
    $$kanenai$$,
    $$Pode acabar / Há o risco de / Não é impossível que$$,
    $$かねない é usado para dizer que existe o risco de algo ruim acontecer. Equivale a "pode acabar...", "há o risco de..." ou "não é impossível que...".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 事故になりかねない (pode acabar virando um acidente) ou 誤解されかねない (há o risco de ser mal interpretado).

O resultado é sempre negativo. A ideia é alertar para um perigo ou uma consequência indesejada, muitas vezes como aviso ou crítica.

Também pode descrever uma pessoa capaz de fazer algo ruim: "ele seria capaz de dizer uma coisa dessas".

Apesar da forma negativa, o sentido é afirmativo: "pode acontecer".$$,
    $$かねない é usado só para possibilidades negativas. Para algo positivo, usa-se かもしれない.

É muito comum em avisos, notícias e alertas de segurança.

Não confunda com かねる (N2), que significa "não poder fazer" de forma educada.$$,
    $$Verbo na forma ます sem ます + かねない
Verbo sem ます + かねません (educado)

Escrita: かねない / 兼ねない$$,
    $$かねない$$,
    $$かねない|かねません|兼ねない$$,
    ARRAY['かねない']::text[],
    ARRAY['かねない', 'かねません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-45', $$このままでは、大きな事故になりかねない。$$, $$このままでは、おおきなじこになりかねない。$$, $$Se continuar assim, pode acabar virando um grande acidente.$$),
    ('n2-grammar-45', $$そんなことを言ったら、誤解されかねない。$$, $$そんなことをいったら、ごかいされかねない。$$, $$Se disser uma coisa dessas, há o risco de ser mal interpretado.$$),
    ('n2-grammar-45', $$無理をすると、病気になりかねない。$$, $$むりをすると、びょうきになりかねない。$$, $$Se exagerar, pode acabar ficando doente.$$),
    ('n2-grammar-45', $$彼なら、そんなひどいことも言いかねない。$$, $$かれなら、そんなひどいこともいいかねない。$$, $$Ele seria capaz de dizer até uma coisa tão cruel dessas.$$),
    ('n2-grammar-45', $$スピードを出しすぎると、事故を起こしかねません。$$, $$スピードをだしすぎると、じこをおこしかねません。$$, $$Correr demais pode acabar causando um acidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝不足が続くと、体を壊し____。$$, $$Se continuar dormindo pouco, pode acabar prejudicando a saúde.$$),
        (2, $$このままでは、会社が倒産し____。$$, $$Se continuar assim, a empresa pode acabar falindo.$$),
        (3, $$不注意な一言が、人を傷つけ____。$$, $$Uma palavra descuidada pode acabar magoando alguém.$$),
        (4, $$彼はうそもつき____人だ。$$, $$Ele é uma pessoa capaz de mentir.$$),
        (5, $$確認しないと、大きなミスにつながり____。$$, $$Se não conferir, pode acabar levando a um grande erro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かねない$$),
        (1, $$かねません$$),
        (2, $$かねない$$),
        (2, $$かねません$$),
        (3, $$かねない$$),
        (3, $$かねません$$),
        (4, $$かねない$$),
        (5, $$かねない$$),
        (5, $$かねません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-46 — 〜かねる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-46',
    'grammar',
    'N2',
    $$〜かねる$$,
    $$kaneru$$,
    $$Não poder / Ser difícil de / Não estar em condições de$$,
    $$かねる é usado para dizer, de forma educada e indireta, que não é possível fazer algo. Equivale a "não poder", "ser difícil de" ou "não estar em condições de".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, お答えしかねます (não posso responder), 応じかねます (não podemos atender).

O ponto principal é a educação. Em vez de dizer diretamente できません, que pode soar frio, かねます mostra que a pessoa gostaria de fazer, mas, por regras ou circunstâncias, não pode.

Por isso, é muito usado no atendimento ao cliente, em empresas e em e-mails formais.

Apesar da forma afirmativa, o sentido é negativo: "não posso".$$,
    $$Não confunda かねる (não posso, educado) com かねない (pode acabar acontecendo algo ruim).

A forma わかりかねます ("não sei informar") é muito usada por atendentes.

Em contextos formais, かねる soa muito mais suave do que できない.$$,
    $$Verbo na forma ます sem ます + かねる
Verbo sem ます + かねます (educado, mais comum)
お / ご + Verbo + しかねます (muito educado)

Escrita: かねる / 兼ねる$$,
    $$かねる$$,
    $$かねる|かねます|兼ねる|兼ねます$$,
    ARRAY['かねる']::text[],
    ARRAY['かねる', 'かねます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-46', $$申し訳ありませんが、その質問にはお答えしかねます。$$, $$もうしわけありませんが、そのしつもんにはおこたえしかねます。$$, $$Desculpe, mas não posso responder a essa pergunta.$$),
    ('n2-grammar-46', $$申し訳ありませんが、ご要望には応じかねます。$$, $$もうしわけありませんが、ごようぼうにはおうじかねます。$$, $$Lamentamos, mas não podemos atender a esse pedido.$$),
    ('n2-grammar-46', $$彼の意見には賛成しかねる。$$, $$かれのいけんにはさんせいしかねる。$$, $$Não posso concordar com a opinião dele.$$),
    ('n2-grammar-46', $$個人情報はお教えしかねます。$$, $$こじんじょうほうはおおしえしかねます。$$, $$Não podemos fornecer informações pessoais.$$),
    ('n2-grammar-46', $$この件については、私には判断しかねます。$$, $$このけんについては、わたしにははんだんしかねます。$$, $$Sobre este assunto, não estou em condições de decidir.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$恐れ入りますが、セール品の返品はお受けし____。$$, $$Lamentamos, mas não aceitamos devolução de itens em promoção.$$),
        (2, $$その条件では、契約し____。$$, $$Com essas condições, não podemos fechar o contrato.$$),
        (3, $$彼の行動は理解し____。$$, $$O comportamento dele é difícil de entender.$$),
        (4, $$申し訳ございませんが、そのご質問にはお答えし____。$$, $$Pedimos desculpas, mas não podemos responder a essa pergunta.$$),
        (5, $$私一人では決め____ので、上司に相談します。$$, $$Não posso decidir sozinho, então vou consultar meu chefe.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-46', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かねます$$),
        (2, $$かねます$$),
        (3, $$かねる$$),
        (3, $$かねます$$),
        (4, $$かねます$$),
        (5, $$かねます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-47 — 〜から言うと
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-47',
    'grammar',
    'N2',
    $$〜から言うと$$,
    $$kara iu to$$,
    $$Do ponto de vista de / Considerando / Em termos de$$,
    $$から言うと é usado para indicar a perspectiva, o critério ou o ponto de vista a partir do qual se faz um julgamento. Equivale a "do ponto de vista de", "considerando" ou "em termos de".

A primeira parte mostra o critério (a experiência, o preço, a posição de alguém, a capacidade), e a segunda apresenta a opinião ou conclusão baseada nesse critério.

Por exemplo, "pela minha experiência, este método é o melhor" ou "em termos de preço, este é mais vantajoso".

A expressão 結論から言うと significa "indo direto à conclusão" e é muito usada em apresentações e e-mails.

As formas から言えば e から言って têm o mesmo sentido.$$,
    $$Comparado a から見ると, から言うと destaca mais o critério usado para julgar, enquanto から見ると destaca o ponto de vista de alguém.

結論から言うと é uma forma muito comum de ir direto ao ponto em reuniões.

Na escrita, também aparece em hiragana: からいうと.$$,
    $$Substantivo (critério / ponto de vista) + から言うと / から言えば / から言って、 + Julgamento

Expressões comuns: 経験から言うと / 結論から言うと / 立場から言うと$$,
    $$から言うと$$,
    $$から言うと|からいうと|から言えば|からいえば|から言って|からいって$$,
    ARRAY['から', '言うと']::text[],
    ARRAY['から言うと', 'から言えば', 'から言って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-47', $$私の経験から言うと、この方法が一番いい。$$, $$わたしのけいけんからいうと、このほうほうがいちばんいい。$$, $$Pela minha experiência, este método é o melhor.$$),
    ('n2-grammar-47', $$値段から言えば、こちらのほうがお得だ。$$, $$ねだんからいえば、こちらのほうがおとくだ。$$, $$Em termos de preço, este é mais vantajoso.$$),
    ('n2-grammar-47', $$私の立場から言うと、賛成はできない。$$, $$わたしのたちばからいうと、さんせいはできない。$$, $$Da minha posição, não posso concordar.$$),
    ('n2-grammar-47', $$結論から言うと、計画は中止です。$$, $$けつろんからいうと、けいかくはちゅうしです。$$, $$Indo direto à conclusão, o plano está cancelado.$$),
    ('n2-grammar-47', $$実力から言って、彼が優勝するだろう。$$, $$じつりょくからいって、かれがゆうしょうするだろう。$$, $$Considerando a habilidade, ele deve ser o campeão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$結論____、この案に賛成です。$$, $$Indo direto à conclusão, sou a favor desta proposta.$$),
        (2, $$品質____、この商品が一番だ。$$, $$Em termos de qualidade, este produto é o melhor.$$),
        (3, $$教師の立場____、もっと勉強してほしい。$$, $$Do ponto de vista de professor, gostaria que estudassem mais.$$),
        (4, $$私の経験____、それは無理だ。$$, $$Pela minha experiência, isso é impossível.$$),
        (5, $$距離____、電車のほうが早い。$$, $$Considerando a distância, o trem é mais rápido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-47', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から言うと$$),
        (1, $$から言えば$$),
        (2, $$から言うと$$),
        (2, $$から言えば$$),
        (3, $$から言うと$$),
        (3, $$から言えば$$),
        (4, $$から言うと$$),
        (4, $$から言えば$$),
        (5, $$から言うと$$),
        (5, $$から言えば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-48 — 〜からこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-48',
    'grammar',
    'N2',
    $$〜からこそ$$,
    $$kara koso$$,
    $$Justamente porque / É exatamente por isso que$$,
    $$からこそ é usado para enfatizar que um motivo específico é o verdadeiro ou o mais importante. Equivale a "justamente porque" ou "é exatamente por isso que".

Ele junta から (porque) com こそ (ênfase). A ideia é destacar o motivo, muitas vezes de forma surpreendente ou contrária ao senso comum.

Por exemplo, "falo com rigor justamente porque gosto de você" ou "é justamente por ter falhado que se pode aprender".

Muitas vezes, o motivo pareceria negativo à primeira vista, mas, na verdade, é a razão de algo positivo. Por exemplo, "é justamente por estar ocupado que o descanso é importante".

A frase costuma terminar com のだ ou です, reforçando a explicação.$$,
    $$からこそ não é usado com motivos negativos para resultados negativos simples. Ele destaca um motivo especial, muitas vezes com valor positivo.

Em discursos e cartas, からこそ é usado para expressar convicção e gratidão.

Comparado a ばこそ (N1), からこそ é mais comum na conversa.$$,
    $$Verbo / Adjetivo (forma simples) + からこそ、 + Resultado / Opinião
Substantivo / Adjetivo な + だ + からこそ
… + からこそ + 〜のだ / 〜んです$$,
    $$からこそ$$,
    $$からこそ$$,
    ARRAY['から', 'こそ']::text[],
    ARRAY['からこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-48', $$あなたのことが好きだからこそ、厳しく言うのです。$$, $$あなたのことがすきだからこそ、きびしくいうのです。$$, $$Falo com rigor justamente porque gosto de você.$$),
    ('n2-grammar-48', $$失敗したからこそ、学べることもある。$$, $$しっぱいしたからこそ、まなべることもある。$$, $$É justamente por ter falhado que há coisas que se pode aprender.$$),
    ('n2-grammar-48', $$毎日努力したからこそ、成功できた。$$, $$まいにちどりょくしたからこそ、せいこうできた。$$, $$Foi justamente por ter me esforçado todo dia que consegui ter sucesso.$$),
    ('n2-grammar-48', $$忙しいからこそ、休みが大切だ。$$, $$いそがしいからこそ、やすみがたいせつだ。$$, $$É justamente por estar ocupado que o descanso é importante.$$),
    ('n2-grammar-48', $$家族がいるからこそ、頑張れる。$$, $$かぞくがいるからこそ、がんばれる。$$, $$É justamente por ter a família que consigo me esforçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達だ____、本当のことを言う。$$, $$Justamente por sermos amigos, digo a verdade.$$),
        (2, $$苦労した____、今の幸せがある。$$, $$É justamente por ter passado dificuldades que tenho a felicidade de hoje.$$),
        (3, $$この仕事は難しい____、やりがいがある。$$, $$É justamente por ser difícil que este trabalho é gratificante.$$),
        (4, $$好きだ____、毎日続けられる。$$, $$É justamente por gostar que consigo continuar todos os dias.$$),
        (5, $$大切な人だ____、守りたい。$$, $$Justamente por ser uma pessoa importante, quero protegê-la.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-48', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からこそ$$),
        (2, $$からこそ$$),
        (3, $$からこそ$$),
        (4, $$からこそ$$),
        (5, $$からこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-49 — 〜から見ると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-49',
    'grammar',
    'N2',
    $$〜から見ると$$,
    $$kara miru to$$,
    $$Do ponto de vista de / Visto por / Para$$,
    $$から見ると é usado para indicar o ponto de vista de alguém ou de um grupo, mostrando como algo parece a partir dessa perspectiva. Equivale a "do ponto de vista de", "visto por" ou "para".

A primeira parte indica quem está olhando (crianças, estrangeiros, pais, especialistas), e a segunda mostra a impressão ou o julgamento a partir desse olhar.

Por exemplo, "do ponto de vista das crianças, os adultos parecem saber tudo" ou "para os estrangeiros, os costumes japoneses são curiosos".

As formas から見れば, から見て e から見ても também são usadas. から見ても significa "mesmo do ponto de vista de", reforçando a avaliação.

Também pode indicar um ponto de vista físico: "vista de fora, esta casa parece muito velha".$$,
    $$Comparado a から言うと, から見ると foca mais na percepção de alguém, e から言うと, no critério usado para julgar.

É muito útil para falar de diferenças culturais.

Para a própria opinião, 私から見て ("do meu ponto de vista") soa natural e modesto.$$,
    $$Substantivo (pessoa / grupo) + から見ると / から見れば / から見て、 + Impressão / Julgamento
Substantivo + から見ても + … (mesmo do ponto de vista de)

Escrita: から見ると / からみると$$,
    $$から見ると$$,
    $$から見ると|からみると|から見れば|からみれば|から見て|から見ても$$,
    ARRAY['から', '見ると']::text[],
    ARRAY['から見ると', 'から見れば', 'から見て', 'から見ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-49', $$子供から見ると、大人は何でも知っているようだ。$$, $$こどもからみると、おとなはなんでもしっているようだ。$$, $$Do ponto de vista das crianças, os adultos parecem saber tudo.$$),
    ('n2-grammar-49', $$外国人から見ると、日本の習慣は不思議だ。$$, $$がいこくじんからみると、にほんのしゅうかんはふしぎだ。$$, $$Para os estrangeiros, os costumes japoneses são curiosos.$$),
    ('n2-grammar-49', $$親から見れば、子供はいつまでも子供だ。$$, $$おやからみれば、こどもはいつまでもこどもだ。$$, $$Para os pais, os filhos são sempre crianças.$$),
    ('n2-grammar-49', $$私から見て、彼は努力家だ。$$, $$わたしからみて、かれはどりょくかだ。$$, $$Do meu ponto de vista, ele é muito esforçado.$$),
    ('n2-grammar-49', $$専門家から見ても、この絵は素晴らしい。$$, $$せんもんかからみても、このえはすばらしい。$$, $$Mesmo do ponto de vista de um especialista, este quadro é maravilhoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$若者____、昔の音楽は新鮮だ。$$, $$Para os jovens, a música antiga é uma novidade.$$),
        (2, $$先生____、彼はいい学生だ。$$, $$Do ponto de vista do professor, ele é um bom aluno.$$),
        (3, $$外____、この家はとても古く見える。$$, $$Vista de fora, esta casa parece muito velha.$$),
        (4, $$日本人____、ブラジルの十二月の夏は不思議だろう。$$, $$Para os japoneses, o verão de dezembro no Brasil deve ser estranho.$$),
        (5, $$客の立場____、この店のサービスは悪い。$$, $$Do ponto de vista do cliente, o atendimento desta loja é ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から見ると$$),
        (1, $$から見れば$$),
        (2, $$から見ると$$),
        (2, $$から見れば$$),
        (3, $$から見ると$$),
        (3, $$から見れば$$),
        (4, $$から見ると$$),
        (4, $$から見れば$$),
        (5, $$から見ると$$),
        (5, $$から見れば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-50 — 〜からには
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-50',
    'grammar',
    'N2',
    $$〜からには$$,
    $$kara ni wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$からには é usado para dizer que, como uma situação ou decisão é assim, existe uma obrigação, uma vontade ou uma determinação natural. Equivale a "já que", "uma vez que" ou "visto que".

A primeira parte apresenta um fato ou uma decisão (vir ao Japão, prometer, participar, ser escolhido). A segunda mostra o que, por isso, deve ou se quer fazer, com expressões como たい, なければならない, べきだ, つもりだ ou uma determinação forte.

Por exemplo, "já que vim ao Japão, quero estudar japonês" ou "uma vez que prometi, tenho que cumprir".

O sentido é praticamente igual ao de 以上は e 上は. からには é o mais comum na conversa.$$,
    $$A segunda parte quase sempre expressa determinação, dever ou forte vontade.

やるからには ("já que vou fazer") é uma expressão muito usada para mostrar comprometimento.

以上は soa um pouco mais formal; 上は é o mais formal dos três.$$,
    $$Verbo (forma simples) + からには、 + Obrigação / Vontade / Determinação
Substantivo + である + からには$$,
    $$からには$$,
    $$からには$$,
    ARRAY['から', 'には']::text[],
    ARRAY['からには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-50', $$日本に来たからには、日本語を勉強したい。$$, $$にほんにきたからには、にほんごをべんきょうしたい。$$, $$Já que vim ao Japão, quero estudar japonês.$$),
    ('n2-grammar-50', $$約束したからには、守らなければならない。$$, $$やくそくしたからには、まもらなければならない。$$, $$Uma vez que prometi, tenho que cumprir.$$),
    ('n2-grammar-50', $$試合に出るからには、勝ちたい。$$, $$しあいにでるからには、かちたい。$$, $$Já que vou participar da partida, quero vencer.$$),
    ('n2-grammar-50', $$やると決めたからには、最後までやる。$$, $$やるときめたからには、さいごまでやる。$$, $$Uma vez que decidi fazer, vou até o fim.$$),
    ('n2-grammar-50', $$社長になったからには、会社を成長させたい。$$, $$しゃちょうになったからには、かいしゃをせいちょうさせたい。$$, $$Já que me tornei presidente, quero fazer a empresa crescer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学する____、その国の文化も学びたい。$$, $$Já que vou fazer intercâmbio, quero aprender também a cultura do país.$$),
        (2, $$仕事を引き受けた____、責任を持つべきだ。$$, $$Uma vez que aceitou o trabalho, deve assumir a responsabilidade.$$),
        (3, $$高いお金を払った____、楽しまないと。$$, $$Já que paguei caro, tenho que aproveitar.$$),
        (4, $$代表に選ばれた____、全力を尽くします。$$, $$Já que fui escolhido como representante, vou dar o meu melhor.$$),
        (5, $$始めた____、途中でやめない。$$, $$Uma vez que comecei, não vou parar no meio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-50', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からには$$),
        (2, $$からには$$),
        (3, $$からには$$),
        (4, $$からには$$),
        (5, $$からには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-51 — 〜からして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-51',
    'grammar',
    'N2',
    $$〜からして$$,
    $$kara shite$$,
    $$A começar por / Já pelo / Só de ver$$,
    $$からして tem dois usos principais.

O primeiro é dar um exemplo inicial, geralmente o mais básico ou óbvio, para mostrar que algo é assim. Equivale a "a começar por" ou "até mesmo". Por exemplo, "o próprio presidente se atrasa, então é natural que os funcionários também se atrasem". O tom costuma ser de crítica.

O segundo é indicar uma base para julgar algo, com o sentido de "já pelo..." ou "só de ver...". A pessoa observa um detalhe, como a aparência, o nome ou o jeito de falar, e chega a uma conclusão. Por exemplo, "só pela fachada, já parece cara".

Ele vem diretamente depois de substantivos.$$,
    $$No primeiro uso, からして costuma apontar alguém que deveria dar o exemplo, como um chefe ou professor.

No segundo uso, é parecido com からすると, mas からして destaca um detalhe inicial ou superficial.

É uma expressão comum em conversas e textos de opinião.$$,
    $$Substantivo (exemplo inicial) + からして + Frase (crítica / avaliação)
Substantivo (detalhe observado) + からして、 + Julgamento$$,
    $$からして$$,
    $$からして$$,
    ARRAY['から', 'して']::text[],
    ARRAY['からして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-51', $$この店は、外観からして高そうだ。$$, $$このみせは、がいかんからしてたかそうだ。$$, $$Só pela fachada, esta loja já parece cara.$$),
    ('n2-grammar-51', $$彼は話し方からして、真面目な人だとわかる。$$, $$かれははなしかたからして、まじめなひとだとわかる。$$, $$Já pelo jeito de falar, dá para ver que ele é uma pessoa séria.$$),
    ('n2-grammar-51', $$この映画は、タイトルからしておもしろそうだ。$$, $$このえいがは、タイトルからしておもしろそうだ。$$, $$Só pelo título, este filme já parece interessante.$$),
    ('n2-grammar-51', $$社長からして遅刻するのだから、社員が遅れるのも当然だ。$$, $$しゃちょうからしてちこくするのだから、しゃいんがおくれるのもとうぜんだ。$$, $$A começar pelo presidente, que se atrasa, é natural que os funcionários também se atrasem.$$),
    ('n2-grammar-51', $$あの態度からして、彼は反省していない。$$, $$あのたいどからして、かれははんせいしていない。$$, $$Só por aquela atitude, dá para ver que ele não está arrependido.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この料理は、におい____おいしそうだ。$$, $$Esta comida, só pelo cheiro, já parece gostosa.$$),
        (2, $$彼の服装____、お金持ちのようだ。$$, $$Só pelas roupas, ele parece ser rico.$$),
        (3, $$先生____ルールを守らないのだから、学生が守るはずがない。$$, $$A começar pelo professor, que não segue as regras, é óbvio que os alunos também não vão seguir.$$),
        (4, $$その顔____、何かあったようだね。$$, $$Só pela sua cara, parece que aconteceu alguma coisa, hein.$$),
        (5, $$名前____、強そうな犬だ。$$, $$Só pelo nome, parece ser um cachorro forte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-51', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からして$$),
        (2, $$からして$$),
        (3, $$からして$$),
        (4, $$からして$$),
        (5, $$からして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-52 — 〜からすると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-52',
    'grammar',
    'N2',
    $$〜からすると$$,
    $$kara suru to$$,
    $$A julgar por / Do ponto de vista de / Para$$,
    $$からすると tem dois usos principais.

O primeiro é fazer uma suposição a partir de algo observado. Equivale a "a julgar por". A pessoa observa uma pista, como a expressão de alguém, o céu ou pegadas, e chega a uma conclusão provável. A frase costuma terminar com ようだ, らしい, だろう ou そうだ.

O segundo é indicar o ponto de vista de alguém ou de um grupo. Equivale a "do ponto de vista de" ou "para". Por exemplo, "do ponto de vista dos pais, a segurança dos filhos é o mais importante".

A forma からすれば tem o mesmo sentido.$$,
    $$No uso de suposição, からすると é parecido com からして e から見ると.

No uso de ponto de vista, からすれば é um pouco mais comum.

É uma expressão muito usada em deduções e em discussões sobre diferentes pontos de vista.$$,
    $$Substantivo (pista observada) + からすると、 + Suposição + ようだ / らしい / だろう
Substantivo (pessoa / grupo / posição) + からすると / からすれば、 + Opinião$$,
    $$からすると$$,
    $$からすると|からすれば$$,
    ARRAY['から', 'すると']::text[],
    ARRAY['からすると', 'からすれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-52', $$彼の表情からすると、試験はうまくいったようだ。$$, $$かれのひょうじょうからすると、しけんはうまくいったようだ。$$, $$A julgar pela expressão dele, parece que a prova foi bem.$$),
    ('n2-grammar-52', $$親の立場からすると、子供の安全が一番だ。$$, $$おやのたちばからすると、こどものあんぜんがいちばんだ。$$, $$Do ponto de vista dos pais, a segurança dos filhos é o mais importante.$$),
    ('n2-grammar-52', $$この空からすると、午後は雨になりそうだ。$$, $$このそらからすると、ごごはあめになりそうだ。$$, $$A julgar por este céu, parece que vai chover à tarde.$$),
    ('n2-grammar-52', $$日本人からすれば、当たり前のことかもしれない。$$, $$にほんじんからすれば、あたりまえのことかもしれない。$$, $$Para os japoneses, talvez seja algo óbvio.$$),
    ('n2-grammar-52', $$彼の話し方からすると、関西の人だろう。$$, $$かれのはなしかたからすると、かんさいのひとだろう。$$, $$A julgar pelo jeito de falar, ele deve ser da região de Kansai.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女の様子____、何か心配事があるようだ。$$, $$A julgar pelo jeito dela, parece que há alguma preocupação.$$),
        (2, $$子供の立場____、親の言うことは厳しすぎる。$$, $$Do ponto de vista das crianças, o que os pais dizem é rígido demais.$$),
        (3, $$足跡____、犯人は男性だろう。$$, $$A julgar pelas pegadas, o culpado deve ser um homem.$$),
        (4, $$専門家____、この計画は無理がある。$$, $$Do ponto de vista dos especialistas, este plano é inviável.$$),
        (5, $$彼の顔色____、体調が悪いみたいだ。$$, $$A julgar pela cor do rosto dele, parece que não está bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-52', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からすると$$),
        (1, $$からすれば$$),
        (2, $$からすると$$),
        (2, $$からすれば$$),
        (3, $$からすると$$),
        (3, $$からすれば$$),
        (4, $$からすると$$),
        (4, $$からすれば$$),
        (5, $$からすると$$),
        (5, $$からすれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-53 — 〜からと言って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-53',
    'grammar',
    'N2',
    $$〜からと言って$$,
    $$kara to itte$$,
    $$Só porque / Não é porque... que$$,
    $$からと言って é usado para dizer que um motivo não justifica necessariamente uma conclusão. Equivale a "só porque..." ou "não é porque... que...".

A primeira parte apresenta um fato que poderia levar a uma conclusão, e a segunda nega essa conclusão. Por isso, a segunda parte costuma terminar com expressões negativas ou de correção, como とは限らない, わけではない, てはいけない ou必要はない.

Por exemplo, "só porque é caro, não significa que seja bom" ou "não é porque falhou que deve desistir".

Na fala casual, からと言って costuma virar からって.$$,
    $$からと言って é uma ótima forma de corrigir generalizações e preconceitos.

A segunda parte quase nunca é afirmativa simples. Ela corrige ou nega a conclusão esperada.

Em conselhos, からと言って aparece para dizer que algo não é desculpa: 忙しいからと言って、連絡しないのはよくない.$$,
    $$Frase (forma simples) + からと言って、 + Negação
… + とは限らない / わけではない / てはいけない / 必要はない

Fala: からって
Escrita: からと言って / からといって$$,
    $$からと言って$$,
    $$からと言って|からといって|からって$$,
    ARRAY['から', 'と', '言って']::text[],
    ARRAY['からと言って', 'からといって', 'からって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-53', $$高いからと言って、いい物とは限らない。$$, $$たかいからといって、いいものとはかぎらない。$$, $$Só porque é caro, não significa que seja bom.$$),
    ('n2-grammar-53', $$日本人だからと言って、みんな敬語が上手なわけではない。$$, $$にほんじんだからといって、みんなけいごがじょうずなわけではない。$$, $$Não é porque é japonês que todos são bons em linguagem honorífica.$$),
    ('n2-grammar-53', $$一度失敗したからと言って、あきらめてはいけない。$$, $$いちどしっぱいしたからといって、あきらめてはいけない。$$, $$Não é porque falhou uma vez que deve desistir.$$),
    ('n2-grammar-53', $$忙しいからと言って、連絡しないのはよくない。$$, $$いそがしいからといって、れんらくしないのはよくない。$$, $$Estar ocupado não justifica não dar notícias.$$),
    ('n2-grammar-53', $$嫌いだからって、食べないのはだめだよ。$$, $$きらいだからって、たべないのはだめだよ。$$, $$Só porque não gosta, não pode deixar de comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お金がある____、幸せとは限らない。$$, $$Só porque tem dinheiro, não significa que seja feliz.$$),
        (2, $$若い____、無理をしてはいけない。$$, $$Não é porque é jovem que pode exagerar.$$),
        (3, $$一度失敗した____、才能がないわけではない。$$, $$Só porque falhou uma vez, não significa que não tenha talento.$$),
        (4, $$安い____、たくさん買う必要はない。$$, $$Só porque é barato, não precisa comprar muito.$$),
        (5, $$先生だ____、何でも知っているわけではない。$$, $$Não é porque é professor que sabe de tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$からと言って$$),
        (1, $$からといって$$),
        (2, $$からと言って$$),
        (2, $$からといって$$),
        (3, $$からと言って$$),
        (3, $$からといって$$),
        (4, $$からと言って$$),
        (4, $$からといって$$),
        (5, $$からと言って$$),
        (5, $$からといって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-54 — 〜っこない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-54',
    'grammar',
    'N2',
    $$〜っこない$$,
    $$kkonai$$,
    $$Não tem como / Jamais / De jeito nenhum$$,
    $$っこない é uma expressão casual que nega uma possibilidade com muita força. Equivale a "não tem como", "jamais" ou "de jeito nenhum".

Ele vem depois do verbo na forma ます sem ます, geralmente com verbos potenciais ou verbos de resultado, como わかる, 勝てる, 終わる e 間に合う.

Por exemplo, "uma questão tão difícil, não tem como entender" ou "de jeito nenhum dá para ganhar dele".

O sentido é parecido com わけがない e はずがない, mas っこない é bem mais coloquial e emocional. Por isso, é usado com amigos e família, e não em situações formais.$$,
    $$っこない é muito comum entre jovens e em conversas informais.

Em situações formais, use わけがない ou はずがない.

Às vezes, っこない expressa desânimo ou falta de confiança, como em できっこない ("não vou conseguir de jeito nenhum").$$,
    $$Verbo na forma ます sem ます + っこない
Verbo potencial sem ます + っこない (できっこない / 勝てっこない)$$,
    $$っこない$$,
    $$っこない|っこありません$$,
    ARRAY['っこない']::text[],
    ARRAY['っこない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-54', $$こんな難しい問題、わかりっこない。$$, $$こんなむずかしいもんだい、わかりっこない。$$, $$Uma questão tão difícil assim, não tem como entender.$$),
    ('n2-grammar-54', $$一日でこの仕事が終わりっこない。$$, $$いちにちでこのしごとがおわりっこない。$$, $$Não tem como este trabalho terminar em um dia.$$),
    ('n2-grammar-54', $$あんなに強い人に勝てっこないよ。$$, $$あんなにつよいひとにかてっこないよ。$$, $$De jeito nenhum dá para ganhar de alguém tão forte.$$),
    ('n2-grammar-54', $$そんな話、誰も信じっこない。$$, $$そんなはなし、だれもしんじっこない。$$, $$Uma história dessas, ninguém vai acreditar jamais.$$),
    ('n2-grammar-54', $$今から走っても、間に合いっこない。$$, $$いまからはしっても、まにあいっこない。$$, $$Mesmo correndo agora, não tem como chegar a tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人でこんなに食べられ____。$$, $$Não tem como comer tudo isso sozinho.$$),
        (2, $$あんなに怒っていたから、彼女が許してくれ____。$$, $$Ela estava tão brava que jamais vai me perdoar.$$),
        (3, $$そんな高い車、買え____。$$, $$Um carro tão caro assim, não tem como comprar.$$),
        (4, $$今から勉強しても、合格でき____。$$, $$Mesmo estudando a partir de agora, não tem como passar.$$),
        (5, $$こんな難しい話、子供にわかり____。$$, $$Uma conversa tão difícil, criança nenhuma entende.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-54', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$っこない$$),
        (2, $$っこない$$),
        (3, $$っこない$$),
        (4, $$っこない$$),
        (5, $$っこない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-55 — 〜ことだ（忠告）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-55',
    'grammar',
    'N2',
    $$〜ことだ（忠告）$$,
    $$koto da (chuukoku)$$,
    $$O melhor é / O certo é / O importante é$$,
    $$Nesse uso, ことだ é usado para dar um conselho ou uma recomendação forte, dizendo qual é a melhor coisa a fazer em uma situação. Equivale a "o melhor é", "o certo é" ou "o importante é".

Ele vem depois do verbo na forma de dicionário ou na forma ない. Muitas vezes, a primeira parte apresenta um objetivo com たいなら, たければ ou ば: "se quer melhorar o japonês, o melhor é falar todo dia".

O tom é de quem tem experiência ou autoridade para aconselhar, como um professor, um pai ou um superior. Por isso, não é usado para aconselhar pessoas mais velhas ou de posição superior.

Na forma educada, usa-se ことです.$$,
    $$ことだ é diferente de ほうがいい: ことだ soa mais firme e assertivo, como uma recomendação decisiva.

Com superiores, ことだ pode soar arrogante. Prefira ほうがいいと思います.

Não confunda com outros usos de ことだ, como "é algo que..." em frases explicativas.$$,
    $$(〜たいなら / 〜たければ、) + Verbo na forma de dicionário + ことだ
Verbo na forma ない + ことだ (o melhor é não...)

Educado: ことです$$,
    $$ことだ$$,
    $$ことだ|ことです$$,
    ARRAY['こと', 'だ']::text[],
    ARRAY['ことだ', 'ことです', 'ないことだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-55', $$日本語が上手になりたいなら、毎日話すことだ。$$, $$にほんごがじょうずになりたいなら、まいにちはなすことだ。$$, $$Se quer melhorar o japonês, o melhor é falar todo dia.$$),
    ('n2-grammar-55', $$健康になりたければ、よく寝ることです。$$, $$けんこうになりたければ、よくねることです。$$, $$Se quer ficar saudável, o importante é dormir bem.$$),
    ('n2-grammar-55', $$風邪を早く治したいなら、無理をしないことだ。$$, $$かぜをはやくなおしたいなら、むりをしないことだ。$$, $$Se quer se curar logo do resfriado, o melhor é não exagerar.$$),
    ('n2-grammar-55', $$わからないことがあれば、先生に聞くことだ。$$, $$わからないことがあれば、せんせいにきくことだ。$$, $$Se tiver alguma dúvida, o certo é perguntar ao professor.$$),
    ('n2-grammar-55', $$合格したければ、もっと勉強することだ。$$, $$ごうかくしたければ、もっとべんきょうすることだ。$$, $$Se quer passar, o melhor é estudar mais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$痩せたいなら、甘い物を食べない____。$$, $$Se quer emagrecer, o melhor é não comer doces.$$),
        (2, $$試験に受かりたければ、過去問を解く____。$$, $$Se quer passar na prova, o melhor é resolver provas anteriores.$$),
        (3, $$友達を作りたいなら、自分から話しかける____。$$, $$Se quer fazer amigos, o melhor é puxar conversa você mesmo.$$),
        (4, $$疲れているなら、ゆっくり休む____。$$, $$Se está cansado, o melhor é descansar bem.$$),
        (5, $$成功したければ、あきらめない____。$$, $$Se quer ter sucesso, o importante é não desistir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-55', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことだ$$),
        (1, $$ことです$$),
        (2, $$ことだ$$),
        (2, $$ことです$$),
        (3, $$ことだ$$),
        (3, $$ことです$$),
        (4, $$ことだ$$),
        (4, $$ことです$$),
        (5, $$ことだ$$),
        (5, $$ことです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-56 — 〜ことだから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-56',
    'grammar',
    'N2',
    $$〜ことだから$$,
    $$koto dakara$$,
    $$Como se trata de / Conhecendo / Sendo quem é$$,
    $$ことだから é usado para fazer uma suposição baseada no que se conhece sobre uma pessoa, geralmente sobre o caráter ou os hábitos dela. Equivale a "como se trata de...", "conhecendo..." ou "sendo quem é...".

A estrutura é Pessoa + の + ことだから. Muitas vezes, antes da pessoa vem uma descrição, como 真面目な彼 (ele, que é sério) ou いつも遅刻する彼 (ele, que sempre se atrasa).

A segunda parte é uma suposição, geralmente com だろう, に違いない, はずだ ou きっと.

Por exemplo, "conhecendo ele, que é tão sério, com certeza vai cumprir a promessa" ou "como se trata de uma criança, logo vai esquecer".

A suposição pode ser positiva ou negativa, dependendo do que se sabe da pessoa.$$,
    $$ことだから quase sempre é usado com pessoas, e não com objetos.

A estrutura mostra que quem fala conhece bem a pessoa e confia nesse conhecimento para prever o comportamento dela.

É comum em conversas entre amigos e família.$$,
    $$(Descrição +) Pessoa + の + ことだから、 + Suposição + だろう / に違いない / はずだ$$,
    $$ことだから$$,
    $$ことだから$$,
    ARRAY['こと', 'だから']::text[],
    ARRAY['ことだから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-56', $$真面目な彼のことだから、きっと約束を守るだろう。$$, $$まじめなかれのことだから、きっとやくそくをまもるだろう。$$, $$Conhecendo ele, que é tão sério, com certeza vai cumprir a promessa.$$),
    ('n2-grammar-56', $$子供のことだから、すぐ忘れるだろう。$$, $$こどものことだから、すぐわすれるだろう。$$, $$Como se trata de uma criança, logo vai esquecer.$$),
    ('n2-grammar-56', $$いつも遅刻する彼のことだから、今日も遅れるだろう。$$, $$いつもちこくするかれのことだから、きょうもおくれるだろう。$$, $$Sendo ele, que sempre se atrasa, hoje também deve chegar atrasado.$$),
    ('n2-grammar-56', $$料理上手な母のことだから、おいしい料理を作ってくれるだろう。$$, $$りょうりじょうずなははのことだから、おいしいりょうりをつくってくれるだろう。$$, $$Conhecendo minha mãe, que cozinha tão bem, ela deve fazer uma comida deliciosa.$$),
    ('n2-grammar-56', $$優しい田中さんのことだから、手伝ってくれるはずだ。$$, $$やさしいたなかさんのことだから、てつだってくれるはずだ。$$, $$Conhecendo o Tanaka, que é tão gentil, ele deve ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭のいい彼女の____、きっと合格するだろう。$$, $$Conhecendo ela, que é tão inteligente, com certeza vai passar.$$),
        (2, $$忙しい部長の____、今日も帰りが遅くなるだろう。$$, $$Sendo o gerente tão ocupado, hoje também deve voltar tarde.$$),
        (3, $$心配性の母の____、何度も電話してくるだろう。$$, $$Conhecendo minha mãe, que se preocupa tanto, ela deve ligar várias vezes.$$),
        (4, $$忘れっぽい彼の____、また約束を忘れているに違いない。$$, $$Sendo ele tão esquecido, com certeza esqueceu o compromisso de novo.$$),
        (5, $$正直な彼の____、うそはつかないだろう。$$, $$Conhecendo ele, que é tão honesto, não deve mentir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-56', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことだから$$),
        (2, $$ことだから$$),
        (3, $$ことだから$$),
        (4, $$ことだから$$),
        (5, $$ことだから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-57 — 〜ことか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-57',
    'grammar',
    'N2',
    $$〜ことか$$,
    $$koto ka$$,
    $$Quanto! / Como! / Quantas vezes!$$,
    $$ことか é usado no fim de uma frase para expressar um sentimento muito forte, com o sentido de exclamação. Equivale a "quanto...!", "como...!" ou "quantas vezes...!".

Ele aparece quase sempre junto com palavras de grau ou quantidade, como どんなに, どれほど, どれだけ e 何度. A ideia é que o sentimento ou a quantidade foi tão grande que não dá nem para medir.

Por exemplo, "como fiquei feliz ao saber que passei!" ou "quantas vezes eu te avisei!".

Apesar de terminar com か, não é uma pergunta. É uma exclamação emocional.

A forma ことだろう tem o mesmo sentido e soa um pouco mais suave.$$,
    $$ことか é típico de textos escritos e de falas emocionadas.

Sem palavras como どんなに ou 何度, a frase com ことか fica estranha.

É comum em cartas, discursos e relatos de emoções intensas, como saudade e alívio.$$,
    $$どんなに / どれほど / どれだけ / 何度 + … + ことか
… + ことだろう (mais suave)$$,
    $$ことか$$,
    $$ことか|ことだろう$$,
    ARRAY['こと', 'か']::text[],
    ARRAY['ことか', 'ことだろう']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-57', $$合格したと聞いて、どんなにうれしかったことか。$$, $$ごうかくしたときいて、どんなにうれしかったことか。$$, $$Como fiquei feliz ao saber que passei!$$),
    ('n2-grammar-57', $$この日をどれほど待ったことか。$$, $$このひをどれほどまったことか。$$, $$Quanto eu esperei por este dia!$$),
    ('n2-grammar-57', $$同じことを何度注意したことか。$$, $$おなじことをなんどちゅういしたことか。$$, $$Quantas vezes eu avisei sobre a mesma coisa!$$),
    ('n2-grammar-57', $$一人暮らしは、どんなに寂しいことか。$$, $$ひとりぐらしは、どんなにさびしいことか。$$, $$Como é solitário morar sozinho!$$),
    ('n2-grammar-57', $$家族に会えて、どれだけ安心したことだろう。$$, $$かぞくにあえて、どれだけあんしんしたことだろう。$$, $$Quanto alívio eu senti ao ver minha família!$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あなたに会えて、どんなにうれしい____。$$, $$Como estou feliz por te ver!$$),
        (2, $$子供のころ、何度この川で遊んだ____。$$, $$Quantas vezes brinquei neste rio quando era criança!$$),
        (3, $$彼の言葉に、どれだけ救われた____。$$, $$Quanto as palavras dele me salvaram!$$),
        (4, $$試験の結果を、どれほど心配した____。$$, $$Como me preocupei com o resultado da prova!$$),
        (5, $$留学中、母の料理がどんなに恋しかった____。$$, $$Como senti falta da comida da minha mãe durante o intercâmbio!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-57', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことか$$),
        (2, $$ことか$$),
        (3, $$ことか$$),
        (4, $$ことか$$),
        (5, $$ことか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-58 — 〜ことなく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-58',
    'grammar',
    'N2',
    $$〜ことなく$$,
    $$koto naku$$,
    $$Sem / Sem jamais / Nem uma vez$$,
    $$ことなく é usado para dizer que algo é feito sem que outra coisa aconteça. Equivale a "sem" ou "sem jamais".

Ele vem depois do verbo na forma de dicionário. O sentido é o mesmo de ないで e ずに, mas ことなく soa mais formal e literário.

Muitas vezes, indica uma ação que seria natural ou esperada, mas que não aconteceu nem uma vez. Por exemplo, "ele trabalhou sem parar" ou "perseguiu o sonho sem desistir nem uma vez".

É muito usado em textos escritos, notícias, discursos e narrativas, especialmente para descrever persistência ou continuidade.$$,
    $$Na conversa do dia a dia, ないで ou ずに são mais naturais.

ことなく aparece muito em frases sobre persistência, como 休むことなく e あきらめることなく.

Em textos sobre tradição, 変わることなく ("sem mudar") é comum para falar de algo que se mantém.$$,
    $$Verbo na forma de dicionário + ことなく + Verbo
一度も + Verbo + ことなく (sem nem uma vez)

Variação: こともなく$$,
    $$ことなく$$,
    $$ことなく|こともなく$$,
    ARRAY['こと', 'なく']::text[],
    ARRAY['ことなく', 'こともなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-58', $$彼は休むことなく働き続けた。$$, $$かれはやすむことなくはたらきつづけた。$$, $$Ele continuou trabalhando sem parar.$$),
    ('n2-grammar-58', $$一度もあきらめることなく、夢を追い続けた。$$, $$いちどもあきらめることなく、ゆめをおいつづけた。$$, $$Perseguiu o sonho sem desistir nem uma vez.$$),
    ('n2-grammar-58', $$誰にも知られることなく、彼は町を出た。$$, $$だれにもしられることなく、かれはまちをでた。$$, $$Ele deixou a cidade sem que ninguém soubesse.$$),
    ('n2-grammar-58', $$彼女は迷うことなく、その仕事を選んだ。$$, $$かのじょはまようことなく、そのしごとをえらんだ。$$, $$Ela escolheu esse trabalho sem hesitar.$$),
    ('n2-grammar-58', $$雨は止むことなく降り続いた。$$, $$あめはやむことなくふりつづいた。$$, $$A chuva continuou caindo sem parar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は一日も休む____、学校に通った。$$, $$Ela frequentou a escola sem faltar nem um dia.$$),
        (2, $$彼は誰にも相談する____、一人で決めた。$$, $$Ele decidiu sozinho, sem consultar ninguém.$$),
        (3, $$失敗を恐れる____、挑戦してください。$$, $$Tente sem ter medo de errar.$$),
        (4, $$彼は振り返る____、去っていった。$$, $$Ele foi embora sem olhar para trás.$$),
        (5, $$この店は、百年間変わる____昔の味を守っている。$$, $$Esta loja mantém o sabor de antigamente há cem anos, sem mudar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-58', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことなく$$),
        (2, $$ことなく$$),
        (3, $$ことなく$$),
        (4, $$ことなく$$),
        (5, $$ことなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-59 — 〜ことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-59',
    'grammar',
    'N2',
    $$〜ことに$$,
    $$koto ni$$,
    $$Para minha surpresa / Infelizmente / Felizmente$$,
    $$ことに é usado no começo de uma frase para expressar o sentimento de quem fala sobre o que vai ser dito. Ele aparece depois de adjetivos ou verbos de sentimento.

As formas mais comuns são:
• 驚いたことに: para minha surpresa.
• うれしいことに: para minha alegria, felizmente.
• 残念なことに: infelizmente.
• 不思議なことに: curiosamente.
• 幸いなことに: por sorte, felizmente.
• 困ったことに: para piorar, o problema é que.

A ideia é: "o que é surpreendente / triste / bom é que...". O sentimento vem primeiro, e o fato vem depois.

Ele vem depois de adjetivos い, adjetivos な com な e verbos na forma た.$$,
    $$ことに soa um pouco formal e aparece muito em textos, notícias e relatos.

Na conversa, as pessoas costumam dizer simplesmente 驚いたけど ou 残念だけど.

幸いなことに é muito comum em notícias, como em "felizmente, não houve feridos".$$,
    $$Adjetivo い (sentimento) + ことに、 + Fato
Adjetivo な + な + ことに、 + Fato
Verbo de sentimento na forma た + ことに、 + Fato$$,
    $$ことに$$,
    $$ことに$$,
    ARRAY['こと', 'に']::text[],
    ARRAY['ことに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-59', $$驚いたことに、彼は試験に合格した。$$, $$おどろいたことに、かれはしけんにごうかくした。$$, $$Para minha surpresa, ele passou na prova.$$),
    ('n2-grammar-59', $$うれしいことに、来週友達が遊びに来る。$$, $$うれしいことに、らいしゅうともだちがあそびにくる。$$, $$Para minha alegria, um amigo vem me visitar semana que vem.$$),
    ('n2-grammar-59', $$残念なことに、雨で試合は中止になった。$$, $$ざんねんなことに、あめでしあいはちゅうしになった。$$, $$Infelizmente, a partida foi cancelada por causa da chuva.$$),
    ('n2-grammar-59', $$不思議なことに、誰もそのことを覚えていなかった。$$, $$ふしぎなことに、だれもそのことをおぼえていなかった。$$, $$Curiosamente, ninguém se lembrava disso.$$),
    ('n2-grammar-59', $$幸いなことに、けが人はいなかった。$$, $$さいわいなことに、けがにんはいなかった。$$, $$Felizmente, não houve feridos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$残念な____、彼はパーティーに来られなかった。$$, $$Infelizmente, ele não pôde vir à festa.$$),
        (2, $$驚いた____、彼女は一人で全部やった。$$, $$Para minha surpresa, ela fez tudo sozinha.$$),
        (3, $$困った____、財布を忘れてしまった。$$, $$O problema é que acabei esquecendo a carteira.$$),
        (4, $$うれしい____、試験に合格した。$$, $$Para minha alegria, passei na prova.$$),
        (5, $$面白い____、二人は同じ日に生まれた。$$, $$Curiosamente, os dois nasceram no mesmo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことに$$),
        (2, $$ことに$$),
        (3, $$ことに$$),
        (4, $$ことに$$),
        (5, $$ことに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-60 — 〜ことにはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-60',
    'grammar',
    'N2',
    $$〜ことにはならない$$,
    $$koto ni wa naranai$$,
    $$Não significa que / Não equivale a / Não conta como$$,
    $$ことにはならない é usado para dizer que uma ação não é suficiente para ser considerada outra coisa. Equivale a "não significa que", "não equivale a" ou "não conta como".

A ideia é corrigir uma conclusão apressada. Por exemplo, "só assistir uma vez não significa que você entendeu" ou "comprar o livro não conta como estudar".

Muitas vezes, a primeira parte usa だけでは ou ただ, mostrando que aquilo é pouco para chegar à conclusão.

Ele vem depois da forma た do verbo (ou da forma simples) + ことにはならない. Também é comum a forma ということにはならない.$$,
    $$Essa estrutura é muito útil em argumentos e conselhos, para mostrar que algo é insuficiente.

Compare com ことになる (fica decidido / resulta em), que é a forma afirmativa.

É comum em falas de professores e pais: 謝ればいいということにはならない ("pedir desculpas não resolve tudo").$$,
    $$… + だけでは、 + Verbo na forma た + ことにはならない
Frase + ということにはならない

Educado: ことにはなりません$$,
    $$ことにはならない$$,
    $$ことにはならない|ことにはなりません|ことにならない$$,
    ARRAY['こと', 'に', 'は', 'ならない']::text[],
    ARRAY['ことにはならない', 'ことにはなりません', 'ということにはならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-60', $$一度見ただけでは、理解したことにはならない。$$, $$いちどみただけでは、りかいしたことにはならない。$$, $$Só ter visto uma vez não significa que você entendeu.$$),
    ('n2-grammar-60', $$謝っただけでは、責任を取ったことにはならない。$$, $$あやまっただけでは、せきにんをとったことにはならない。$$, $$Só pedir desculpas não equivale a assumir a responsabilidade.$$),
    ('n2-grammar-60', $$本を買っただけでは、勉強したことにはならない。$$, $$ほんをかっただけでは、べんきょうしたことにはならない。$$, $$Só comprar o livro não conta como estudar.$$),
    ('n2-grammar-60', $$黙っていても、問題を解決したことにはならない。$$, $$だまっていても、もんだいをかいけつしたことにはならない。$$, $$Ficar calado não significa que o problema foi resolvido.$$),
    ('n2-grammar-60', $$一回勝っただけでは、強いということにはならない。$$, $$いっかいかっただけでは、つよいということにはならない。$$, $$Vencer uma vez só não significa que você é forte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業に出ただけでは、勉強した____。$$, $$Só ir à aula não significa que você estudou.$$),
        (2, $$計画を立てただけでは、実行した____。$$, $$Só fazer o plano não equivale a executá-lo.$$),
        (3, $$知っているだけでは、できる____。$$, $$Só saber não significa conseguir fazer.$$),
        (4, $$謝れば許される____。$$, $$Pedir desculpas não significa que você será perdoado.$$),
        (5, $$一度話しただけで、友達になった____。$$, $$Ter conversado uma vez não significa que viraram amigos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにはならない$$),
        (1, $$ことにはなりません$$),
        (2, $$ことにはならない$$),
        (2, $$ことにはなりません$$),
        (3, $$ことにはならない$$),
        (3, $$ことにはなりません$$),
        (4, $$ことにはならない$$),
        (4, $$ことにはなりません$$),
        (5, $$ことにはならない$$),
        (5, $$ことにはなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-61 — 〜くせして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-61',
    'grammar',
    'N2',
    $$〜くせして$$,
    $$kuse shite$$,
    $$Apesar de / Mesmo sendo / Embora$$,
    $$くせして indica que alguém age de um jeito que não combina com a sua condição, posição ou com o que deveria fazer. Equivale a "apesar de" ou "mesmo sendo".

O tom é sempre de crítica, desprezo ou irritação. A pessoa que fala acha a atitude do outro inadequada. Por exemplo, "apesar de não saber nada, ele fica dando palpite".

É uma variação mais coloquial de くせに e aparece principalmente na fala.$$,
    $$O sujeito das duas partes da frase precisa ser o mesmo.

Não se usa para falar de si mesmo de forma positiva, porque a expressão carrega crítica.

くせして soa um pouco mais forte e mais informal que くせに.$$,
    $$Verbo (forma simples) + くせして
Adjetivo い + くせして
Adjetivo な + な + くせして
Substantivo + の + くせして$$,
    $$くせして$$,
    $$くせして$$,
    ARRAY['くせ', 'して']::text[],
    ARRAY['くせして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-61', $$何も知らないくせして、口を出すな。$$, $$なにもしらないくせして、くちをだすな。$$, $$Não se meta mesmo sem saber nada.$$),
    ('n2-grammar-61', $$子供のくせして、生意気なことを言う。$$, $$こどものくせして、なまいきなことをいう。$$, $$Mesmo sendo criança, fala coisas atrevidas.$$),
    ('n2-grammar-61', $$下手なくせして、いつも自慢している。$$, $$へたなくせして、いつもじまんしている。$$, $$Apesar de ser ruim nisso, vive se gabando.$$),
    ('n2-grammar-61', $$お金がないくせして、高い服ばかり買う。$$, $$おかねがないくせして、たかいふくばかりかう。$$, $$Apesar de não ter dinheiro, só compra roupas caras.$$),
    ('n2-grammar-61', $$自分は遅れたくせして、人には文句を言う。$$, $$じぶんはおくれたくせして、ひとにはもんくをいう。$$, $$Mesmo tendo se atrasado, reclama dos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束した____、彼は来なかった。$$, $$Apesar de ter prometido, ele não veio.$$),
        (2, $$男の____泣くなんて、と言われた。$$, $$Disseram que, mesmo sendo homem, ele estava chorando.$$),
        (3, $$わかっている____、知らないふりをする。$$, $$Mesmo sabendo, finge que não sabe.$$),
        (4, $$若い____、すぐに疲れたと言う。$$, $$Mesmo sendo jovem, logo diz que está cansado.$$),
        (5, $$新人の____、偉そうな態度だ。$$, $$Mesmo sendo novato, tem uma atitude arrogante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-61', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くせして$$),
        (2, $$くせして$$),
        (3, $$くせして$$),
        (4, $$くせして$$),
        (5, $$くせして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-62 — 〜ならまだしも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-62',
    'grammar',
    'N2',
    $$〜ならまだしも$$,
    $$nara madashimo$$,
    $$Ainda se fosse / Se fosse até passava / Seria aceitável se$$,
    $$まだしも serve para comparar duas situações. A primeira seria até aceitável, mas a segunda, que é a real, não é. Equivale a "ainda se fosse..., tudo bem, mas...".

A pessoa mostra que a situação atual é pior ou mais difícil de aceitar do que a outra. Por exemplo, "se fosse uma vez, ainda passava, mas três vezes já é demais".

Costuma aparecer junto com なら ou ならまだしも, seguido de uma frase que expressa crítica ou dificuldade.$$,
    $$É parecido com ならともかく, mas まだしも tem um tom um pouco mais forte de insatisfação.

É uma expressão um pouco formal e aparece tanto na fala quanto na escrita.$$,
    $$Substantivo + ならまだしも、 + Situação real (inaceitável)
Verbo (forma simples) + ならまだしも、 + Situação real
Substantivo + は + まだしも、 + Situação real$$,
    $$まだしも$$,
    $$まだしも$$,
    ARRAY['まだ', 'しも']::text[],
    ARRAY['まだしも', 'ならまだしも', 'はまだしも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-62', $$一回ならまだしも、三回も遅刻するのは問題だ。$$, $$いっかいならまだしも、さんかいもちこくするのはもんだいだ。$$, $$Se fosse uma vez ainda passava, mas atrasar três vezes é um problema.$$),
    ('n2-grammar-62', $$子供ならまだしも、大人がそんなことをするなんて。$$, $$こどもならまだしも、おとながそんなことをするなんて。$$, $$Se fosse uma criança ainda vá lá, mas um adulto fazer uma coisa dessas...$$),
    ('n2-grammar-62', $$暑いのはまだしも、湿気がひどくて困る。$$, $$あついのはまだしも、しっけがひどくてこまる。$$, $$O calor ainda dá para aguentar, mas a umidade está terrível.$$),
    ('n2-grammar-62', $$知らなかったならまだしも、知っていて黙っていたのは許せない。$$, $$しらなかったならまだしも、しっていてだまっていたのはゆるせない。$$, $$Se ele não soubesse ainda passava, mas saber e ficar calado é imperdoável.$$),
    ('n2-grammar-62', $$一人ならまだしも、全員が間違えるとは。$$, $$ひとりならまだしも、ぜんいんがまちがえるとは。$$, $$Se fosse uma pessoa só ainda vá lá, mas todos errarem...$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$少しなら____、こんなに高いのは無理だ。$$, $$Se fosse um pouco ainda passava, mas tão caro assim é impossível.$$),
        (2, $$雨なら____、台風の中で出かけるのは危ない。$$, $$Se fosse chuva ainda vá lá, mas sair no meio de um tufão é perigoso.$$),
        (3, $$初心者なら____、プロがこんなミスをするなんて。$$, $$Se fosse um iniciante ainda passava, mas um profissional cometer um erro desses...$$),
        (4, $$一日なら____、一週間も待てない。$$, $$Um dia ainda dava, mas não dá para esperar uma semana inteira.$$),
        (5, $$味は____、値段が高すぎる。$$, $$O sabor até que passa, mas o preço é alto demais.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-62', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まだしも$$),
        (2, $$まだしも$$),
        (3, $$まだしも$$),
        (4, $$まだしも$$),
        (5, $$まだしも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-63 — 〜まい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-63',
    'grammar',
    'N2',
    $$〜まい$$,
    $$mai$$,
    $$Não vou / Provavelmente não / Nunca mais$$,
    $$まい é uma forma negativa usada para falar de intenção ou suposição.

O primeiro uso expressa a decisão firme de não fazer algo. Equivale a "não vou mais..." ou "nunca mais...". Por exemplo, "nunca mais vou a esse restaurante".

O segundo uso expressa uma suposição negativa. Equivale a "provavelmente não..." ou "acho que não...". Nesse caso, é como uma versão formal de ないだろう.

É uma forma de estilo escrito ou formal, mas aparece em algumas expressões fixas na fala.$$,
    $$No uso de decisão, o sujeito costuma ser a primeira pessoa. Muitas vezes vem com 二度と ou もう.

No uso de suposição, é comum em textos e opiniões, e equivale a ないだろう ou ないと思う.

A forma まいと思う aparece bastante para expressar decisão.$$,
    $$Verbo do grupo 1 (forma dicionário) + まい
Verbo do grupo 2 (raiz ou forma dicionário) + まい
する → するまい / すまい
来る → 来るまい / 来まい$$,
    $$まい$$,
    $$まい$$,
    ARRAY['まい']::text[],
    ARRAY['まい', 'まいと思う', 'すまい', '来まい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-63', $$あんな店には二度と行くまい。$$, $$あんなみせにはにどといくまい。$$, $$Nunca mais vou a uma loja daquelas.$$),
    ('n2-grammar-63', $$彼はもう来るまい。$$, $$かれはもうくるまい。$$, $$Ele provavelmente não vem mais.$$),
    ('n2-grammar-63', $$もう酒は飲むまいと決めた。$$, $$もうさけはのむまいときめた。$$, $$Decidi que não vou mais beber.$$),
    ('n2-grammar-63', $$この問題は子供には解けまい。$$, $$このもんだいはこどもにはとけまい。$$, $$Uma criança provavelmente não consegue resolver este problema.$$),
    ('n2-grammar-63', $$同じ失敗は繰り返すまいと思う。$$, $$おなじしっぱいはくりかえすまいとおもう。$$, $$Penso em não repetir o mesmo erro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$もう二度と嘘はつく____。$$, $$Nunca mais vou contar mentiras.$$),
        (2, $$こんな天気では、誰も来る____。$$, $$Com um tempo destes, provavelmente ninguém vai vir.$$),
        (3, $$あの人とは二度と会う____と思った。$$, $$Pensei que nunca mais encontraria aquela pessoa.$$),
        (4, $$彼が負けることはある____。$$, $$Provavelmente não há chance de ele perder.$$),
        (5, $$無駄遣いはす____と心に決めた。$$, $$Decidi no meu coração que não vou mais desperdiçar dinheiro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-63', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まい$$),
        (2, $$まい$$),
        (3, $$まい$$),
        (4, $$まい$$),
        (5, $$まい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-64 — 〜ままに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-64',
    'grammar',
    'N2',
    $$〜ままに$$,
    $$mama ni$$,
    $$Conforme / Do jeito que / Ao sabor de$$,
    $$ままに indica que alguém age seguindo algo, sem resistir ou sem planejar. Equivale a "conforme", "do jeito que" ou "ao sabor de".

Pode indicar seguir a vontade de outra pessoa, como "fazer conforme mandaram", ou seguir os próprios sentimentos, como "andar conforme os pés levam".

Também aparece em expressões fixas, como "sentir conforme o coração manda".$$,
    $$Expressões comuns são 言われるままに (conforme mandaram), 思うままに (como quiser) e 気の向くままに (ao sabor da vontade).

Muitas vezes transmite a ideia de agir de forma passiva ou livre, sem pensar muito.$$,
    $$Verbo (forma dicionário / passiva) + ままに
Verbo (forma た) + ままに
Substantivo + の + ままに$$,
    $$ままに$$,
    $$ままに$$,
    ARRAY['まま', 'に']::text[],
    ARRAY['ままに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-64', $$言われるままに、書類にサインしてしまった。$$, $$いわれるままに、しょるいにサインしてしまった。$$, $$Assinei os documentos do jeito que me mandaram.$$),
    ('n2-grammar-64', $$足の向くままに、町を歩いた。$$, $$あしのむくままに、まちをあるいた。$$, $$Andei pela cidade para onde os pés me levavam.$$),
    ('n2-grammar-64', $$思うままに絵を描いてください。$$, $$おもうままにえをかいてください。$$, $$Desenhe do jeito que quiser.$$),
    ('n2-grammar-64', $$気の向くままに旅をするのが好きだ。$$, $$きのむくままにたびをするのがすきだ。$$, $$Gosto de viajar ao sabor da vontade.$$),
    ('n2-grammar-64', $$感じたままに話してください。$$, $$かんじたままにはなしてください。$$, $$Fale conforme você sentiu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$店員に勧められる____、高い服を買った。$$, $$Comprei uma roupa cara conforme o vendedor recomendou.$$),
        (2, $$心の____、歌を歌った。$$, $$Cantei conforme o coração mandava.$$),
        (3, $$見た____、正直に説明した。$$, $$Expliquei com sinceridade do jeito que vi.$$),
        (4, $$時間の流れる____、一日を過ごした。$$, $$Passei o dia ao sabor do tempo.$$),
        (5, $$彼は欲望の____行動する。$$, $$Ele age conforme seus desejos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-64', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ままに$$),
        (2, $$ままに$$),
        (3, $$ままに$$),
        (4, $$ままに$$),
        (5, $$ままに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-65 — 全く〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-65',
    'grammar',
    'N2',
    $$全く〜ない$$,
    $$mattaku ~ nai$$,
    $$Nem um pouco / De jeito nenhum / Absolutamente não$$,
    $$全く junto com uma forma negativa reforça a negação de forma total. Equivale a "nem um pouco", "de jeito nenhum" ou "absolutamente não".

Indica que não existe nenhuma exceção ou quantidade. Por exemplo, "não entendi absolutamente nada" ou "não estou nem um pouco cansado".

Também pode aparecer sozinho, como interjeição, para mostrar irritação, com o sentido de "francamente!".$$,
    $$É parecido com 全然〜ない, mas 全く soa um pouco mais formal.

Com frases afirmativas, 全く significa "realmente" ou "completamente", como em "concordo completamente".$$,
    $$全く + Verbo (forma ない)
全く + Adjetivo い (forma くない)
全く + Adjetivo な / Substantivo + ではない$$,
    $$全く〜ない$$,
    $$全く|まったく$$,
    ARRAY['全く', 'ない']::text[],
    ARRAY['全く〜ない', 'まったく〜ない', '全く〜ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-65', $$彼の話は全くわからなかった。$$, $$かれのはなしはまったくわからなかった。$$, $$Não entendi absolutamente nada do que ele disse.$$),
    ('n2-grammar-65', $$この薬は全く効かない。$$, $$このくすりはまったくきかない。$$, $$Este remédio não faz efeito nenhum.$$),
    ('n2-grammar-65', $$昨日のことは全く覚えていない。$$, $$きのうのことはまったくおぼえていない。$$, $$Não me lembro de nada de ontem.$$),
    ('n2-grammar-65', $$この映画は全く面白くなかった。$$, $$このえいがはまったくおもしろくなかった。$$, $$Este filme não teve graça nenhuma.$$),
    ('n2-grammar-65', $$彼女はお酒を全く飲みません。$$, $$かのじょはおさけをまったくのみません。$$, $$Ela não bebe nada de álcool.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その件については____知りません。$$, $$Não sei absolutamente nada sobre esse assunto.$$),
        (2, $$ここからは山が____見えない。$$, $$Daqui não dá para ver a montanha de jeito nenhum.$$),
        (3, $$試験の結果は____よくなかった。$$, $$O resultado da prova não foi nada bom.$$),
        (4, $$彼は____反省していないようだ。$$, $$Parece que ele não está nem um pouco arrependido.$$),
        (5, $$この問題は____難しくない。$$, $$Este problema não é nem um pouco difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$全く$$),
        (1, $$まったく$$),
        (2, $$全く$$),
        (2, $$まったく$$),
        (3, $$全く$$),
        (3, $$まったく$$),
        (4, $$全く$$),
        (4, $$まったく$$),
        (5, $$全く$$),
        (5, $$まったく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-66 — 〜もかまわず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-66',
    'grammar',
    'N2',
    $$〜もかまわず$$,
    $$mo kamawazu$$,
    $$Sem se importar com / Sem ligar para / Apesar de$$,
    $$もかまわず indica que alguém faz algo sem se importar com uma situação que normalmente faria a pessoa hesitar. Equivale a "sem se importar com" ou "sem ligar para".

Muitas vezes se refere ao olhar dos outros, à chuva, ao horário ou à presença de pessoas. Por exemplo, "chorou alto sem se importar com as pessoas em volta".

O tom costuma mostrar surpresa ou crítica diante da atitude.$$,
    $$A expressão 人目もかまわず (sem se importar com o olhar dos outros) é muito comum.

É parecido com を気にせず, mas もかまわず é mais formal e mais expressivo.

A forma かまわず sozinha também significa "sem se importar".$$,
    $$Substantivo + もかまわず
Verbo (forma simples) + の + もかまわず
Adjetivo い + の + もかまわず$$,
    $$もかまわず$$,
    $$もかまわず|も構わず$$,
    ARRAY['も', 'かまわず']::text[],
    ARRAY['もかまわず', 'も構わず', 'のもかまわず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-66', $$彼女は人目もかまわず泣き出した。$$, $$かのじょはひとめもかまわずなきだした。$$, $$Ela começou a chorar sem se importar com o olhar dos outros.$$),
    ('n2-grammar-66', $$服が汚れるのもかまわず、子供たちは遊んでいる。$$, $$ふくがよごれるのもかまわず、こどもたちはあそんでいる。$$, $$As crianças estão brincando sem ligar para as roupas sujando.$$),
    ('n2-grammar-66', $$雨もかまわず、彼は走り続けた。$$, $$あめもかまわず、かれははしりつづけた。$$, $$Ele continuou correndo sem se importar com a chuva.$$),
    ('n2-grammar-66', $$夜中なのもかまわず、隣の人が大声で歌っている。$$, $$よなかなのもかまわず、となりのひとがおおごえでうたっている。$$, $$Mesmo sendo meia-noite, o vizinho está cantando alto sem se importar.$$),
    ('n2-grammar-66', $$周りの迷惑もかまわず、電話で話している人がいる。$$, $$まわりのめいわくもかまわず、でんわではなしているひとがいる。$$, $$Tem gente falando ao telefone sem se importar com o incômodo aos outros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は値段____、高い料理を注文した。$$, $$Ele pediu pratos caros sem se importar com o preço.$$),
        (2, $$母が止めるの____、彼は家を出た。$$, $$Ele saiu de casa sem ligar para a mãe tentando impedir.$$),
        (3, $$寒さ____、彼らは海で泳いだ。$$, $$Eles nadaram no mar sem se importar com o frio.$$),
        (4, $$足が痛いの____、最後まで走った。$$, $$Corri até o fim sem ligar para a dor no pé.$$),
        (5, $$彼は人目____、大声で笑った。$$, $$Ele riu alto sem se importar com o olhar dos outros.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もかまわず$$),
        (1, $$も構わず$$),
        (2, $$もかまわず$$),
        (2, $$も構わず$$),
        (3, $$もかまわず$$),
        (3, $$も構わず$$),
        (4, $$もかまわず$$),
        (4, $$も構わず$$),
        (5, $$もかまわず$$),
        (5, $$も構わず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-67 — 〜も当然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-67',
    'grammar',
    'N2',
    $$〜も当然だ$$,
    $$mo touzen da$$,
    $$É natural que / Não é de admirar que / É óbvio que$$,
    $$も当然だ indica que um resultado ou reação é totalmente esperado diante da situação. Equivale a "é natural que" ou "não é de admirar que".

A primeira parte da frase costuma explicar o motivo, e depois vem a conclusão de que o resultado faz sentido. Por exemplo, "ele estudou tanto, então é natural que tenha passado".

A forma のも当然だ é a mais usada, porque transforma a ação em um substantivo antes de も.$$,
    $$É parecido com のも無理はない e のももっともだ.

Na fala, também aparece como のも当たり前だ.

O tom pode ser de compreensão ou de crítica, dependendo da situação.$$,
    $$Verbo (forma simples) + のも当然だ
Adjetivo い + のも当然だ
Adjetivo な + な + のも当然だ$$,
    $$も当然だ$$,
    $$も当然|もとうぜん$$,
    ARRAY['も', '当然', 'だ']::text[],
    ARRAY['も当然だ', 'のも当然だ', 'も当然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-67', $$毎日練習したのだから、優勝したのも当然だ。$$, $$まいにちれんしゅうしたのだから、ゆうしょうしたのもとうぜんだ。$$, $$Ele treinou todo dia, então é natural que tenha vencido.$$),
    ('n2-grammar-67', $$あんなにひどいことを言われたら、怒るのも当然だ。$$, $$あんなにひどいことをいわれたら、おこるのもとうぜんだ。$$, $$Ouvindo uma coisa tão horrível, é natural ficar com raiva.$$),
    ('n2-grammar-67', $$一晩中起きていたから、眠いのも当然だ。$$, $$ひとばんじゅうおきていたから、ねむいのもとうぜんだ。$$, $$Fiquei acordado a noite toda, então é óbvio que estou com sono.$$),
    ('n2-grammar-67', $$彼は嘘をついたのだから、信用されないのも当然だ。$$, $$かれはうそをついたのだから、しんようされないのもとうぜんだ。$$, $$Ele mentiu, então não é de admirar que não confiem nele.$$),
    ('n2-grammar-67', $$こんなに安いのだから、人気があるのも当然です。$$, $$こんなにやすいのだから、にんきがあるのもとうぜんです。$$, $$Sendo tão barato assim, é natural que seja popular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何も食べていないなら、お腹がすくの____。$$, $$Se você não comeu nada, é natural estar com fome.$$),
        (2, $$あれだけ働けば、疲れるの____。$$, $$Trabalhando tanto assim, é natural ficar cansado.$$),
        (3, $$約束を破ったのだから、彼女が怒るの____。$$, $$Você quebrou a promessa, então é natural que ela fique brava.$$),
        (4, $$駅に近いので、家賃が高いの____。$$, $$Fica perto da estação, então é natural que o aluguel seja caro.$$),
        (5, $$勉強しなかったんだから、落ちたの____。$$, $$Você não estudou, então é óbvio que reprovou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-67', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$も当然だ$$),
        (1, $$も当然です$$),
        (2, $$も当然だ$$),
        (2, $$も当然です$$),
        (3, $$も当然だ$$),
        (3, $$も当然です$$),
        (4, $$も当然だ$$),
        (4, $$も当然です$$),
        (5, $$も当然だ$$),
        (5, $$も当然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-68 — 〜もの / 〜もん
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-68',
    'grammar',
    'N2',
    $$〜もの / 〜もん$$,
    $$mono / mon$$,
    $$É que / Porque / Afinal$$,
    $$もの ou もん no fim da frase serve para justificar algo de forma pessoal, quase como uma desculpa. Equivale a "é que..." ou "porque...".

A pessoa explica o motivo da sua atitude e espera que o outro entenda. O tom é coloquial e um pouco infantil ou carinhoso. Por exemplo, "não fui porque estava chovendo, ué".

もん é a forma mais informal e é muito usada por crianças, jovens e mulheres. Muitas vezes aparece junto com だって ou だもの.$$,
    $$É comum começar a frase com だって, como em だって、〜もん.

Não se usa em situações formais ou com superiores.

A forma ですもの aparece na fala feminina mais educada.$$,
    $$Verbo (forma simples) + もの / もん
Adjetivo い + もの / もん
Adjetivo な / Substantivo + だ + もの / もん
Frase + んだもん$$,
    $$もの$$,
    $$もの|もん$$,
    ARRAY['もの']::text[],
    ARRAY['もの', 'もん', 'だもの', 'だもん', 'んだもん', 'ですもの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-68', $$だって、知らなかったんだもん。$$, $$だって、しらなかったんだもん。$$, $$É que eu não sabia, ué.$$),
    ('n2-grammar-68', $$行きたくない。疲れているもの。$$, $$いきたくない。つかれているもの。$$, $$Não quero ir. É que estou cansado.$$),
    ('n2-grammar-68', $$仕方ないよ、子供だもん。$$, $$しかたないよ、こどもだもん。$$, $$Não tem jeito, afinal é criança.$$),
    ('n2-grammar-68', $$食べないよ。まずいもん。$$, $$たべないよ。まずいもん。$$, $$Não vou comer. É que está ruim.$$),
    ('n2-grammar-68', $$だって、雨が降っていたんですもの。$$, $$だって、あめがふっていたんですもの。$$, $$É que estava chovendo, sabe.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅刻したのは仕方ないよ。電車が止まったんだ____。$$, $$Não tive culpa do atraso. É que o trem parou.$$),
        (2, $$だって、怖かったんだ____。$$, $$É que eu estava com medo.$$),
        (3, $$一人で行けないよ。まだ子供だ____。$$, $$Não consigo ir sozinho. Afinal ainda sou criança.$$),
        (4, $$その服は買わない。高い____。$$, $$Não vou comprar essa roupa. É que é cara.$$),
        (5, $$だって、誰も教えてくれなかった____。$$, $$É que ninguém me ensinou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-68', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もの$$),
        (1, $$もん$$),
        (2, $$もの$$),
        (2, $$もん$$),
        (3, $$もの$$),
        (3, $$もん$$),
        (4, $$もの$$),
        (4, $$もん$$),
        (5, $$もの$$),
        (5, $$もん$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-69 — 〜ものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-69',
    'grammar',
    'N2',
    $$〜ものだ$$,
    $$mono da$$,
    $$É natural que / Costumava / Como é$$,
    $$ものだ tem alguns usos importantes.

O primeiro é falar de algo que é natural, uma verdade geral ou um costume. Equivale a "é natural que" ou "é assim que as coisas são". Por exemplo, "as pessoas mudam com o tempo".

O segundo é dar um conselho ou uma regra social, com o sentido de "deve-se". Por exemplo, "deve-se respeitar os mais velhos".

O terceiro, com a forma passada, é lembrar com nostalgia algo que se fazia com frequência. Equivale a "costumava". Por exemplo, "eu costumava brincar neste parque".

Também pode mostrar emoção ou surpresa, como "como o tempo passa rápido!".$$,
    $$Na fala, ものだ costuma virar もんだ.

Na forma negativa, ものではない significa "não se deve".

O uso de lembrança costuma vir com palavras como よく ou 昔は.$$,
    $$Verbo (forma dicionário) + ものだ (verdade geral / conselho)
Verbo (forma た) + ものだ (lembrança do passado)
Adjetivo い / Adjetivo な + な + ものだ (emoção)$$,
    $$ものだ$$,
    $$ものだ|もんだ|ものです$$,
    ARRAY['もの', 'だ']::text[],
    ARRAY['ものだ', 'もんだ', 'ものです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-69', $$子供のころは、よくこの川で泳いだものだ。$$, $$こどものころは、よくこのかわでおよいだものだ。$$, $$Quando criança, eu costumava nadar muito neste rio.$$),
    ('n2-grammar-69', $$人の心は変わるものだ。$$, $$ひとのこころはかわるものだ。$$, $$O coração das pessoas muda, é natural.$$),
    ('n2-grammar-69', $$年上の人には敬語を使うものです。$$, $$としうえのひとにはけいごをつかうものです。$$, $$Com pessoas mais velhas, deve-se usar linguagem respeitosa.$$),
    ('n2-grammar-69', $$時間がたつのは早いものだ。$$, $$じかんがたつのははやいものだ。$$, $$Como o tempo passa rápido.$$),
    ('n2-grammar-69', $$学生時代はよく徹夜したもんだ。$$, $$がくせいじだいはよくてつやしたもんだ。$$, $$Na época de estudante eu costumava virar a noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$若いころは、よく友達と旅行した____。$$, $$Quando jovem, eu costumava viajar muito com os amigos.$$),
        (2, $$約束は守る____。$$, $$Promessas devem ser cumpridas.$$),
        (3, $$お金はすぐになくなる____。$$, $$Dinheiro acaba rápido, é natural.$$),
        (4, $$昔はこの公園でよく遊んだ____。$$, $$Antigamente eu costumava brincar muito neste parque.$$),
        (5, $$人に会ったら挨拶をする____。$$, $$Quando se encontra alguém, deve-se cumprimentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-69', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだ$$),
        (1, $$もんだ$$),
        (2, $$ものだ$$),
        (2, $$ものです$$),
        (2, $$もんだ$$),
        (3, $$ものだ$$),
        (3, $$ものです$$),
        (3, $$もんだ$$),
        (4, $$ものだ$$),
        (4, $$もんだ$$),
        (5, $$ものだ$$),
        (5, $$ものです$$),
        (5, $$もんだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-70 — 〜ものだから
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-70',
    'grammar',
    'N2',
    $$〜ものだから$$,
    $$mono dakara$$,
    $$É que / Porque / Como$$,
    $$ものだから serve para explicar o motivo de algo, geralmente como justificativa ou desculpa. Equivale a "é que" ou "porque".

A pessoa explica que o resultado aconteceu por causa de uma situação que ela não conseguiu evitar. Por exemplo, "me atrasei porque o trem parou".

Na fala, aparece muito como もんだから.$$,
    $$Depois de ものだから não se usam pedidos, ordens ou convites. A segunda parte costuma ser um fato.

É parecido com から, mas ものだから dá mais ênfase à justificativa.

É muito usado para pedir desculpas de forma educada.$$,
    $$Verbo (forma simples) + ものだから
Adjetivo い + ものだから
Adjetivo な + な + ものだから
Substantivo + な + ものだから$$,
    $$ものだから$$,
    $$ものだから|もんだから|ものですから$$,
    ARRAY['もの', 'だから']::text[],
    ARRAY['ものだから', 'もんだから', 'ものですから']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-70', $$電車が遅れたものだから、会議に間に合わなかった。$$, $$でんしゃがおくれたものだから、かいぎにまにあわなかった。$$, $$É que o trem atrasou, então não cheguei a tempo da reunião.$$),
    ('n2-grammar-70', $$あまりに安かったものだから、たくさん買ってしまった。$$, $$あまりにやすかったものだから、たくさんかってしまった。$$, $$Estava tão barato que acabei comprando muito.$$),
    ('n2-grammar-70', $$道が分からなかったもんだから、人に聞いた。$$, $$みちがわからなかったもんだから、ひとにきいた。$$, $$Como eu não sabia o caminho, perguntei para alguém.$$),
    ('n2-grammar-70', $$子供が熱を出したものですから、今日は休ませてください。$$, $$こどもがねつをだしたものですから、きょうはやすませてください。$$, $$É que meu filho está com febre, então me deixe faltar hoje.$$),
    ('n2-grammar-70', $$静かなものだから、つい寝てしまった。$$, $$しずかなものだから、ついねてしまった。$$, $$Estava tão silencioso que acabei dormindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$目覚ましが鳴らなかった____、寝坊しました。$$, $$É que o despertador não tocou, então dormi demais.$$),
        (2, $$あまりにおいしかった____、全部食べてしまった。$$, $$Estava tão gostoso que acabei comendo tudo.$$),
        (3, $$初めてな____、よく分かりません。$$, $$É que é a primeira vez, então não entendo bem.$$),
        (4, $$急いでいた____、財布を忘れた。$$, $$Como eu estava com pressa, esqueci a carteira.$$),
        (5, $$寒かった____、窓を閉めました。$$, $$É que estava frio, então fechei a janela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-70', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものだから$$),
        (1, $$もんだから$$),
        (1, $$ものですから$$),
        (2, $$ものだから$$),
        (2, $$もんだから$$),
        (2, $$ものですから$$),
        (3, $$ものだから$$),
        (3, $$もんだから$$),
        (3, $$ものですから$$),
        (4, $$ものだから$$),
        (4, $$もんだから$$),
        (4, $$ものですから$$),
        (5, $$ものだから$$),
        (5, $$もんだから$$),
        (5, $$ものですから$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-71 — 〜ものではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-71',
    'grammar',
    'N2',
    $$〜ものではない$$,
    $$mono dewa nai$$,
    $$Não se deve / Não é certo / Não convém$$,
    $$ものではない serve para dar um conselho ou uma advertência baseada no bom senso ou nas regras sociais. Equivale a "não se deve" ou "não é certo".

A pessoa não está proibindo diretamente, mas dizendo que, de forma geral, aquilo não é adequado. Por exemplo, "não se deve falar mal dos outros".

É muito usado por pais, professores ou pessoas mais velhas ao dar conselhos.$$,
    $$Na fala, aparece como もんじゃない ou ものじゃない.

A forma positiva, ものだ, significa "deve-se".

Não se usa para falar de uma regra específica, como uma lei, mas sim de bom senso.$$,
    $$Verbo (forma dicionário) + ものではない
Verbo (forma dicionário) + もんじゃない$$,
    $$ものではない$$,
    $$ものではない|ものじゃない|もんじゃない|ものではありません$$,
    ARRAY['もの', 'では', 'ない']::text[],
    ARRAY['ものではない', 'ものじゃない', 'もんじゃない', 'ものではありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-71', $$人の悪口を言うものではない。$$, $$ひとのわるぐちをいうものではない。$$, $$Não se deve falar mal dos outros.$$),
    ('n2-grammar-71', $$食べ物を無駄にするものではありません。$$, $$たべものをむだにするものではありません。$$, $$Não se deve desperdiçar comida.$$),
    ('n2-grammar-71', $$夜遅くに電話するもんじゃないよ。$$, $$よるおそくにでんわするもんじゃないよ。$$, $$Não é certo telefonar tarde da noite.$$),
    ('n2-grammar-71', $$年上の人にそんな口をきくものじゃない。$$, $$としうえのひとにそんなくちをきくものじゃない。$$, $$Não se fala desse jeito com alguém mais velho.$$),
    ('n2-grammar-71', $$約束を簡単に破るものではない。$$, $$やくそくをかんたんにやぶるものではない。$$, $$Não se deve quebrar promessas com facilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人の物を勝手に使う____。$$, $$Não se deve usar as coisas dos outros sem permissão.$$),
        (2, $$子供の前でたばこを吸う____。$$, $$Não se deve fumar na frente de crianças.$$),
        (3, $$人を外見で判断する____。$$, $$Não se deve julgar as pessoas pela aparência.$$),
        (4, $$お年寄りをばかにする____。$$, $$Não se deve zombar dos idosos.$$),
        (5, $$人の話は途中で遮る____。$$, $$Não se deve interromper as pessoas enquanto falam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-71', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものではない$$),
        (1, $$ものじゃない$$),
        (1, $$もんじゃない$$),
        (1, $$ものではありません$$),
        (2, $$ものではない$$),
        (2, $$ものじゃない$$),
        (2, $$もんじゃない$$),
        (2, $$ものではありません$$),
        (3, $$ものではない$$),
        (3, $$ものじゃない$$),
        (3, $$もんじゃない$$),
        (3, $$ものではありません$$),
        (4, $$ものではない$$),
        (4, $$ものじゃない$$),
        (4, $$もんじゃない$$),
        (4, $$ものではありません$$),
        (5, $$ものではない$$),
        (5, $$ものじゃない$$),
        (5, $$もんじゃない$$),
        (5, $$ものではありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-72 — 〜ものがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-72',
    'grammar',
    'N2',
    $$〜ものがある$$,
    $$mono ga aru$$,
    $$Há algo de / Tem um quê de / É realmente$$,
    $$ものがある serve para expressar uma impressão forte que a pessoa sente diante de algo. Equivale a "há algo de..." ou "é realmente...".

A pessoa não descreve um fato objetivo, mas um sentimento ou avaliação pessoal. Por exemplo, "a música dele tem algo de comovente" ou "é realmente difícil aceitar isso".

É uma expressão um pouco formal, comum em comentários e opiniões.$$,
    $$Costuma vir com palavras que expressam sentimento, como 感動する, 寂しい, 厳しい ou 難しい.

Não se usa para falar de coisas concretas, apenas de impressões.$$,
    $$Verbo (forma dicionário) + ものがある
Adjetivo い + ものがある
Adjetivo な + な + ものがある$$,
    $$ものがある$$,
    $$ものがある|ものがあります|ものがあった$$,
    ARRAY['もの', 'が', 'ある']::text[],
    ARRAY['ものがある', 'ものがあります', 'ものがあった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-72', $$彼の歌には人の心を動かすものがある。$$, $$かれのうたにはひとのこころをうごかすものがある。$$, $$As músicas dele têm algo que mexe com o coração das pessoas.$$),
    ('n2-grammar-72', $$この年で一人暮らしをするのは寂しいものがある。$$, $$このとしでひとりぐらしをするのはさびしいものがある。$$, $$Morar sozinho nesta idade tem algo de solitário.$$),
    ('n2-grammar-72', $$彼女の才能には驚くべきものがある。$$, $$かのじょのさいのうにはおどろくべきものがある。$$, $$O talento dela tem algo de surpreendente.$$),
    ('n2-grammar-72', $$毎日三時間の通勤はつらいものがある。$$, $$まいにちさんじかんのつうきんはつらいものがある。$$, $$Três horas de deslocamento por dia é realmente duro.$$),
    ('n2-grammar-72', $$この町の景色には懐かしいものがあります。$$, $$このまちのけしきにはなつかしいものがあります。$$, $$A paisagem desta cidade tem algo de nostálgico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供の成長の速さには驚く____。$$, $$A rapidez com que as crianças crescem é realmente surpreendente.$$),
        (2, $$彼の作品には何か特別な____。$$, $$As obras dele têm algo de especial.$$),
        (3, $$この年で新しいことを始めるのは難しい____。$$, $$Começar algo novo nesta idade é realmente difícil.$$),
        (4, $$彼の演技には心に響く____。$$, $$A atuação dele tem algo que toca o coração.$$),
        (5, $$友達と別れるのはつらい____。$$, $$Se despedir de um amigo é realmente doloroso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-72', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものがある$$),
        (1, $$ものがあります$$),
        (2, $$ものがある$$),
        (2, $$ものがあります$$),
        (3, $$ものがある$$),
        (3, $$ものがあります$$),
        (4, $$ものがある$$),
        (4, $$ものがあります$$),
        (5, $$ものがある$$),
        (5, $$ものがあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-73 — 〜ものか / 〜もんか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-73',
    'grammar',
    'N2',
    $$〜ものか / 〜もんか$$,
    $$mono ka / mon ka$$,
    $$De jeito nenhum / Nunca que / Imagine se$$,
    $$ものか ou もんか no fim da frase expressa uma negação muito forte, em tom de pergunta retórica. Equivale a "de jeito nenhum" ou "nunca que...".

A pessoa mostra que está totalmente decidida a não fazer algo ou que acha algo impossível. Por exemplo, "nunca mais vou àquela loja!" ou "imagine se ele vai entender".

É uma expressão emotiva e informal. Na forma mais educada, aparece como ものですか.$$,
    $$Na fala masculina, também aparece como ものかよ ou もんかよ.

ものですか é usado na fala feminina mais educada.

Embora tenha forma de pergunta, o sentido é sempre negativo.$$,
    $$Verbo (forma dicionário) + ものか / もんか
Adjetivo い + ものか / もんか
Adjetivo な / Substantivo + な + ものか / もんか$$,
    $$ものか$$,
    $$ものか|もんか|ものですか$$,
    ARRAY['もの', 'か']::text[],
    ARRAY['ものか', 'もんか', 'ものですか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-73', $$あんな店には二度と行くものか。$$, $$あんなみせにはにどといくものか。$$, $$Nunca mais que eu vou àquela loja!$$),
    ('n2-grammar-73', $$負けるもんか。$$, $$まけるもんか。$$, $$De jeito nenhum vou perder!$$),
    ('n2-grammar-73', $$彼の気持ちなんて分かるものか。$$, $$かれのきもちなんてわかるものか。$$, $$Imagine se dá para entender o que ele sente.$$),
    ('n2-grammar-73', $$こんな問題、簡単なものか。$$, $$こんなもんだい、かんたんなものか。$$, $$Este problema não tem nada de fácil!$$),
    ('n2-grammar-73', $$あの人に謝るものですか。$$, $$あのひとにあやまるものですか。$$, $$Imagine se eu vou pedir desculpas àquela pessoa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなまずい料理、二度と食べる____。$$, $$Nunca mais vou comer uma comida ruim dessas!$$),
        (2, $$あいつの言うことなんか信じる____。$$, $$De jeito nenhum vou acreditar no que aquele cara diz!$$),
        (3, $$こんなことで泣く____。$$, $$Imagine se vou chorar por uma coisa dessas!$$),
        (4, $$彼が本当のことを言う____。$$, $$Imagine se ele vai dizer a verdade.$$),
        (5, $$絶対にあきらめる____。$$, $$De jeito nenhum vou desistir!$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-73', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものか$$),
        (1, $$もんか$$),
        (1, $$ものですか$$),
        (2, $$ものか$$),
        (2, $$もんか$$),
        (2, $$ものですか$$),
        (3, $$ものか$$),
        (3, $$もんか$$),
        (3, $$ものですか$$),
        (4, $$ものか$$),
        (4, $$もんか$$),
        (4, $$ものですか$$),
        (5, $$ものか$$),
        (5, $$もんか$$),
        (5, $$ものですか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-74 — 〜ものなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-74',
    'grammar',
    'N2',
    $$〜ものなら$$,
    $$mono nara$$,
    $$Se pudesse / Se por acaso / Se ousar$$,
    $$ものなら tem dois usos principais.

O primeiro vem com a forma potencial e expressa um desejo que é difícil de realizar. Equivale a "se pudesse...". Por exemplo, "se pudesse voltar ao passado, eu voltaria". A segunda parte costuma ser um desejo ou um convite.

O segundo vem com a forma volitiva, como ようものなら, e indica que, se alguém fizer algo, o resultado será muito ruim. Equivale a "se ousar..." ou "se por acaso...". Por exemplo, "se você se atrasar, o professor vai ficar furioso".$$,
    $$No primeiro uso, a situação é quase impossível ou muito difícil.

O segundo uso tem um tom de exagero e advertência.

Na fala, aparece como もんなら.$$,
    $$Verbo (forma potencial) + ものなら、 + Desejo / Convite
Verbo (forma volitiva) + ものなら、 + Resultado ruim$$,
    $$ものなら$$,
    $$ものなら|もんなら$$,
    ARRAY['もの', 'なら']::text[],
    ARRAY['ものなら', 'もんなら', 'ようものなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-74', $$戻れるものなら、学生時代に戻りたい。$$, $$もどれるものなら、がくせいじだいにもどりたい。$$, $$Se pudesse voltar, eu voltaria à época de estudante.$$),
    ('n2-grammar-74', $$できるものなら、やってみなさい。$$, $$できるものなら、やってみなさい。$$, $$Se você consegue, então tente.$$),
    ('n2-grammar-74', $$遅刻でもしようものなら、先生にひどく怒られる。$$, $$ちこくでもしようものなら、せんせいにひどくおこられる。$$, $$Se por acaso você se atrasar, o professor vai ficar furioso.$$),
    ('n2-grammar-74', $$代われるものなら、代わってあげたい。$$, $$かわれるものなら、かわってあげたい。$$, $$Se pudesse, eu trocaria de lugar com você.$$),
    ('n2-grammar-74', $$彼に秘密を話そうものなら、すぐにみんなに知られてしまう。$$, $$かれにひみつをはなそうものなら、すぐにみんなにしられてしまう。$$, $$Se você ousar contar um segredo a ele, logo todo mundo vai saber.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$行ける____、今すぐにでも日本に行きたい。$$, $$Se pudesse, iria ao Japão agora mesmo.$$),
        (2, $$やり直せる____、もう一度やり直したい。$$, $$Se pudesse recomeçar, gostaria de recomeçar mais uma vez.$$),
        (3, $$母に嘘をつこう____、大変なことになる。$$, $$Se você ousar mentir para a minha mãe, vai ser um problemão.$$),
        (4, $$勝てる____、勝ってみろ。$$, $$Se você consegue ganhar, tente ganhar.$$),
        (5, $$彼の前で失敗しよう____、ずっと笑われる。$$, $$Se por acaso você falhar na frente dele, vai ser motivo de piada para sempre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-74', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものなら$$),
        (1, $$もんなら$$),
        (2, $$ものなら$$),
        (2, $$もんなら$$),
        (3, $$ものなら$$),
        (3, $$もんなら$$),
        (4, $$ものなら$$),
        (4, $$もんなら$$),
        (5, $$ものなら$$),
        (5, $$もんなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-75 — 〜ものの
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-75',
    'grammar',
    'N2',
    $$〜ものの$$,
    $$mono no$$,
    $$Embora / Apesar de / Mas$$,
    $$ものの serve para ligar duas ideias contrárias. Equivale a "embora" ou "apesar de".

A primeira parte reconhece um fato, e a segunda mostra que o resultado esperado não aconteceu. Por exemplo, "embora tenha comprado o livro, ainda não li".

É uma expressão um pouco formal, mais comum na escrita.$$,
    $$É parecido com けれども e のに, mas ものの não carrega tanta emoção de frustração como のに.

A forma とはいうものの significa "apesar de dizer isso".$$,
    $$Verbo (forma simples) + ものの
Adjetivo い + ものの
Adjetivo な + な / である + ものの
Substantivo + である + ものの$$,
    $$ものの$$,
    $$ものの$$,
    ARRAY['もの', 'の']::text[],
    ARRAY['ものの', 'とはいうものの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-75', $$本を買ったものの、まだ読んでいない。$$, $$ほんをかったものの、まだよんでいない。$$, $$Embora tenha comprado o livro, ainda não li.$$),
    ('n2-grammar-75', $$大学は出たものの、仕事が見つからない。$$, $$だいがくはでたものの、しごとがみつからない。$$, $$Apesar de ter me formado, não encontro emprego.$$),
    ('n2-grammar-75', $$習ってはいるものの、なかなか上手にならない。$$, $$ならってはいるものの、なかなかじょうずにならない。$$, $$Embora esteja fazendo aulas, não consigo melhorar.$$),
    ('n2-grammar-75', $$便利なものの、値段が高い。$$, $$べんりなものの、ねだんがたかい。$$, $$Embora seja prático, o preço é alto.$$),
    ('n2-grammar-75', $$春とはいうものの、まだ寒い日が続いている。$$, $$はるとはいうものの、まださむいひがつづいている。$$, $$Apesar de ser primavera, os dias continuam frios.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束はした____、行けるかどうかわからない。$$, $$Embora eu tenha prometido, não sei se vou poder ir.$$),
        (2, $$ジムに入会した____、一度も行っていない。$$, $$Embora tenha me inscrito na academia, não fui nenhuma vez.$$),
        (3, $$説明書を読んだ____、使い方がよくわからない。$$, $$Apesar de ter lido o manual, não entendo bem como usar.$$),
        (4, $$この部屋は広い____、駅から遠い。$$, $$Embora este quarto seja espaçoso, fica longe da estação.$$),
        (5, $$自信はない____、やってみることにした。$$, $$Embora não tenha confiança, resolvi tentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-75', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ものの$$),
        (2, $$ものの$$),
        (3, $$ものの$$),
        (4, $$ものの$$),
        (5, $$ものの$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-76 — もっとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-76',
    'grammar',
    'N2',
    $$もっとも$$,
    $$mottomo$$,
    $$No entanto / Embora / Se bem que$$,
    $$もっとも, no começo de uma frase, serve para acrescentar uma observação ou uma ressalva ao que foi dito antes. Equivale a "no entanto", "se bem que" ou "embora".

A pessoa primeiro afirma algo e depois limita ou corrige parcialmente essa afirmação. Por exemplo, "ele é um ótimo aluno. Se bem que, em matemática, é fraco".

Também é usado como adjetivo, もっともな, com o sentido de "razoável" ou "justo".$$,
    $$No começo da frase, o sentido é parecido com ただし e ただ.

Como advérbio antes de adjetivos, 最も significa "o mais", mas esse é outro uso, normalmente escrito em kanji.$$,
    $$Frase + もっとも、 + Ressalva / Observação
もっともな + Substantivo (razoável)$$,
    $$もっとも$$,
    $$もっとも$$,
    ARRAY['もっとも']::text[],
    ARRAY['もっとも', 'もっともな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-76', $$このレストランはおいしい。もっとも、値段は少し高いが。$$, $$このレストランはおいしい。もっとも、ねだんはすこしたかいが。$$, $$Este restaurante é gostoso. Se bem que o preço é um pouco alto.$$),
    ('n2-grammar-76', $$明日は休みです。もっとも、急な仕事が入れば出社します。$$, $$あしたはやすみです。もっとも、きゅうなしごとがはいればしゅっしゃします。$$, $$Amanhã é folga. No entanto, se surgir algum trabalho urgente, vou à empresa.$$),
    ('n2-grammar-76', $$彼は優秀な学生だ。もっとも、数学は苦手だが。$$, $$かれはゆうしゅうながくせいだ。もっとも、すうがくはにがてだが。$$, $$Ele é um ótimo aluno. Se bem que é fraco em matemática.$$),
    ('n2-grammar-76', $$彼女の意見はもっともだ。$$, $$かのじょのいけんはもっともだ。$$, $$A opinião dela é razoável.$$),
    ('n2-grammar-76', $$彼が怒るのももっともな話だ。$$, $$かれがおこるのももっともなはなしだ。$$, $$É compreensível que ele fique bravo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$参加は自由です。____、事前の申し込みが必要です。$$, $$A participação é livre. No entanto, é preciso se inscrever antes.$$),
        (2, $$この本は面白い。____、少し長すぎるけど。$$, $$Este livro é interessante. Se bem que é um pouco longo demais.$$),
        (3, $$彼の言うことは____だ。$$, $$O que ele diz é razoável.$$),
        (4, $$この店は毎日開いている。____、正月は休みだが。$$, $$Esta loja abre todos os dias. Se bem que fecha no Ano-Novo.$$),
        (5, $$それは____な意見ですね。$$, $$Essa é uma opinião razoável, não é?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-76', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もっとも$$),
        (2, $$もっとも$$),
        (3, $$もっとも$$),
        (4, $$もっとも$$),
        (5, $$もっとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-77 — もう少しで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-77',
    'grammar',
    'N2',
    $$もう少しで$$,
    $$mou sukoshi de$$,
    $$Por pouco / Quase / Faltou pouco para$$,
    $$もう少しで indica que algo quase aconteceu, mas no fim não aconteceu. Equivale a "por pouco" ou "quase".

Geralmente vem junto com ところだった, mostrando que a pessoa escapou de uma situação ruim por pouco. Por exemplo, "quase perdi o trem".

Também pode indicar que falta pouco para algo acontecer no futuro, com o sentido de "daqui a pouco" ou "já está quase".$$,
    $$É parecido com 危うく e あやうく, mas もう少しで é mais comum na fala.

Também aparece como もうちょっとで, que é mais informal.$$,
    $$もう少しで + Verbo (forma dicionário) + ところだった
もう少しで + Verbo (forma dicionário / Substantivo) (falta pouco)$$,
    $$もう少しで$$,
    $$もう少しで|もうすこしで|もうちょっとで$$,
    ARRAY['もう', '少し', 'で']::text[],
    ARRAY['もう少しで', 'もうちょっとで', 'もう少しで〜ところだった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-77', $$もう少しで電車に乗り遅れるところだった。$$, $$もうすこしででんしゃにのりおくれるところだった。$$, $$Por pouco não perdi o trem.$$),
    ('n2-grammar-77', $$もう少しで車にひかれるところだった。$$, $$もうすこしでくるまにひかれるところだった。$$, $$Por pouco não fui atropelado por um carro.$$),
    ('n2-grammar-77', $$もう少しで宿題が終わる。$$, $$もうすこしでしゅくだいがおわる。$$, $$Falta pouco para terminar a lição de casa.$$),
    ('n2-grammar-77', $$もうちょっとで優勝できたのに。$$, $$もうちょっとでゆうしょうできたのに。$$, $$Faltou pouco para eu vencer.$$),
    ('n2-grammar-77', $$もう少しで夏休みだ。$$, $$もうすこしでなつやすみだ。$$, $$Já estão quase chegando as férias de verão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____大事な書類を捨てるところだった。$$, $$Por pouco não joguei fora um documento importante.$$),
        (2, $$____試験に遅れるところだった。$$, $$Quase me atrasei para a prova.$$),
        (3, $$____階段から落ちるところだった。$$, $$Por pouco não caí da escada.$$),
        (4, $$____この仕事も終わります。$$, $$Falta pouco para este trabalho também terminar.$$),
        (5, $$____彼女の誕生日だ。$$, $$Já está quase no aniversário dela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-77', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$もう少しで$$),
        (1, $$もうすこしで$$),
        (1, $$もうちょっとで$$),
        (2, $$もう少しで$$),
        (2, $$もうすこしで$$),
        (2, $$もうちょっとで$$),
        (3, $$もう少しで$$),
        (3, $$もうすこしで$$),
        (3, $$もうちょっとで$$),
        (4, $$もう少しで$$),
        (4, $$もうすこしで$$),
        (4, $$もうちょっとで$$),
        (5, $$もう少しで$$),
        (5, $$もうすこしで$$),
        (5, $$もうちょっとで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-78 — 〜ないではいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-78',
    'grammar',
    'N2',
    $$〜ないではいられない$$,
    $$nai dewa irarenai$$,
    $$Não consigo deixar de / Não dá para não / Não resisto a$$,
    $$ないではいられない indica que a pessoa não consegue se controlar e acaba fazendo algo, mesmo sem querer. Equivale a "não consigo deixar de" ou "não resisto a".

A ação acontece de forma natural ou por um sentimento forte. Por exemplo, "vendo aquela cena, não consegui deixar de chorar".

É uma expressão um pouco formal. A forma ずにはいられない tem o mesmo sentido.$$,
    $$O sujeito costuma ser a primeira pessoa. Para outras pessoas, usa-se ようだ ou らしい no final.

É parecido com ずにはいられない, que é um pouco mais formal.

Costuma vir com verbos de reação, como 笑う, 泣く, 言う ou 心配する.$$,
    $$Verbo (forma ない sem ない) + ないではいられない
する → しないではいられない$$,
    $$ないではいられない$$,
    $$ないではいられない|ないではいられなかった|ないではいられません$$,
    ARRAY['ない', 'では', 'いられない']::text[],
    ARRAY['ないではいられない', 'ないではいられなかった', 'ないではいられません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-78', $$その映画を見て、泣かないではいられなかった。$$, $$そのえいがをみて、なかないではいられなかった。$$, $$Vendo aquele filme, não consegui deixar de chorar.$$),
    ('n2-grammar-78', $$彼の話があまりに面白くて、笑わないではいられない。$$, $$かれのはなしがあまりにおもしろくて、わらわないではいられない。$$, $$A história dele é tão engraçada que não dá para não rir.$$),
    ('n2-grammar-78', $$困っている人を見ると、助けないではいられない。$$, $$こまっているひとをみると、たすけないではいられない。$$, $$Quando vejo alguém em dificuldade, não consigo deixar de ajudar.$$),
    ('n2-grammar-78', $$子供のことを心配しないではいられません。$$, $$こどものことをしんぱいしないではいられません。$$, $$Não consigo deixar de me preocupar com meu filho.$$),
    ('n2-grammar-78', $$甘いものを見ると、食べないではいられない。$$, $$あまいものをみると、たべないではいられない。$$, $$Quando vejo doce, não resisto a comer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ひどい話を聞いて、怒ら____。$$, $$Ouvindo uma história horrível, não consegui deixar de ficar com raiva.$$),
        (2, $$この歌を聞くと、踊ら____。$$, $$Quando ouço esta música, não resisto a dançar.$$),
        (3, $$彼の態度には、一言言わ____。$$, $$Com aquela atitude dele, não consigo deixar de dizer alguma coisa.$$),
        (4, $$結果が気になって、確かめ____。$$, $$Estava tão curioso com o resultado que não consegui deixar de conferir.$$),
        (5, $$かわいい猫を見ると、触ら____。$$, $$Quando vejo um gato fofo, não resisto a fazer carinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-78', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないではいられなかった$$),
        (2, $$ないではいられない$$),
        (2, $$ないではいられません$$),
        (3, $$ないではいられない$$),
        (3, $$ないではいられません$$),
        (4, $$ないではいられなかった$$),
        (5, $$ないではいられない$$),
        (5, $$ないではいられません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-79 — 〜ないことには〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-79',
    'grammar',
    'N2',
    $$〜ないことには〜ない$$,
    $$nai koto niwa ~ nai$$,
    $$Se não... não / Sem... não dá / A menos que$$,
    $$ないことには〜ない indica que, se uma condição não for cumprida, algo não vai acontecer ou não vai ser possível. Equivale a "se não..., não..." ou "sem..., não dá".

A primeira parte mostra uma condição necessária. A segunda parte é sempre negativa. Por exemplo, "se não experimentar, não dá para saber se é gostoso".

É uma expressão que reforça a importância da condição.$$,
    $$A segunda parte costuma ser わからない, できない, 始まらない ou 話にならない.

É parecido com なければ〜ない, mas ないことには dá mais ênfase à condição.$$,
    $$Verbo (forma ない) + ことには + Frase negativa
Adjetivo い (forma くない) + ことには + Frase negativa
Adjetivo な / Substantivo + でない + ことには + Frase negativa$$,
    $$ないことには$$,
    $$ないことには$$,
    ARRAY['ない', 'こと', 'には']::text[],
    ARRAY['ないことには', 'でないことには']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-79', $$実際に食べてみないことには、おいしいかどうかわからない。$$, $$じっさいにたべてみないことには、おいしいかどうかわからない。$$, $$Se não experimentar de verdade, não dá para saber se é gostoso.$$),
    ('n2-grammar-79', $$社長が来ないことには、会議が始められない。$$, $$しゃちょうがこないことには、かいぎがはじめられない。$$, $$Se o presidente não vier, não dá para começar a reunião.$$),
    ('n2-grammar-79', $$お金がないことには、何もできない。$$, $$おかねがないことには、なにもできない。$$, $$Sem dinheiro, não dá para fazer nada.$$),
    ('n2-grammar-79', $$健康でないことには、仕事も楽しめない。$$, $$けんこうでないことには、しごともたのしめない。$$, $$Sem saúde, não dá para aproveitar nem o trabalho.$$),
    ('n2-grammar-79', $$本人に会わないことには、何とも言えない。$$, $$ほんにんにあわないことには、なんともいえない。$$, $$Se eu não encontrar a pessoa, não posso dizer nada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$練習し____、上手にならない。$$, $$Se não praticar, não vai melhorar.$$),
        (2, $$やってみ____、結果はわからない。$$, $$Se não tentar, não dá para saber o resultado.$$),
        (3, $$天気がよくなら____、出発できない。$$, $$Se o tempo não melhorar, não dá para partir.$$),
        (4, $$詳しい話を聞か____、判断できない。$$, $$Se eu não ouvir os detalhes, não posso decidir.$$),
        (5, $$パスポートが____、海外には行けない。$$, $$Sem passaporte, não dá para ir ao exterior.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないことには$$),
        (2, $$ないことには$$),
        (3, $$ないことには$$),
        (4, $$ないことには$$),
        (5, $$ないことには$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-80 — 〜中を / 〜中では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-80',
    'grammar',
    'N2',
    $$〜中を / 〜中では$$,
    $$naka wo / naka dewa$$,
    $$Em meio a / Debaixo de / Apesar de$$,
    $$中を indica que uma ação acontece em meio a uma situação, geralmente difícil ou desfavorável. Equivale a "em meio a" ou "debaixo de". Por exemplo, "correu debaixo de chuva forte".

Também é muito usado em agradecimentos formais, como "obrigado por ter vindo apesar de estar tão ocupado". Nesse caso, mostra respeito pelo esforço da outra pessoa.

中では indica a situação em que algo acontece ou é avaliado, com o sentido de "nessa situação" ou "nesse contexto".$$,
    $$As expressões お忙しい中を e お足元の悪い中を são muito usadas em discursos e cartas.

Nesse uso, 中 é lido なか. Não se confunde com 中 lido ちゅう, como em 会議中.$$,
    $$Substantivo + の + 中を
Verbo (forma simples) + 中を
Adjetivo い / Adjetivo な + な + 中を
Substantivo + の + 中では$$,
    $$中を$$,
    $$中を|中では|なかを$$,
    ARRAY['中', 'を']::text[],
    ARRAY['中を', '中では', 'お忙しい中を']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-80', $$お忙しい中を、来ていただきありがとうございます。$$, $$おいそがしいなかを、きていただきありがとうございます。$$, $$Obrigado por ter vindo apesar de estar tão ocupado.$$),
    ('n2-grammar-80', $$激しい雨の中を、彼は走って帰った。$$, $$はげしいあめのなかを、かれははしってかえった。$$, $$Ele voltou correndo debaixo de uma chuva forte.$$),
    ('n2-grammar-80', $$寒い中を、長い時間待たせてしまった。$$, $$さむいなかを、ながいじかんまたせてしまった。$$, $$Fiz você esperar muito tempo nesse frio.$$),
    ('n2-grammar-80', $$皆が見守る中を、選手が入場した。$$, $$みながみまもるなかを、せんしゅがにゅうじょうした。$$, $$Os atletas entraram em meio aos olhares de todos.$$),
    ('n2-grammar-80', $$厳しい状況の中では、助け合うことが大切だ。$$, $$きびしいじょうきょうのなかでは、たすけあうことがたいせつだ。$$, $$Em meio a uma situação difícil, é importante se ajudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$お足元の悪い____、お越しいただきありがとうございます。$$, $$Obrigado por ter vindo apesar do mau tempo.$$),
        (2, $$大雪の____、救助隊が出発した。$$, $$A equipe de resgate partiu em meio à forte neve.$$),
        (3, $$多くの人が注目する____、彼はスピーチを始めた。$$, $$Ele começou o discurso em meio à atenção de muitas pessoas.$$),
        (4, $$暑い____、手伝ってくれてありがとう。$$, $$Obrigado por me ajudar nesse calor.$$),
        (5, $$このような状況の____、計画を変えるしかない。$$, $$Em meio a uma situação como esta, só resta mudar os planos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-80', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$中を$$),
        (2, $$中を$$),
        (3, $$中を$$),
        (4, $$中を$$),
        (5, $$中では$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-81 — 〜なくはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-81',
    'grammar',
    'N2',
    $$〜なくはない$$,
    $$naku wa nai$$,
    $$Não é que não / Até que dá para / Não deixa de$$,
    $$なくはない é uma dupla negação que expressa uma afirmação fraca ou com hesitação. Equivale a "não é que não..." ou "até que dá para...".

A pessoa admite que algo é possível ou verdadeiro, mas sem muita certeza ou entusiasmo. Por exemplo, "não é que eu não entenda o sentimento dele" ou "até que dá para comer".

Também aparece como ないこともない, com o mesmo sentido.$$,
    $$É uma forma indireta e educada de concordar parcialmente.

A forma ないこともない é muito parecida e também bastante usada.

Costuma vir com verbos de possibilidade, como できる, わかる ou 食べられる.$$,
    $$Verbo (forma ない sem ない) + なくはない
Substantivo + が + なくはない$$,
    $$なくはない$$,
    $$なくはない|なくもない|ないこともない$$,
    ARRAY['なく', 'は', 'ない']::text[],
    ARRAY['なくはない', 'なくもない', 'ないこともない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-81', $$彼の気持ちもわからなくはない。$$, $$かれのきもちもわからなくはない。$$, $$Não é que eu não entenda o sentimento dele.$$),
    ('n2-grammar-81', $$辛い料理も食べられなくはない。$$, $$からいりょうりもたべられなくはない。$$, $$Até que dá para eu comer comida apimentada.$$),
    ('n2-grammar-81', $$急げば、間に合わなくはない。$$, $$いそげば、まにあわなくはない。$$, $$Se correr, até que dá para chegar a tempo.$$),
    ('n2-grammar-81', $$この問題は難しいけど、解けなくはない。$$, $$このもんだいはむずかしいけど、とけなくはない。$$, $$Este problema é difícil, mas até que dá para resolver.$$),
    ('n2-grammar-81', $$一人で行けないこともない。$$, $$ひとりでいけないこともない。$$, $$Não é que eu não consiga ir sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頑張れば、一日で終わら____。$$, $$Se eu me esforçar, até que dá para terminar em um dia.$$),
        (2, $$お酒は飲め____が、あまり好きではない。$$, $$Não é que eu não consiga beber, mas não gosto muito.$$),
        (3, $$彼の言うことも理解でき____。$$, $$Até que dá para entender o que ele diz.$$),
        (4, $$車で行けば、行け____。$$, $$Indo de carro, até que dá para ir.$$),
        (5, $$その意見に賛成でき____。$$, $$Não é que eu não possa concordar com essa opinião.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-81', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくはない$$),
        (1, $$なくもない$$),
        (1, $$ないこともない$$),
        (2, $$なくはない$$),
        (2, $$なくもない$$),
        (2, $$ないこともない$$),
        (3, $$なくはない$$),
        (3, $$なくもない$$),
        (3, $$ないこともない$$),
        (4, $$なくはない$$),
        (4, $$なくもない$$),
        (4, $$ないこともない$$),
        (5, $$なくはない$$),
        (5, $$なくもない$$),
        (5, $$ないこともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-82 — 〜なくて済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-82',
    'grammar',
    'N2',
    $$〜なくて済む$$,
    $$nakute sumu$$,
    $$Não precisar / Dispensar / Livrar-se de$$,
    $$なくて済む indica que não foi preciso fazer algo que normalmente seria necessário. Equivale a "não precisar" ou "se livrar de fazer".

Muitas vezes mostra alívio, porque a pessoa evitou um trabalho, um gasto ou um problema. Por exemplo, "como ele me deu carona, não precisei pegar táxi".

A forma ないで済む tem o mesmo sentido.$$,
    $$É parecido com ずに済む, que é mais formal.

No passado, なくて済んだ mostra alívio por não ter precisado fazer algo.$$,
    $$Verbo (forma ない sem ない) + なくて済む
Verbo (forma ない) + で済む$$,
    $$なくて済む$$,
    $$なくて済|なくてすむ|なくてすん|ないで済|ないですむ|ないですん$$,
    ARRAY['なくて', '済む']::text[],
    ARRAY['なくて済む', 'なくて済んだ', 'ないで済む', 'ないで済んだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-82', $$友達が車で送ってくれたので、タクシーに乗らなくて済んだ。$$, $$ともだちがくるまでおくってくれたので、タクシーにのらなくてすんだ。$$, $$Como um amigo me deu carona, não precisei pegar táxi.$$),
    ('n2-grammar-82', $$早く気づいたので、大きな問題にならなくて済んだ。$$, $$はやくきづいたので、おおきなもんだいにならなくてすんだ。$$, $$Como percebemos cedo, não virou um grande problema.$$),
    ('n2-grammar-82', $$近くに住めば、毎朝早く起きなくて済む。$$, $$ちかくにすめば、まいあさはやくおきなくてすむ。$$, $$Se morar perto, não vai precisar acordar cedo toda manhã.$$),
    ('n2-grammar-82', $$ネットで買えば、店まで行かないで済む。$$, $$ネットでかえば、みせまでいかないですむ。$$, $$Comprando pela internet, você não precisa ir até a loja.$$),
    ('n2-grammar-82', $$雨がやんだので、傘を買わなくて済んだ。$$, $$あめがやんだので、かさをかわなくてすんだ。$$, $$Como a chuva parou, não precisei comprar guarda-chuva.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$母が手伝ってくれたので、徹夜し____。$$, $$Como minha mãe me ajudou, não precisei virar a noite.$$),
        (2, $$予約しておけば、並ば____。$$, $$Se fizer reserva, não vai precisar esperar na fila.$$),
        (3, $$けががひどくなかったので、入院し____。$$, $$Como o ferimento não foi grave, não precisei ser internado.$$),
        (4, $$自炊すれば、外食にお金を使わ____。$$, $$Se cozinhar em casa, não precisa gastar dinheiro comendo fora.$$),
        (5, $$先に連絡したので、謝ら____。$$, $$Como avisei antes, não precisei pedir desculpas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なくて済んだ$$),
        (1, $$ないで済んだ$$),
        (2, $$なくて済む$$),
        (2, $$ないで済む$$),
        (3, $$なくて済んだ$$),
        (3, $$ないで済んだ$$),
        (4, $$なくて済む$$),
        (4, $$ないで済む$$),
        (5, $$なくて済んだ$$),
        (5, $$ないで済んだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-83 — 何も〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-83',
    'grammar',
    'N2',
    $$何も〜ない$$,
    $$nani mo ~ nai$$,
    $$Nada / Coisa nenhuma / Nenhum$$,
    $$何も junto com uma forma negativa indica negação total, com o sentido de "nada" ou "coisa nenhuma". Por exemplo, "não comi nada hoje".

Também aparece em expressões como 何も〜ことはない, que significa "não há necessidade nenhuma de...". Por exemplo, "não precisa chorar tanto".

É uma expressão básica, mas muito usada para reforçar a negação.$$,
    $$Com partículas como で ou に, a forma muda: 何でも não é negativa, e 何にも significa "em nada".

No uso 何も〜ことはない, a expressão tem um tom de conselho ou consolo.$$,
    $$何も + Verbo (forma ない)
何も + Verbo (forma dicionário) + ことはない (não há necessidade)$$,
    $$何も〜ない$$,
    $$何も|なにも$$,
    ARRAY['何', 'も', 'ない']::text[],
    ARRAY['何も〜ない', '何も〜ません', '何も〜ことはない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-83', $$今日は朝から何も食べていない。$$, $$きょうはあさからなにもたべていない。$$, $$Hoje não comi nada desde a manhã.$$),
    ('n2-grammar-83', $$その件については何も知りません。$$, $$そのけんについてはなにもしりません。$$, $$Não sei nada sobre esse assunto.$$),
    ('n2-grammar-83', $$何も心配することはないよ。$$, $$なにもしんぱいすることはないよ。$$, $$Não há nada com que se preocupar.$$),
    ('n2-grammar-83', $$部屋には何もなかった。$$, $$へやにはなにもなかった。$$, $$Não havia nada no quarto.$$),
    ('n2-grammar-83', $$何もそんなに怒ることはない。$$, $$なにもそんなにおこることはない。$$, $$Não precisa ficar tão bravo assim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は____言わずに帰ってしまった。$$, $$Ele foi embora sem dizer nada.$$),
        (2, $$昨日のことは____覚えていない。$$, $$Não me lembro de nada de ontem.$$),
        (3, $$冷蔵庫の中には____ない。$$, $$Não tem nada na geladeira.$$),
        (4, $$____泣くことはないじゃないか。$$, $$Não precisa chorar, não é?$$),
        (5, $$週末は____予定がない。$$, $$Não tenho nenhum compromisso no fim de semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-83', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$何も$$),
        (1, $$なにも$$),
        (2, $$何も$$),
        (2, $$なにも$$),
        (3, $$何も$$),
        (3, $$なにも$$),
        (4, $$何も$$),
        (4, $$なにも$$),
        (5, $$何も$$),
        (5, $$なにも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-84 — なお
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-84',
    'grammar',
    'N2',
    $$なお$$,
    $$nao$$,
    $$Além disso / Observação / Ainda mais$$,
    $$なお tem dois usos principais.

O primeiro é no começo de uma frase, para acrescentar uma informação complementar. Equivale a "além disso" ou "observação". É muito usado em avisos, e-mails e documentos formais. Por exemplo, "além disso, o estacionamento não está disponível".

O segundo é como advérbio, com o sentido de "ainda mais" ou "mais ainda". Por exemplo, "se você puder vir, será ainda melhor".$$,
    $$No uso de complemento, é parecido com ちなみに, mas なお é mais formal.

No uso de advérbio, é parecido com さらに e もっと.

A expressão なおさら significa "mais ainda".$$,
    $$Frase + なお、 + Informação complementar
なお + Adjetivo / Verbo (ainda mais)$$,
    $$なお$$,
    $$なお$$,
    ARRAY['なお']::text[],
    ARRAY['なお', 'なおさら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-84', $$会議は三時からです。なお、駐車場はありません。$$, $$かいぎはさんじからです。なお、ちゅうしゃじょうはありません。$$, $$A reunião é a partir das três. Além disso, não há estacionamento.$$),
    ('n2-grammar-84', $$申し込みは今月末までです。なお、詳細はホームページをご覧ください。$$, $$もうしこみはこんげつまつまでです。なお、しょうさいはホームページをごらんください。$$, $$As inscrições vão até o fim do mês. Para detalhes, veja o site.$$),
    ('n2-grammar-84', $$薬を飲んだが、なお熱が下がらない。$$, $$くすりをのんだが、なおねつがさがらない。$$, $$Tomei o remédio, mas a febre ainda não baixou.$$),
    ('n2-grammar-84', $$来てくれれば、なおうれしい。$$, $$きてくれれば、なおうれしい。$$, $$Se você vier, ficarei ainda mais feliz.$$),
    ('n2-grammar-84', $$説明を聞いて、なおさらわからなくなった。$$, $$せつめいをきいて、なおさらわからなくなった。$$, $$Ouvindo a explicação, fiquei ainda mais confuso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試験は九時に始まります。____、遅刻した人は入室できません。$$, $$A prova começa às nove. Além disso, quem se atrasar não poderá entrar.$$),
        (2, $$参加費は無料です。____、飲み物は各自でご用意ください。$$, $$A participação é gratuita. Observação: cada um deve trazer sua própria bebida.$$),
        (3, $$少し休んだが、____疲れが取れない。$$, $$Descansei um pouco, mas o cansaço ainda não passou.$$),
        (4, $$安くて、おいしければ____いい。$$, $$Se for barato e gostoso, melhor ainda.$$),
        (5, $$本日は休業です。____、明日は通常通り営業します。$$, $$Hoje estamos fechados. Além disso, amanhã funcionaremos normalmente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-84', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$なお$$),
        (2, $$なお$$),
        (3, $$なお$$),
        (4, $$なお$$),
        (5, $$なお$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-85 — 〜ねばならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-85',
    'grammar',
    'N2',
    $$〜ねばならない$$,
    $$neba naranai$$,
    $$Ter que / Ser preciso / Dever$$,
    $$ねばならない indica obrigação ou necessidade. Equivale a "ter que" ou "ser preciso".

Tem o mesmo sentido de なければならない, mas é uma forma antiga e formal, mais usada na escrita, em discursos e em textos sérios.

Por exemplo, "temos que proteger o meio ambiente".$$,
    $$Atenção à forma de する, que vira せねばならない e não しねばならない.

Na fala do dia a dia, usa-se mais なければならない ou なきゃ.

A forma ねばならぬ é ainda mais antiga e formal.$$,
    $$Verbo (forma ない sem ない) + ねばならない
する → せねばならない
来る → 来ねばならない$$,
    $$ねばならない$$,
    $$ねばならない|ねばならぬ|ねばなりません|ねばならなかった$$,
    ARRAY['ね', 'ば', 'ならない']::text[],
    ARRAY['ねばならない', 'ねばならぬ', 'ねばなりません', 'せねばならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-85', $$私たちは環境を守らねばならない。$$, $$わたしたちはかんきょうをまもらねばならない。$$, $$Nós temos que proteger o meio ambiente.$$),
    ('n2-grammar-85', $$この問題は早く解決せねばならない。$$, $$このもんだいははやくかいけつせねばならない。$$, $$Este problema precisa ser resolvido logo.$$),
    ('n2-grammar-85', $$約束は守らねばならぬ。$$, $$やくそくはまもらねばならぬ。$$, $$Promessas devem ser cumpridas.$$),
    ('n2-grammar-85', $$明日までにレポートを出さねばなりません。$$, $$あしたまでにレポートをださねばなりません。$$, $$Tenho que entregar o relatório até amanhã.$$),
    ('n2-grammar-85', $$彼は家族のために働かねばならなかった。$$, $$かれはかぞくのためにはたらかねばならなかった。$$, $$Ele teve que trabalhar pela família.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$今日中にこの仕事を終わら____。$$, $$Tenho que terminar este trabalho ainda hoje.$$),
        (2, $$国民は法律を守ら____。$$, $$Os cidadãos devem obedecer às leis.$$),
        (3, $$この計画は見直さ____。$$, $$Este plano precisa ser revisto.$$),
        (4, $$もっと努力せ____。$$, $$Preciso me esforçar mais.$$),
        (5, $$子供の安全を第一に考え____。$$, $$É preciso pensar em primeiro lugar na segurança das crianças.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-85', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ねばならない$$),
        (1, $$ねばなりません$$),
        (1, $$ねばならぬ$$),
        (2, $$ねばならない$$),
        (2, $$ねばなりません$$),
        (2, $$ねばならぬ$$),
        (3, $$ねばならない$$),
        (3, $$ねばなりません$$),
        (3, $$ねばならぬ$$),
        (4, $$ねばならない$$),
        (4, $$ねばなりません$$),
        (4, $$ねばならぬ$$),
        (5, $$ねばならない$$),
        (5, $$ねばなりません$$),
        (5, $$ねばならぬ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-86 — 〜にあたって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-86',
    'grammar',
    'N2',
    $$〜にあたって$$,
    $$ni atatte$$,
    $$Por ocasião de / Ao / No momento de$$,
    $$にあたって indica um momento importante ou especial em que algo é feito. Equivale a "por ocasião de" ou "ao".

É usado antes de começar algo significativo, como uma viagem, um novo trabalho, uma cerimônia ou uma mudança. A segunda parte costuma falar de uma preparação, um cuidado ou uma mensagem. Por exemplo, "ao começar o novo ano letivo, o diretor fez um discurso".

É uma expressão formal, comum em discursos e documentos.$$,
    $$にあたり é ainda mais formal.

É parecido com に際して, mas にあたって destaca um momento especial ou uma etapa importante.

Não se usa para situações comuns do dia a dia.$$,
    $$Substantivo + にあたって / にあたり
Verbo (forma dicionário) + にあたって / にあたり$$,
    $$にあたって$$,
    $$にあたって|にあたり|に当たって|に当たり$$,
    ARRAY['に', 'あたって']::text[],
    ARRAY['にあたって', 'にあたり', 'に当たって', 'にあたっての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-86', $$留学するにあたって、両親に相談した。$$, $$りゅうがくするにあたって、りょうしんにそうだんした。$$, $$Ao decidir estudar no exterior, conversei com meus pais.$$),
    ('n2-grammar-86', $$新年を迎えるにあたって、目標を立てた。$$, $$しんねんをむかえるにあたって、もくひょうをたてた。$$, $$Por ocasião do Ano-Novo, estabeleci metas.$$),
    ('n2-grammar-86', $$開会にあたり、一言ご挨拶申し上げます。$$, $$かいかいにあたり、ひとことごあいさつもうしあげます。$$, $$Na abertura, gostaria de dizer algumas palavras.$$),
    ('n2-grammar-86', $$工事を始めるにあたって、近所に説明をした。$$, $$こうじをはじめるにあたって、きんじょにせつめいをした。$$, $$Ao começar a obra, demos explicações aos vizinhos.$$),
    ('n2-grammar-86', $$引っ越しにあたって、いらない物を捨てた。$$, $$ひっこしにあたって、いらないものをすてた。$$, $$Por ocasião da mudança, joguei fora as coisas que não precisava.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$新しい店を開く____、たくさん準備をした。$$, $$Ao abrir a nova loja, fizemos muitos preparativos.$$),
        (2, $$卒業____、先生にお礼の手紙を書いた。$$, $$Por ocasião da formatura, escrevi uma carta de agradecimento ao professor.$$),
        (3, $$契約を結ぶ____、内容をよく確認してください。$$, $$Ao firmar o contrato, verifique bem o conteúdo.$$),
        (4, $$結婚する____、家を買った。$$, $$Por ocasião do casamento, compramos uma casa.$$),
        (5, $$試合を始める____、選手たちが握手をした。$$, $$No momento de começar a partida, os jogadores trocaram apertos de mão.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-86', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にあたって$$),
        (1, $$にあたり$$),
        (1, $$に当たって$$),
        (1, $$に当たり$$),
        (2, $$にあたって$$),
        (2, $$にあたり$$),
        (2, $$に当たって$$),
        (2, $$に当たり$$),
        (3, $$にあたって$$),
        (3, $$にあたり$$),
        (3, $$に当たって$$),
        (3, $$に当たり$$),
        (4, $$にあたって$$),
        (4, $$にあたり$$),
        (4, $$に当たって$$),
        (4, $$に当たり$$),
        (5, $$にあたって$$),
        (5, $$にあたり$$),
        (5, $$に当たって$$),
        (5, $$に当たり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-87 — 〜にほかならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-87',
    'grammar',
    'N2',
    $$〜にほかならない$$,
    $$ni hoka naranai$$,
    $$Não é nada mais que / É justamente / Nada além de$$,
    $$にほかならない serve para afirmar com muita certeza que algo é exatamente aquilo, e nada mais. Equivale a "não é nada mais que" ou "é justamente".

Muitas vezes é usado para explicar a causa verdadeira de algo. Por exemplo, "o sucesso dele não é nada mais que fruto do esforço".

É uma expressão formal e enfática, comum em textos e discursos.$$,
    $$Costuma aparecer como からにほかならない para explicar uma razão.

É parecido com にすぎない na forma, mas o sentido é diferente. にすぎない diminui a importância, enquanto にほかならない reforça.$$,
    $$Substantivo + にほかならない
Frase + から + にほかならない
Frase + ため + にほかならない$$,
    $$にほかならない$$,
    $$にほかならない|に他ならない|にほかなりません|に他なりません$$,
    ARRAY['に', 'ほか', 'ならない']::text[],
    ARRAY['にほかならない', 'に他ならない', 'にほかなりません', 'からにほかならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-87', $$彼の成功は努力の結果にほかならない。$$, $$かれのせいこうはどりょくのけっかにほかならない。$$, $$O sucesso dele não é nada mais que fruto do esforço.$$),
    ('n2-grammar-87', $$親が厳しいのは、子供を愛しているからにほかならない。$$, $$おやがきびしいのは、こどもをあいしているからにほかならない。$$, $$Os pais são rígidos justamente porque amam os filhos.$$),
    ('n2-grammar-87', $$この事故は不注意にほかならない。$$, $$このじこはふちゅういにほかならない。$$, $$Este acidente não é nada mais que descuido.$$),
    ('n2-grammar-87', $$私がここまで来られたのは、皆さんのおかげにほかなりません。$$, $$わたしがここまでこられたのは、みなさんのおかげにほかなりません。$$, $$Se cheguei até aqui, foi justamente graças a todos vocês.$$),
    ('n2-grammar-87', $$それは言い訳に他ならない。$$, $$それはいいわけにほかならない。$$, $$Isso não é nada além de uma desculpa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼が怒ったのは、あなたを心配したから____。$$, $$Ele ficou bravo justamente porque se preocupou com você.$$),
        (2, $$この結果は、チーム全員の協力____。$$, $$Este resultado não é nada mais que a cooperação de toda a equipe.$$),
        (3, $$戦争は人間の愚かさ____。$$, $$A guerra não é nada além da estupidez humana.$$),
        (4, $$彼が合格できたのは、毎日勉強したから____。$$, $$Ele passou justamente porque estudou todos os dias.$$),
        (5, $$教育とは、未来への投資____。$$, $$A educação não é nada mais que um investimento no futuro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-87', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にほかならない$$),
        (1, $$に他ならない$$),
        (1, $$にほかなりません$$),
        (1, $$に他なりません$$),
        (2, $$にほかならない$$),
        (2, $$に他ならない$$),
        (2, $$にほかなりません$$),
        (2, $$に他なりません$$),
        (3, $$にほかならない$$),
        (3, $$に他ならない$$),
        (3, $$にほかなりません$$),
        (3, $$に他なりません$$),
        (4, $$にほかならない$$),
        (4, $$に他ならない$$),
        (4, $$にほかなりません$$),
        (4, $$に他なりません$$),
        (5, $$にほかならない$$),
        (5, $$に他ならない$$),
        (5, $$にほかなりません$$),
        (5, $$に他なりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-88 — 〜に限らず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-88',
    'grammar',
    'N2',
    $$〜に限らず$$,
    $$ni kagirazu$$,
    $$Não só / Não apenas / Não se limita a$$,
    $$に限らず indica que algo não se aplica apenas a um caso, mas a vários outros também. Equivale a "não só" ou "não apenas".

A pessoa dá um exemplo e depois amplia a ideia para um grupo maior. Por exemplo, "não só os jovens, mas também os idosos usam smartphones".

Depois de に限らず, costuma aparecer も ou palavras como みんな, どこでも ou いつでも.$$,
    $$É parecido com だけでなく e のみならず, mas に限らず é mais formal que だけでなく.

Não é o mesmo que に限る, que significa "o melhor é".$$,
    $$Substantivo + に限らず + Frase (com も / みんな / 誰でも)$$,
    $$に限らず$$,
    $$に限らず|にかぎらず$$,
    ARRAY['に', '限らず']::text[],
    ARRAY['に限らず', 'にかぎらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-88', $$若者に限らず、お年寄りもスマホを使っている。$$, $$わかものにかぎらず、おとしよりもスマホをつかっている。$$, $$Não só os jovens, mas também os idosos usam smartphone.$$),
    ('n2-grammar-88', $$この店は週末に限らず、いつも混んでいる。$$, $$このみせはしゅうまつにかぎらず、いつもこんでいる。$$, $$Esta loja não fica cheia só no fim de semana, está sempre lotada.$$),
    ('n2-grammar-88', $$日本に限らず、多くの国で少子化が問題になっている。$$, $$にほんにかぎらず、おおくのくにでしょうしかがもんだいになっている。$$, $$Não apenas no Japão, mas em muitos países a baixa natalidade é um problema.$$),
    ('n2-grammar-88', $$このゲームは子供に限らず、大人にも人気がある。$$, $$このゲームはこどもにかぎらず、おとなにもにんきがある。$$, $$Este jogo é popular não só entre crianças, mas também entre adultos.$$),
    ('n2-grammar-88', $$料理に限らず、彼女は何でも上手だ。$$, $$りょうりにかぎらず、かのじょはなんでもじょうずだ。$$, $$Não só na cozinha, ela é boa em tudo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この公園は休日____、平日も人が多い。$$, $$Este parque não tem muita gente só nos feriados, nos dias úteis também.$$),
        (2, $$男性____、女性もこの仕事に応募できる。$$, $$Não apenas homens, mulheres também podem se candidatar a este trabalho.$$),
        (3, $$東京____、大都市はどこも家賃が高い。$$, $$Não só em Tóquio, em todas as grandes cidades o aluguel é caro.$$),
        (4, $$スポーツ____、彼は音楽も得意だ。$$, $$Não só nos esportes, ele também é bom em música.$$),
        (5, $$この問題は学生____、誰にでも起こりうる。$$, $$Este problema não se limita a estudantes, pode acontecer com qualquer pessoa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-88', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限らず$$),
        (1, $$にかぎらず$$),
        (2, $$に限らず$$),
        (2, $$にかぎらず$$),
        (3, $$に限らず$$),
        (3, $$にかぎらず$$),
        (4, $$に限らず$$),
        (4, $$にかぎらず$$),
        (5, $$に限らず$$),
        (5, $$にかぎらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-89 — 〜に限る
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-89',
    'grammar',
    'N2',
    $$〜に限る$$,
    $$ni kagiru$$,
    $$O melhor é / Nada como / Não há nada melhor que$$,
    $$に限る expressa a opinião pessoal de que algo é a melhor opção numa situação. Equivale a "o melhor é" ou "nada como".

Por exemplo, "num dia quente, nada como uma cerveja gelada" ou "quando se está cansado, o melhor é dormir".

Também pode significar "limitado a", em avisos e regras, como "limitado a membros".$$,
    $$No uso de opinião, a frase costuma começar com uma situação, como 疲れた時は ou 夏は.

No uso de limite, aparece em avisos, como 会員に限る ou 先着百名に限る.$$,
    $$Substantivo + に限る
Verbo (forma dicionário / forma ない) + に限る$$,
    $$に限る$$,
    $$に限る|にかぎる|に限ります|に限り$$,
    ARRAY['に', '限る']::text[],
    ARRAY['に限る', 'にかぎる', 'に限ります', 'に限り']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-89', $$暑い日は冷たいビールに限る。$$, $$あついひはつめたいビールにかぎる。$$, $$Num dia quente, nada como uma cerveja gelada.$$),
    ('n2-grammar-89', $$疲れた時は、早く寝るに限る。$$, $$つかれたときは、はやくねるにかぎる。$$, $$Quando se está cansado, o melhor é dormir cedo.$$),
    ('n2-grammar-89', $$風邪をひいたら、家で休むに限ります。$$, $$かぜをひいたら、いえでやすむにかぎります。$$, $$Quando se pega resfriado, o melhor é descansar em casa.$$),
    ('n2-grammar-89', $$面倒なことには関わらないに限る。$$, $$めんどうなことにはかかわらないにかぎる。$$, $$O melhor é não se envolver em coisas complicadas.$$),
    ('n2-grammar-89', $$参加は会員に限ります。$$, $$さんかはかいいんにかぎります。$$, $$A participação é limitada a membros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寒い日は温泉____。$$, $$Num dia frio, nada como uma fonte termal.$$),
        (2, $$ストレスがたまった時は、カラオケで歌う____。$$, $$Quando o estresse acumula, o melhor é cantar no karaokê.$$),
        (3, $$夏はやっぱりスイカ____。$$, $$No verão, nada como melancia.$$),
        (4, $$怪しいメールは開かない____。$$, $$O melhor é não abrir e-mails suspeitos.$$),
        (5, $$旅行は気の合う友達と行く____。$$, $$Para viajar, o melhor é ir com amigos com quem se tem afinidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-89', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限る$$),
        (1, $$にかぎる$$),
        (1, $$に限ります$$),
        (2, $$に限る$$),
        (2, $$にかぎる$$),
        (2, $$に限ります$$),
        (3, $$に限る$$),
        (3, $$にかぎる$$),
        (3, $$に限ります$$),
        (4, $$に限る$$),
        (4, $$にかぎる$$),
        (4, $$に限ります$$),
        (5, $$に限る$$),
        (5, $$にかぎる$$),
        (5, $$に限ります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-90 — 〜に限って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-90',
    'grammar',
    'N2',
    $$〜に限って$$,
    $$ni kagitte$$,
    $$Justo quando / Logo / Não é possível que$$,
    $$に限って tem dois usos principais.

O primeiro indica que algo ruim acontece justamente numa ocasião especial ou inoportuna. Equivale a "justo quando" ou "logo". Por exemplo, "justo no dia em que esqueci o guarda-chuva, choveu". O tom é de frustração.

O segundo expressa confiança total em alguém, com o sentido de "não é possível que essa pessoa...". Por exemplo, "meu filho não faria uma coisa dessas".$$,
    $$No primeiro uso, a frase costuma descrever algo inesperado e ruim.

No segundo uso, aparece muito como うちの子に限って, quando os pais defendem os filhos.

Não se confunde com に限らず, que significa "não só".$$,
    $$Substantivo + に限って
Verbo (forma simples) + 時 / 日 + に限って
Pessoa + に限って + Frase negativa (confiança)$$,
    $$に限って$$,
    $$に限って|にかぎって$$,
    ARRAY['に', '限って']::text[],
    ARRAY['に限って', 'にかぎって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-90', $$傘を持っていない日に限って、雨が降る。$$, $$かさをもっていないひにかぎって、あめがふる。$$, $$Justo no dia em que não estou com guarda-chuva, chove.$$),
    ('n2-grammar-90', $$急いでいる時に限って、電車が遅れる。$$, $$いそいでいるときにかぎって、でんしゃがおくれる。$$, $$Justo quando estou com pressa, o trem atrasa.$$),
    ('n2-grammar-90', $$うちの子に限って、そんなことはしません。$$, $$うちのこにかぎって、そんなことはしません。$$, $$Não é possível que meu filho faça uma coisa dessas.$$),
    ('n2-grammar-90', $$大事な試験の日に限って、熱が出た。$$, $$だいじなしけんのひにかぎって、ねつがでた。$$, $$Logo no dia da prova importante, tive febre.$$),
    ('n2-grammar-90', $$彼に限って、嘘をつくはずがない。$$, $$かれにかぎって、うそをつくはずがない。$$, $$Ele, de todas as pessoas, não mentiria.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$出かけようとする時____、電話がかかってくる。$$, $$Justo quando vou sair, o telefone toca.$$),
        (2, $$休みの日____、早く目が覚める。$$, $$Logo nos dias de folga, acordo cedo.$$),
        (3, $$真面目な彼____、遅刻するはずがない。$$, $$Não é possível que ele, tão sério, se atrase.$$),
        (4, $$デートの日____、寝坊してしまった。$$, $$Justo no dia do encontro, acabei dormindo demais.$$),
        (5, $$洗車した日____、雨が降る。$$, $$Justo no dia em que lavo o carro, chove.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-90', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に限って$$),
        (1, $$にかぎって$$),
        (2, $$に限って$$),
        (2, $$にかぎって$$),
        (3, $$に限って$$),
        (3, $$にかぎって$$),
        (4, $$に限って$$),
        (4, $$にかぎって$$),
        (5, $$に限って$$),
        (5, $$にかぎって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-91 — 〜に関わらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-91',
    'grammar',
    'N2',
    $$〜に関わらず$$,
    $$ni kakawarazu$$,
    $$Independentemente de / Seja qual for / Não importa$$,
    $$に関わらず indica que algo vale para todos os casos, sem depender de uma condição. Equivale a "independentemente de" ou "não importa".

Costuma vir depois de palavras que indicam diferença ou opostos, como idade, sexo, tempo, quantidade, ou de pares como "chover ou não chover". Por exemplo, "independentemente da idade, qualquer pessoa pode participar".

É uma expressão formal, muito usada em avisos e regras.$$,
    $$Pares comuns são 好き嫌いに関わらず, 経験の有無に関わらず e 参加するしないに関わらず.

É parecido com を問わず. Também pode ser escrito にかかわらず.

Não se confunde com にも関わらず, que significa "apesar de".$$,
    $$Substantivo (diferença / tipo) + に関わらず
Verbo (forma dicionário) + Verbo (forma ない) + に関わらず
Adjetivo い + Adjetivo い (forma ない) + に関わらず$$,
    $$に関わらず$$,
    $$に関わらず|にかかわらず|に関わりなく|にかかわりなく$$,
    ARRAY['に', '関わらず']::text[],
    ARRAY['に関わらず', 'にかかわらず', 'に関わりなく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-91', $$年齢に関わらず、誰でも参加できます。$$, $$ねんれいにかかわらず、だれでもさんかできます。$$, $$Independentemente da idade, qualquer pessoa pode participar.$$),
    ('n2-grammar-91', $$天気に関わらず、試合は行われます。$$, $$てんきにかかわらず、しあいはおこなわれます。$$, $$A partida será realizada seja qual for o tempo.$$),
    ('n2-grammar-91', $$経験の有無に関わらず、応募できます。$$, $$けいけんのうむにかかわらず、おうぼできます。$$, $$É possível se candidatar com ou sem experiência.$$),
    ('n2-grammar-91', $$好き嫌いにかかわらず、全部食べなさい。$$, $$すききらいにかかわらず、ぜんぶたべなさい。$$, $$Gostando ou não, coma tudo.$$),
    ('n2-grammar-91', $$参加するしないに関わらず、連絡してください。$$, $$さんかするしないにかかわらず、れんらくしてください。$$, $$Participando ou não, entre em contato.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$性別____、能力のある人を採用します。$$, $$Independentemente do sexo, contratamos pessoas capacitadas.$$),
        (2, $$雨が降る降らない____、イベントは開催します。$$, $$Chovendo ou não, o evento será realizado.$$),
        (3, $$国籍____、誰でも利用できます。$$, $$Independentemente da nacionalidade, qualquer pessoa pode usar.$$),
        (4, $$金額の大小____、寄付は大歓迎です。$$, $$Não importa se o valor é grande ou pequeno, doações são muito bem-vindas.$$),
        (5, $$昼夜____、この店は営業している。$$, $$Esta loja funciona seja de dia ou de noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関わらず$$),
        (1, $$にかかわらず$$),
        (1, $$に関わりなく$$),
        (2, $$に関わらず$$),
        (2, $$にかかわらず$$),
        (2, $$に関わりなく$$),
        (3, $$に関わらず$$),
        (3, $$にかかわらず$$),
        (3, $$に関わりなく$$),
        (4, $$に関わらず$$),
        (4, $$にかかわらず$$),
        (4, $$に関わりなく$$),
        (5, $$に関わらず$$),
        (5, $$にかかわらず$$),
        (5, $$に関わりなく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-92 — 〜に関わる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-92',
    'grammar',
    'N2',
    $$〜に関わる$$,
    $$ni kakawaru$$,
    $$Relacionado a / Que afeta / Que envolve$$,
    $$に関わる indica que algo tem uma relação direta e importante com outra coisa, muitas vezes de forma séria. Equivale a "relacionado a", "que afeta" ou "que envolve".

Costuma aparecer com palavras de grande peso, como vida, honra, futuro ou reputação. Por exemplo, "uma doença que põe a vida em risco" ou "um problema que afeta o futuro da empresa".

Também pode indicar participação em algo, como "trabalhar envolvido com educação".$$,
    $$Expressões comuns são 命に関わる, 名誉に関わる e 将来に関わる.

É parecido com に関する, mas に関わる transmite que a relação é séria ou que tem influência forte.$$,
    $$Substantivo + に関わる + Substantivo
Substantivo + に関わって + Verbo$$,
    $$に関わる$$,
    $$に関わる|にかかわる|に関わって|に関わった|に関わり$$,
    ARRAY['に', '関わる']::text[],
    ARRAY['に関わる', 'にかかわる', 'に関わって', 'に関わった', 'に関わります']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-92', $$これは命に関わる病気だ。$$, $$これはいのちにかかわるびょうきだ。$$, $$Esta é uma doença que põe a vida em risco.$$),
    ('n2-grammar-92', $$会社の将来に関わる問題なので、慎重に考えよう。$$, $$かいしゃのしょうらいにかかわるもんだいなので、しんちょうにかんがえよう。$$, $$É um problema que afeta o futuro da empresa, então vamos pensar com cuidado.$$),
    ('n2-grammar-92', $$彼は長年教育に関わる仕事をしている。$$, $$かれはながねんきょういくにかかわるしごとをしている。$$, $$Ele trabalha há muitos anos com educação.$$),
    ('n2-grammar-92', $$そんな失敗は店の評判に関わる。$$, $$そんなしっぱいはみせのひょうばんにかかわる。$$, $$Um erro desses afeta a reputação da loja.$$),
    ('n2-grammar-92', $$この事件に関わった人は全員調べられた。$$, $$このじけんにかかわったひとはぜんいんしらべられた。$$, $$Todas as pessoas envolvidas neste caso foram investigadas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$それは私の名誉____問題だ。$$, $$Isso é um problema que envolve a minha honra.$$),
        (2, $$子供の安全____ことは、すぐに対応すべきだ。$$, $$Questões que afetam a segurança das crianças devem ser tratadas imediatamente.$$),
        (3, $$彼女は環境保護____活動をしている。$$, $$Ela faz atividades relacionadas à proteção do meio ambiente.$$),
        (4, $$けがは軽く、命____ものではなかった。$$, $$O ferimento foi leve e não pôs a vida em risco.$$),
        (5, $$この決定は社員全員の生活____。$$, $$Esta decisão afeta a vida de todos os funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-92', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に関わる$$),
        (1, $$にかかわる$$),
        (2, $$に関わる$$),
        (2, $$にかかわる$$),
        (3, $$に関わる$$),
        (3, $$にかかわる$$),
        (4, $$に関わる$$),
        (4, $$にかかわる$$),
        (5, $$に関わる$$),
        (5, $$にかかわる$$),
        (5, $$に関わります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-93 — 〜に決まっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-93',
    'grammar',
    'N2',
    $$〜に決まっている$$,
    $$ni kimatte iru$$,
    $$Com certeza / É claro que / Só pode ser$$,
    $$に決まっている expressa uma certeza forte, baseada na opinião da pessoa que fala. Equivale a "com certeza" ou "é claro que".

A pessoa está tão convencida que não admite outra possibilidade. Por exemplo, "se ele não estudou, é claro que vai reprovar".

É uma expressão de conversa e transmite emoção. Na fala, aparece muito como に決まってる.$$,
    $$É mais subjetivo e emocional que に違いない.

Na fala informal, aparece como に決まってる ou に決まってるじゃん.$$,
    $$Verbo (forma simples) + に決まっている
Adjetivo い + に決まっている
Adjetivo な / Substantivo + に決まっている$$,
    $$に決まっている$$,
    $$に決まって|にきまって$$,
    ARRAY['に', '決まって', 'いる']::text[],
    ARRAY['に決まっている', 'に決まってる', 'に決まっています']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-93', $$そんなに食べたら、太るに決まっている。$$, $$そんなにたべたら、ふとるにきまっている。$$, $$Se comer tanto assim, é claro que vai engordar.$$),
    ('n2-grammar-93', $$勉強しなかったんだから、落ちるに決まってるよ。$$, $$べんきょうしなかったんだから、おちるにきまってるよ。$$, $$Você não estudou, então com certeza vai reprovar.$$),
    ('n2-grammar-93', $$あんな高い店、おいしいに決まっている。$$, $$あんなたかいみせ、おいしいにきまっている。$$, $$Uma loja cara daquelas, é claro que é gostosa.$$),
    ('n2-grammar-93', $$犯人はあの男に決まっている。$$, $$はんにんはあのおとこにきまっている。$$, $$O culpado só pode ser aquele homem.$$),
    ('n2-grammar-93', $$みんなに言ったら、反対されるに決まっています。$$, $$みんなにいったら、はんたいされるにきまっています。$$, $$Se contar para todos, com certeza vão ser contra.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人で行くなんて、危ない____。$$, $$Ir sozinho? É claro que é perigoso.$$),
        (2, $$彼が勝つ____。$$, $$Com certeza ele vai ganhar.$$),
        (3, $$こんな時間に電話したら、迷惑____。$$, $$Ligar a esta hora, é claro que vai incomodar.$$),
        (4, $$そんな話、嘘____。$$, $$Uma história dessas só pode ser mentira.$$),
        (5, $$毎日練習すれば、上手になる____。$$, $$Se praticar todo dia, com certeza vai melhorar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-93', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に決まっている$$),
        (1, $$に決まってる$$),
        (1, $$に決まっています$$),
        (2, $$に決まっている$$),
        (2, $$に決まってる$$),
        (2, $$に決まっています$$),
        (3, $$に決まっている$$),
        (3, $$に決まってる$$),
        (3, $$に決まっています$$),
        (4, $$に決まっている$$),
        (4, $$に決まってる$$),
        (4, $$に決まっています$$),
        (5, $$に決まっている$$),
        (5, $$に決まってる$$),
        (5, $$に決まっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-94 — 〜に越したことはない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-94',
    'grammar',
    'N2',
    $$〜に越したことはない$$,
    $$ni koshita koto wa nai$$,
    $$O ideal é / Nada melhor que / O melhor seria$$,
    $$に越したことはない indica que algo é o mais desejável ou o mais seguro, de acordo com o bom senso. Equivale a "o ideal é" ou "nada melhor que".

A pessoa reconhece que aquilo é o melhor, mas muitas vezes sem obrigar. Por exemplo, "o ideal é ter mais dinheiro" ou "o melhor é tomar cuidado".

É uma expressão de conselho geral, usada tanto na fala quanto na escrita.$$,
    $$É comum com palavras como 安い, 早い, 気をつける, 健康 ou 用心.

Muitas vezes aparece com が depois, indicando uma ressalva, como "o ideal seria..., mas...".$$,
    $$Verbo (forma dicionário / forma ない) + に越したことはない
Adjetivo い + に越したことはない
Adjetivo な / Substantivo + に越したことはない$$,
    $$に越したことはない$$,
    $$に越したことはない|にこしたことはない|に越したことはありません$$,
    ARRAY['に', '越した', 'ことはない']::text[],
    ARRAY['に越したことはない', 'にこしたことはない', 'に越したことはありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-94', $$お金はあるに越したことはない。$$, $$おかねはあるにこしたことはない。$$, $$Ter dinheiro nunca é demais.$$),
    ('n2-grammar-94', $$用心するに越したことはない。$$, $$ようじんするにこしたことはない。$$, $$O melhor é tomar cuidado.$$),
    ('n2-grammar-94', $$値段は安いに越したことはないが、質も大切だ。$$, $$ねだんはやすいにこしたことはないが、しつもたいせつだ。$$, $$O ideal é que o preço seja baixo, mas a qualidade também importa.$$),
    ('n2-grammar-94', $$健康に越したことはありません。$$, $$けんこうにこしたことはありません。$$, $$Nada melhor que ter saúde.$$),
    ('n2-grammar-94', $$早く着くに越したことはない。$$, $$はやくつくにこしたことはない。$$, $$O ideal é chegar cedo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$体は丈夫な____。$$, $$O ideal é ter um corpo forte.$$),
        (2, $$準備は早めにする____。$$, $$O melhor é fazer os preparativos com antecedência.$$),
        (3, $$部屋は広い____。$$, $$O ideal é um quarto espaçoso.$$),
        (4, $$けがをしない____。$$, $$O melhor é não se machucar.$$),
        (5, $$仕事は楽な____が、それだけでは選べない。$$, $$O ideal seria um trabalho tranquilo, mas não dá para escolher só por isso.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に越したことはない$$),
        (1, $$にこしたことはない$$),
        (1, $$に越したことはありません$$),
        (2, $$に越したことはない$$),
        (2, $$にこしたことはない$$),
        (2, $$に越したことはありません$$),
        (3, $$に越したことはない$$),
        (3, $$にこしたことはない$$),
        (3, $$に越したことはありません$$),
        (4, $$に越したことはない$$),
        (4, $$にこしたことはない$$),
        (4, $$に越したことはありません$$),
        (5, $$に越したことはない$$),
        (5, $$にこしたことはない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-95 — 〜に応えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-95',
    'grammar',
    'N2',
    $$〜に応えて$$,
    $$ni kotaete$$,
    $$Atendendo a / Em resposta a / Correspondendo a$$,
    $$に応えて indica que alguém age para atender a um pedido, uma expectativa ou um desejo de outras pessoas. Equivale a "atendendo a" ou "em resposta a".

Costuma vir com palavras como pedido, expectativa, desejo, voz e apoio. Por exemplo, "atendendo aos pedidos dos fãs, a banda fez um bis".

É uma expressão formal, comum em notícias e anúncios.$$,
    $$Palavras comuns antes são 期待, 要望, 声援, 希望 e リクエスト.

Não se confunde com に答えて, que é responder a uma pergunta.$$,
    $$Substantivo + に応えて
Substantivo + に応える + Substantivo$$,
    $$に応えて$$,
    $$に応えて|に応え|にこたえて|に応える$$,
    ARRAY['に', '応えて']::text[],
    ARRAY['に応えて', 'に応え', 'に応える', 'にこたえて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-95', $$ファンの声援に応えて、選手は手を振った。$$, $$ファンのせいえんにこたえて、せんしゅはてをふった。$$, $$Em resposta à torcida, o atleta acenou.$$),
    ('n2-grammar-95', $$客の要望に応えて、営業時間を延長した。$$, $$きゃくのようぼうにこたえて、えいぎょうじかんをえんちょうした。$$, $$Atendendo ao pedido dos clientes, ampliamos o horário de funcionamento.$$),
    ('n2-grammar-95', $$両親の期待に応えて、彼は医者になった。$$, $$りょうしんのきたいにこたえて、かれはいしゃになった。$$, $$Correspondendo às expectativas dos pais, ele se tornou médico.$$),
    ('n2-grammar-95', $$アンコールに応え、もう一曲歌った。$$, $$アンコールにこたえ、もういっきょくうたった。$$, $$Atendendo ao pedido de bis, cantou mais uma música.$$),
    ('n2-grammar-95', $$市民の声に応える政治が必要だ。$$, $$しみんのこえにこたえるせいじがひつようだ。$$, $$É preciso uma política que responda à voz dos cidadãos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$リクエスト____、その曲をもう一度演奏した。$$, $$Atendendo ao pedido, tocaram aquela música mais uma vez.$$),
        (2, $$社員の希望____、在宅勤務を導入した。$$, $$Atendendo ao desejo dos funcionários, adotamos o trabalho remoto.$$),
        (3, $$皆さんの期待____、全力で頑張ります。$$, $$Para corresponder às expectativas de todos, vou me esforçar ao máximo.$$),
        (4, $$読者の要望____、続編が出版された。$$, $$Atendendo ao pedido dos leitores, a continuação foi publicada.$$),
        (5, $$観客の拍手____、歌手は再び登場した。$$, $$Em resposta aos aplausos do público, a cantora voltou ao palco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に応えて$$),
        (1, $$に応え$$),
        (1, $$にこたえて$$),
        (2, $$に応えて$$),
        (2, $$に応え$$),
        (2, $$にこたえて$$),
        (3, $$に応えて$$),
        (3, $$に応え$$),
        (3, $$にこたえて$$),
        (4, $$に応えて$$),
        (4, $$に応え$$),
        (4, $$にこたえて$$),
        (5, $$に応えて$$),
        (5, $$に応え$$),
        (5, $$にこたえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-96 — 〜に加えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-96',
    'grammar',
    'N2',
    $$〜に加えて$$,
    $$ni kuwaete$$,
    $$Além de / Somado a / Junto com$$,
    $$に加えて indica que algo é acrescentado a outra coisa. Equivale a "além de" ou "somado a".

Muitas vezes é usado para juntar dois fatores do mesmo tipo, como duas qualidades ou dois problemas. Por exemplo, "além da chuva, o vento também estava forte".

É uma expressão formal, comum em textos, notícias e explicações.$$,
    $$É parecido com だけでなく e の上に, mas に加えて é mais formal.

A forma それに加えて aparece no começo de frase com o sentido de "além disso".$$,
    $$Substantivo + に加えて
Substantivo + に加え$$,
    $$に加えて$$,
    $$に加えて|に加え|にくわえて$$,
    ARRAY['に', '加えて']::text[],
    ARRAY['に加えて', 'に加え', 'それに加えて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-96', $$雨に加えて、風も強くなってきた。$$, $$あめにくわえて、かぜもつよくなってきた。$$, $$Além da chuva, o vento também ficou forte.$$),
    ('n2-grammar-96', $$彼は英語に加えて、中国語も話せる。$$, $$かれはえいごにくわえて、ちゅうごくごもはなせる。$$, $$Além de inglês, ele também fala chinês.$$),
    ('n2-grammar-96', $$給料に加え、ボーナスも出る。$$, $$きゅうりょうにくわえ、ボーナスもでる。$$, $$Além do salário, também há bônus.$$),
    ('n2-grammar-96', $$物価の上昇に加えて、税金も上がった。$$, $$ぶっかのじょうしょうにくわえて、ぜいきんもあがった。$$, $$Somado ao aumento dos preços, os impostos também subiram.$$),
    ('n2-grammar-96', $$この店は味に加えて、サービスもいい。$$, $$このみせはあじにくわえて、サービスもいい。$$, $$Além do sabor, o atendimento desta loja também é bom.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭痛____、熱も出てきた。$$, $$Além da dor de cabeça, também comecei a ter febre.$$),
        (2, $$彼女は美しさ____、知性も持っている。$$, $$Além da beleza, ela também tem inteligência.$$),
        (3, $$仕事____、家事もしなければならない。$$, $$Além do trabalho, também tenho que fazer as tarefas de casa.$$),
        (4, $$交通費____、宿泊費も会社が払う。$$, $$Além do transporte, a empresa também paga a hospedagem.$$),
        (5, $$人手不足____、資金も足りない。$$, $$Somado à falta de pessoal, também falta verba.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-96', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に加えて$$),
        (1, $$に加え$$),
        (1, $$にくわえて$$),
        (2, $$に加えて$$),
        (2, $$に加え$$),
        (2, $$にくわえて$$),
        (3, $$に加えて$$),
        (3, $$に加え$$),
        (3, $$にくわえて$$),
        (4, $$に加えて$$),
        (4, $$に加え$$),
        (4, $$にくわえて$$),
        (5, $$に加えて$$),
        (5, $$に加え$$),
        (5, $$にくわえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-97 — 〜に基づいて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-97',
    'grammar',
    'N2',
    $$〜に基づいて$$,
    $$ni motozuite$$,
    $$Com base em / Baseado em / De acordo com$$,
    $$に基づいて indica que algo é feito tendo outra coisa como base, fundamento ou referência. Equivale a "com base em" ou "baseado em".

Costuma vir com palavras como dados, fatos, leis, experiência e pesquisa. Por exemplo, "um filme baseado em fatos reais" ou "decidir com base nos dados".

É uma expressão formal, comum em textos, relatórios e notícias.$$,
    $$É parecido com をもとに, mas に基づいて é mais formal e indica uma base mais rígida, como regras ou dados.

As formas に基づく e に基づいた vêm antes de substantivos.$$,
    $$Substantivo + に基づいて + Verbo
Substantivo + に基づく + Substantivo
Substantivo + に基づいた + Substantivo$$,
    $$に基づいて$$,
    $$に基づいて|に基づき|に基づく|に基づいた|にもとづいて$$,
    ARRAY['に', '基づいて']::text[],
    ARRAY['に基づいて', 'に基づき', 'に基づく', 'に基づいた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-97', $$この映画は実話に基づいて作られた。$$, $$このえいがはじつわにもとづいてつくられた。$$, $$Este filme foi feito com base em uma história real.$$),
    ('n2-grammar-97', $$データに基づいて、計画を立てた。$$, $$データにもとづいて、けいかくをたてた。$$, $$Fizemos o plano com base nos dados.$$),
    ('n2-grammar-97', $$法律に基づき、処分が決められた。$$, $$ほうりつにもとづき、しょぶんがきめられた。$$, $$A punição foi decidida de acordo com a lei.$$),
    ('n2-grammar-97', $$経験に基づくアドバイスは役に立つ。$$, $$けいけんにもとづくアドバイスはやくにたつ。$$, $$Conselhos baseados em experiência são úteis.$$),
    ('n2-grammar-97', $$調査に基づいた報告書を提出した。$$, $$ちょうさにもとづいたほうこくしょをていしゅつした。$$, $$Entreguei um relatório baseado na pesquisa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$アンケートの結果____、商品を改良した。$$, $$Melhoramos o produto com base no resultado da pesquisa.$$),
        (2, $$規則____、手続きを行ってください。$$, $$Faça os procedimentos de acordo com as regras.$$),
        (3, $$事実____記事を書くべきだ。$$, $$Deve-se escrever artigos com base em fatos.$$),
        (4, $$科学的な根拠____判断する。$$, $$Decido com base em fundamentos científicos.$$),
        (5, $$この小説は作者の体験____書かれた。$$, $$Este romance foi escrito com base nas experiências do autor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に基づいて$$),
        (1, $$に基づき$$),
        (1, $$にもとづいて$$),
        (2, $$に基づいて$$),
        (2, $$に基づき$$),
        (2, $$にもとづいて$$),
        (3, $$に基づいて$$),
        (3, $$に基づき$$),
        (3, $$にもとづいて$$),
        (4, $$に基づいて$$),
        (4, $$に基づき$$),
        (4, $$にもとづいて$$),
        (5, $$に基づいて$$),
        (5, $$に基づき$$),
        (5, $$にもとづいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-98 — 〜に向かって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-98',
    'grammar',
    'N2',
    $$〜に向かって$$,
    $$ni mukatte$$,
    $$Em direção a / Para / Rumo a$$,
    $$に向かって indica uma direção ou um alvo. Equivale a "em direção a", "para" ou "rumo a".

Pode indicar uma direção física, como "andar em direção ao mar", ou a pessoa para quem se fala, como "gritar para alguém".

Também pode indicar um objetivo a ser alcançado, como "esforçar-se rumo ao sonho".$$,
    $$Com pessoas, muitas vezes indica uma atitude de confronto ou falta de respeito, como "falar desse jeito com o pai".

に向けて é parecido, mas é mais usado para objetivos e preparação.$$,
    $$Substantivo (lugar / pessoa / objetivo) + に向かって + Verbo
Substantivo + に向かう / に向けて$$,
    $$に向かって$$,
    $$に向かって|に向かい|にむかって$$,
    ARRAY['に', '向かって']::text[],
    ARRAY['に向かって', 'に向かい', 'にむかって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-98', $$船は南に向かって進んだ。$$, $$ふねはみなみにむかってすすんだ。$$, $$O navio seguiu em direção ao sul.$$),
    ('n2-grammar-98', $$夢に向かって頑張っている。$$, $$ゆめにむかってがんばっている。$$, $$Estou me esforçando rumo ao meu sonho.$$),
    ('n2-grammar-98', $$親に向かって、そんな口をきくな。$$, $$おやにむかって、そんなくちをきくな。$$, $$Não fale desse jeito com seus pais.$$),
    ('n2-grammar-98', $$彼は海に向かって大声で叫んだ。$$, $$かれはうみにむかっておおごえでさけんだ。$$, $$Ele gritou bem alto em direção ao mar.$$),
    ('n2-grammar-98', $$台風は東に向かい、勢力を強めている。$$, $$たいふうはひがしにむかい、せいりょくをつよめている。$$, $$O tufão segue para o leste e está ganhando força.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちは学校____走っていった。$$, $$As crianças saíram correndo em direção à escola.$$),
        (2, $$目標____、毎日練習している。$$, $$Treino todo dia rumo ao meu objetivo.$$),
        (3, $$先生____、失礼なことを言ってはいけない。$$, $$Não se deve dizer coisas rudes para o professor.$$),
        (4, $$鏡____笑ってみた。$$, $$Tentei sorrir para o espelho.$$),
        (5, $$飛行機は東京____飛び立った。$$, $$O avião decolou rumo a Tóquio.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-98', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に向かって$$),
        (1, $$にむかって$$),
        (2, $$に向かって$$),
        (2, $$にむかって$$),
        (3, $$に向かって$$),
        (3, $$にむかって$$),
        (4, $$に向かって$$),
        (4, $$にむかって$$),
        (5, $$に向かって$$),
        (5, $$にむかって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-99 — 〜に応じて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-99',
    'grammar',
    'N2',
    $$〜に応じて$$,
    $$ni oujite$$,
    $$De acordo com / Conforme / Dependendo de$$,
    $$に応じて indica que algo muda ou se adapta conforme outra coisa. Equivale a "de acordo com", "conforme" ou "dependendo de".

Costuma vir com palavras que indicam variação, como idade, nível, quantidade, necessidade ou situação. Por exemplo, "o salário muda de acordo com a experiência".

Também pode significar "atender a" um pedido, como "atender a uma entrevista".$$,
    $$É parecido com によって, mas に応じて destaca que algo é ajustado de forma adequada.

A forma に応じた vem antes de substantivos, como 能力に応じた仕事.$$,
    $$Substantivo + に応じて + Verbo
Substantivo + に応じた + Substantivo$$,
    $$に応じて$$,
    $$に応じて|に応じ|に応じた|におうじて$$,
    ARRAY['に', '応じて']::text[],
    ARRAY['に応じて', 'に応じ', 'に応じた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-99', $$経験に応じて、給料が決まる。$$, $$けいけんにおうじて、きゅうりょうがきまる。$$, $$O salário é definido de acordo com a experiência.$$),
    ('n2-grammar-99', $$予算に応じて、プランを選んでください。$$, $$よさんにおうじて、プランをえらんでください。$$, $$Escolha o plano conforme o seu orçamento.$$),
    ('n2-grammar-99', $$季節に応じて、メニューが変わる。$$, $$きせつにおうじて、メニューがかわる。$$, $$O cardápio muda dependendo da estação.$$),
    ('n2-grammar-99', $$レベルに応じた授業を受けられる。$$, $$レベルにおうじたじゅぎょうをうけられる。$$, $$É possível ter aulas de acordo com o seu nível.$$),
    ('n2-grammar-99', $$必要に応じて、資料を追加します。$$, $$ひつようにおうじて、しりょうをついかします。$$, $$Conforme a necessidade, acrescentaremos materiais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$年齢____、料金が違います。$$, $$O preço muda de acordo com a idade.$$),
        (2, $$天気____、予定を変更します。$$, $$Mudaremos os planos dependendo do tempo.$$),
        (3, $$売り上げ____、ボーナスが支払われる。$$, $$O bônus é pago conforme as vendas.$$),
        (4, $$能力____仕事を任せる。$$, $$Confio as tarefas de acordo com a capacidade de cada um.$$),
        (5, $$客の注文____、料理を作る。$$, $$Faço os pratos conforme o pedido do cliente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-99', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に応じて$$),
        (1, $$に応じ$$),
        (1, $$におうじて$$),
        (2, $$に応じて$$),
        (2, $$に応じ$$),
        (2, $$におうじて$$),
        (3, $$に応じて$$),
        (3, $$に応じ$$),
        (3, $$におうじて$$),
        (4, $$に応じて$$),
        (4, $$に応じ$$),
        (4, $$におうじて$$),
        (5, $$に応じて$$),
        (5, $$に応じ$$),
        (5, $$におうじて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-100 — 〜に際して
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-100',
    'grammar',
    'N2',
    $$〜に際して$$,
    $$ni saishite$$,
    $$Por ocasião de / Ao / No momento de$$,
    $$に際して indica o momento em que algo especial é feito. Equivale a "por ocasião de" ou "ao".

É usado em situações formais, antes ou durante um acontecimento importante, como uma inscrição, uma viagem ou uma cerimônia. Por exemplo, "ao se inscrever, apresente um documento de identidade".

É comum em avisos, discursos e documentos oficiais.$$,
    $$É muito parecido com にあたって. A diferença é pequena, mas に際して foca mais no momento em si, enquanto にあたって destaca uma etapa importante.

に際し é ainda mais formal.$$,
    $$Substantivo + に際して / に際し
Verbo (forma dicionário) + に際して / に際し$$,
    $$に際して$$,
    $$に際して|に際し|にさいして$$,
    ARRAY['に', '際して']::text[],
    ARRAY['に際して', 'に際し', 'に際しての']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-100', $$申し込みに際して、身分証明書が必要です。$$, $$もうしこみにさいして、みぶんしょうめいしょがひつようです。$$, $$Ao fazer a inscrição, é necessário um documento de identidade.$$),
    ('n2-grammar-100', $$出発に際して、注意事項を説明します。$$, $$しゅっぱつにさいして、ちゅういじこうをせつめいします。$$, $$Antes da partida, vou explicar os cuidados necessários.$$),
    ('n2-grammar-100', $$入学に際し、学長がお祝いの言葉を述べた。$$, $$にゅうがくにさいし、がくちょうがおいわいのことばをのべた。$$, $$Por ocasião da entrada na universidade, o reitor deu uma mensagem de felicitações.$$),
    ('n2-grammar-100', $$契約するに際して、内容をよく読んでください。$$, $$けいやくするにさいして、ないようをよくよんでください。$$, $$Ao assinar o contrato, leia bem o conteúdo.$$),
    ('n2-grammar-100', $$帰国に際して、友人たちがパーティーを開いてくれた。$$, $$きこくにさいして、ゆうじんたちがパーティーをひらいてくれた。$$, $$Por ocasião da minha volta ao país, meus amigos fizeram uma festa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ご利用____、以下の点にご注意ください。$$, $$Ao utilizar, preste atenção aos pontos abaixo.$$),
        (2, $$退職____、お世話になった方々に挨拶をした。$$, $$Por ocasião da minha aposentadoria, cumprimentei as pessoas que me ajudaram.$$),
        (3, $$工事を行う____、ご迷惑をおかけします。$$, $$Durante a realização da obra, pedimos desculpas pelo incômodo.$$),
        (4, $$就職____、スーツを新しく買った。$$, $$Por ocasião do novo emprego, comprei um terno novo.$$),
        (5, $$試験を受ける____、受験票を忘れないでください。$$, $$Ao fazer a prova, não esqueça o comprovante de inscrição.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-100', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に際して$$),
        (1, $$に際し$$),
        (1, $$にさいして$$),
        (2, $$に際して$$),
        (2, $$に際し$$),
        (2, $$にさいして$$),
        (3, $$に際して$$),
        (3, $$に際し$$),
        (3, $$にさいして$$),
        (4, $$に際して$$),
        (4, $$に際し$$),
        (4, $$にさいして$$),
        (5, $$に際して$$),
        (5, $$に際し$$),
        (5, $$にさいして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-101 — 〜に先立ち
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-101',
    'grammar',
    'N2',
    $$〜に先立ち$$,
    $$ni sakidachi$$,
    $$Antes de / Previamente a / Em preparação para$$,
    $$に先立ち indica que algo é feito antes de um acontecimento importante, como preparação. Equivale a "antes de" ou "previamente a".

É usado em situações formais, como eventos, lançamentos, cerimônias ou reuniões. Por exemplo, "antes do lançamento, foi feita uma apresentação para a imprensa".

A forma に先立って tem o mesmo sentido.$$,
    $$É mais formal que の前に e aparece muito em notícias e anúncios.

A forma に先立つ vem antes de substantivos, como 試合に先立つ練習.$$,
    $$Substantivo + に先立ち / に先立って
Verbo (forma dicionário) + に先立ち / に先立って
Substantivo + に先立つ + Substantivo$$,
    $$に先立ち$$,
    $$に先立ち|に先立って|に先立つ|にさきだち|にさきだって$$,
    ARRAY['に', '先立ち']::text[],
    ARRAY['に先立ち', 'に先立って', 'に先立つ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-101', $$新商品の発売に先立ち、記者会見が行われた。$$, $$しんしょうひんのはつばいにさきだち、きしゃかいけんがおこなわれた。$$, $$Antes do lançamento do novo produto, foi realizada uma coletiva de imprensa.$$),
    ('n2-grammar-101', $$試合に先立って、開会式が行われた。$$, $$しあいにさきだって、かいかいしきがおこなわれた。$$, $$Antes da partida, foi realizada a cerimônia de abertura.$$),
    ('n2-grammar-101', $$工事を始めるに先立ち、住民への説明会を開いた。$$, $$こうじをはじめるにさきだち、じゅうみんへのせつめいかいをひらいた。$$, $$Antes de começar a obra, fizemos uma reunião de esclarecimento para os moradores.$$),
    ('n2-grammar-101', $$出発に先立って、全員の荷物を確認した。$$, $$しゅっぱつにさきだって、ぜんいんのにもつをかくにんした。$$, $$Antes da partida, conferimos a bagagem de todos.$$),
    ('n2-grammar-101', $$映画の公開に先立ち、試写会が開かれた。$$, $$えいがのこうかいにさきだち、ししゃかいがひらかれた。$$, $$Antes da estreia do filme, houve uma sessão de pré-estreia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議____、資料を配った。$$, $$Antes da reunião, distribuímos os materiais.$$),
        (2, $$留学する____、ビザを取った。$$, $$Antes de estudar no exterior, tirei o visto.$$),
        (3, $$新店舗のオープン____、記念イベントを行う。$$, $$Antes da inauguração da nova loja, faremos um evento comemorativo.$$),
        (4, $$手術____、医師から説明を受けた。$$, $$Antes da cirurgia, recebi explicações do médico.$$),
        (5, $$選挙____、候補者の討論会が開かれた。$$, $$Antes da eleição, foi realizado um debate entre os candidatos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-101', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に先立ち$$),
        (1, $$に先立って$$),
        (1, $$にさきだち$$),
        (1, $$にさきだって$$),
        (2, $$に先立ち$$),
        (2, $$に先立って$$),
        (2, $$にさきだち$$),
        (2, $$にさきだって$$),
        (3, $$に先立ち$$),
        (3, $$に先立って$$),
        (3, $$にさきだち$$),
        (3, $$にさきだって$$),
        (4, $$に先立ち$$),
        (4, $$に先立って$$),
        (4, $$にさきだち$$),
        (4, $$にさきだって$$),
        (5, $$に先立ち$$),
        (5, $$に先立って$$),
        (5, $$にさきだち$$),
        (5, $$にさきだって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-102 — 〜にせよ / 〜にしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-102',
    'grammar',
    'N2',
    $$〜にせよ / 〜にしろ$$,
    $$ni seyo / ni shiro$$,
    $$Mesmo que / Ainda que / Seja como for$$,
    $$にせよ e にしろ indicam que, mesmo aceitando uma situação, a conclusão não muda. Equivale a "mesmo que" ou "ainda que".

Por exemplo, "mesmo que esteja ocupado, devia pelo menos ligar". A pessoa reconhece a situação, mas mantém sua opinião.

Também aparecem com palavras interrogativas, como いずれにせよ ou 何にしろ, com o sentido de "seja como for".$$,
    $$São parecidos com としても e にしても, mas mais formais.

にしろ é um pouco mais comum na fala, e にせよ é mais comum na escrita.

いずれにせよ é uma expressão muito usada para encerrar uma discussão.$$,
    $$Verbo (forma simples) + にせよ / にしろ
Adjetivo い + にせよ / にしろ
Adjetivo な / Substantivo + (である) + にせよ / にしろ
Palavra interrogativa + にせよ / にしろ$$,
    $$にせよ$$,
    $$にせよ|にしろ$$,
    ARRAY['に', 'せよ']::text[],
    ARRAY['にせよ', 'にしろ', 'いずれにせよ', '何にしろ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-102', $$忙しいにせよ、電話くらいはできるだろう。$$, $$いそがしいにせよ、でんわくらいはできるだろう。$$, $$Mesmo ocupado, pelo menos um telefonema dá para fazer.$$),
    ('n2-grammar-102', $$冗談にしろ、そんなことを言うべきではない。$$, $$じょうだんにしろ、そんなことをいうべきではない。$$, $$Mesmo que seja brincadeira, não se deve dizer uma coisa dessas.$$),
    ('n2-grammar-102', $$いずれにせよ、明日までに決めなければならない。$$, $$いずれにせよ、あしたまでにきめなければならない。$$, $$Seja como for, temos que decidir até amanhã.$$),
    ('n2-grammar-102', $$どんな理由があるにせよ、暴力は許されない。$$, $$どんなりゆうがあるにせよ、ぼうりょくはゆるされない。$$, $$Seja qual for o motivo, a violência não é perdoável.$$),
    ('n2-grammar-102', $$何にしろ、無事でよかった。$$, $$なんにしろ、ぶじでよかった。$$, $$Seja como for, que bom que está tudo bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たとえ少額____、借りたお金は返すべきだ。$$, $$Mesmo que seja pouco, dinheiro emprestado deve ser devolvido.$$),
        (2, $$行く____行かないにせよ、早く連絡して。$$, $$Indo ou não, me avise logo.$$),
        (3, $$いずれ____、もう一度話し合いましょう。$$, $$Seja como for, vamos conversar mais uma vez.$$),
        (4, $$知らなかった____、責任は取るべきだ。$$, $$Mesmo que não soubesse, deve assumir a responsabilidade.$$),
        (5, $$誰が来る____、準備はしておこう。$$, $$Seja quem for que venha, vamos deixar tudo preparado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-102', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にせよ$$),
        (1, $$にしろ$$),
        (2, $$にせよ$$),
        (2, $$にしろ$$),
        (3, $$にせよ$$),
        (3, $$にしろ$$),
        (4, $$にせよ$$),
        (4, $$にしろ$$),
        (5, $$にせよ$$),
        (5, $$にしろ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-103 — 〜にしろ〜にしろ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-103',
    'grammar',
    'N2',
    $$〜にしろ〜にしろ$$,
    $$ni shiro ~ ni shiro$$,
    $$Seja... seja / Quer... quer / Tanto... quanto$$,
    $$にしろ〜にしろ apresenta duas opções ou dois exemplos e mostra que, em qualquer caso, a conclusão é a mesma. Equivale a "seja... seja" ou "quer... quer".

Por exemplo, "seja de trem, seja de ônibus, leva uma hora" ou "indo ou não indo, avise".

A forma にせよ〜にせよ tem o mesmo sentido e é mais formal.$$,
    $$Os dois elementos costumam ser opostos ou do mesmo grupo.

É parecido com にしても〜にしても, que é mais comum na fala.$$,
    $$Substantivo + にしろ + Substantivo + にしろ
Verbo + にしろ + Verbo (forma ない) + にしろ
Substantivo + にせよ + Substantivo + にせよ$$,
    $$にしろ〜にしろ$$,
    $$にしろ|にせよ$$,
    ARRAY['に', 'しろ']::text[],
    ARRAY['にしろ〜にしろ', 'にせよ〜にせよ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-103', $$電車にしろバスにしろ、一時間はかかる。$$, $$でんしゃにしろバスにしろ、いちじかんはかかる。$$, $$Seja de trem, seja de ônibus, leva uma hora.$$),
    ('n2-grammar-103', $$行くにしろ行かないにしろ、連絡してください。$$, $$いくにしろいかないにしろ、れんらくしてください。$$, $$Indo ou não, entre em contato.$$),
    ('n2-grammar-103', $$賛成にせよ反対にせよ、意見を言ってください。$$, $$さんせいにせよはんたいにせよ、いけんをいってください。$$, $$Sendo a favor ou contra, dê a sua opinião.$$),
    ('n2-grammar-103', $$肉にしろ魚にしろ、新鮮なものがいい。$$, $$にくにしろさかなにしろ、しんせんなものがいい。$$, $$Seja carne, seja peixe, o bom é que seja fresco.$$),
    ('n2-grammar-103', $$勝つにしろ負けるにしろ、全力を尽くそう。$$, $$かつにしろまけるにしろ、ぜんりょくをつくそう。$$, $$Ganhando ou perdendo, vamos dar o nosso melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大人____子供にしろ、ルールは守らなければならない。$$, $$Seja adulto, seja criança, é preciso seguir as regras.$$),
        (2, $$買う____買わないにしろ、一度見てみよう。$$, $$Comprando ou não, vamos dar uma olhada.$$),
        (3, $$日本語にしろ英語____、毎日の練習が大切だ。$$, $$Seja japonês, seja inglês, a prática diária é importante.$$),
        (4, $$好き____嫌いにせよ、この仕事はやるしかない。$$, $$Gostando ou não, não há outra saída senão fazer este trabalho.$$),
        (5, $$雨____雪にしろ、試合は中止だ。$$, $$Seja chuva, seja neve, a partida está cancelada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-103', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしろ$$),
        (1, $$にせよ$$),
        (2, $$にしろ$$),
        (2, $$にせよ$$),
        (3, $$にしろ$$),
        (3, $$にせよ$$),
        (4, $$にせよ$$),
        (4, $$にしろ$$),
        (5, $$にしろ$$),
        (5, $$にせよ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-104 — 〜にしたら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-104',
    'grammar',
    'N2',
    $$〜にしたら$$,
    $$ni shitara$$,
    $$Para / Do ponto de vista de / Na posição de$$,
    $$にしたら indica o ponto de vista de uma pessoa ou grupo. Equivale a "para" ou "do ponto de vista de".

A pessoa que fala imagina como o outro se sente ou pensa em determinada situação. Por exemplo, "para os pais, o filho é sempre criança".

As formas にすれば e にしてみれば têm o mesmo sentido.$$,
    $$Só se usa com pessoas ou grupos de pessoas, não com coisas.

Não se usa para falar do próprio ponto de vista. Para isso, usa-se 私としては.

É parecido com の立場からすると.$$,
    $$Substantivo (pessoa / grupo) + にしたら
Substantivo + にすれば / にしてみれば$$,
    $$にしたら$$,
    $$にしたら|にすれば|にしてみれば|にしてみたら$$,
    ARRAY['に', 'したら']::text[],
    ARRAY['にしたら', 'にすれば', 'にしてみれば', 'にしてみたら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-104', $$親にしたら、子供はいくつになっても子供だ。$$, $$おやにしたら、こどもはいくつになってもこどもだ。$$, $$Para os pais, o filho é sempre criança, não importa a idade.$$),
    ('n2-grammar-104', $$彼にすれば、それは当然のことだったのだろう。$$, $$かれにすれば、それはとうぜんのことだったのだろう。$$, $$Para ele, isso provavelmente era algo natural.$$),
    ('n2-grammar-104', $$客にしてみれば、待たされるのは迷惑だ。$$, $$きゃくにしてみれば、またされるのはめいわくだ。$$, $$Para o cliente, ter que esperar é um incômodo.$$),
    ('n2-grammar-104', $$先生にしたら、静かな学生のほうが楽だろう。$$, $$せんせいにしたら、しずかながくせいのほうがらくだろう。$$, $$Para o professor, alunos quietos devem ser mais fáceis.$$),
    ('n2-grammar-104', $$子供にしたら、毎日の塾はつらいはずだ。$$, $$こどもにしたら、まいにちのじゅくはつらいはずだ。$$, $$Para uma criança, cursinho todo dia deve ser difícil.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$犬____、散歩は一番楽しい時間なのだろう。$$, $$Para um cachorro, o passeio deve ser o momento mais divertido.$$),
        (2, $$社長____、社員の気持ちはわからないかもしれない。$$, $$Para o presidente, talvez seja difícil entender o sentimento dos funcionários.$$),
        (3, $$近所の人____、夜の騒音は困るだろう。$$, $$Para os vizinhos, o barulho à noite deve ser um problema.$$),
        (4, $$学生____、この宿題は多すぎる。$$, $$Para os alunos, esta lição de casa é demais.$$),
        (5, $$彼女____、あの言葉はショックだったはずだ。$$, $$Para ela, aquelas palavras devem ter sido um choque.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-104', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしたら$$),
        (1, $$にすれば$$),
        (1, $$にしてみれば$$),
        (2, $$にしたら$$),
        (2, $$にすれば$$),
        (2, $$にしてみれば$$),
        (3, $$にしたら$$),
        (3, $$にすれば$$),
        (3, $$にしてみれば$$),
        (4, $$にしたら$$),
        (4, $$にすれば$$),
        (4, $$にしてみれば$$),
        (5, $$にしたら$$),
        (5, $$にすれば$$),
        (5, $$にしてみれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-105 — 〜にしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-105',
    'grammar',
    'N2',
    $$〜にしても$$,
    $$ni shite mo$$,
    $$Mesmo que / Ainda assim / Mesmo para$$,
    $$にしても indica que, mesmo aceitando uma situação, existe algo que não combina ou que continua sendo um problema. Equivale a "mesmo que" ou "ainda assim".

A pessoa admite um fato, mas mostra sua insatisfação ou dúvida. Por exemplo, "mesmo que estivesse ocupado, podia ter avisado".

Também pode indicar um exemplo que representa um grupo, com o sentido de "mesmo para...". Por exemplo, "mesmo para mim, isso é difícil".$$,
    $$É parecido com にせよ e にしろ, mas にしても é mais comum na fala.

A expressão それにしても aparece no começo de frase com o sentido de "mesmo assim" ou "de qualquer forma".$$,
    $$Verbo (forma simples) + にしても
Adjetivo い + にしても
Adjetivo な / Substantivo + (である) + にしても$$,
    $$にしても$$,
    $$にしても$$,
    ARRAY['に', 'しても']::text[],
    ARRAY['にしても', 'それにしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-105', $$忙しかったにしても、連絡くらいできたはずだ。$$, $$いそがしかったにしても、れんらくくらいできたはずだ。$$, $$Mesmo ocupado, você podia pelo menos ter avisado.$$),
    ('n2-grammar-105', $$冗談にしても、言っていいことと悪いことがある。$$, $$じょうだんにしても、いっていいこととわるいことがある。$$, $$Mesmo sendo brincadeira, há coisas que se pode e não se pode dizer.$$),
    ('n2-grammar-105', $$安いにしても、この品質ではだめだ。$$, $$やすいにしても、このひんしつではだめだ。$$, $$Mesmo sendo barato, com esta qualidade não serve.$$),
    ('n2-grammar-105', $$私にしても、この問題は難しい。$$, $$わたしにしても、このもんだいはむずかしい。$$, $$Mesmo para mim, este problema é difícil.$$),
    ('n2-grammar-105', $$遅れるにしても、一言言ってほしかった。$$, $$おくれるにしても、ひとこといってほしかった。$$, $$Mesmo que fosse se atrasar, queria que tivesse avisado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のいたずら____、ひどすぎる。$$, $$Mesmo sendo travessura de criança, passou dos limites.$$),
        (2, $$初めて____、こんなミスはしないだろう。$$, $$Mesmo sendo a primeira vez, ninguém cometeria um erro desses.$$),
        (3, $$行かない____、返事はしておこう。$$, $$Mesmo que não vá, vou pelo menos responder.$$),
        (4, $$高い____、これは買う価値がある。$$, $$Mesmo sendo caro, vale a pena comprar.$$),
        (5, $$急いでいた____、走らないで。$$, $$Mesmo com pressa, não corra.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-105', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしても$$),
        (2, $$にしても$$),
        (3, $$にしても$$),
        (4, $$にしても$$),
        (5, $$にしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-106 — 〜に沿って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-106',
    'grammar',
    'N2',
    $$〜に沿って$$,
    $$ni sotte$$,
    $$Ao longo de / De acordo com / Seguindo$$,
    $$に沿って tem dois usos principais.

O primeiro indica que algo segue ao longo de uma linha física, como um rio, uma rua ou uma linha de trem. Equivale a "ao longo de". Por exemplo, "andei ao longo do rio".

O segundo indica que algo é feito de acordo com um plano, uma regra, um desejo ou uma orientação. Equivale a "de acordo com" ou "seguindo". Por exemplo, "vamos seguir o manual".$$,
    $$No segundo uso, é parecido com に基づいて e に従って.

A forma に沿った vem antes de substantivos, como 希望に沿った商品.$$,
    $$Substantivo + に沿って + Verbo
Substantivo + に沿った + Substantivo
Substantivo + に沿い$$,
    $$に沿って$$,
    $$に沿って|に沿い|に沿った|にそって$$,
    ARRAY['に', '沿って']::text[],
    ARRAY['に沿って', 'に沿い', 'に沿った', 'にそって']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-106', $$川に沿って、桜の木が並んでいる。$$, $$かわにそって、さくらのきがならんでいる。$$, $$Ao longo do rio, há cerejeiras enfileiradas.$$),
    ('n2-grammar-106', $$この道に沿ってまっすぐ行くと、駅があります。$$, $$このみちにそってまっすぐいくと、えきがあります。$$, $$Seguindo reto por esta rua, você encontra a estação.$$),
    ('n2-grammar-106', $$マニュアルに沿って作業を進めてください。$$, $$マニュアルにそってさぎょうをすすめてください。$$, $$Faça o trabalho de acordo com o manual.$$),
    ('n2-grammar-106', $$お客様の希望に沿ったプランを用意しました。$$, $$おきゃくさまのきぼうにそったプランをよういしました。$$, $$Preparamos um plano de acordo com o desejo do cliente.$$),
    ('n2-grammar-106', $$線路に沿い、細い道が続いている。$$, $$せんろにそい、ほそいみちがつづいている。$$, $$Uma rua estreita segue ao longo da linha do trem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$海岸____、ホテルが建っている。$$, $$Ao longo da costa, há hotéis construídos.$$),
        (2, $$計画____、工事を進める。$$, $$A obra segue de acordo com o plano.$$),
        (3, $$会社の方針____行動してください。$$, $$Aja de acordo com a política da empresa.$$),
        (4, $$この線____紙を切ってください。$$, $$Corte o papel seguindo esta linha.$$),
        (5, $$ご要望____、内容を変更いたしました。$$, $$Atendendo ao seu pedido, alteramos o conteúdo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-106', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に沿って$$),
        (1, $$に沿い$$),
        (1, $$にそって$$),
        (2, $$に沿って$$),
        (2, $$に沿い$$),
        (2, $$にそって$$),
        (3, $$に沿って$$),
        (3, $$に沿い$$),
        (3, $$にそって$$),
        (4, $$に沿って$$),
        (4, $$に沿い$$),
        (4, $$にそって$$),
        (5, $$に沿って$$),
        (5, $$に沿い$$),
        (5, $$にそって$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-107 — 〜に相違ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-107',
    'grammar',
    'N2',
    $$〜に相違ない$$,
    $$ni soui nai$$,
    $$Sem dúvida / Com certeza / Não há dúvida de que$$,
    $$に相違ない expressa uma certeza forte, baseada em algum motivo. Equivale a "sem dúvida" ou "não há dúvida de que".

Tem o mesmo sentido de に違いない, mas é mais formal e mais usado na escrita, em documentos e em textos sérios.

Por exemplo, "o culpado é, sem dúvida, aquele homem".$$,
    $$Na fala do dia a dia, usa-se mais に違いない.

A forma に相違ありません é ainda mais formal, usada em declarações e documentos oficiais.$$,
    $$Verbo (forma simples) + に相違ない
Adjetivo い + に相違ない
Adjetivo な / Substantivo + に相違ない$$,
    $$に相違ない$$,
    $$に相違ない|に相違ありません|にそういない$$,
    ARRAY['に', '相違', 'ない']::text[],
    ARRAY['に相違ない', 'に相違ありません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-107', $$犯人はあの男に相違ない。$$, $$はんにんはあのおとこにそういない。$$, $$O culpado é, sem dúvida, aquele homem.$$),
    ('n2-grammar-107', $$彼の話は本当に相違ない。$$, $$かれのはなしはほんとうにそういない。$$, $$Não há dúvida de que a história dele é verdadeira.$$),
    ('n2-grammar-107', $$この作品は有名な画家が描いたものに相違ない。$$, $$このさくひんはゆうめいながかがかいたものにそういない。$$, $$Esta obra, sem dúvida, foi pintada por um pintor famoso.$$),
    ('n2-grammar-107', $$上記の内容に相違ありません。$$, $$じょうきのないようにそういありません。$$, $$O conteúdo acima está correto, sem dúvida.$$),
    ('n2-grammar-107', $$彼女は今ごろ心配しているに相違ない。$$, $$かのじょはいまごろしんぱいしているにそういない。$$, $$Com certeza ela está preocupada agora.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この計画は成功する____。$$, $$Este plano, sem dúvida, vai dar certo.$$),
        (2, $$彼が書いた手紙____。$$, $$Não há dúvida de que é uma carta escrita por ele.$$),
        (3, $$あの店の料理はおいしい____。$$, $$A comida daquela loja com certeza é gostosa.$$),
        (4, $$彼は何かを隠している____。$$, $$Sem dúvida ele está escondendo alguma coisa.$$),
        (5, $$これは事実____。$$, $$Isto, sem dúvida, é um fato.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-107', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に相違ない$$),
        (1, $$に相違ありません$$),
        (2, $$に相違ない$$),
        (2, $$に相違ありません$$),
        (3, $$に相違ない$$),
        (3, $$に相違ありません$$),
        (4, $$に相違ない$$),
        (4, $$に相違ありません$$),
        (5, $$に相違ない$$),
        (5, $$に相違ありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-108 — 〜に過ぎない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-108',
    'grammar',
    'N2',
    $$〜に過ぎない$$,
    $$ni suginai$$,
    $$Não passa de / É apenas / Não é mais que$$,
    $$に過ぎない indica que algo não é tão importante ou não vai além de um certo nível. Equivale a "não passa de" ou "é apenas".

A pessoa diminui a importância de algo, seja por modéstia, seja para mostrar que é pouco. Por exemplo, "isso não passa de um boato" ou "sou apenas um estudante".

É uma expressão um pouco formal, usada tanto na fala quanto na escrita.$$,
    $$É parecido com だけだ, mas に過ぎない é mais formal e tem um tom mais forte de "pouco".

Não se confunde com にほかならない, que reforça em vez de diminuir.$$,
    $$Substantivo + に過ぎない
Verbo (forma simples) + に過ぎない
Número / Quantidade + に過ぎない$$,
    $$に過ぎない$$,
    $$に過ぎない|にすぎない|に過ぎません|にすぎません|に過ぎなかった|にすぎなかった$$,
    ARRAY['に', '過ぎない']::text[],
    ARRAY['に過ぎない', 'にすぎない', 'に過ぎません', 'に過ぎなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-108', $$それはただのうわさに過ぎない。$$, $$それはただのうわさにすぎない。$$, $$Isso não passa de um boato.$$),
    ('n2-grammar-108', $$私はただの学生に過ぎません。$$, $$わたしはただのがくせいにすぎません。$$, $$Sou apenas um estudante.$$),
    ('n2-grammar-108', $$参加者はわずか十人にすぎなかった。$$, $$さんかしゃはわずかじゅうにんにすぎなかった。$$, $$Os participantes não passaram de dez pessoas.$$),
    ('n2-grammar-108', $$彼の言うことは言い訳に過ぎない。$$, $$かれのいうことはいいわけにすぎない。$$, $$O que ele diz não passa de desculpa.$$),
    ('n2-grammar-108', $$これは問題の一部にすぎない。$$, $$これはもんだいのいちぶにすぎない。$$, $$Isto é apenas uma parte do problema.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$それはあなたの想像____。$$, $$Isso não passa da sua imaginação.$$),
        (2, $$私は自分の仕事をした____。$$, $$Eu apenas fiz o meu trabalho.$$),
        (3, $$合格したのは全体の一割____。$$, $$Os aprovados não passaram de dez por cento do total.$$),
        (4, $$この案はまだ計画の段階____。$$, $$Esta proposta ainda é apenas uma fase de planejamento.$$),
        (5, $$彼の優しさは見せかけ____。$$, $$A gentileza dele não passa de fachada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-108', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に過ぎない$$),
        (1, $$にすぎない$$),
        (1, $$に過ぎません$$),
        (1, $$にすぎません$$),
        (2, $$に過ぎない$$),
        (2, $$にすぎない$$),
        (2, $$に過ぎません$$),
        (2, $$にすぎません$$),
        (3, $$に過ぎない$$),
        (3, $$にすぎない$$),
        (3, $$に過ぎなかった$$),
        (3, $$にすぎなかった$$),
        (4, $$に過ぎない$$),
        (4, $$にすぎない$$),
        (4, $$に過ぎません$$),
        (4, $$にすぎません$$),
        (5, $$に過ぎない$$),
        (5, $$にすぎない$$),
        (5, $$に過ぎません$$),
        (5, $$にすぎません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-109 — 〜に伴って
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-109',
    'grammar',
    'N2',
    $$〜に伴って$$,
    $$ni tomonatte$$,
    $$Junto com / À medida que / Com$$,
    $$に伴って indica que uma mudança acontece junto com outra. Equivale a "junto com", "à medida que" ou "com".

A primeira parte mostra uma mudança ou um acontecimento, e a segunda mostra o que muda por causa disso. Por exemplo, "com o aumento da população, o trânsito também piorou".

É uma expressão formal, muito usada em notícias, relatórios e textos sobre mudanças sociais.$$,
    $$É parecido com につれて e とともに.

Costuma vir com palavras que indicam mudança, como 増加, 発展, 変化 e 高齢化.

A forma に伴う vem antes de substantivos, como 台風に伴う被害.$$,
    $$Substantivo + に伴って / に伴い
Verbo (forma dicionário) + の + に伴って / に伴い
Substantivo + に伴う + Substantivo$$,
    $$に伴って$$,
    $$に伴って|に伴い|に伴う|にともなって|にともない$$,
    ARRAY['に', '伴って']::text[],
    ARRAY['に伴って', 'に伴い', 'に伴う']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-109', $$人口の増加に伴って、交通渋滞がひどくなった。$$, $$じんこうのぞうかにともなって、こうつうじゅうたいがひどくなった。$$, $$Com o aumento da população, o trânsito piorou.$$),
    ('n2-grammar-109', $$経済の発展に伴い、生活が豊かになった。$$, $$けいざいのはってんにともない、せいかつがゆたかになった。$$, $$Junto com o desenvolvimento econômico, a vida ficou mais próspera.$$),
    ('n2-grammar-109', $$台風に伴う大雨で、川が増水した。$$, $$たいふうにともなうおおあめで、かわがぞうすいした。$$, $$Com a chuva forte trazida pelo tufão, o rio encheu.$$),
    ('n2-grammar-109', $$年をとるのに伴って、体力が落ちてきた。$$, $$としをとるのにともなって、たいりょくがおちてきた。$$, $$À medida que envelheço, a minha resistência física vem caindo.$$),
    ('n2-grammar-109', $$会社の移転に伴い、住所が変わります。$$, $$かいしゃのいてんにともない、じゅうしょがかわります。$$, $$Com a mudança da empresa, o endereço vai mudar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$高齢化____、医療費が増えている。$$, $$Com o envelhecimento da população, os gastos com saúde estão aumentando.$$),
        (2, $$技術の進歩____、仕事のやり方も変わった。$$, $$Junto com o avanço da tecnologia, a forma de trabalhar também mudou.$$),
        (3, $$気温の上昇____、海の水位も上がっている。$$, $$À medida que a temperatura sobe, o nível do mar também está subindo.$$),
        (4, $$工事____、この道は通行止めになります。$$, $$Por causa da obra, esta rua ficará interditada.$$),
        (5, $$店の拡大____、従業員を増やした。$$, $$Com a ampliação da loja, aumentamos o número de funcionários.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-109', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に伴って$$),
        (1, $$に伴い$$),
        (1, $$にともなって$$),
        (1, $$にともない$$),
        (2, $$に伴って$$),
        (2, $$に伴い$$),
        (2, $$にともなって$$),
        (2, $$にともない$$),
        (3, $$に伴って$$),
        (3, $$に伴い$$),
        (3, $$にともなって$$),
        (3, $$にともない$$),
        (4, $$に伴って$$),
        (4, $$に伴い$$),
        (4, $$にともなって$$),
        (4, $$にともない$$),
        (5, $$に伴って$$),
        (5, $$に伴い$$),
        (5, $$にともなって$$),
        (5, $$にともない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-110 — 〜につけ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-110',
    'grammar',
    'N2',
    $$〜につけ$$,
    $$ni tsuke$$,
    $$Sempre que / Toda vez que / Seja... seja$$,
    $$につけ indica que, sempre que algo acontece, surge naturalmente um sentimento ou uma lembrança. Equivale a "sempre que" ou "toda vez que".

Costuma vir com verbos como ver, ouvir e pensar, e a segunda parte fala de emoções ou lembranças. Por exemplo, "toda vez que vejo esta foto, lembro da minha infância".

Na forma 〜につけ〜につけ, apresenta duas situações opostas com o sentido de "seja... seja". Por exemplo, "nas coisas boas e nas ruins".$$,
    $$A expressão 何かにつけ significa "por qualquer motivo" ou "a todo momento".

É parecido com たびに, mas につけ destaca mais os sentimentos que surgem.

Expressões comuns são いいにつけ悪いにつけ e 雨につけ風につけ.$$,
    $$Verbo (forma dicionário) + につけ
Adjetivo い + につけ + Adjetivo い + につけ
Substantivo + につけ + Substantivo + につけ$$,
    $$につけ$$,
    $$につけ$$,
    ARRAY['に', 'つけ']::text[],
    ARRAY['につけ', 'につけて', '何かにつけ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-110', $$この写真を見るにつけ、子供のころを思い出す。$$, $$このしゃしんをみるにつけ、こどものころをおもいだす。$$, $$Toda vez que vejo esta foto, lembro da minha infância.$$),
    ('n2-grammar-110', $$彼の話を聞くにつけ、自分の甘さを感じる。$$, $$かれのはなしをきくにつけ、じぶんのあまさをかんじる。$$, $$Sempre que ouço a história dele, percebo como sou acomodado.$$),
    ('n2-grammar-110', $$いいにつけ悪いにつけ、親の影響は大きい。$$, $$いいにつけわるいにつけ、おやのえいきょうはおおきい。$$, $$Seja para o bem, seja para o mal, a influência dos pais é grande.$$),
    ('n2-grammar-110', $$母は何かにつけて、私のことを心配する。$$, $$はははなにかにつけて、わたしのことをしんぱいする。$$, $$Minha mãe se preocupa comigo a todo momento.$$),
    ('n2-grammar-110', $$ニュースを見るにつけ、平和の大切さを考える。$$, $$ニュースをみるにつけ、へいわのたいせつさをかんがえる。$$, $$Toda vez que vejo o noticiário, penso na importância da paz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この曲を聞く____、昔の恋人を思い出す。$$, $$Toda vez que ouço esta música, lembro do meu antigo namorado.$$),
        (2, $$嬉しいにつけ悲しい____、彼はいつも日記を書く。$$, $$Feliz ou triste, ele sempre escreve no diário.$$),
        (3, $$彼女の活躍を見る____、勇気をもらう。$$, $$Sempre que vejo o sucesso dela, ganho coragem.$$),
        (4, $$父は何か____、文句を言う。$$, $$Meu pai reclama de qualquer coisa.$$),
        (5, $$故郷の話を聞く____、帰りたくなる。$$, $$Toda vez que ouço falar da minha terra natal, dá vontade de voltar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-110', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につけ$$),
        (1, $$につけて$$),
        (2, $$につけ$$),
        (3, $$につけ$$),
        (3, $$につけて$$),
        (4, $$につけ$$),
        (4, $$につけて$$),
        (5, $$につけ$$),
        (5, $$につけて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-111 — 〜につき
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-111',
    'grammar',
    'N2',
    $$〜につき$$,
    $$ni tsuki$$,
    $$Por motivo de / Devido a / Por cada$$,
    $$につき tem dois usos principais.

O primeiro indica o motivo de algo, de forma formal. Equivale a "por motivo de" ou "devido a". É muito usado em avisos e placas, como "fechado devido a reformas".

O segundo indica uma proporção, com o sentido de "por cada". Por exemplo, "mil ienes por pessoa" ou "um por cliente".$$,
    $$No uso de motivo, aparece principalmente em avisos escritos, como 工事中につき ou 準備中につき.

No uso de proporção, é parecido com あたり, mas につき é mais formal.$$,
    $$Substantivo + につき + Aviso (motivo)
Número / Unidade + につき + Quantidade (proporção)$$,
    $$につき$$,
    $$につき$$,
    ARRAY['に', 'つき']::text[],
    ARRAY['につき']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-111', $$工事中につき、この道は通れません。$$, $$こうじちゅうにつき、このみちはとおれません。$$, $$Devido a obras, não é possível passar por esta rua.$$),
    ('n2-grammar-111', $$本日は定休日につき、お休みします。$$, $$ほんじつはていきゅうびにつき、おやすみします。$$, $$Hoje é nosso dia de folga, por isso estamos fechados.$$),
    ('n2-grammar-111', $$参加費は一人につき千円です。$$, $$さんかひはひとりにつきせんえんです。$$, $$A taxa de participação é de mil ienes por pessoa.$$),
    ('n2-grammar-111', $$お一人様につき、一点限りです。$$, $$おひとりさまにつき、いってんかぎりです。$$, $$Limitado a um item por cliente.$$),
    ('n2-grammar-111', $$雨天につき、試合は中止となりました。$$, $$うてんにつき、しあいはちゅうしとなりました。$$, $$Devido à chuva, a partida foi cancelada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$準備中____、しばらくお待ちください。$$, $$Estamos nos preparando, por favor aguarde um momento.$$),
        (2, $$駐車料金は一時間____三百円です。$$, $$O estacionamento custa trezentos ienes por hora.$$),
        (3, $$改装中____、休業しております。$$, $$Estamos fechados devido a reformas.$$),
        (4, $$このくじは一回____百円です。$$, $$Este sorteio custa cem ienes por vez.$$),
        (5, $$会議中____、入室をご遠慮ください。$$, $$Em reunião, por favor não entre.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-111', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$につき$$),
        (2, $$につき$$),
        (3, $$につき$$),
        (4, $$につき$$),
        (5, $$につき$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-112 — 〜にわたって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-112',
    'grammar',
    'N2',
    $$〜にわたって$$,
    $$ni watatte$$,
    $$Durante / Ao longo de / Por toda a extensão de$$,
    $$にわたって indica que algo se estende por um período longo ou por uma área grande. Equivale a "durante" ou "ao longo de".

Costuma vir com palavras de tempo, como "três horas" ou "dez anos", ou de espaço, como "todo o país" ou "uma grande área". Por exemplo, "a reunião durou cinco horas".

Mostra que a duração ou a extensão é grande.$$,
    $$A forma にわたる vem antes de substantivos, como 長年にわたる研究.

É parecido com の間, mas にわたって destaca a grande extensão.$$,
    $$Substantivo (período / área / quantidade) + にわたって / にわたり
Substantivo + にわたる + Substantivo$$,
    $$にわたって$$,
    $$にわたって|にわたり|にわたる|にわたった$$,
    ARRAY['に', 'わたって']::text[],
    ARRAY['にわたって', 'にわたり', 'にわたる', 'にわたった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-112', $$会議は五時間にわたって続いた。$$, $$かいぎはごじかんにわたってつづいた。$$, $$A reunião durou cinco horas.$$),
    ('n2-grammar-112', $$彼は十年にわたって、この研究を続けてきた。$$, $$かれはじゅうねんにわたって、このけんきゅうをつづけてきた。$$, $$Ele continuou esta pesquisa ao longo de dez anos.$$),
    ('n2-grammar-112', $$台風で、広い範囲にわたり被害が出た。$$, $$たいふうで、ひろいはんいにわたりひがいがでた。$$, $$Com o tufão, houve danos em uma grande área.$$),
    ('n2-grammar-112', $$三日間にわたる祭りが始まった。$$, $$みっかかんにわたるまつりがはじまった。$$, $$Começou um festival que dura três dias.$$),
    ('n2-grammar-112', $$全国にわたって、大雨が降った。$$, $$ぜんこくにわたって、おおあめがふった。$$, $$Choveu forte em todo o país.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$手術は八時間____行われた。$$, $$A cirurgia durou oito horas.$$),
        (2, $$この地域では一か月____雨が降らなかった。$$, $$Nesta região, não choveu durante um mês.$$),
        (3, $$長年____研究の結果がようやく出た。$$, $$Finalmente saiu o resultado de uma pesquisa de muitos anos.$$),
        (4, $$彼女は二十年____、この店を経営してきた。$$, $$Ela administrou esta loja ao longo de vinte anos.$$),
        (5, $$試験は三日間____行われる。$$, $$A prova será realizada ao longo de três dias.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-112', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にわたって$$),
        (1, $$にわたり$$),
        (2, $$にわたって$$),
        (2, $$にわたり$$),
        (3, $$にわたる$$),
        (3, $$にわたった$$),
        (4, $$にわたって$$),
        (4, $$にわたり$$),
        (5, $$にわたって$$),
        (5, $$にわたり$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-113 — 〜にも関わらず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-113',
    'grammar',
    'N2',
    $$〜にも関わらず$$,
    $$ni mo kakawarazu$$,
    $$Apesar de / Embora / Mesmo$$,
    $$にも関わらず indica que algo aconteceu de forma contrária ao que se esperava. Equivale a "apesar de" ou "embora".

A primeira parte apresenta um fato, e a segunda mostra um resultado inesperado. Muitas vezes há um tom de surpresa ou crítica. Por exemplo, "apesar da chuva, muitas pessoas vieram".

É uma expressão formal, comum em textos e notícias.$$,
    $$É parecido com のに, mas のに expressa mais frustração pessoal, enquanto にも関わらず é mais objetivo e formal.

Também é escrito にもかかわらず.

Não se confunde com に関わらず, que significa "independentemente de".$$,
    $$Verbo (forma simples) + にも関わらず
Adjetivo い + にも関わらず
Adjetivo な / Substantivo + (である) + にも関わらず$$,
    $$にも関わらず$$,
    $$にも関わらず|にもかかわらず$$,
    ARRAY['に', 'も', '関わらず']::text[],
    ARRAY['にも関わらず', 'にもかかわらず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-113', $$雨にも関わらず、たくさんの人が来た。$$, $$あめにもかかわらず、たくさんのひとがきた。$$, $$Apesar da chuva, muitas pessoas vieram.$$),
    ('n2-grammar-113', $$彼は熱があるにもかかわらず、会社に行った。$$, $$かれはねつがあるにもかかわらず、かいしゃにいった。$$, $$Apesar de estar com febre, ele foi trabalhar.$$),
    ('n2-grammar-113', $$一生懸命勉強したにも関わらず、試験に落ちた。$$, $$いっしょうけんめいべんきょうしたにもかかわらず、しけんにおちた。$$, $$Apesar de ter estudado muito, reprovei na prova.$$),
    ('n2-grammar-113', $$平日にもかかわらず、店は混んでいた。$$, $$へいじつにもかかわらず、みせはこんでいた。$$, $$Embora fosse dia útil, a loja estava cheia.$$),
    ('n2-grammar-113', $$危険だと言われたにも関わらず、彼は山に登った。$$, $$きけんだといわれたにもかかわらず、かれはやまにのぼった。$$, $$Mesmo tendo sido avisado do perigo, ele subiu a montanha.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$夜遅い____、電話に出てくれてありがとう。$$, $$Obrigado por atender o telefone apesar de ser tarde da noite.$$),
        (2, $$忙しい____、手伝ってくれた。$$, $$Apesar de estar ocupado, ele me ajudou.$$),
        (3, $$注意した____、彼はまた同じミスをした。$$, $$Apesar de eu ter avisado, ele cometeu o mesmo erro.$$),
        (4, $$高い____、その商品はよく売れている。$$, $$Apesar de ser caro, esse produto vende bem.$$),
        (5, $$悪天候____、飛行機は予定通り出発した。$$, $$Apesar do mau tempo, o avião partiu no horário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-113', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にも関わらず$$),
        (1, $$にもかかわらず$$),
        (2, $$にも関わらず$$),
        (2, $$にもかかわらず$$),
        (3, $$にも関わらず$$),
        (3, $$にもかかわらず$$),
        (4, $$にも関わらず$$),
        (4, $$にもかかわらず$$),
        (5, $$にも関わらず$$),
        (5, $$にもかかわらず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-114 — 〜にて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-114',
    'grammar',
    'N2',
    $$〜にて$$,
    $$nite$$,
    $$Em / Por meio de / Com$$,
    $$にて é uma forma formal e escrita da partícula で. Equivale a "em", "por meio de" ou "com".

Pode indicar o lugar onde algo acontece, como "no salão principal", o meio usado, como "por e-mail", ou o momento em que algo termina, como "encerramos hoje".

É muito comum em avisos, convites, anúncios e documentos oficiais.$$,
    $$Na fala do dia a dia, usa-se で.

Expressões comuns são 会場にて, メールにて, 本日にて e 以上にて.$$,
    $$Substantivo (lugar) + にて
Substantivo (meio / método) + にて
Substantivo (tempo) + にて + 終了する / 締め切る$$,
    $$にて$$,
    $$にて$$,
    ARRAY['にて']::text[],
    ARRAY['にて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-114', $$式は本館ホールにて行います。$$, $$しきはほんかんホールにておこないます。$$, $$A cerimônia será realizada no salão do prédio principal.$$),
    ('n2-grammar-114', $$結果はメールにてお知らせします。$$, $$けっかはメールにておしらせします。$$, $$Os resultados serão informados por e-mail.$$),
    ('n2-grammar-114', $$本日にて受付を終了いたします。$$, $$ほんじつにてうけつけをしゅうりょういたします。$$, $$Com o dia de hoje, encerramos as inscrições.$$),
    ('n2-grammar-114', $$以上にて説明を終わります。$$, $$いじょうにてせつめいをおわります。$$, $$Com isso, encerro a explicação.$$),
    ('n2-grammar-114', $$詳細は受付にてお尋ねください。$$, $$しょうさいはうけつけにておたずねください。$$, $$Para detalhes, pergunte na recepção.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会議は三階の会議室____行います。$$, $$A reunião será realizada na sala de reuniões do terceiro andar.$$),
        (2, $$申し込みは電話____受け付けます。$$, $$As inscrições são aceitas por telefone.$$),
        (3, $$これ____本日の授業を終わります。$$, $$Com isto, encerro a aula de hoje.$$),
        (4, $$商品は宅配便____お届けします。$$, $$Entregaremos o produto por serviço de entrega.$$),
        (5, $$チケットは駅の窓口____販売しております。$$, $$Os ingressos estão à venda no guichê da estação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にて$$),
        (2, $$にて$$),
        (3, $$にて$$),
        (4, $$にて$$),
        (5, $$にて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-115 — 〜のももっともだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-115',
    'grammar',
    'N2',
    $$〜のももっともだ$$,
    $$no mo mottomo da$$,
    $$É compreensível que / É natural que / Faz sentido que$$,
    $$のももっともだ indica que uma reação ou atitude é compreensível diante da situação. Equivale a "é compreensível que" ou "faz sentido que".

A pessoa que fala mostra que entende e aceita o motivo do outro. Por exemplo, "depois de esperar duas horas, é compreensível que ele esteja bravo".

É parecido com のも当然だ e のも無理はない.$$,
    $$O tom é de compreensão e empatia, não de crítica.

Também aparece como のももっともです, na forma educada.

A palavra もっとも sozinha, como adjetivo, significa "razoável".$$,
    $$Verbo (forma simples) + のももっともだ
Adjetivo い + のももっともだ
Adjetivo な + な + のももっともだ$$,
    $$のももっともだ$$,
    $$のももっとも$$,
    ARRAY['の', 'も', 'もっとも', 'だ']::text[],
    ARRAY['のももっともだ', 'のももっともです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-115', $$二時間も待たされたのだから、彼が怒るのももっともだ。$$, $$にじかんもまたされたのだから、かれがおこるのももっともだ。$$, $$Ele esperou duas horas, então é compreensível que esteja bravo.$$),
    ('n2-grammar-115', $$初めての海外なら、不安に思うのももっともだ。$$, $$はじめてのかいがいなら、ふあんにおもうのももっともだ。$$, $$Se é a primeira vez no exterior, é natural ficar inseguro.$$),
    ('n2-grammar-115', $$あれだけ練習したのだから、優勝したのももっともです。$$, $$あれだけれんしゅうしたのだから、ゆうしょうしたのももっともです。$$, $$Com tanto treino, faz sentido que tenha vencido.$$),
    ('n2-grammar-115', $$毎日残業では、疲れるのももっともだ。$$, $$まいにちざんぎょうでは、つかれるのももっともだ。$$, $$Fazendo hora extra todo dia, é compreensível ficar cansado.$$),
    ('n2-grammar-115', $$この値段なら、人気があるのももっともだ。$$, $$このねだんなら、にんきがあるのももっともだ。$$, $$Com este preço, é natural que seja popular.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ひどいことを言われたのだから、彼女が泣く____。$$, $$Ouviu coisas horríveis, então é compreensível que ela chore.$$),
        (2, $$約束を何度も破られたら、信じられなくなる____。$$, $$Se a promessa for quebrada várias vezes, é natural deixar de confiar.$$),
        (3, $$こんなに暑いなら、食欲がない____。$$, $$Com este calor, é compreensível não ter apetite.$$),
        (4, $$子供が心配な____。$$, $$É natural se preocupar com o filho.$$),
        (5, $$一人で住むのが寂しい____。$$, $$É compreensível que morar sozinho seja solitário.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のももっともだ$$),
        (1, $$のももっともです$$),
        (2, $$のももっともだ$$),
        (2, $$のももっともです$$),
        (3, $$のももっともだ$$),
        (3, $$のももっともです$$),
        (4, $$のももっともだ$$),
        (4, $$のももっともです$$),
        (5, $$のももっともだ$$),
        (5, $$のももっともです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-116 — 〜の下で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-116',
    'grammar',
    'N2',
    $$〜の下で$$,
    $$no moto de$$,
    $$Sob / Sob a orientação de / Debaixo de$$,
    $$の下で, lido もとで, indica que algo acontece sob a influência, orientação ou condição de algo ou alguém. Equivale a "sob" ou "sob a orientação de".

Pode se referir a uma pessoa, como "estudar sob a orientação de um professor famoso", ou a uma condição, como "sob a lei" ou "sob este acordo".

Também pode indicar um lugar físico, como "debaixo do céu azul".$$,
    $$Nesse uso, 下 é lido もと e não した.

A forma の下に é mais formal e aparece em textos sérios, como 法の下に.

Expressões comuns são 先生の下で, 指導の下で e 青空の下で.$$,
    $$Substantivo (pessoa) + の下で
Substantivo (condição / regra) + の下で / の下に$$,
    $$の下で$$,
    $$の下で|の下に|のもとで|のもとに$$,
    ARRAY['の', '下', 'で']::text[],
    ARRAY['の下で', 'の下に', 'のもとで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-116', $$有名な先生の下で、ピアノを習った。$$, $$ゆうめいなせんせいのもとで、ピアノをならった。$$, $$Aprendi piano sob a orientação de um professor famoso.$$),
    ('n2-grammar-116', $$青空の下で、お弁当を食べた。$$, $$あおぞらのもとで、おべんとうをたべた。$$, $$Comi a marmita debaixo do céu azul.$$),
    ('n2-grammar-116', $$専門家の指導の下で、実験を行った。$$, $$せんもんかのしどうのもとで、じっけんをおこなった。$$, $$Fizemos o experimento sob a orientação de especialistas.$$),
    ('n2-grammar-116', $$すべての人は法の下に平等だ。$$, $$すべてのひとはほうのもとにびょうどうだ。$$, $$Todas as pessoas são iguais perante a lei.$$),
    ('n2-grammar-116', $$厳しい条件の下で、選手たちは練習を続けた。$$, $$きびしいじょうけんのもとで、せんしゅたちはれんしゅうをつづけた。$$, $$Sob condições difíceis, os atletas continuaram treinando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は父親の____、料理の修業をした。$$, $$Ele treinou culinária sob a orientação do pai.$$),
        (2, $$医師の管理____、新しい薬を試した。$$, $$Testamos o novo remédio sob a supervisão do médico.$$),
        (3, $$太陽____、子供たちが元気に遊んでいる。$$, $$Debaixo do sol, as crianças brincam animadas.$$),
        (4, $$新しい社長____、会社は大きく変わった。$$, $$Sob o novo presidente, a empresa mudou muito.$$),
        (5, $$この契約____、両社は協力していく。$$, $$Sob este contrato, as duas empresas vão cooperar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-116', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$下で$$),
        (1, $$もとで$$),
        (2, $$の下で$$),
        (2, $$の下に$$),
        (2, $$のもとで$$),
        (2, $$のもとに$$),
        (3, $$の下で$$),
        (3, $$のもとで$$),
        (4, $$の下で$$),
        (4, $$のもとで$$),
        (5, $$の下で$$),
        (5, $$の下に$$),
        (5, $$のもとで$$),
        (5, $$のもとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-117 — 〜の上では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-117',
    'grammar',
    'N2',
    $$〜の上では$$,
    $$no ue dewa$$,
    $$Segundo / Em termos de / No papel$$,
    $$の上では indica que algo é verdade de acordo com uma informação ou um ponto de vista, mas muitas vezes não corresponde à realidade. Equivale a "segundo", "em termos de" ou "no papel".

Costuma vir com palavras como calendário, dados, cálculo, lei e regra. Por exemplo, "segundo o calendário já é primavera, mas ainda está frio".

A segunda parte muitas vezes mostra uma diferença entre a teoria e a prática.$$,
    $$Expressões comuns são 暦の上では, 計算の上では, データの上では e 法律の上では.

O tom geralmente contrasta a teoria com a realidade.$$,
    $$Substantivo + の上では + Frase
Substantivo + の上で(は) + Frase$$,
    $$の上では$$,
    $$の上では|の上で|のうえでは$$,
    ARRAY['の', '上', 'では']::text[],
    ARRAY['の上では', 'の上で']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-117', $$暦の上では春だが、まだ寒い。$$, $$こよみのうえでははるだが、まださむい。$$, $$Segundo o calendário já é primavera, mas ainda está frio.$$),
    ('n2-grammar-117', $$計算の上では、十分に間に合うはずだ。$$, $$けいさんのうえでは、じゅうぶんにまにあうはずだ。$$, $$Em termos de cálculo, deve dar tempo de sobra.$$),
    ('n2-grammar-117', $$データの上では、売り上げは増えている。$$, $$データのうえでは、うりあげはふえている。$$, $$Segundo os dados, as vendas estão aumentando.$$),
    ('n2-grammar-117', $$法律の上では、彼に責任はない。$$, $$ほうりつのうえでは、かれにせきにんはない。$$, $$Do ponto de vista da lei, ele não tem responsabilidade.$$),
    ('n2-grammar-117', $$書類の上では問題ないが、実際はどうだろう。$$, $$しょるいのうえではもんだいないが、じっさいはどうだろう。$$, $$No papel não há problema, mas como será na prática?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$暦____もう秋だが、毎日暑い。$$, $$Segundo o calendário já é outono, mas faz calor todos os dias.$$),
        (2, $$理論____可能だが、実際には難しい。$$, $$Na teoria é possível, mas na prática é difícil.$$),
        (3, $$数字____、景気は回復している。$$, $$Segundo os números, a economia está se recuperando.$$),
        (4, $$規則____、ここでたばこを吸ってはいけない。$$, $$Segundo as regras, não se pode fumar aqui.$$),
        (5, $$地図____近いが、実際は山道で遠い。$$, $$No mapa é perto, mas na realidade é longe por causa da estrada na montanha.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-117', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$の上では$$),
        (1, $$のうえでは$$),
        (2, $$の上では$$),
        (2, $$のうえでは$$),
        (3, $$の上では$$),
        (3, $$のうえでは$$),
        (4, $$の上では$$),
        (4, $$のうえでは$$),
        (5, $$の上では$$),
        (5, $$のうえでは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-118 — 〜のみならず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-118',
    'grammar',
    'N2',
    $$〜のみならず$$,
    $$nomi narazu$$,
    $$Não apenas / Não só / Além de$$,
    $$のみならず indica que algo não se limita a um caso e se estende a outros. Equivale a "não apenas" ou "não só".

Tem o mesmo sentido de だけでなく, mas é bem mais formal e aparece principalmente na escrita, em discursos e notícias.

Por exemplo, "este problema afeta não apenas o Japão, mas o mundo inteiro". Depois, costuma vir も.$$,
    $$A forma のみならず também pode aparecer no começo de frase com o sentido de "além disso".

É parecido com ばかりか e に限らず.$$,
    $$Substantivo + のみならず + Frase (com も)
Verbo / Adjetivo (forma simples) + のみならず
Adjetivo な / Substantivo + である + のみならず$$,
    $$のみならず$$,
    $$のみならず$$,
    ARRAY['のみ', 'ならず']::text[],
    ARRAY['のみならず']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-118', $$この問題は日本のみならず、世界中に関わる。$$, $$このもんだいはにほんのみならず、せかいじゅうにかかわる。$$, $$Este problema afeta não apenas o Japão, mas o mundo inteiro.$$),
    ('n2-grammar-118', $$彼は歌手であるのみならず、俳優としても活躍している。$$, $$かれはかしゅであるのみならず、はいゆうとしてもかつやくしている。$$, $$Ele não é apenas cantor, também faz sucesso como ator.$$),
    ('n2-grammar-118', $$この映画は子供のみならず、大人にも人気がある。$$, $$このえいがはこどものみならず、おとなにもにんきがある。$$, $$Este filme é popular não só entre crianças, mas também entre adultos.$$),
    ('n2-grammar-118', $$彼女は英語のみならず、フランス語も話せる。$$, $$かのじょはえいごのみならず、フランスごもはなせる。$$, $$Ela fala não apenas inglês, mas também francês.$$),
    ('n2-grammar-118', $$値段が高いのみならず、品質も悪い。$$, $$ねだんがたかいのみならず、ひんしつもわるい。$$, $$Não apenas o preço é alto, a qualidade também é ruim.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は観光地として国内____、海外でも有名だ。$$, $$Esta cidade é famosa como destino turístico não só no país, mas também no exterior.$$),
        (2, $$彼は勉強____、スポーツも得意だ。$$, $$Ele é bom não apenas nos estudos, mas também nos esportes.$$),
        (3, $$環境問題は政府____、個人も考えるべきだ。$$, $$Os problemas ambientais devem ser pensados não só pelo governo, mas também pelos indivíduos.$$),
        (4, $$この薬は効果がない____、副作用もある。$$, $$Este remédio não só não faz efeito, como também tem efeitos colaterais.$$),
        (5, $$このレストランは味____、雰囲気もいい。$$, $$Este restaurante é bom não apenas no sabor, mas também no ambiente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$のみならず$$),
        (2, $$のみならず$$),
        (3, $$のみならず$$),
        (4, $$のみならず$$),
        (5, $$のみならず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-119 — 〜ぬ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-119',
    'grammar',
    'N2',
    $$〜ぬ$$,
    $$nu$$,
    $$Não / Sem$$,
    $$ぬ é uma forma antiga da negação ない. Equivale a "não".

Hoje é usada principalmente na escrita formal, em provérbios, em expressões fixas e em textos literários. Por exemplo, "o que não se vê" ou "sem saber".

Antes de substantivos, ぬ funciona como adjetivo, como em "pessoa desconhecida".$$,
    $$A forma ず também é uma negação antiga, usada no meio da frase.

Expressões comuns são 知らぬ間に, 見知らぬ人, 思わぬ e 言わぬが花.

A forma ねばならない vem da mesma origem.$$,
    $$Verbo (forma ない sem ない) + ぬ
する → せぬ
Verbo (forma ない sem ない) + ぬ + Substantivo$$,
    $$ぬ$$,
    $$ぬ$$,
    ARRAY['ぬ']::text[],
    ARRAY['ぬ', 'せぬ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-119', $$見知らぬ人に声をかけられた。$$, $$みしらぬひとにこえをかけられた。$$, $$Uma pessoa desconhecida falou comigo.$$),
    ('n2-grammar-119', $$知らぬ間に、雨が降り出していた。$$, $$しらぬまに、あめがふりだしていた。$$, $$Sem eu perceber, começou a chover.$$),
    ('n2-grammar-119', $$思わぬところで友達に会った。$$, $$おもわぬところでともだちにあった。$$, $$Encontrei um amigo num lugar inesperado.$$),
    ('n2-grammar-119', $$彼は何も言わぬまま、部屋を出ていった。$$, $$かれはなにもいわぬまま、へやをでていった。$$, $$Ele saiu do quarto sem dizer nada.$$),
    ('n2-grammar-119', $$ここで負けるわけにはいかぬ。$$, $$ここでまけるわけにはいかぬ。$$, $$Não posso perder aqui.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼は帰ら____人となった。$$, $$Ele se tornou alguém que não voltaria mais.$$),
        (2, $$見知ら____町を一人で歩いた。$$, $$Andei sozinho por uma cidade desconhecida.$$),
        (3, $$思わ____事故で、けがをした。$$, $$Me machuquei num acidente inesperado.$$),
        (4, $$知ら____間に、時間が過ぎていた。$$, $$Sem eu perceber, o tempo tinha passado.$$),
        (5, $$言わ____が花だ。$$, $$O melhor é não dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-119', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ぬ$$),
        (2, $$ぬ$$),
        (3, $$ぬ$$),
        (4, $$ぬ$$),
        (5, $$ぬ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-120 — 〜抜きにして
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-120',
    'grammar',
    'N2',
    $$〜抜きにして$$,
    $$nuki ni shite$$,
    $$Sem / Deixando de lado / Sem levar em conta$$,
    $$抜きにして indica que algo é feito sem um elemento que normalmente estaria presente. Equivale a "sem" ou "deixando de lado".

Por exemplo, "deixando as formalidades de lado, vamos conversar à vontade".

Também aparece na forma 抜きにしては〜ない, que significa que algo não é possível sem aquele elemento. Por exemplo, "não dá para falar da história do Japão sem falar de Kyoto".$$,
    $$A forma 抜きで é mais simples e informal, como 朝ご飯抜きで.

Expressões comuns são 冗談は抜きにして e 堅い話は抜きにして.$$,
    $$Substantivo + を抜きにして / は抜きにして
Substantivo + 抜きで
Substantivo + を抜きにしては + Frase negativa$$,
    $$抜きにして$$,
    $$抜きにして|抜きで|抜きに|ぬきにして$$,
    ARRAY['抜き', 'に', 'して']::text[],
    ARRAY['抜きにして', 'を抜きにして', '抜きで', '抜きにしては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-120', $$冗談は抜きにして、本当の話をしよう。$$, $$じょうだんはぬきにして、ほんとうのはなしをしよう。$$, $$Deixando as brincadeiras de lado, vamos falar sério.$$),
    ('n2-grammar-120', $$堅い話は抜きにして、今日は楽しみましょう。$$, $$かたいはなしはぬきにして、きょうはたのしみましょう。$$, $$Deixando os assuntos sérios de lado, vamos nos divertir hoje.$$),
    ('n2-grammar-120', $$彼の協力を抜きにしては、この計画は成功しなかった。$$, $$かれのきょうりょくをぬきにしては、このけいかくはせいこうしなかった。$$, $$Sem a cooperação dele, este plano não teria dado certo.$$),
    ('n2-grammar-120', $$今朝は朝ご飯抜きで会社に来た。$$, $$けさはあさごはんぬきでかいしゃにきた。$$, $$Hoje de manhã vim para o trabalho sem tomar café.$$),
    ('n2-grammar-120', $$値段を抜きにして考えれば、この車が一番いい。$$, $$ねだんをぬきにしてかんがえれば、このくるまがいちばんいい。$$, $$Sem levar em conta o preço, este carro é o melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$挨拶は____、さっそく始めましょう。$$, $$Deixando os cumprimentos de lado, vamos começar logo.$$),
        (2, $$お世辞は____、正直な意見を聞かせてください。$$, $$Sem elogios, me diga sua opinião sincera.$$),
        (3, $$この町の歴史は、お寺を____は語れない。$$, $$Não dá para falar da história desta cidade sem falar dos templos.$$),
        (4, $$わさび____お寿司をください。$$, $$Me dá um sushi sem wasabi, por favor.$$),
        (5, $$仕事の話は____、ゆっくり飲もう。$$, $$Deixando o trabalho de lado, vamos beber com calma.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-120', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$抜きにして$$),
        (1, $$ぬきにして$$),
        (2, $$抜きにして$$),
        (2, $$ぬきにして$$),
        (3, $$抜きにして$$),
        (3, $$ぬきにして$$),
        (4, $$抜きで$$),
        (5, $$抜きにして$$),
        (5, $$ぬきにして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-121 — 〜抜く
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-121',
    'grammar',
    'N2',
    $$〜抜く$$,
    $$nuku$$,
    $$Até o fim / Completamente / Com todas as forças$$,
    $$抜く, quando vem depois de outro verbo, indica que a ação é feita até o fim, de forma completa, mesmo sendo difícil. Equivale a "até o fim" ou "completamente".

Muitas vezes mostra esforço e persistência. Por exemplo, "corri a maratona até o fim" ou "pensei muito, até o limite".

Também pode indicar intensidade extrema, como em "estar completamente exausto".$$,
    $$Combinações comuns são 走り抜く, やり抜く, 考え抜く, 守り抜く e 困り抜く.

É parecido com 切る, como em 使い切る, mas 抜く destaca o esforço para superar dificuldades.$$,
    $$Verbo (forma ます sem ます) + 抜く$$,
    $$抜く$$,
    $$抜く|抜いた|抜いて|抜き|抜こう|抜け$$,
    ARRAY['抜く']::text[],
    ARRAY['抜く', '抜いた', '抜いて', '抜きます']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-121', $$彼はマラソンを最後まで走り抜いた。$$, $$かれはマラソンをさいごまではしりぬいた。$$, $$Ele correu a maratona até o fim.$$),
    ('n2-grammar-121', $$何があっても、この仕事をやり抜くつもりだ。$$, $$なにがあっても、このしごとをやりぬくつもりだ。$$, $$Aconteça o que acontecer, pretendo levar este trabalho até o fim.$$),
    ('n2-grammar-121', $$考え抜いた結果、会社を辞めることにした。$$, $$かんがえぬいたけっか、かいしゃをやめることにした。$$, $$Depois de pensar muito bem, decidi sair da empresa.$$),
    ('n2-grammar-121', $$母は家族を守り抜いた。$$, $$はははかぞくをまもりぬいた。$$, $$Minha mãe protegeu a família com todas as forças.$$),
    ('n2-grammar-121', $$苦しい練習に耐え抜いて、優勝した。$$, $$くるしいれんしゅうにたえぬいて、ゆうしょうした。$$, $$Aguentou os treinos duros até o fim e venceu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一度始めたことは、最後までやり____。$$, $$O que se começa, deve-se levar até o fim.$$),
        (2, $$悩み____末、彼女は留学を決めた。$$, $$Depois de se angustiar muito, ela decidiu estudar no exterior.$$),
        (3, $$選手たちは四十二キロを走り____。$$, $$Os atletas correram os quarenta e dois quilômetros até o fim.$$),
        (4, $$この秘密は最後まで守り____つもりだ。$$, $$Pretendo guardar este segredo até o fim.$$),
        (5, $$彼は厳しい時代を生き____。$$, $$Ele sobreviveu a uma época difícil até o fim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-121', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$抜く$$),
        (1, $$抜こう$$),
        (2, $$抜いた$$),
        (3, $$抜いた$$),
        (4, $$抜く$$),
        (5, $$抜いた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-122 — 〜を契機に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-122',
    'grammar',
    'N2',
    $$〜を契機に$$,
    $$wo keiki ni$$,
    $$Aproveitando / A partir de / Por ocasião de$$,
    $$を契機に indica que um acontecimento serve como ponto de partida para uma mudança. Equivale a "a partir de", "aproveitando" ou "por ocasião de".

Muitas vezes o acontecimento é importante, como um casamento, uma doença, uma crise ou uma mudança de emprego, e leva a uma nova fase. Por exemplo, "a partir da doença, comecei a cuidar da saúde".

É uma expressão formal, parecida com をきっかけに.$$,
    $$É mais formal que をきっかけに e aparece muito em notícias e textos.

A forma を契機として é ainda mais formal.$$,
    $$Substantivo + を契機に / を契機として
Verbo (forma simples) + の + を契機に$$,
    $$を契機に$$,
    $$を契機に|を契機と|をけいきに$$,
    ARRAY['を', '契機', 'に']::text[],
    ARRAY['を契機に', 'を契機として', 'を契機にして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-122', $$病気を契機に、健康に気をつけるようになった。$$, $$びょうきをけいきに、けんこうにきをつけるようになった。$$, $$A partir da doença, passei a cuidar da saúde.$$),
    ('n2-grammar-122', $$結婚を契機として、仕事を辞めた。$$, $$けっこんをけいきとして、しごとをやめた。$$, $$Por ocasião do casamento, deixei o trabalho.$$),
    ('n2-grammar-122', $$オリンピックを契機に、町が大きく変わった。$$, $$オリンピックをけいきに、まちがおおきくかわった。$$, $$A partir das Olimpíadas, a cidade mudou muito.$$),
    ('n2-grammar-122', $$留学したのを契機に、国際問題に興味を持った。$$, $$りゅうがくしたのをけいきに、こくさいもんだいにきょうみをもった。$$, $$A partir do intercâmbio, passei a me interessar por questões internacionais.$$),
    ('n2-grammar-122', $$この事故を契機に、安全対策が見直された。$$, $$このじこをけいきに、あんぜんたいさくがみなおされた。$$, $$A partir deste acidente, as medidas de segurança foram revistas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$転職____、引っ越しをした。$$, $$Aproveitando a mudança de emprego, mudei de casa.$$),
        (2, $$子供の誕生____、たばこをやめた。$$, $$A partir do nascimento do meu filho, parei de fumar.$$),
        (3, $$震災____、防災意識が高まった。$$, $$A partir do terremoto, a consciência sobre prevenção de desastres aumentou.$$),
        (4, $$就職したの____、一人暮らしを始めた。$$, $$Por ocasião do primeiro emprego, comecei a morar sozinho.$$),
        (5, $$この出会い____、彼の人生は変わった。$$, $$A partir deste encontro, a vida dele mudou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-122', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を契機に$$),
        (1, $$を契機として$$),
        (1, $$をけいきに$$),
        (2, $$を契機に$$),
        (2, $$を契機として$$),
        (2, $$をけいきに$$),
        (3, $$を契機に$$),
        (3, $$を契機として$$),
        (3, $$をけいきに$$),
        (4, $$を契機に$$),
        (4, $$を契機として$$),
        (4, $$をけいきに$$),
        (5, $$を契機に$$),
        (5, $$を契機として$$),
        (5, $$をけいきに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-123 — 〜をめぐって
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-123',
    'grammar',
    'N2',
    $$〜をめぐって$$,
    $$wo megutte$$,
    $$Em torno de / Sobre / A respeito de$$,
    $$をめぐって indica o tema central de uma discussão, disputa ou conflito. Equivale a "em torno de" ou "sobre".

Costuma vir com verbos como discutir, brigar, debater e disputar, e geralmente há várias opiniões ou pessoas envolvidas. Por exemplo, "houve uma discussão sobre o novo projeto".

É uma expressão formal, muito usada em notícias.$$,
    $$É parecido com について, mas をめぐって é usado quando há debate, conflito ou opiniões diferentes.

A forma をめぐる vem antes de substantivos, como 遺産をめぐる争い.$$,
    $$Substantivo + をめぐって / をめぐり + Verbo
Substantivo + をめぐる + Substantivo$$,
    $$をめぐって$$,
    $$をめぐって|をめぐり|をめぐる|を巡って|を巡り|を巡る$$,
    ARRAY['を', 'めぐって']::text[],
    ARRAY['をめぐって', 'をめぐり', 'をめぐる', 'を巡って']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-123', $$新しい空港の建設をめぐって、住民の意見が分かれた。$$, $$あたらしいくうこうのけんせつをめぐって、じゅうみんのいけんがわかれた。$$, $$As opiniões dos moradores se dividiram em torno da construção do novo aeroporto.$$),
    ('n2-grammar-123', $$遺産をめぐって、兄弟が争っている。$$, $$いさんをめぐって、きょうだいがあらそっている。$$, $$Os irmãos estão brigando pela herança.$$),
    ('n2-grammar-123', $$この問題をめぐり、国会で議論が行われた。$$, $$このもんだいをめぐり、こっかいでぎろんがおこなわれた。$$, $$Houve um debate no parlamento sobre este problema.$$),
    ('n2-grammar-123', $$環境をめぐる問題は、ますます深刻になっている。$$, $$かんきょうをめぐるもんだいは、ますますしんこくになっている。$$, $$Os problemas relacionados ao meio ambiente estão cada vez mais sérios.$$),
    ('n2-grammar-123', $$一人の女性をめぐって、二人の男が争った。$$, $$ひとりのじょせいをめぐって、ふたりのおとこがあらそった。$$, $$Dois homens disputaram uma mesma mulher.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$税金の値上げ____、反対の声が上がっている。$$, $$Há vozes contrárias ao aumento dos impostos.$$),
        (2, $$会社の将来____、社員たちが話し合った。$$, $$Os funcionários conversaram sobre o futuro da empresa.$$),
        (3, $$土地____トラブルが起きた。$$, $$Houve um problema envolvendo o terreno.$$),
        (4, $$その事件____、さまざまなうわさが流れた。$$, $$Circularam vários boatos sobre esse caso.$$),
        (5, $$優勝____、三チームが激しく戦っている。$$, $$Três equipes estão disputando ferozmente o título.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-123', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をめぐって$$),
        (1, $$をめぐり$$),
        (1, $$を巡って$$),
        (1, $$を巡り$$),
        (2, $$をめぐって$$),
        (2, $$をめぐり$$),
        (2, $$を巡って$$),
        (2, $$を巡り$$),
        (3, $$をめぐる$$),
        (3, $$を巡る$$),
        (3, $$をめぐって$$),
        (3, $$を巡って$$),
        (4, $$をめぐって$$),
        (4, $$をめぐり$$),
        (4, $$を巡って$$),
        (4, $$を巡り$$),
        (5, $$をめぐって$$),
        (5, $$をめぐり$$),
        (5, $$を巡って$$),
        (5, $$を巡り$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-124 — 〜をもとに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-124',
    'grammar',
    'N2',
    $$〜をもとに$$,
    $$wo moto ni$$,
    $$Com base em / A partir de / Inspirado em$$,
    $$をもとに indica o material, a fonte ou a referência usada para criar ou fazer algo. Equivale a "com base em" ou "a partir de".

Por exemplo, "um filme feito a partir de um romance" ou "fazer um gráfico com base nos dados".

É muito usado para falar de criações, como obras, produtos, planos e relatórios.$$,
    $$É parecido com に基づいて, mas をもとに é usado quando algo serve de material ou inspiração. に基づいて é mais rígido e usado com regras ou dados.

Também é escrito を元に.$$,
    $$Substantivo + をもとに / をもとにして + Verbo
Substantivo + をもとにした + Substantivo$$,
    $$をもとに$$,
    $$をもとに|を元に|を基に$$,
    ARRAY['を', 'もと', 'に']::text[],
    ARRAY['をもとに', 'をもとにして', 'をもとにした', 'を元に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-124', $$この映画は小説をもとに作られた。$$, $$このえいがはしょうせつをもとにつくられた。$$, $$Este filme foi feito com base em um romance.$$),
    ('n2-grammar-124', $$アンケートの結果をもとに、新商品を開発した。$$, $$アンケートのけっかをもとに、しんしょうひんをかいはつした。$$, $$Desenvolvemos um novo produto a partir dos resultados da pesquisa.$$),
    ('n2-grammar-124', $$実際の事件をもとにしたドラマが人気だ。$$, $$じっさいのじけんをもとにしたドラマがにんきだ。$$, $$Uma série baseada em um caso real está fazendo sucesso.$$),
    ('n2-grammar-124', $$自分の経験をもとにして、本を書いた。$$, $$じぶんのけいけんをもとにして、ほんをかいた。$$, $$Escrevi um livro com base nas minhas experiências.$$),
    ('n2-grammar-124', $$このデータを元に、グラフを作ってください。$$, $$このデータをもとに、グラフをつくってください。$$, $$Faça um gráfico com base nestes dados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昔話____、新しい物語を作った。$$, $$Criei uma nova história a partir de um conto antigo.$$),
        (2, $$この曲は民謡____作られた。$$, $$Esta música foi composta com base em uma canção folclórica.$$),
        (3, $$お客様の意見____、サービスを改善しました。$$, $$Melhoramos o serviço com base na opinião dos clientes.$$),
        (4, $$写真____、絵を描いた。$$, $$Desenhei a partir de uma foto.$$),
        (5, $$事実____した小説を読んだ。$$, $$Li um romance baseado em fatos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をもとに$$),
        (1, $$をもとにして$$),
        (1, $$を元に$$),
        (2, $$をもとに$$),
        (2, $$をもとにして$$),
        (2, $$を元に$$),
        (3, $$をもとに$$),
        (3, $$をもとにして$$),
        (3, $$を元に$$),
        (4, $$をもとに$$),
        (4, $$をもとにして$$),
        (4, $$を元に$$),
        (5, $$をもとに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-125 — 〜を除いて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-125',
    'grammar',
    'N2',
    $$〜を除いて$$,
    $$wo nozoite$$,
    $$Exceto / Com exceção de / Tirando$$,
    $$を除いて indica uma exceção. Equivale a "exceto", "com exceção de" ou "tirando".

A pessoa diz que algo vale para todos ou para tudo, menos para aquele item. Por exemplo, "a loja abre todos os dias, exceto domingo".

É uma expressão um pouco formal, usada tanto na fala quanto na escrita.$$,
    $$É parecido com 以外, mas を除いて é mais formal.

A forma を除けば significa "tirando isso", e muitas vezes mostra que o resto é bom.$$,
    $$Substantivo + を除いて / を除き
Substantivo + を除けば$$,
    $$を除いて$$,
    $$を除いて|を除き|を除けば|をのぞいて$$,
    ARRAY['を', '除いて']::text[],
    ARRAY['を除いて', 'を除き', 'を除けば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-125', $$この店は日曜日を除いて、毎日営業している。$$, $$このみせはにちようびをのぞいて、まいにちえいぎょうしている。$$, $$Esta loja abre todos os dias, exceto domingo.$$),
    ('n2-grammar-125', $$彼を除いて、全員が賛成した。$$, $$かれをのぞいて、ぜんいんがさんせいした。$$, $$Todos concordaram, com exceção dele.$$),
    ('n2-grammar-125', $$一部の地域を除き、晴れるでしょう。$$, $$いちぶのちいきをのぞき、はれるでしょう。$$, $$Com exceção de algumas regiões, o tempo deve ficar ensolarado.$$),
    ('n2-grammar-125', $$値段を除けば、このホテルは最高だ。$$, $$ねだんをのぞけば、このホテルはさいこうだ。$$, $$Tirando o preço, este hotel é ótimo.$$),
    ('n2-grammar-125', $$祝日を除いて、授業があります。$$, $$しゅくじつをのぞいて、じゅぎょうがあります。$$, $$Há aulas, exceto nos feriados.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供____、入場料は千円です。$$, $$Exceto para crianças, a entrada custa mil ienes.$$),
        (2, $$数学____、どの科目も得意だ。$$, $$Sou bom em todas as matérias, exceto matemática.$$),
        (3, $$この部分____、レポートはよく書けている。$$, $$Tirando esta parte, o relatório está bem escrito.$$),
        (4, $$一人____、全員が時間通りに来た。$$, $$Com exceção de uma pessoa, todos chegaram no horário.$$),
        (5, $$年末年始____、休まず営業します。$$, $$Funcionaremos sem folga, exceto no fim e início de ano.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-125', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を除いて$$),
        (1, $$を除き$$),
        (1, $$をのぞいて$$),
        (2, $$を除いて$$),
        (2, $$を除き$$),
        (2, $$をのぞいて$$),
        (3, $$を除いて$$),
        (3, $$を除き$$),
        (3, $$を除けば$$),
        (3, $$をのぞいて$$),
        (4, $$を除いて$$),
        (4, $$を除き$$),
        (4, $$をのぞいて$$),
        (5, $$を除いて$$),
        (5, $$を除き$$),
        (5, $$をのぞいて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-126 — 〜を問わず
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-126',
    'grammar',
    'N2',
    $$〜を問わず$$,
    $$wo towazu$$,
    $$Independentemente de / Sem distinção de / Seja qual for$$,
    $$を問わず indica que algo vale para todos, sem levar em conta uma diferença. Equivale a "independentemente de" ou "sem distinção de".

Costuma vir com palavras que indicam variação, como idade, sexo, nacionalidade, experiência e estação, ou com pares opostos, como "dia e noite". Por exemplo, "procuramos funcionários sem distinção de idade".

É uma expressão formal, muito usada em anúncios e avisos.$$,
    $$É muito parecido com に関わらず.

Também aparece como は問わない, com o sentido de "não importa".

Pares comuns são 昼夜を問わず, 男女を問わず e 経験の有無を問わず.$$,
    $$Substantivo (diferença / tipo) + を問わず
Substantivo + Substantivo (opostos) + を問わず$$,
    $$を問わず$$,
    $$を問わず|をとわず|は問わない$$,
    ARRAY['を', '問わず']::text[],
    ARRAY['を問わず', 'は問わない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-126', $$年齢を問わず、誰でも応募できます。$$, $$ねんれいをとわず、だれでもおうぼできます。$$, $$Qualquer pessoa pode se inscrever, independentemente da idade.$$),
    ('n2-grammar-126', $$この祭りは国内外を問わず、多くの人が訪れる。$$, $$このまつりはこくないがいをとわず、おおくのひとがおとずれる。$$, $$Muitas pessoas, do país e do exterior, visitam este festival.$$),
    ('n2-grammar-126', $$このスポーツは男女を問わず人気がある。$$, $$このスポーツはだんじょをとわずにんきがある。$$, $$Este esporte é popular entre homens e mulheres.$$),
    ('n2-grammar-126', $$経験の有無を問わず、歓迎します。$$, $$けいけんのうむをとわず、かんげいします。$$, $$Damos boas-vindas, com ou sem experiência.$$),
    ('n2-grammar-126', $$この病院は昼夜を問わず、患者を受け入れている。$$, $$このびょういんはちゅうやをとわず、かんじゃをうけいれている。$$, $$Este hospital recebe pacientes de dia e de noite.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$国籍____、参加できます。$$, $$É possível participar independentemente da nacionalidade.$$),
        (2, $$このアプリは季節____使える。$$, $$Este aplicativo pode ser usado em qualquer estação.$$),
        (3, $$学歴____、能力のある人を採用する。$$, $$Contratamos pessoas capacitadas sem distinção de escolaridade.$$),
        (4, $$晴雨____、イベントは行います。$$, $$O evento será realizado com sol ou chuva.$$),
        (5, $$プロ、アマ____、誰でも出場できる大会だ。$$, $$É um campeonato em que qualquer um pode competir, profissional ou amador.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-126', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$を問わず$$),
        (1, $$をとわず$$),
        (2, $$を問わず$$),
        (2, $$をとわず$$),
        (3, $$を問わず$$),
        (3, $$をとわず$$),
        (4, $$を問わず$$),
        (4, $$をとわず$$),
        (5, $$を問わず$$),
        (5, $$をとわず$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-127 — お〜願う
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-127',
    'grammar',
    'N2',
    $$お〜願う$$,
    $$o ~ negau$$,
    $$Pedimos que / Por gentileza / Solicitamos que$$,
    $$お〜願う é uma forma muito educada de pedir algo a alguém. Equivale a "pedimos que" ou "por gentileza".

É muito usada em avisos públicos, anúncios, cartas e no atendimento ao cliente. Por exemplo, "pedimos que aguarde um momento".

A forma mais comum é お〜願います, e a forma ainda mais respeitosa é お〜願えますか ou お〜願えませんか.$$,
    $$Com palavras de origem chinesa, usa-se ご em vez de お, como em ご協力願います e ご注意願います.

É mais formal que お〜ください.$$,
    $$お + Verbo (forma ます sem ます) + 願います
ご + Substantivo (ação) + 願います
お + Verbo (forma ます sem ます) + 願えますか$$,
    $$お〜願う$$,
    $$願います|願えます|願えません|願いたい|願う$$,
    ARRAY['お', '願う']::text[],
    ARRAY['お〜願います', 'ご〜願います', 'お〜願えますか', 'お〜願えませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-127', $$しばらくお待ち願います。$$, $$しばらくおまちねがいます。$$, $$Pedimos que aguarde um momento.$$),
    ('n2-grammar-127', $$ご協力願います。$$, $$ごきょうりょくねがいます。$$, $$Pedimos a sua colaboração.$$),
    ('n2-grammar-127', $$こちらにお名前をお書き願えますか。$$, $$こちらにおなまえをおかきねがえますか。$$, $$Poderia, por gentileza, escrever seu nome aqui?$$),
    ('n2-grammar-127', $$館内ではお静かに願います。$$, $$かんないではおしずかにねがいます。$$, $$Pedimos silêncio dentro do prédio.$$),
    ('n2-grammar-127', $$足元にご注意願います。$$, $$あしもとにごちゅういねがいます。$$, $$Pedimos atenção ao degrau.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会場内での撮影はご遠慮____。$$, $$Pedimos que não tire fotos dentro do local.$$),
        (2, $$こちらの書類にご記入____。$$, $$Pedimos que preencha este documento.$$),
        (3, $$もう一度お確かめ____か。$$, $$Poderia, por gentileza, verificar mais uma vez?$$),
        (4, $$お手数ですが、ご返信____。$$, $$Desculpe o incômodo, mas pedimos que responda.$$),
        (5, $$少々お待ち____か。$$, $$Poderia aguardar um momento, por gentileza?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-127', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$願います$$),
        (2, $$願います$$),
        (2, $$願えますか$$),
        (3, $$願えます$$),
        (3, $$願えません$$),
        (4, $$願います$$),
        (5, $$願えます$$),
        (5, $$願えません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-128 — おまけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-128',
    'grammar',
    'N2',
    $$おまけに$$,
    $$omake ni$$,
    $$Além disso / E ainda por cima / Para piorar$$,
    $$おまけに serve para acrescentar mais uma informação do mesmo tipo, geralmente reforçando a ideia anterior. Equivale a "além disso" ou "e ainda por cima".

É muito usado para listar coisas ruins, com o sentido de "para piorar". Por exemplo, "estava frio e, para piorar, começou a chover". Também pode ser usado com coisas boas.

É uma expressão coloquial, comum na fala.$$,
    $$É parecido com その上 e それに, mas おまけに é mais coloquial e emocional.

Muitas vezes aparece junto com し na frase anterior.$$,
    $$Frase (com ponto final) + おまけに + Frase
Frase + し、おまけに + Frase$$,
    $$おまけに$$,
    $$おまけに$$,
    ARRAY['おまけ', 'に']::text[],
    ARRAY['おまけに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-128', $$今日は寒いし、おまけに雨も降ってきた。$$, $$きょうはさむいし、おまけにあめもふってきた。$$, $$Hoje está frio e, para piorar, começou a chover.$$),
    ('n2-grammar-128', $$この店は安くて、おまけに量も多い。$$, $$このみせはやすくて、おまけにりょうもおおい。$$, $$Esta loja é barata e, além disso, as porções são grandes.$$),
    ('n2-grammar-128', $$道に迷って、おまけに財布もなくした。$$, $$みちにまよって、おまけにさいふもなくした。$$, $$Me perdi e, ainda por cima, perdi a carteira.$$),
    ('n2-grammar-128', $$彼は頭がいい。おまけに性格もいい。$$, $$かれはあたまがいい。おまけにせいかくもいい。$$, $$Ele é inteligente. Além disso, tem um ótimo caráter.$$),
    ('n2-grammar-128', $$寝坊して、おまけに電車も遅れた。$$, $$ねぼうして、おまけにでんしゃもおくれた。$$, $$Dormi demais e, para piorar, o trem atrasou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この部屋は狭いし、____日当たりも悪い。$$, $$Este quarto é pequeno e, para piorar, pega pouco sol.$$),
        (2, $$彼女は美人で、____料理も上手だ。$$, $$Ela é bonita e, além disso, cozinha bem.$$),
        (3, $$熱が出て、____咳も止まらない。$$, $$Tive febre e, ainda por cima, a tosse não para.$$),
        (4, $$このパソコンは軽いし、____安い。$$, $$Este computador é leve e, além disso, barato.$$),
        (5, $$試験に落ちて、____彼女にも振られた。$$, $$Reprovei na prova e, para piorar, levei um fora da namorada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-128', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$おまけに$$),
        (2, $$おまけに$$),
        (3, $$おまけに$$),
        (4, $$おまけに$$),
        (5, $$おまけに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-129 — 恐らく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-129',
    'grammar',
    'N2',
    $$恐らく$$,
    $$osoraku$$,
    $$Provavelmente / Talvez / Possivelmente$$,
    $$恐らく expressa uma suposição com bastante probabilidade. Equivale a "provavelmente".

A frase costuma terminar com だろう, でしょう ou と思う. Por exemplo, "provavelmente ele não vem".

É um pouco mais formal que たぶん e aparece muito em notícias, textos e falas sérias.$$,
    $$É parecido com たぶん, mas 恐らく é mais formal.

Também é escrito em hiragana, おそらく.

Às vezes tem um tom de preocupação, mas nem sempre o sentido é negativo.$$,
    $$恐らく + Frase + だろう / でしょう / と思う$$,
    $$恐らく$$,
    $$恐らく|おそらく$$,
    ARRAY['恐らく']::text[],
    ARRAY['恐らく', 'おそらく']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-129', $$彼は恐らく来ないだろう。$$, $$かれはおそらくこないだろう。$$, $$Provavelmente ele não vem.$$),
    ('n2-grammar-129', $$明日は恐らく雨でしょう。$$, $$あしたはおそらくあめでしょう。$$, $$Amanhã provavelmente vai chover.$$),
    ('n2-grammar-129', $$この計画は恐らく失敗するだろう。$$, $$このけいかくはおそらくしっぱいするだろう。$$, $$Este plano provavelmente vai fracassar.$$),
    ('n2-grammar-129', $$おそらく彼女はもう知っていると思う。$$, $$おそらくかのじょはもうしっているとおもう。$$, $$Acho que provavelmente ela já sabe.$$),
    ('n2-grammar-129', $$犯人は恐らく近所の人だろう。$$, $$はんにんはおそらくきんじょのひとだろう。$$, $$O culpado provavelmente é alguém da vizinhança.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____試合は中止になるでしょう。$$, $$Provavelmente a partida vai ser cancelada.$$),
        (2, $$彼は____この事実を知らないだろう。$$, $$Ele provavelmente não sabe deste fato.$$),
        (3, $$この絵は____有名な画家のものだろう。$$, $$Este quadro provavelmente é de um pintor famoso.$$),
        (4, $$____明日までには終わると思う。$$, $$Acho que provavelmente termina até amanhã.$$),
        (5, $$____彼は道に迷ったのだろう。$$, $$Provavelmente ele se perdeu.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-129', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$恐らく$$),
        (1, $$おそらく$$),
        (2, $$恐らく$$),
        (2, $$おそらく$$),
        (3, $$恐らく$$),
        (3, $$おそらく$$),
        (4, $$恐らく$$),
        (4, $$おそらく$$),
        (5, $$恐らく$$),
        (5, $$おそらく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-130 — 〜恐れがある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-130',
    'grammar',
    'N2',
    $$〜恐れがある$$,
    $$osore ga aru$$,
    $$Há risco de / Pode ser que / Corre o risco de$$,
    $$恐れがある indica que existe a possibilidade de algo ruim acontecer. Equivale a "há risco de" ou "corre o risco de".

É usado apenas para coisas negativas, como desastres, doenças ou problemas. Por exemplo, "há risco de o tufão atingir a região".

É uma expressão formal, muito usada em notícias, previsões do tempo e avisos.$$,
    $$Não se usa para coisas boas. Para possibilidades neutras, usa-se かもしれない.

Também é escrito おそれがある.

A forma negativa, 恐れはない, significa "não há risco".$$,
    $$Verbo (forma dicionário) + 恐れがある
Substantivo + の + 恐れがある$$,
    $$恐れがある$$,
    $$恐れがある|おそれがある|恐れがあります|おそれがあります|恐れもある$$,
    ARRAY['恐れ', 'が', 'ある']::text[],
    ARRAY['恐れがある', 'おそれがある', '恐れがあります', '恐れもある']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-130', $$台風が上陸する恐れがある。$$, $$たいふうがじょうりくするおそれがある。$$, $$Há risco de o tufão atingir a terra.$$),
    ('n2-grammar-130', $$この薬は副作用の恐れがあります。$$, $$このくすりはふくさようのおそれがあります。$$, $$Este remédio pode causar efeitos colaterais.$$),
    ('n2-grammar-130', $$大雨で川があふれる恐れがある。$$, $$おおあめでかわがあふれるおそれがある。$$, $$Com a chuva forte, há risco de o rio transbordar.$$),
    ('n2-grammar-130', $$このままでは、会社が倒産するおそれがある。$$, $$このままでは、かいしゃがとうさんするおそれがある。$$, $$Do jeito que está, a empresa corre o risco de falir.$$),
    ('n2-grammar-130', $$その病気は他の人にうつる恐れがあります。$$, $$そのびょうきはほかのひとにうつるおそれがあります。$$, $$Essa doença pode ser transmitida para outras pessoas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$明日は大雪になる____。$$, $$Há risco de nevar forte amanhã.$$),
        (2, $$この地域は地震の____。$$, $$Esta região corre risco de terremoto.$$),
        (3, $$放っておくと、病気が悪化する____。$$, $$Se deixar como está, há risco de a doença piorar.$$),
        (4, $$このままでは、試合に負ける____。$$, $$Do jeito que está, há risco de perder a partida.$$),
        (5, $$古い建物なので、倒れる____。$$, $$Como é um prédio velho, há risco de desabar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-130', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$恐れがある$$),
        (1, $$おそれがある$$),
        (1, $$恐れがあります$$),
        (1, $$おそれがあります$$),
        (2, $$恐れがある$$),
        (2, $$おそれがある$$),
        (2, $$恐れがあります$$),
        (2, $$おそれがあります$$),
        (3, $$恐れがある$$),
        (3, $$おそれがある$$),
        (3, $$恐れがあります$$),
        (3, $$おそれがあります$$),
        (4, $$恐れがある$$),
        (4, $$おそれがある$$),
        (4, $$恐れがあります$$),
        (4, $$おそれがあります$$),
        (5, $$恐れがある$$),
        (5, $$おそれがある$$),
        (5, $$恐れがあります$$),
        (5, $$おそれがあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-131 — 及び
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-131',
    'grammar',
    'N2',
    $$及び$$,
    $$oyobi$$,
    $$E / Bem como / Assim como$$,
    $$及び serve para ligar dois ou mais substantivos, com o sentido de "e" ou "bem como".

É uma palavra formal, usada principalmente na escrita, em documentos oficiais, leis, avisos e notícias. Na fala do dia a dia, usa-se と.

Por exemplo, "o nome e o endereço" ou "estudantes, bem como professores".$$,
    $$Quando há vários itens, 及び costuma ficar antes do último.

Também é escrito em hiragana, および.

É parecido com 並びに, que também é formal.$$,
    $$Substantivo + 及び + Substantivo
Substantivo、Substantivo + 及び + Substantivo$$,
    $$及び$$,
    $$及び|および$$,
    ARRAY['及び']::text[],
    ARRAY['及び', 'および']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-131', $$氏名及び住所を記入してください。$$, $$しめいおよびじゅうしょをきにゅうしてください。$$, $$Preencha o nome e o endereço.$$),
    ('n2-grammar-131', $$学生及び教職員は、この入口を使ってください。$$, $$がくせいおよびきょうしょくいんは、このいりぐちをつかってください。$$, $$Estudantes e funcionários, usem esta entrada.$$),
    ('n2-grammar-131', $$会場内での飲食及び喫煙は禁止です。$$, $$かいじょうないでのいんしょくおよびきつえんはきんしです。$$, $$É proibido comer, beber e fumar dentro do local.$$),
    ('n2-grammar-131', $$東京、大阪及び名古屋で説明会を開きます。$$, $$とうきょう、おおさかおよびなごやでせつめいかいをひらきます。$$, $$Faremos reuniões informativas em Tóquio, Osaka e Nagoya.$$),
    ('n2-grammar-131', $$日本語および英語で対応いたします。$$, $$にほんごおよびえいごでたいおういたします。$$, $$Atendemos em japonês e em inglês.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$申込書____写真を提出すること。$$, $$Entregue o formulário de inscrição e a foto.$$),
        (2, $$本人____家族の同意が必要です。$$, $$É necessário o consentimento da própria pessoa e da família.$$),
        (3, $$駐車場____駐輪場は地下にあります。$$, $$O estacionamento de carros e de bicicletas fica no subsolo.$$),
        (4, $$中学生____高校生を対象とした講座です。$$, $$É um curso voltado a alunos do ensino fundamental e médio.$$),
        (5, $$商品の返品____交換はできません。$$, $$Não é possível devolver nem trocar os produtos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-131', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$及び$$),
        (1, $$および$$),
        (2, $$及び$$),
        (2, $$および$$),
        (3, $$及び$$),
        (3, $$および$$),
        (4, $$及び$$),
        (4, $$および$$),
        (5, $$及び$$),
        (5, $$および$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-132 — ろくに〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-132',
    'grammar',
    'N2',
    $$ろくに〜ない$$,
    $$roku ni ~ nai$$,
    $$Mal / Quase não / Direito não$$,
    $$ろくに junto com uma forma negativa indica que algo não é feito de forma suficiente ou adequada. Equivale a "mal", "quase não" ou "não... direito".

O tom é negativo e muitas vezes de crítica ou reclamação. Por exemplo, "mal dormi ontem" ou "ele nem cumprimenta direito".

É uma expressão coloquial, comum na fala.$$,
    $$A forma ろくな, antes de substantivos, significa "decente" ou "que preste", como em ろくなものがない, "não tem nada que preste".

É parecido com ほとんど〜ない, mas ろくに tem um tom mais crítico.$$,
    $$ろくに + Verbo (forma ない)
ろくな + Substantivo + がない / ではない$$,
    $$ろくに〜ない$$,
    $$ろくに|ろくな$$,
    ARRAY['ろく', 'に', 'ない']::text[],
    ARRAY['ろくに〜ない', 'ろくな〜ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-132', $$昨日はろくに寝ていない。$$, $$きのうはろくにねていない。$$, $$Ontem mal dormi.$$),
    ('n2-grammar-132', $$彼はろくに挨拶もしない。$$, $$かれはろくにあいさつもしない。$$, $$Ele nem cumprimenta direito.$$),
    ('n2-grammar-132', $$ろくに勉強しないで試験を受けた。$$, $$ろくにべんきょうしないでしけんをうけた。$$, $$Fiz a prova quase sem estudar.$$),
    ('n2-grammar-132', $$忙しくて、ろくに食事もとれない。$$, $$いそがしくて、ろくにしょくじもとれない。$$, $$Estou tão ocupado que mal consigo comer.$$),
    ('n2-grammar-132', $$この店にはろくな物がない。$$, $$このみせにはろくなものがない。$$, $$Esta loja não tem nada que preste.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$説明書も____読まずに、使い始めた。$$, $$Comecei a usar sem nem ler o manual direito.$$),
        (2, $$彼は人の話を____聞かない。$$, $$Ele mal ouve o que os outros dizem.$$),
        (3, $$最近は____休みも取れない。$$, $$Ultimamente mal consigo tirar folga.$$),
        (4, $$____調べもしないで、文句を言うな。$$, $$Não reclame sem nem pesquisar direito.$$),
        (5, $$あいつは____ことをしない。$$, $$Aquele cara não faz nada que preste.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-132', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ろくに$$),
        (2, $$ろくに$$),
        (3, $$ろくに$$),
        (4, $$ろくに$$),
        (5, $$ろくな$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-133 — 幸いなことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-133',
    'grammar',
    'N2',
    $$幸いなことに$$,
    $$saiwai na koto ni$$,
    $$Felizmente / Por sorte / Para nossa sorte$$,
    $$幸いなことに expressa que algo aconteceu de forma favorável, geralmente quando poderia ter sido pior. Equivale a "felizmente" ou "por sorte".

A pessoa mostra alívio ou gratidão pela situação. Por exemplo, "houve um acidente, mas felizmente ninguém se feriu".

O padrão 〜ことに também aparece com outras palavras de sentimento, como 残念なことに e 驚いたことに.$$,
    $$A forma 幸い sozinha ou 幸いにも tem o mesmo sentido.

O padrão Adjetivo + ことに expressa o sentimento da pessoa que fala sobre o fato.$$,
    $$幸いなことに、 + Frase
幸いにも、 + Frase$$,
    $$幸いなことに$$,
    $$幸いなことに|幸いにも|さいわいなことに|幸い$$,
    ARRAY['幸い', 'な', 'こと', 'に']::text[],
    ARRAY['幸いなことに', '幸いにも', '幸い']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-133', $$幸いなことに、けが人はいなかった。$$, $$さいわいなことに、けがにんはいなかった。$$, $$Felizmente, não houve feridos.$$),
    ('n2-grammar-133', $$幸いなことに、天気に恵まれた。$$, $$さいわいなことに、てんきにめぐまれた。$$, $$Por sorte, fomos agraciados com bom tempo.$$),
    ('n2-grammar-133', $$財布を落としたが、幸いにも見つかった。$$, $$さいふをおとしたが、さいわいにもみつかった。$$, $$Perdi a carteira, mas felizmente foi encontrada.$$),
    ('n2-grammar-133', $$幸いなことに、電車にはまだ間に合った。$$, $$さいわいなことに、でんしゃにはまだまにあった。$$, $$Por sorte, ainda deu tempo de pegar o trem.$$),
    ('n2-grammar-133', $$幸い、病気は軽かった。$$, $$さいわい、びょうきはかるかった。$$, $$Felizmente, a doença era leve.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、火事はすぐに消えた。$$, $$Felizmente, o incêndio foi logo apagado.$$),
        (2, $$____、試験に合格できた。$$, $$Por sorte, consegui passar na prova.$$),
        (3, $$事故に遭ったが、____命は助かった。$$, $$Sofri um acidente, mas felizmente sobrevivi.$$),
        (4, $$____、雨は降らなかった。$$, $$Por sorte, não choveu.$$),
        (5, $$____、近くに病院があった。$$, $$Felizmente, havia um hospital por perto.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-133', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$幸いなことに$$),
        (1, $$幸いにも$$),
        (1, $$幸い$$),
        (2, $$幸いなことに$$),
        (2, $$幸いにも$$),
        (2, $$幸い$$),
        (3, $$幸いなことに$$),
        (3, $$幸いにも$$),
        (3, $$幸い$$),
        (4, $$幸いなことに$$),
        (4, $$幸いにも$$),
        (4, $$幸い$$),
        (5, $$幸いなことに$$),
        (5, $$幸いにも$$),
        (5, $$幸い$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-134 — 〜せいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-134',
    'grammar',
    'N2',
    $$〜せいか$$,
    $$sei ka$$,
    $$Talvez por causa de / Será que é por / Quem sabe por$$,
    $$せいか indica uma causa provável, mas sem certeza. Equivale a "talvez por causa de" ou "será que é por".

A pessoa supõe que algo foi o motivo de um resultado, geralmente negativo. Por exemplo, "talvez por ter dormido pouco, estou com dor de cabeça".

Também pode ser usado com resultados positivos ou neutros, mas é mais comum com coisas ruins.$$,
    $$É uma variação de せいで, mas com dúvida.

Para resultados positivos, também se usa おかげか.

Uma expressão comum é 気のせいか, que significa "talvez seja impressão minha".$$,
    $$Verbo (forma simples) + せいか
Adjetivo い + せいか
Adjetivo な + な + せいか
Substantivo + の + せいか$$,
    $$せいか$$,
    $$せいか$$,
    ARRAY['せい', 'か']::text[],
    ARRAY['せいか', '気のせいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-134', $$寝不足のせいか、頭が痛い。$$, $$ねぶそくのせいか、あたまがいたい。$$, $$Talvez por ter dormido pouco, estou com dor de cabeça.$$),
    ('n2-grammar-134', $$年のせいか、最近疲れやすい。$$, $$としのせいか、さいきんつかれやすい。$$, $$Será que é pela idade? Ultimamente me canso fácil.$$),
    ('n2-grammar-134', $$天気が悪いせいか、客が少ない。$$, $$てんきがわるいせいか、きゃくがすくない。$$, $$Talvez por causa do mau tempo, há poucos clientes.$$),
    ('n2-grammar-134', $$気のせいか、彼女は元気がないように見える。$$, $$きのせいか、かのじょはげんきがないようにみえる。$$, $$Pode ser impressão minha, mas ela parece desanimada.$$),
    ('n2-grammar-134', $$緊張したせいか、うまく話せなかった。$$, $$きんちょうしたせいか、うまくはなせなかった。$$, $$Talvez por ter ficado nervoso, não consegui falar bem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$食べすぎた____、お腹が痛い。$$, $$Talvez por ter comido demais, estou com dor de barriga.$$),
        (2, $$風邪の____、声が出ない。$$, $$Talvez por causa do resfriado, estou sem voz.$$),
        (3, $$暑い____、食欲がない。$$, $$Talvez por causa do calor, estou sem apetite.$$),
        (4, $$気の____、彼は少しやせたようだ。$$, $$Pode ser impressão minha, mas ele parece ter emagrecido um pouco.$$),
        (5, $$コーヒーを飲んだ____、眠れない。$$, $$Talvez por ter tomado café, não consigo dormir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-134', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せいか$$),
        (2, $$せいか$$),
        (3, $$せいか$$),
        (4, $$せいか$$),
        (5, $$せいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-135 — せっかく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-135',
    'grammar',
    'N2',
    $$せっかく$$,
    $$sekkaku$$,
    $$Já que / Com tanto esforço / Logo que$$,
    $$せっかく indica que algo é valioso, raro ou foi conseguido com esforço. Equivale a "já que" ou "com tanto esforço".

Tem dois usos comuns. O primeiro é dizer que é uma pena não aproveitar algo, como "já que você veio até aqui, fique mais um pouco".

O segundo é lamentar que um esforço foi desperdiçado, como "com tanto esforço que fiz a comida, ninguém comeu". Nesse caso, costuma vir com のに.$$,
    $$Expressões comuns são せっかくですが, para recusar educadamente, e せっかくの休み.

É parecido com わざわざ, mas せっかく destaca o valor da oportunidade.$$,
    $$せっかく + Verbo (forma た) + のに (lamento)
せっかく + Verbo (forma た) + から / ので (aproveitar)
せっかく + の + Substantivo$$,
    $$せっかく$$,
    $$せっかく$$,
    ARRAY['せっかく']::text[],
    ARRAY['せっかく', 'せっかくの', 'せっかくですが']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-135', $$せっかく作ったのに、誰も食べてくれなかった。$$, $$せっかくつくったのに、だれもたべてくれなかった。$$, $$Com tanto esforço que fiz, ninguém comeu.$$),
    ('n2-grammar-135', $$せっかく京都に来たから、お寺を見に行こう。$$, $$せっかくきょうとにきたから、おてらをみにいこう。$$, $$Já que viemos a Kyoto, vamos ver os templos.$$),
    ('n2-grammar-135', $$せっかくの休みなのに、雨が降っている。$$, $$せっかくのやすみなのに、あめがふっている。$$, $$Logo no meu dia de folga, está chovendo.$$),
    ('n2-grammar-135', $$せっかくですが、今日は用事があります。$$, $$せっかくですが、きょうはようじがあります。$$, $$Agradeço o convite, mas hoje tenho um compromisso.$$),
    ('n2-grammar-135', $$せっかく覚えた単語を忘れてしまった。$$, $$せっかくおぼえたたんごをわすれてしまった。$$, $$Esqueci as palavras que tinha decorado com tanto esforço.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____来てくれたのに、留守にしていてごめんね。$$, $$Você veio até aqui e eu não estava em casa, desculpe.$$),
        (2, $$____のチャンスを逃してしまった。$$, $$Deixei escapar uma chance preciosa.$$),
        (3, $$____ここまで来たんだから、頂上まで登ろう。$$, $$Já que chegamos até aqui, vamos subir até o topo.$$),
        (4, $$____ですが、遠慮しておきます。$$, $$Agradeço, mas vou recusar.$$),
        (5, $$____準備したのに、パーティーは中止になった。$$, $$Preparei tudo com tanto esforço, mas a festa foi cancelada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-135', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せっかく$$),
        (2, $$せっかく$$),
        (3, $$せっかく$$),
        (4, $$せっかく$$),
        (5, $$せっかく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-136 — せめて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-136',
    'grammar',
    'N2',
    $$せめて$$,
    $$semete$$,
    $$Pelo menos / Ao menos / No mínimo$$,
    $$せめて indica o mínimo que a pessoa deseja, mesmo que não consiga o ideal. Equivale a "pelo menos" ou "ao menos".

A pessoa aceita que não pode ter tudo, mas espera ou pede ao menos uma pequena parte. Por exemplo, "se não pode vir, pelo menos ligue".

A frase costuma terminar com um desejo, um pedido ou uma intenção, como たい, てほしい ou ください.$$,
    $$É parecido com 少なくとも, mas せめて expressa desejo, enquanto 少なくとも é mais objetivo.

Costuma aparecer junto com だけでも ou くらい.$$,
    $$せめて + Substantivo / Quantidade + だけでも / くらい
せめて + Frase (desejo / pedido)$$,
    $$せめて$$,
    $$せめて$$,
    ARRAY['せめて']::text[],
    ARRAY['せめて', 'せめて〜だけでも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-136', $$来られないなら、せめて電話くらいしてほしい。$$, $$こられないなら、せめてでんわくらいしてほしい。$$, $$Se não pode vir, pelo menos ligue.$$),
    ('n2-grammar-136', $$せめて週に一回は運動したい。$$, $$せめてしゅうにいっかいはうんどうしたい。$$, $$Quero me exercitar pelo menos uma vez por semana.$$),
    ('n2-grammar-136', $$優勝は無理でも、せめて三位には入りたい。$$, $$ゆうしょうはむりでも、せめてさんいにははいりたい。$$, $$Mesmo que vencer seja impossível, quero ao menos ficar em terceiro.$$),
    ('n2-grammar-136', $$せめて名前だけでも教えてください。$$, $$せめてなまえだけでもおしえてください。$$, $$Me diga ao menos o seu nome.$$),
    ('n2-grammar-136', $$せめてもう一日休みがあればいいのに。$$, $$せめてもういちにちやすみがあればいいのに。$$, $$Seria bom ter pelo menos mais um dia de folga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____一時間だけでも寝たい。$$, $$Quero dormir pelo menos uma hora.$$),
        (2, $$忙しくても、____朝ご飯は食べなさい。$$, $$Mesmo ocupado, pelo menos tome o café da manhã.$$),
        (3, $$____雨がやむまで待ちましょう。$$, $$Vamos esperar ao menos até a chuva parar.$$),
        (4, $$全部は無理でも、____半分は終わらせたい。$$, $$Mesmo que tudo seja impossível, quero terminar ao menos a metade.$$),
        (5, $$____お礼だけでも言わせてください。$$, $$Deixe-me ao menos agradecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-136', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$せめて$$),
        (2, $$せめて$$),
        (3, $$せめて$$),
        (4, $$せめて$$),
        (5, $$せめて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-137 — 〜次第
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-137',
    'grammar',
    'N2',
    $$〜次第$$,
    $$shidai$$,
    $$Assim que / Logo que / Tão logo$$,
    $$次第, depois da raiz de um verbo, indica que algo será feito imediatamente depois que outra coisa acontecer. Equivale a "assim que" ou "logo que".

A segunda parte costuma ser uma ação intencional, como entrar em contato, enviar ou começar. Por exemplo, "assim que eu chegar, entro em contato".

É uma expressão formal, muito usada no trabalho e em e-mails.$$,
    $$Não se usa com acontecimentos passados. A frase sempre fala do futuro.

É parecido com たらすぐに, mas 次第 é mais formal.

Não se confunde com 次第で, que significa "dependendo de".$$,
    $$Verbo (forma ます sem ます) + 次第
Substantivo (ação) + 次第$$,
    $$次第$$,
    $$次第|しだい$$,
    ARRAY['次第']::text[],
    ARRAY['次第', 'しだい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-137', $$着き次第、連絡します。$$, $$つきしだい、れんらくします。$$, $$Assim que eu chegar, entro em contato.$$),
    ('n2-grammar-137', $$準備ができ次第、出発しましょう。$$, $$じゅんびができしだい、しゅっぱつしましょう。$$, $$Assim que tudo estiver pronto, vamos partir.$$),
    ('n2-grammar-137', $$結果がわかり次第、お知らせします。$$, $$けっかがわかりしだい、おしらせします。$$, $$Assim que soubermos o resultado, avisaremos.$$),
    ('n2-grammar-137', $$商品が届き次第、お送りいたします。$$, $$しょうひんがとどきしだい、おおくりいたします。$$, $$Assim que o produto chegar, enviaremos.$$),
    ('n2-grammar-137', $$雨がやみ次第、試合を再開します。$$, $$あめがやみしだい、しあいをさいかいします。$$, $$Assim que a chuva parar, a partida será retomada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$仕事が終わり____、そちらに向かいます。$$, $$Assim que o trabalho terminar, vou até aí.$$),
        (2, $$詳細が決まり____、ご連絡いたします。$$, $$Assim que os detalhes forem definidos, entraremos em contato.$$),
        (3, $$部長が戻り____、会議を始めます。$$, $$Assim que o gerente voltar, começaremos a reunião.$$),
        (4, $$確認でき____、お返事します。$$, $$Assim que eu puder confirmar, respondo.$$),
        (5, $$席が空き____、ご案内します。$$, $$Assim que vagar uma mesa, nós o levaremos até ela.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-137', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第$$),
        (1, $$しだい$$),
        (2, $$次第$$),
        (2, $$しだい$$),
        (3, $$次第$$),
        (3, $$しだい$$),
        (4, $$次第$$),
        (4, $$しだい$$),
        (5, $$次第$$),
        (5, $$しだい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-138 — 〜次第で
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-138',
    'grammar',
    'N2',
    $$〜次第で$$,
    $$shidai de$$,
    $$Dependendo de / Conforme / De acordo com$$,
    $$次第で indica que um resultado depende de algo. Equivale a "dependendo de" ou "conforme".

A primeira parte mostra o fator decisivo, e a segunda mostra que o resultado pode mudar. Por exemplo, "dependendo do esforço, qualquer um pode passar".

Na forma 次第だ, no fim da frase, significa "depende de".$$,
    $$A forma 次第では indica uma possibilidade especial, como "dependendo do caso, pode ser que...".

Expressões comuns são 努力次第, 天気次第, あなた次第 e 考え方次第.$$,
    $$Substantivo + 次第で + Frase
Substantivo + 次第だ / 次第です
Substantivo + 次第では$$,
    $$次第で$$,
    $$次第で|次第だ|次第です|しだいで$$,
    ARRAY['次第', 'で']::text[],
    ARRAY['次第で', '次第では', '次第だ', '次第です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-138', $$努力次第で、誰でも上手になれる。$$, $$どりょくしだいで、だれでもじょうずになれる。$$, $$Dependendo do esforço, qualquer um pode melhorar.$$),
    ('n2-grammar-138', $$天気次第で、予定を変えるかもしれない。$$, $$てんきしだいで、よていをかえるかもしれない。$$, $$Dependendo do tempo, talvez mudemos os planos.$$),
    ('n2-grammar-138', $$行くかどうかは、あなた次第です。$$, $$いくかどうかは、あなたしだいです。$$, $$Ir ou não depende de você.$$),
    ('n2-grammar-138', $$考え方次第で、人生は楽しくなる。$$, $$かんがえかたしだいで、じんせいはたのしくなる。$$, $$Conforme o modo de pensar, a vida fica mais divertida.$$),
    ('n2-grammar-138', $$結果次第では、計画を中止する。$$, $$けっかしだいでは、けいかくをちゅうしする。$$, $$Dependendo do resultado, cancelaremos o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$使い方____、便利にも危険にもなる。$$, $$Dependendo do uso, pode ser útil ou perigoso.$$),
        (2, $$成功するかどうかは、君の努力____。$$, $$Ter sucesso ou não depende do seu esforço.$$),
        (3, $$値段____、買うかどうか決めます。$$, $$Vou decidir se compro dependendo do preço.$$),
        (4, $$体調____、明日の試合に出られないかもしれない。$$, $$Dependendo de como eu estiver de saúde, talvez eu não possa jogar amanhã.$$),
        (5, $$相手の態度____、こちらの対応も変わる。$$, $$Conforme a atitude do outro, nossa reação também muda.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-138', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第で$$),
        (1, $$しだいで$$),
        (2, $$次第だ$$),
        (2, $$次第です$$),
        (3, $$次第で$$),
        (3, $$しだいで$$),
        (4, $$次第では$$),
        (5, $$次第で$$),
        (5, $$しだいで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-139 — 次第に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-139',
    'grammar',
    'N2',
    $$次第に$$,
    $$shidai ni$$,
    $$Gradualmente / Aos poucos / Pouco a pouco$$,
    $$次第に indica que uma mudança acontece de forma gradual, ao longo do tempo. Equivale a "gradualmente" ou "aos poucos".

Costuma vir com verbos de mudança, como なる, 増える, 減る e 変わる. Por exemplo, "aos poucos foi ficando escuro".

É um pouco mais formal que だんだん.$$,
    $$É parecido com だんだん e 徐々に.

だんだん é mais coloquial, 次第に é mais comum na escrita e 徐々に destaca uma mudança lenta e constante.$$,
    $$次第に + Verbo (mudança)$$,
    $$次第に$$,
    $$次第に|しだいに$$,
    ARRAY['次第', 'に']::text[],
    ARRAY['次第に', 'しだいに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-139', $$空が次第に暗くなってきた。$$, $$そらがしだいにくらくなってきた。$$, $$O céu foi escurecendo aos poucos.$$),
    ('n2-grammar-139', $$日本の生活にも次第に慣れてきた。$$, $$にほんのせいかつにもしだいになれてきた。$$, $$Fui me acostumando gradualmente com a vida no Japão.$$),
    ('n2-grammar-139', $$雨は次第に強くなった。$$, $$あめはしだいにつよくなった。$$, $$A chuva foi ficando mais forte.$$),
    ('n2-grammar-139', $$彼の病気は次第によくなっている。$$, $$かれのびょうきはしだいによくなっている。$$, $$A doença dele está melhorando pouco a pouco.$$),
    ('n2-grammar-139', $$町の人口は次第に減っている。$$, $$まちのじんこうはしだいにへっている。$$, $$A população da cidade está diminuindo gradualmente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$春になって、____暖かくなってきた。$$, $$Com a chegada da primavera, foi esquentando aos poucos.$$),
        (2, $$練習を続けて、____上手になった。$$, $$Continuando a praticar, fui melhorando gradualmente.$$),
        (3, $$二人の関係は____悪くなった。$$, $$A relação dos dois foi piorando aos poucos.$$),
        (4, $$緊張も____ほぐれてきた。$$, $$O nervosismo também foi passando pouco a pouco.$$),
        (5, $$台風が近づき、風が____強まった。$$, $$Com a aproximação do tufão, o vento foi ficando mais forte.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-139', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$次第に$$),
        (1, $$しだいに$$),
        (2, $$次第に$$),
        (2, $$しだいに$$),
        (3, $$次第に$$),
        (3, $$しだいに$$),
        (4, $$次第に$$),
        (4, $$しだいに$$),
        (5, $$次第に$$),
        (5, $$しだいに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-140 — しかも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-140',
    'grammar',
    'N2',
    $$しかも$$,
    $$shikamo$$,
    $$Além disso / E ainda / E mais$$,
    $$しかも serve para acrescentar uma informação que reforça a anterior. Equivale a "além disso" ou "e ainda".

A segunda informação costuma ser algo ainda mais surpreendente ou importante. Por exemplo, "este restaurante é gostoso e, além disso, barato".

Também pode ligar ideias contrastantes, com o sentido de "e mesmo assim".$$,
    $$É parecido com その上 e おまけに. しかも é neutro, おまけに é mais coloquial e その上 é mais formal.

Pode ser usado tanto com coisas boas quanto ruins.$$,
    $$Frase (com ponto final) + しかも + Frase
Adjetivo / Substantivo + で、しかも + Frase$$,
    $$しかも$$,
    $$しかも$$,
    ARRAY['しかも']::text[],
    ARRAY['しかも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-140', $$この店はおいしい。しかも安い。$$, $$このみせはおいしい。しかもやすい。$$, $$Esta loja é gostosa. E, além disso, barata.$$),
    ('n2-grammar-140', $$彼は頭がよくて、しかもスポーツも得意だ。$$, $$かれはあたまがよくて、しかもスポーツもとくいだ。$$, $$Ele é inteligente e ainda é bom em esportes.$$),
    ('n2-grammar-140', $$雨が降ってきた。しかも雷まで鳴っている。$$, $$あめがふってきた。しかもかみなりまでなっている。$$, $$Começou a chover. E ainda por cima está trovejando.$$),
    ('n2-grammar-140', $$この部屋は広くて、しかも駅から近い。$$, $$このへやはひろくて、しかもえきからちかい。$$, $$Este quarto é espaçoso e, além disso, perto da estação.$$),
    ('n2-grammar-140', $$彼は試験に合格した。しかも一番の成績で。$$, $$かれはしけんにごうかくした。しかもいちばんのせいせきで。$$, $$Ele passou na prova. E com a melhor nota.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$このパソコンは軽い。____バッテリーも長持ちする。$$, $$Este computador é leve. Além disso, a bateria dura bastante.$$),
        (2, $$彼女は美人で、____優しい。$$, $$Ela é bonita e ainda por cima gentil.$$),
        (3, $$道に迷った。____携帯の電池も切れた。$$, $$Me perdi. E ainda por cima a bateria do celular acabou.$$),
        (4, $$このホテルは安くて、____朝食付きだ。$$, $$Este hotel é barato e, além disso, inclui café da manhã.$$),
        (5, $$彼は遅刻した。____宿題も忘れた。$$, $$Ele se atrasou. E ainda esqueceu a lição de casa.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-140', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$しかも$$),
        (2, $$しかも$$),
        (3, $$しかも$$),
        (4, $$しかも$$),
        (5, $$しかも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-141 — その上
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-141',
    'grammar',
    'N2',
    $$その上$$,
    $$sono ue$$,
    $$Além disso / Ainda por cima / Somado a isso$$,
    $$その上 serve para acrescentar uma informação a algo que já foi dito. Equivale a "além disso" ou "ainda por cima".

As duas informações costumam ter o mesmo sentido, ambas boas ou ambas ruins. Por exemplo, "o quarto é espaçoso e, além disso, tem uma vista linda".

É um pouco mais formal que それに e おまけに.$$,
    $$É parecido com しかも, mas その上 é mais usado para somar informações do mesmo tipo.

Na escrita, também aparece como そのうえ, em hiragana.$$,
    $$Frase (com ponto final) + その上 + Frase
Frase + て / で、その上 + Frase$$,
    $$その上$$,
    $$その上|そのうえ$$,
    ARRAY['その', '上']::text[],
    ARRAY['その上', 'そのうえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-141', $$この部屋は広い。その上、景色もきれいだ。$$, $$このへやはひろい。そのうえ、けしきもきれいだ。$$, $$Este quarto é espaçoso. Além disso, a vista é linda.$$),
    ('n2-grammar-141', $$道に迷って、その上雨まで降ってきた。$$, $$みちにまよって、そのうえあめまでふってきた。$$, $$Me perdi e, ainda por cima, começou a chover.$$),
    ('n2-grammar-141', $$彼は親切で、その上とても面白い。$$, $$かれはしんせつで、そのうえとてもおもしろい。$$, $$Ele é gentil e, além disso, muito engraçado.$$),
    ('n2-grammar-141', $$給料が安い。その上、残業も多い。$$, $$きゅうりょうがやすい。そのうえ、ざんぎょうもおおい。$$, $$O salário é baixo. Além disso, há muita hora extra.$$),
    ('n2-grammar-141', $$ごちそうになって、その上お土産までもらった。$$, $$ごちそうになって、そのうえおみやげまでもらった。$$, $$Me ofereceram um banquete e, ainda por cima, ganhei um presente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この車は燃費がいい。____、デザインもいい。$$, $$Este carro é econômico. Além disso, o design é bonito.$$),
        (2, $$風邪をひいて、____熱も出た。$$, $$Peguei um resfriado e, ainda por cima, tive febre.$$),
        (3, $$彼女は頭がいい。____、努力家だ。$$, $$Ela é inteligente. Além disso, é muito esforçada.$$),
        (4, $$この店は安くて、____店員も親切だ。$$, $$Esta loja é barata e, além disso, os atendentes são gentis.$$),
        (5, $$仕事をなくした。____、家賃も払えない。$$, $$Perdi o emprego. Ainda por cima, não consigo pagar o aluguel.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-141', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$その上$$),
        (1, $$そのうえ$$),
        (2, $$その上$$),
        (2, $$そのうえ$$),
        (3, $$その上$$),
        (3, $$そのうえ$$),
        (4, $$その上$$),
        (4, $$そのうえ$$),
        (5, $$その上$$),
        (5, $$そのうえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-142 — それなのに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-142',
    'grammar',
    'N2',
    $$それなのに$$,
    $$sore na noni$$,
    $$Mesmo assim / Apesar disso / E no entanto$$,
    $$それなのに liga duas frases quando o resultado é contrário ao esperado. Equivale a "mesmo assim" ou "apesar disso".

A pessoa que fala mostra surpresa, decepção ou insatisfação. Por exemplo, "estudei muito. Mesmo assim, reprovei".

É a forma de usar のに no começo de uma frase.$$,
    $$É parecido com それでも e けれども, mas それなのに tem mais emoção de frustração.

Não se usa para dar ordens ou fazer pedidos na segunda parte.$$,
    $$Frase (com ponto final) + それなのに + Frase (resultado inesperado)$$,
    $$それなのに$$,
    $$それなのに$$,
    ARRAY['それ', 'な', 'のに']::text[],
    ARRAY['それなのに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-142', $$毎日練習した。それなのに、試合に負けた。$$, $$まいにちれんしゅうした。それなのに、しあいにまけた。$$, $$Treinei todos os dias. Mesmo assim, perdi a partida.$$),
    ('n2-grammar-142', $$彼は約束した。それなのに、来なかった。$$, $$かれはやくそくした。それなのに、こなかった。$$, $$Ele prometeu. E no entanto não veio.$$),
    ('n2-grammar-142', $$薬を飲んだ。それなのに、熱が下がらない。$$, $$くすりをのんだ。それなのに、ねつがさがらない。$$, $$Tomei o remédio. Apesar disso, a febre não baixa.$$),
    ('n2-grammar-142', $$一生懸命説明した。それなのに、誰もわかってくれない。$$, $$いっしょうけんめいせつめいした。それなのに、だれもわかってくれない。$$, $$Expliquei com todo o empenho. Mesmo assim, ninguém entende.$$),
    ('n2-grammar-142', $$天気予報は晴れだった。それなのに、雨が降った。$$, $$てんきよほうははれだった。それなのに、あめがふった。$$, $$A previsão era de sol. E no entanto choveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$早く家を出た。____、遅刻してしまった。$$, $$Saí cedo de casa. Mesmo assim, acabei me atrasando.$$),
        (2, $$ダイエットをしている。____、全然やせない。$$, $$Estou fazendo dieta. Apesar disso, não emagreço nada.$$),
        (3, $$何度も注意した。____、彼はまた同じことをした。$$, $$Avisei várias vezes. E no entanto ele fez a mesma coisa de novo.$$),
        (4, $$高いお金を払った。____、サービスは最悪だった。$$, $$Paguei caro. Mesmo assim, o serviço foi péssimo.$$),
        (5, $$彼女のために料理を作った。____、一口も食べなかった。$$, $$Fiz comida para ela. E no entanto ela não comeu nem um pedaço.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-142', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それなのに$$),
        (2, $$それなのに$$),
        (3, $$それなのに$$),
        (4, $$それなのに$$),
        (5, $$それなのに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-143 — それなら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-143',
    'grammar',
    'N2',
    $$それなら$$,
    $$sore nara$$,
    $$Então / Nesse caso / Se é assim$$,
    $$それなら é usado para reagir ao que a outra pessoa disse, dando uma sugestão, uma decisão ou uma conclusão. Equivale a "então" ou "nesse caso".

A pessoa recebe uma informação e responde com base nela. Por exemplo, "estou cansado." "Então descanse um pouco".

É muito comum em conversas. A forma mais curta e coloquial é なら, e a mais informal é じゃあ.$$,
    $$É parecido com じゃあ e では, mas それなら deixa mais claro que a resposta é baseada no que o outro disse.

Também pode ser usado para tirar uma conclusão lógica.$$,
    $$(Fala do outro) + それなら、 + Sugestão / Decisão$$,
    $$それなら$$,
    $$それなら$$,
    ARRAY['それ', 'なら']::text[],
    ARRAY['それなら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-143', $$「疲れた。」「それなら、少し休もう。」$$, $$「つかれた。」「それなら、すこしやすもう。」$$, $$Estou cansado. Então vamos descansar um pouco.$$),
    ('n2-grammar-143', $$「明日は雨らしいよ。」「それなら、傘を持っていこう。」$$, $$「あしたはあめらしいよ。」「それなら、かさをもっていこう。」$$, $$Parece que amanhã vai chover. Nesse caso, vamos levar guarda-chuva.$$),
    ('n2-grammar-143', $$「この店、高いね。」「それなら、別の店にしよう。」$$, $$「このみせ、たかいね。」「それなら、べつのみせにしよう。」$$, $$Esta loja é cara, né? Então vamos em outra.$$),
    ('n2-grammar-143', $$「時間がないんです。」「それなら、また今度にしましょう。」$$, $$「じかんがないんです。」「それなら、またこんどにしましょう。」$$, $$Estou sem tempo. Nesse caso, vamos deixar para outra vez.$$),
    ('n2-grammar-143', $$「道がわからない。」「それなら、地図を見せてあげる。」$$, $$「みちがわからない。」「それなら、ちずをみせてあげる。」$$, $$Não sei o caminho. Então eu te mostro o mapa.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$「お腹がすいた。」「____、何か食べに行こう。」$$, $$Estou com fome. Então vamos comer alguma coisa.$$),
        (2, $$「頭が痛いんです。」「____、今日は早く帰ってください。」$$, $$Estou com dor de cabeça. Nesse caso, vá embora cedo hoje.$$),
        (3, $$「電車が止まっているって。」「____、タクシーで行こう。」$$, $$Dizem que o trem parou. Então vamos de táxi.$$),
        (4, $$「日曜日なら空いてるよ。」「____、日曜日に会おう。」$$, $$No domingo estou livre. Então vamos nos encontrar no domingo.$$),
        (5, $$「この服、少し大きいです。」「____、小さいサイズをお持ちします。」$$, $$Esta roupa está um pouco grande. Nesse caso, trarei um tamanho menor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-143', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それなら$$),
        (2, $$それなら$$),
        (3, $$それなら$$),
        (4, $$それなら$$),
        (5, $$それなら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-144 — それにしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-144',
    'grammar',
    'N2',
    $$それにしても$$,
    $$sore ni shite mo$$,
    $$Mesmo assim / Ainda assim / De qualquer forma$$,
    $$それにしても serve para mostrar que, mesmo aceitando o que foi dito, a pessoa ainda acha algo surpreendente, estranho ou exagerado. Equivale a "mesmo assim" ou "ainda assim".

Por exemplo, "sei que é verão, mas mesmo assim está quente demais".

Também é usado para mudar de assunto de forma natural, voltando a algo que estava na cabeça da pessoa, com o sentido de "de qualquer forma" ou "falando nisso".$$,
    $$É comum na fala, especialmente para expressar surpresa ou reclamação.

É parecido com それにしたって, que é mais coloquial.$$,
    $$Frase + それにしても、 + Opinião / Surpresa
それにしても、 + Novo assunto$$,
    $$それにしても$$,
    $$それにしても$$,
    ARRAY['それ', 'に', 'しても']::text[],
    ARRAY['それにしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-144', $$夏だとはいえ、それにしても暑すぎる。$$, $$なつだとはいえ、それにしてもあつすぎる。$$, $$Sei que é verão, mas mesmo assim está quente demais.$$),
    ('n2-grammar-144', $$忙しいのはわかるが、それにしても連絡が遅い。$$, $$いそがしいのはわかるが、それにしてもれんらくがおそい。$$, $$Entendo que esteja ocupado, mas ainda assim o contato está demorando.$$),
    ('n2-grammar-144', $$それにしても、彼はどこに行ったんだろう。$$, $$それにしても、かれはどこにいったんだろう。$$, $$De qualquer forma, para onde será que ele foi?$$),
    ('n2-grammar-144', $$安いと聞いていたけど、それにしても安いね。$$, $$やすいときいていたけど、それにしてもやすいね。$$, $$Tinha ouvido falar que era barato, mas mesmo assim é barato demais.$$),
    ('n2-grammar-144', $$それにしても、今日は人が多いね。$$, $$それにしても、きょうはひとがおおいね。$$, $$De qualquer forma, hoje tem muita gente, né?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供だから仕方ないけど、____うるさい。$$, $$É criança, então não tem jeito, mas mesmo assim é barulhento demais.$$),
        (2, $$____、あの映画は面白かったね。$$, $$De qualquer forma, aquele filme foi divertido, né?$$),
        (3, $$人気の店だとは聞いていたが、____すごい行列だ。$$, $$Tinha ouvido que era uma loja popular, mas ainda assim que fila enorme.$$),
        (4, $$初心者とはいえ、____ひどいミスだ。$$, $$Mesmo sendo iniciante, ainda assim é um erro feio.$$),
        (5, $$____、彼女はいつ帰ってくるのかな。$$, $$De qualquer forma, quando será que ela volta?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-144', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$それにしても$$),
        (2, $$それにしても$$),
        (3, $$それにしても$$),
        (4, $$それにしても$$),
        (5, $$それにしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-145 — そう言えば
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-145',
    'grammar',
    'N2',
    $$そう言えば$$,
    $$sou ieba$$,
    $$Falando nisso / Por falar nisso / Agora que mencionou$$,
    $$そう言えば é usado quando algo dito na conversa faz a pessoa lembrar de outra coisa. Equivale a "falando nisso" ou "por falar nisso".

Também é usado quando a pessoa se lembra de repente de algo, mesmo sem ligação direta com o assunto. Por exemplo, "falando nisso, você devolveu aquele livro?".

É uma expressão muito comum na fala do dia a dia.$$,
    $$Também é escrito そういえば, em hiragana.

É parecido com ところで, mas そう言えば indica que a lembrança surgiu da conversa ou de repente.$$,
    $$そう言えば、 + Frase (lembrança)$$,
    $$そう言えば$$,
    $$そう言えば|そういえば$$,
    ARRAY['そう', '言えば']::text[],
    ARRAY['そう言えば', 'そういえば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-145', $$そう言えば、明日は田中さんの誕生日だ。$$, $$そういえば、あしたはたなかさんのたんじょうびだ。$$, $$Falando nisso, amanhã é aniversário do Tanaka.$$),
    ('n2-grammar-145', $$「京都に行ったよ。」「そう言えば、私も来月行くんだ。」$$, $$「きょうとにいったよ。」「そういえば、わたしもらいげついくんだ。」$$, $$Fui a Kyoto. Por falar nisso, eu também vou no mês que vem.$$),
    ('n2-grammar-145', $$そういえば、最近彼に会っていない。$$, $$そういえば、さいきんかれにあっていない。$$, $$Agora que penso nisso, faz tempo que não o vejo.$$),
    ('n2-grammar-145', $$そう言えば、あの本はもう読んだ？$$, $$そういえば、あのほんはもうよんだ？$$, $$Falando nisso, você já leu aquele livro?$$),
    ('n2-grammar-145', $$「雨が多いね。」「そう言えば、もう梅雨だね。」$$, $$「あめがおおいね。」「そういえば、もうつゆだね。」$$, $$Tem chovido muito, né? Por falar nisso, já é época de chuvas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、昨日のテストはどうだった？$$, $$Falando nisso, como foi a prova de ontem?$$),
        (2, $$____、駅前に新しい店ができたよ。$$, $$Por falar nisso, abriu uma loja nova em frente à estação.$$),
        (3, $$「最近寒いね。」「____、もう十二月だね。」$$, $$Ultimamente está frio, né? Agora que mencionou, já é dezembro.$$),
        (4, $$____、鍵を閉めたかな。$$, $$Falando nisso, será que eu tranquei a porta?$$),
        (5, $$____、山田さんが結婚するらしいよ。$$, $$Por falar nisso, parece que o Yamada vai se casar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-145', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そう言えば$$),
        (1, $$そういえば$$),
        (2, $$そう言えば$$),
        (2, $$そういえば$$),
        (3, $$そう言えば$$),
        (3, $$そういえば$$),
        (4, $$そう言えば$$),
        (4, $$そういえば$$),
        (5, $$そう言えば$$),
        (5, $$そういえば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-146 — そうすると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-146',
    'grammar',
    'N2',
    $$そうすると$$,
    $$sou suru to$$,
    $$Então / Nesse caso / Fazendo isso$$,
    $$そうすると tem dois usos principais.

O primeiro indica o resultado de uma ação. Equivale a "fazendo isso" ou "aí". Por exemplo, "aperte este botão. Aí a porta abre".

O segundo é tirar uma conclusão a partir do que a outra pessoa disse. Equivale a "então" ou "nesse caso". Por exemplo, "a reunião é às três? Então temos que sair às duas".$$,
    $$No primeiro uso, é parecido com すると.

No segundo uso, é parecido com それなら e つまり.$$,
    $$Frase (ação, com ponto final) + そうすると + Resultado
(Fala do outro) + そうすると、 + Conclusão$$,
    $$そうすると$$,
    $$そうすると$$,
    ARRAY['そう', 'すると']::text[],
    ARRAY['そうすると']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-146', $$このボタンを押してください。そうすると、ドアが開きます。$$, $$このボタンをおしてください。そうすると、ドアがあきます。$$, $$Aperte este botão. Aí a porta abre.$$),
    ('n2-grammar-146', $$「会議は三時からです。」「そうすると、二時には出なければなりませんね。」$$, $$「かいぎはさんじからです。」「そうすると、にじにはでなければなりませんね。」$$, $$A reunião é às três. Então temos que sair às duas, né?$$),
    ('n2-grammar-146', $$毎日少しずつ練習する。そうすると、自然に上手になる。$$, $$まいにちすこしずつれんしゅうする。そうすると、しぜんにじょうずになる。$$, $$Pratique um pouco todo dia. Fazendo isso, você melhora naturalmente.$$),
    ('n2-grammar-146', $$「彼は来ないそうです。」「そうすると、四人ですね。」$$, $$「かれはこないそうです。」「そうすると、よにんですね。」$$, $$Dizem que ele não vem. Nesse caso, seremos quatro, né?$$),
    ('n2-grammar-146', $$窓を開けた。そうすると、涼しい風が入ってきた。$$, $$まどをあけた。そうすると、すずしいかぜがはいってきた。$$, $$Abri a janela. Aí entrou uma brisa fresca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この道をまっすぐ行ってください。____、右に駅が見えます。$$, $$Siga reto por esta rua. Aí você verá a estação à direita.$$),
        (2, $$「明日は休みです。」「____、会議は明後日ですね。」$$, $$Amanhã é folga. Então a reunião é depois de amanhã, né?$$),
        (3, $$水を加えて混ぜます。____、柔らかくなります。$$, $$Acrescente água e misture. Fazendo isso, fica macio.$$),
        (4, $$「料金は一人三千円です。」「____、全部で一万五千円ですね。」$$, $$A taxa é de três mil ienes por pessoa. Nesse caso, ao todo são quinze mil, né?$$),
        (5, $$早く寝るようにした。____、朝が楽になった。$$, $$Comecei a dormir cedo. Aí as manhãs ficaram mais fáceis.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-146', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$そうすると$$),
        (2, $$そうすると$$),
        (3, $$そうすると$$),
        (4, $$そうすると$$),
        (5, $$そうすると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-147 — 〜末に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-147',
    'grammar',
    'N2',
    $$〜末に$$,
    $$sue ni$$,
    $$Depois de muito / Após / No fim de$$,
    $$末に indica que, depois de um processo longo e difícil, chegou-se a um resultado. Equivale a "depois de muito..." ou "após".

A primeira parte costuma ser um esforço, uma dúvida ou uma luta prolongada, como pensar muito, discutir muito ou treinar muito. Por exemplo, "depois de pensar muito, decidi mudar de emprego".

É uma expressão um pouco formal.$$,
    $$A forma 末の vem antes de substantivos, como 苦労の末の成功.

É parecido com あげく, mas あげく costuma indicar um resultado ruim, enquanto 末に pode ser bom ou ruim.$$,
    $$Verbo (forma た) + 末に / 末
Substantivo + の + 末に / 末$$,
    $$末に$$,
    $$末に|末の|末、|すえに$$,
    ARRAY['末', 'に']::text[],
    ARRAY['末に', '末', '末の']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-147', $$よく考えた末に、会社を辞めることにした。$$, $$よくかんがえたすえに、かいしゃをやめることにした。$$, $$Depois de pensar muito, decidi sair da empresa.$$),
    ('n2-grammar-147', $$長い話し合いの末に、結論が出た。$$, $$ながいはなしあいのすえに、けつろんがでた。$$, $$Após uma longa discussão, chegamos a uma conclusão.$$),
    ('n2-grammar-147', $$苦労の末、ようやく成功した。$$, $$くろうのすえ、ようやくせいこうした。$$, $$Depois de muito sofrimento, finalmente tive sucesso.$$),
    ('n2-grammar-147', $$迷った末に、赤い服を買った。$$, $$まよったすえに、あかいふくをかった。$$, $$Depois de muita dúvida, comprei a roupa vermelha.$$),
    ('n2-grammar-147', $$激しい戦いの末に、日本チームが勝った。$$, $$はげしいたたかいのすえに、にほんチームがかった。$$, $$Após uma luta acirrada, a equipe japonesa venceu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いろいろ悩んだ____、留学をあきらめた。$$, $$Depois de me angustiar muito, desisti do intercâmbio.$$),
        (2, $$十年の研究の____、新しい薬が完成した。$$, $$Após dez anos de pesquisa, o novo remédio foi concluído.$$),
        (3, $$何度も失敗した____、やっと合格できた。$$, $$Depois de falhar várias vezes, finalmente consegui passar.$$),
        (4, $$努力の____成功だった。$$, $$Foi um sucesso conquistado depois de muito esforço.$$),
        (5, $$話し合った____、二人は別れることにした。$$, $$Depois de muito conversar, os dois decidiram se separar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-147', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$末に$$),
        (1, $$すえに$$),
        (2, $$末に$$),
        (2, $$すえに$$),
        (3, $$末に$$),
        (3, $$すえに$$),
        (4, $$末の$$),
        (5, $$末に$$),
        (5, $$すえに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-148 — 少しも〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-148',
    'grammar',
    'N2',
    $$少しも〜ない$$,
    $$sukoshi mo ~ nai$$,
    $$Nem um pouco / Nada / Nem um pouquinho$$,
    $$少しも junto com uma forma negativa indica negação total. Equivale a "nem um pouco" ou "nada".

Reforça que não existe nenhuma quantidade ou nenhum grau. Por exemplo, "não estou nem um pouco cansado" ou "ele não mudou nada".

É parecido com 全然〜ない e ちっとも〜ない.$$,
    $$ちっとも〜ない é mais coloquial, enquanto 少しも〜ない é neutro.

Não se usa 少しも em frases afirmativas.$$,
    $$少しも + Verbo (forma ない)
少しも + Adjetivo (forma negativa)$$,
    $$少しも〜ない$$,
    $$少しも|すこしも$$,
    ARRAY['少し', 'も', 'ない']::text[],
    ARRAY['少しも〜ない', '少しも〜ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-148', $$この映画は少しも面白くなかった。$$, $$このえいがはすこしもおもしろくなかった。$$, $$Este filme não teve graça nenhuma.$$),
    ('n2-grammar-148', $$彼は少しも変わっていない。$$, $$かれはすこしもかわっていない。$$, $$Ele não mudou nada.$$),
    ('n2-grammar-148', $$その話は少しも知らなかった。$$, $$そのはなしはすこしもしらなかった。$$, $$Eu não sabia nada dessa história.$$),
    ('n2-grammar-148', $$少しも疲れていません。$$, $$すこしもつかれていません。$$, $$Não estou nem um pouco cansado.$$),
    ('n2-grammar-148', $$彼女の気持ちが少しもわからない。$$, $$かのじょのきもちがすこしもわからない。$$, $$Não entendo nem um pouco o que ela sente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この薬は____効かない。$$, $$Este remédio não faz efeito nenhum.$$),
        (2, $$彼は____反省していない。$$, $$Ele não está nem um pouco arrependido.$$),
        (3, $$勉強しても、____上手にならない。$$, $$Mesmo estudando, não melhoro nem um pouquinho.$$),
        (4, $$この料理は____辛くない。$$, $$Esta comida não é nem um pouco apimentada.$$),
        (5, $$あなたのことを____疑っていません。$$, $$Não duvido de você nem um pouco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-148', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$少しも$$),
        (1, $$すこしも$$),
        (2, $$少しも$$),
        (2, $$すこしも$$),
        (3, $$少しも$$),
        (3, $$すこしも$$),
        (4, $$少しも$$),
        (4, $$すこしも$$),
        (5, $$少しも$$),
        (5, $$すこしも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-149 — 少なくとも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-149',
    'grammar',
    'N2',
    $$少なくとも$$,
    $$sukunaku tomo$$,
    $$Pelo menos / No mínimo / Ao menos$$,
    $$少なくとも indica o mínimo de algo, seja uma quantidade, um tempo ou um grau. Equivale a "pelo menos" ou "no mínimo".

Também pode limitar uma afirmação, com o sentido de "pelo menos no meu caso" ou "pelo menos isso é certo".

Por exemplo, "leva pelo menos uma hora" ou "pelo menos eu não acho isso".$$,
    $$É parecido com せめて, mas 少なくとも é mais objetivo. せめて expressa um desejo.

O oposto é 多くとも ou 多くても, que significa "no máximo".$$,
    $$少なくとも + Quantidade / Tempo
少なくとも + Frase$$,
    $$少なくとも$$,
    $$少なくとも|すくなくとも$$,
    ARRAY['少なく', 'とも']::text[],
    ARRAY['少なくとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-149', $$駅まで少なくとも三十分はかかる。$$, $$えきまですくなくともさんじゅっぷんはかかる。$$, $$Leva pelo menos trinta minutos até a estação.$$),
    ('n2-grammar-149', $$少なくとも一日に一回は運動しよう。$$, $$すくなくともいちにちにいっかいはうんどうしよう。$$, $$Vamos nos exercitar pelo menos uma vez por dia.$$),
    ('n2-grammar-149', $$この仕事には少なくとも三人必要だ。$$, $$このしごとにはすくなくともさんにんひつようだ。$$, $$Este trabalho precisa de no mínimo três pessoas.$$),
    ('n2-grammar-149', $$少なくとも私はそう思わない。$$, $$すくなくともわたしはそうおもわない。$$, $$Pelo menos eu não penso assim.$$),
    ('n2-grammar-149', $$少なくとも、彼は嘘をついていない。$$, $$すくなくとも、かれはうそをついていない。$$, $$Pelo menos uma coisa é certa: ele não está mentindo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日____七時間は寝たほうがいい。$$, $$É melhor dormir pelo menos sete horas por dia.$$),
        (2, $$この家を買うには、____三千万円必要だ。$$, $$Para comprar esta casa, são necessários no mínimo trinta milhões de ienes.$$),
        (3, $$____、私の責任ではない。$$, $$Pelo menos não é culpa minha.$$),
        (4, $$パーティーには____五十人は来るだろう。$$, $$Pelo menos cinquenta pessoas devem vir à festa.$$),
        (5, $$____週に一度は家族に電話しなさい。$$, $$Ligue para a sua família pelo menos uma vez por semana.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-149', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$少なくとも$$),
        (1, $$すくなくとも$$),
        (2, $$少なくとも$$),
        (2, $$すくなくとも$$),
        (3, $$少なくとも$$),
        (3, $$すくなくとも$$),
        (4, $$少なくとも$$),
        (4, $$すくなくとも$$),
        (5, $$少なくとも$$),
        (5, $$すくなくとも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-150 — 直ちに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-150',
    'grammar',
    'N2',
    $$直ちに$$,
    $$tadachi ni$$,
    $$Imediatamente / Já / Sem demora$$,
    $$直ちに significa "imediatamente" ou "sem demora". Indica que algo deve ser feito logo, sem esperar.

É uma palavra formal, usada em avisos, ordens, notícias e situações de emergência. Por exemplo, "evacuem imediatamente".

Na fala do dia a dia, usa-se mais すぐに.$$,
    $$É mais formal e mais forte que すぐに.

Também pode indicar uma relação direta, como em 直ちに影響はない, "não há efeito imediato".$$,
    $$直ちに + Verbo$$,
    $$直ちに$$,
    $$直ちに|ただちに$$,
    ARRAY['直ちに']::text[],
    ARRAY['直ちに', 'ただちに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-150', $$火事です。直ちに避難してください。$$, $$かじです。ただちにひなんしてください。$$, $$É um incêndio. Evacuem imediatamente.$$),
    ('n2-grammar-150', $$問題が見つかったら、直ちに報告すること。$$, $$もんだいがみつかったら、ただちにほうこくすること。$$, $$Se encontrar um problema, informe imediatamente.$$),
    ('n2-grammar-150', $$事故の知らせを受けて、直ちに現場へ向かった。$$, $$じこのしらせをうけて、ただちにげんばへむかった。$$, $$Ao receber a notícia do acidente, fui imediatamente ao local.$$),
    ('n2-grammar-150', $$この薬を飲めば、直ちに痛みが消えるわけではない。$$, $$このくすりをのめば、ただちにいたみがきえるわけではない。$$, $$Tomar este remédio não significa que a dor vai passar imediatamente.$$),
    ('n2-grammar-150', $$会議は直ちに中止された。$$, $$かいぎはただちにちゅうしされた。$$, $$A reunião foi cancelada imediatamente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地震が起きたら、____火を消してください。$$, $$Se houver um terremoto, apague o fogo imediatamente.$$),
        (2, $$警察は____調査を始めた。$$, $$A polícia começou a investigação imediatamente.$$),
        (3, $$異常があれば、____連絡してください。$$, $$Se houver alguma anormalidade, entre em contato sem demora.$$),
        (4, $$命令を受けて、兵士たちは____出発した。$$, $$Ao receber a ordem, os soldados partiram imediatamente.$$),
        (5, $$けが人は____病院に運ばれた。$$, $$Os feridos foram levados imediatamente ao hospital.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-150', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$直ちに$$),
        (1, $$ただちに$$),
        (2, $$直ちに$$),
        (2, $$ただちに$$),
        (3, $$直ちに$$),
        (3, $$ただちに$$),
        (4, $$直ちに$$),
        (4, $$ただちに$$),
        (5, $$直ちに$$),
        (5, $$ただちに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-151 — 〜たまえ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-151',
    'grammar',
    'N2',
    $$〜たまえ$$,
    $$tamae$$,
    $$Faça / Vá / Ande$$,
    $$たまえ é uma forma de dar ordens de maneira suave, mas vinda de alguém em posição superior. Equivale a "faça" ou "vá".

É usado por homens mais velhos ou em posição de autoridade, como chefes ou professores, ao falar com alguém de posição inferior. Por exemplo, "sente-se aí".

Hoje em dia soa antiquado e aparece principalmente em livros, filmes e falas de personagens.$$,
    $$É mais suave que a forma imperativa simples, mas ainda mostra superioridade.

Não se usa com superiores nem em situações formais.

A forma negativa é たまうな, mas é rara.$$,
    $$Verbo (forma ます sem ます) + たまえ$$,
    $$たまえ$$,
    $$たまえ$$,
    ARRAY['たまえ']::text[],
    ARRAY['たまえ', '〜たまえ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-151', $$そこに座りたまえ。$$, $$そこにすわりたまえ。$$, $$Sente-se aí.$$),
    ('n2-grammar-151', $$君も一緒に来たまえ。$$, $$きみもいっしょにきたまえ。$$, $$Venha você também.$$),
    ('n2-grammar-151', $$遠慮しないで食べたまえ。$$, $$えんりょしないでたべたまえ。$$, $$Coma sem cerimônia.$$),
    ('n2-grammar-151', $$早く報告書を出したまえ。$$, $$はやくほうこくしょをだしたまえ。$$, $$Entregue logo o relatório.$$),
    ('n2-grammar-151', $$もっとよく考えたまえ。$$, $$もっとよくかんがえたまえ。$$, $$Pense melhor.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$話を最後まで聞き____。$$, $$Ouça a história até o fim.$$),
        (2, $$こっちへ来____。$$, $$Venha cá.$$),
        (3, $$もう一度やってみ____。$$, $$Tente mais uma vez.$$),
        (4, $$自分の意見を言い____。$$, $$Diga a sua opinião.$$),
        (5, $$ゆっくり休み____。$$, $$Descanse bem.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-151', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$たまえ$$),
        (2, $$たまえ$$),
        (3, $$たまえ$$),
        (4, $$たまえ$$),
        (5, $$たまえ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-152 — 〜てばかりはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-152',
    'grammar',
    'N2',
    $$〜てばかりはいられない$$,
    $$te bakari wa irarenai$$,
    $$Não dá para ficar só / Não posso continuar só / Não dá para viver só$$,
    $$てばかりはいられない indica que a pessoa não pode continuar apenas em um estado ou fazendo só uma coisa, porque precisa agir. Equivale a "não dá para ficar só...".

Muitas vezes a situação atual é confortável ou emocional, mas a pessoa percebe que precisa mudar. Por exemplo, "não dá para ficar só chorando, tenho que seguir em frente".

É uma expressão de determinação ou de reflexão sobre a realidade.$$,
    $$A forma ばかりもいられない tem o mesmo sentido.

É parecido com てはいられない, mas ばかり destaca que a pessoa estava fazendo apenas aquilo.$$,
    $$Verbo (forma て) + ばかりはいられない
Verbo (forma て) + ばかりもいられない$$,
    $$てばかりはいられない$$,
    $$ばかりはいられない|ばかりもいられない|ばかりはいられません|ばかりもいられません$$,
    ARRAY['て', 'ばかり', 'は', 'いられない']::text[],
    ARRAY['てばかりはいられない', 'てばかりもいられない', 'でばかりはいられない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-152', $$いつまでも泣いてばかりはいられない。$$, $$いつまでもないてばかりはいられない。$$, $$Não dá para ficar só chorando para sempre.$$),
    ('n2-grammar-152', $$試験が近いから、遊んでばかりはいられない。$$, $$しけんがちかいから、あそんでばかりはいられない。$$, $$A prova está chegando, então não dá para ficar só brincando.$$),
    ('n2-grammar-152', $$親に頼ってばかりもいられない。$$, $$おやにたよってばかりもいられない。$$, $$Não posso continuar só dependendo dos meus pais.$$),
    ('n2-grammar-152', $$休んでばかりはいられないので、仕事を探し始めた。$$, $$やすんでばかりはいられないので、しごとをさがしはじめた。$$, $$Como não dá para ficar só descansando, comecei a procurar emprego.$$),
    ('n2-grammar-152', $$失敗を悔やんでばかりはいられません。$$, $$しっぱいをくやんでばかりはいられません。$$, $$Não dá para ficar só lamentando o fracasso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$落ち込んで____、次の準備をしよう。$$, $$Não dá para ficar só desanimado, vamos preparar o próximo passo.$$),
        (2, $$文句を言って____。自分で何とかしよう。$$, $$Não dá para ficar só reclamando. Vou dar um jeito sozinho.$$),
        (3, $$いつまでも寝て____。$$, $$Não dá para ficar só dormindo para sempre.$$),
        (4, $$喜んで____。まだ問題は残っている。$$, $$Não dá para ficar só comemorando. Ainda há problemas.$$),
        (5, $$待って____から、自分から連絡した。$$, $$Como não dava para ficar só esperando, entrei em contato por conta própria.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-152', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ばかりはいられない$$),
        (1, $$ばかりもいられない$$),
        (2, $$ばかりはいられない$$),
        (2, $$ばかりもいられない$$),
        (3, $$ばかりはいられない$$),
        (3, $$ばかりもいられない$$),
        (4, $$ばかりはいられない$$),
        (4, $$ばかりもいられない$$),
        (5, $$ばかりはいられない$$),
        (5, $$ばかりもいられない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-153 — 〜てでも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-153',
    'grammar',
    'N2',
    $$〜てでも$$,
    $$te demo$$,
    $$Mesmo que seja preciso / Nem que seja / Custe o que custar$$,
    $$てでも indica que a pessoa está disposta a usar um meio difícil ou extremo para alcançar um objetivo. Equivale a "mesmo que seja preciso..." ou "nem que seja...".

A primeira parte mostra o sacrifício, e a segunda mostra a vontade forte. Por exemplo, "quero ir ao show nem que seja pegando dinheiro emprestado".

A segunda parte costuma ter たい, つもりだ ou um verbo de intenção.$$,
    $$Expressões comuns são 借金してでも, 徹夜してでも e 何をしてでも.

É parecido com てまで, mas てでも mostra mais determinação, enquanto てまで muitas vezes critica o exagero.$$,
    $$Verbo (forma て) + でも + Desejo / Intenção$$,
    $$てでも$$,
    $$てでも|んででも$$,
    ARRAY['て', 'でも']::text[],
    ARRAY['てでも', 'ででも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-153', $$借金してでも、この車を買いたい。$$, $$しゃっきんしてでも、このくるまをかいたい。$$, $$Quero comprar este carro nem que seja fazendo dívida.$$),
    ('n2-grammar-153', $$徹夜してでも、明日までに終わらせる。$$, $$てつやしてでも、あしたまでにおわらせる。$$, $$Vou terminar até amanhã, nem que seja virando a noite.$$),
    ('n2-grammar-153', $$何をしてでも、彼女を助けたい。$$, $$なにをしてでも、かのじょをたすけたい。$$, $$Quero ajudá-la, custe o que custar.$$),
    ('n2-grammar-153', $$会社を休んででも、そのコンサートに行きたい。$$, $$かいしゃをやすんででも、そのコンサートにいきたい。$$, $$Quero ir a esse show mesmo que precise faltar no trabalho.$$),
    ('n2-grammar-153', $$無理をしてでも、試合に出るつもりだ。$$, $$むりをしてでも、しあいにでるつもりだ。$$, $$Pretendo jogar a partida mesmo que precise me forçar.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$並ん____、あの店のラーメンが食べたい。$$, $$Quero comer o lámen daquela loja nem que seja preciso enfrentar fila.$$),
        (2, $$走っ____、終電に間に合わせよう。$$, $$Vamos pegar o último trem nem que seja correndo.$$),
        (3, $$どんなことをし____、夢をかなえたい。$$, $$Quero realizar o meu sonho custe o que custar.$$),
        (4, $$仕事を辞め____、世界一周の旅に出たい。$$, $$Quero dar a volta ao mundo nem que seja preciso largar o emprego.$$),
        (5, $$頭を下げ____、協力をお願いするつもりだ。$$, $$Pretendo pedir ajuda nem que seja preciso me humilhar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-153', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ででも$$),
        (2, $$てでも$$),
        (3, $$てでも$$),
        (4, $$てでも$$),
        (5, $$てでも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-154 — 〜て以来
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-154',
    'grammar',
    'N2',
    $$〜て以来$$,
    $$te irai$$,
    $$Desde que / Desde / A partir de quando$$,
    $$て以来 indica que um estado continua desde um momento no passado até agora. Equivale a "desde que".

A primeira parte mostra o acontecimento que marcou o início, e a segunda mostra o estado que permanece. Por exemplo, "desde que vim ao Japão, moro em Tóquio".

É uma expressão um pouco formal.$$,
    $$A segunda parte deve ser algo que continua até o presente. Não se usa para algo que aconteceu uma única vez.

É parecido com てから, mas て以来 destaca a continuidade.

Expressões comuns são それ以来 e 卒業以来.$$,
    $$Verbo (forma て) + 以来
Substantivo + 以来$$,
    $$て以来$$,
    $$て以来|で以来|以来$$,
    ARRAY['て', '以来']::text[],
    ARRAY['て以来', '以来', 'それ以来']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-154', $$日本に来て以来、ずっと東京に住んでいる。$$, $$にほんにきていらい、ずっととうきょうにすんでいる。$$, $$Desde que vim ao Japão, moro em Tóquio.$$),
    ('n2-grammar-154', $$卒業以来、彼とは会っていない。$$, $$そつぎょういらい、かれとはあっていない。$$, $$Desde a formatura, não o vejo.$$),
    ('n2-grammar-154', $$あの事故以来、車の運転が怖くなった。$$, $$あのじこいらい、くるまのうんてんがこわくなった。$$, $$Desde aquele acidente, passei a ter medo de dirigir.$$),
    ('n2-grammar-154', $$結婚して以来、料理を作るようになった。$$, $$けっこんしていらい、りょうりをつくるようになった。$$, $$Desde que me casei, passei a cozinhar.$$),
    ('n2-grammar-154', $$彼女はそれ以来、一度も連絡してこない。$$, $$かのじょはそれいらい、いちどもれんらくしてこない。$$, $$Desde então, ela não entrou em contato nenhuma vez.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たばこをやめ____、体の調子がいい。$$, $$Desde que parei de fumar, me sinto bem.$$),
        (2, $$この町に引っ越し____、毎日散歩している。$$, $$Desde que me mudei para esta cidade, caminho todos os dias.$$),
        (3, $$入社____、一度も休んだことがない。$$, $$Desde que entrei na empresa, nunca faltei.$$),
        (4, $$大学に入っ____、一人暮らしをしている。$$, $$Desde que entrei na universidade, moro sozinho.$$),
        (5, $$先月風邪をひい____、ずっと咳が止まらない。$$, $$Desde que peguei resfriado no mês passado, a tosse não para.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-154', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て以来$$),
        (2, $$て以来$$),
        (3, $$以来$$),
        (4, $$て以来$$),
        (5, $$て以来$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-155 — 〜ていては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-155',
    'grammar',
    'N2',
    $$〜ていては$$,
    $$te ite wa$$,
    $$Se continuar / Se ficar / Desse jeito$$,
    $$ていては indica que, se uma situação ou atitude continuar, o resultado será ruim. Equivale a "se continuar..." ou "se ficar...".

A primeira parte mostra um comportamento que se repete ou se mantém, e a segunda mostra uma consequência negativa. Por exemplo, "se continuar dormindo até tarde, vai se atrasar".

O tom é de advertência ou preocupação.$$,
    $$Na fala, aparece como てちゃ ou てたら.

É parecido com ていたら, mas ていては destaca mais o resultado ruim.$$,
    $$Verbo (forma て) + いては + Resultado negativo$$,
    $$ていては$$,
    $$ていては|でいては$$,
    ARRAY['て', 'いて', 'は']::text[],
    ARRAY['ていては', 'でいては']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-155', $$毎日遊んでいては、試験に合格できない。$$, $$まいにちあそんでいては、しけんにごうかくできない。$$, $$Se continuar brincando todo dia, não vai passar na prova.$$),
    ('n2-grammar-155', $$そんなに食べていては、太ってしまうよ。$$, $$そんなにたべていては、ふとってしまうよ。$$, $$Se continuar comendo tanto assim, vai engordar.$$),
    ('n2-grammar-155', $$文句ばかり言っていては、何も変わらない。$$, $$もんくばかりいっていては、なにもかわらない。$$, $$Se ficar só reclamando, nada vai mudar.$$),
    ('n2-grammar-155', $$こんなに休んでいては、仕事が終わらない。$$, $$こんなにやすんでいては、しごとがおわらない。$$, $$Descansando tanto assim, o trabalho não vai terminar.$$),
    ('n2-grammar-155', $$人に頼っていては、成長できない。$$, $$ひとにたよっていては、せいちょうできない。$$, $$Se continuar dependendo dos outros, não vai crescer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎晩遅くまで起き____、体を壊すよ。$$, $$Se continuar acordado até tarde toda noite, vai acabar doente.$$),
        (2, $$そんなにお金を使っ____、すぐになくなる。$$, $$Se continuar gastando tanto assim, o dinheiro vai acabar logo.$$),
        (3, $$待っ____、チャンスを逃してしまう。$$, $$Se ficar só esperando, vai perder a chance.$$),
        (4, $$ゲームばかりし____、目が悪くなる。$$, $$Se ficar só jogando videogame, vai prejudicar a vista.$$),
        (5, $$失敗を怖がっ____、何もできない。$$, $$Se continuar com medo de errar, não vai conseguir fazer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-155', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていては$$),
        (2, $$ていては$$),
        (3, $$ていては$$),
        (4, $$ていては$$),
        (5, $$ていては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-156 — 〜てこそ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-156',
    'grammar',
    'N2',
    $$〜てこそ$$,
    $$te koso$$,
    $$Só quando / Somente ao / É justamente ao$$,
    $$てこそ indica que algo só tem valor ou só acontece de verdade quando uma condição é cumprida. Equivale a "só quando" ou "somente ao".

A pessoa reforça que aquela condição é essencial. Por exemplo, "só quando você mesmo experimenta é que entende".

A segunda parte costuma expressar algo positivo, como entender, ter valor ou ser possível.$$,
    $$こそ é uma partícula de ênfase, que destaca a palavra anterior.

É parecido com てはじめて, mas てこそ destaca o valor ou a importância da condição.$$,
    $$Verbo (forma て) + こそ$$,
    $$てこそ$$,
    $$てこそ|でこそ$$,
    ARRAY['て', 'こそ']::text[],
    ARRAY['てこそ', 'でこそ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-156', $$自分で経験してこそ、本当の意味がわかる。$$, $$じぶんでけいけんしてこそ、ほんとうのいみがわかる。$$, $$Só quando você mesmo vive é que entende o verdadeiro sentido.$$),
    ('n2-grammar-156', $$努力してこそ、成功できる。$$, $$どりょくしてこそ、せいこうできる。$$, $$Só com esforço é possível ter sucesso.$$),
    ('n2-grammar-156', $$みんなで協力してこそ、いいものができる。$$, $$みんなできょうりょくしてこそ、いいものができる。$$, $$Só quando todos cooperam é que se faz algo bom.$$),
    ('n2-grammar-156', $$健康であってこそ、仕事も楽しめる。$$, $$けんこうであってこそ、しごともたのしめる。$$, $$Só com saúde é que dá para aproveitar até o trabalho.$$),
    ('n2-grammar-156', $$失敗を経験してこそ、人は強くなる。$$, $$しっぱいをけいけんしてこそ、ひとはつよくなる。$$, $$É justamente ao passar por fracassos que as pessoas ficam mais fortes.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$実際に使っ____、良さがわかる。$$, $$Só usando de verdade é que se percebe o valor.$$),
        (2, $$親になっ____、親の苦労がわかる。$$, $$Só quando se vira pai é que se entende o sofrimento dos pais.$$),
        (3, $$毎日練習し____、上手になれる。$$, $$Só praticando todo dia é que dá para melhorar.$$),
        (4, $$相手の話をよく聞い____、いい関係が作れる。$$, $$Só ouvindo bem o outro é que se constrói uma boa relação.$$),
        (5, $$苦労し____、喜びも大きい。$$, $$É justamente por ter sofrido que a alegria é grande.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-156', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てこそ$$),
        (2, $$てこそ$$),
        (3, $$てこそ$$),
        (4, $$てこそ$$),
        (5, $$てこそ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-157 — 〜てまで
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-157',
    'grammar',
    'N2',
    $$〜てまで$$,
    $$te made$$,
    $$A ponto de / Chegando a / Até o ponto de$$,
    $$てまで indica que alguém chega a um extremo para conseguir algo. Equivale a "a ponto de" ou "chegando a".

Muitas vezes a pessoa que fala critica ou questiona esse exagero. Por exemplo, "não quero ganhar a ponto de mentir".

Também pode mostrar admiração pelo esforço de alguém, como "ele veio até aqui, a ponto de faltar ao trabalho".$$,
    $$É muito comum na forma てまで〜たくない, "não quero chegar a ponto de...".

É parecido com てでも, mas てまで costuma ter um tom de crítica ao exagero.$$,
    $$Verbo (forma て) + まで + Frase
Verbo (forma て) + まで + Verbo (forma たくない)$$,
    $$てまで$$,
    $$てまで|でまで$$,
    ARRAY['て', 'まで']::text[],
    ARRAY['てまで', 'でまで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-157', $$嘘をついてまで、勝ちたくない。$$, $$うそをついてまで、かちたくない。$$, $$Não quero ganhar a ponto de mentir.$$),
    ('n2-grammar-157', $$借金してまで、高い車を買う必要はない。$$, $$しゃっきんしてまで、たかいくるまをかうひつようはない。$$, $$Não é preciso comprar um carro caro a ponto de fazer dívida.$$),
    ('n2-grammar-157', $$彼は仕事を休んでまで、手伝いに来てくれた。$$, $$かれはしごとをやすんでまで、てつだいにきてくれた。$$, $$Ele chegou a faltar ao trabalho para vir me ajudar.$$),
    ('n2-grammar-157', $$徹夜してまで、ゲームをするのはよくない。$$, $$てつやしてまで、ゲームをするのはよくない。$$, $$Não é bom jogar videogame a ponto de virar a noite.$$),
    ('n2-grammar-157', $$人を傷つけてまで、自分の意見を通したくない。$$, $$ひとをきずつけてまで、じぶんのいけんをとおしたくない。$$, $$Não quero impor minha opinião a ponto de magoar alguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$友達を裏切っ____、お金がほしいとは思わない。$$, $$Não quero dinheiro a ponto de trair um amigo.$$),
        (2, $$体を壊し____、働く必要はない。$$, $$Não precisa trabalhar a ponto de arruinar a saúde.$$),
        (3, $$何時間も並ん____、食べたいとは思わない。$$, $$Não tenho vontade de comer a ponto de ficar horas na fila.$$),
        (4, $$彼女は家を売っ____、夢を追いかけた。$$, $$Ela chegou a vender a casa para correr atrás do sonho.$$),
        (5, $$規則を破っ____、やることではない。$$, $$Não é algo que valha a pena fazer a ponto de quebrar as regras.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-157', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てまで$$),
        (2, $$てまで$$),
        (3, $$でまで$$),
        (4, $$てまで$$),
        (5, $$てまで$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-158 — 〜てならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-158',
    'grammar',
    'N2',
    $$〜てならない$$,
    $$te naranai$$,
    $$Não consigo deixar de / Sinto muito / Extremamente$$,
    $$てならない indica um sentimento muito forte que surge naturalmente e que a pessoa não consegue controlar. Equivale a "não consigo deixar de..." ou "sinto muito...".

Costuma vir com palavras de sentimento ou sensação, como preocupar-se, sentir saudade, achar estranho ou lamentar. Por exemplo, "não consigo deixar de me preocupar com o futuro".

É um pouco mais formal que てたまらない.$$,
    $$É usado principalmente com sentimentos da primeira pessoa.

É parecido com てたまらない, mas てならない é mais usado com sentimentos que surgem sem querer, como 気がしてならない.

Uma expressão comum é 気がしてならない, "não consigo tirar essa sensação".$$,
    $$Verbo (forma て) + ならない
Adjetivo い (sem い) + くてならない
Adjetivo な + でならない$$,
    $$てならない$$,
    $$てならない|でならない|てなりません|でなりません$$,
    ARRAY['て', 'ならない']::text[],
    ARRAY['てならない', 'でならない', 'てなりません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-158', $$将来のことが心配でならない。$$, $$しょうらいのことがしんぱいでならない。$$, $$Não consigo deixar de me preocupar com o futuro.$$),
    ('n2-grammar-158', $$国に残した家族のことが気になってならない。$$, $$くににのこしたかぞくのことがきになってならない。$$, $$Não consigo parar de pensar na família que deixei no meu país.$$),
    ('n2-grammar-158', $$彼が嘘をついているような気がしてならない。$$, $$かれがうそをついているようなきがしてならない。$$, $$Não consigo tirar a sensação de que ele está mentindo.$$),
    ('n2-grammar-158', $$試験に落ちて、悔しくてならない。$$, $$しけんにおちて、くやしくてならない。$$, $$Reprovei na prova e estou extremamente frustrado.$$),
    ('n2-grammar-158', $$故郷が懐かしくてなりません。$$, $$こきょうがなつかしくてなりません。$$, $$Sinto muita saudade da minha terra natal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人暮らしの母のことが心配____。$$, $$Não consigo deixar de me preocupar com minha mãe, que mora sozinha.$$),
        (2, $$あの時の失敗が悔やまれ____。$$, $$Lamento muito aquele erro.$$),
        (3, $$試合の結果が気になっ____。$$, $$Não consigo parar de pensar no resultado da partida.$$),
        (4, $$彼女が来ないのが不思議に思われ____。$$, $$Acho muito estranho ela não vir.$$),
        (5, $$何か悪いことが起こる気がし____。$$, $$Não consigo tirar a sensação de que algo ruim vai acontecer.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-158', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$でならない$$),
        (1, $$でなりません$$),
        (2, $$てならない$$),
        (2, $$てなりません$$),
        (3, $$てならない$$),
        (3, $$てなりません$$),
        (4, $$てならない$$),
        (4, $$てなりません$$),
        (5, $$てならない$$),
        (5, $$てなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-159 — 〜てたまらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-159',
    'grammar',
    'N2',
    $$〜てたまらない$$,
    $$te tamaranai$$,
    $$Muito / Insuportavelmente / Não aguento de tanto$$,
    $$てたまらない indica que um sentimento ou sensação é tão forte que a pessoa quase não consegue suportar. Equivale a "muito", "insuportavelmente" ou "não aguento de tanto...".

Costuma vir com adjetivos de sentimento ou sensação física, como quente, frio, dolorido, feliz, triste ou com vontade. Por exemplo, "está quente demais, não aguento" ou "estou morrendo de vontade de te ver".

É uma expressão emotiva, comum na fala.$$,
    $$É usado com sentimentos da primeira pessoa. Para outras pessoas, acrescenta-se ようだ ou らしい.

É parecido com てしょうがない e てしかたがない, que são mais coloquiais.$$,
    $$Adjetivo い (sem い) + くてたまらない
Adjetivo な + でたまらない
Verbo (forma たい sem い) + くてたまらない
Verbo (forma て) + たまらない$$,
    $$てたまらない$$,
    $$てたまらない|でたまらない|てたまりません|でたまりません|てたまらなかった|でたまらなかった$$,
    ARRAY['て', 'たまらない']::text[],
    ARRAY['てたまらない', 'でたまらない', 'てたまりません', 'てたまらなかった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-159', $$今日は暑くてたまらない。$$, $$きょうはあつくてたまらない。$$, $$Hoje está quente demais, não aguento.$$),
    ('n2-grammar-159', $$彼女に会いたくてたまらない。$$, $$かのじょにあいたくてたまらない。$$, $$Estou morrendo de vontade de vê-la.$$),
    ('n2-grammar-159', $$歯が痛くてたまらない。$$, $$はがいたくてたまらない。$$, $$Meu dente dói insuportavelmente.$$),
    ('n2-grammar-159', $$合格の知らせを聞いて、うれしくてたまらなかった。$$, $$ごうかくのしらせをきいて、うれしくてたまらなかった。$$, $$Ouvindo a notícia da aprovação, fiquei felicíssimo.$$),
    ('n2-grammar-159', $$一人で留守番をするのが不安でたまらない。$$, $$ひとりでるすばんをするのがふあんでたまらない。$$, $$Ficar sozinho em casa me deixa extremamente ansioso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$朝から何も食べていないので、お腹がすい____。$$, $$Não comi nada desde a manhã, estou morrendo de fome.$$),
        (2, $$この部屋は寒く____。$$, $$Este quarto está frio demais, não aguento.$$),
        (3, $$試験の結果が心配____。$$, $$Estou extremamente preocupado com o resultado da prova.$$),
        (4, $$あの映画が見たく____。$$, $$Estou morrendo de vontade de ver aquele filme.$$),
        (5, $$子供が生まれて、うれしく____。$$, $$Meu filho nasceu e estou felicíssimo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-159', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てたまらない$$),
        (1, $$てたまりません$$),
        (2, $$てたまらない$$),
        (2, $$てたまりません$$),
        (3, $$でたまらない$$),
        (3, $$でたまりません$$),
        (4, $$てたまらない$$),
        (4, $$てたまりません$$),
        (5, $$てたまらない$$),
        (5, $$てたまりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-160 — 〜て当然だ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-160',
    'grammar',
    'N2',
    $$〜て当然だ$$,
    $$te touzen da$$,
    $$É natural que / É óbvio que / Não é para menos$$,
    $$て当然だ indica que algo é totalmente natural ou esperado diante da situação. Equivale a "é natural que" ou "é óbvio que".

A pessoa explica que, por algum motivo, aquele resultado ou atitude faz todo o sentido. Por exemplo, "ele treinou muito, então é natural que tenha vencido".

Também pode expressar que algo deveria ser assim, com o sentido de "é o mínimo".$$,
    $$É parecido com のも当然だ e のは当たり前だ.

A forma て当たり前だ é mais coloquial e tem o mesmo sentido.$$,
    $$Verbo (forma て) + 当然だ
Adjetivo い (sem い) + くて当然だ
Adjetivo な / Substantivo + で当然だ$$,
    $$て当然だ$$,
    $$て当然|で当然|てとうぜん$$,
    ARRAY['て', '当然', 'だ']::text[],
    ARRAY['て当然だ', 'で当然だ', 'て当然です']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-160', $$あれだけ練習したのだから、勝って当然だ。$$, $$あれだけれんしゅうしたのだから、かってとうぜんだ。$$, $$Com tanto treino, é natural que tenha vencido.$$),
    ('n2-grammar-160', $$約束を破ったのだから、怒られて当然だ。$$, $$やくそくをやぶったのだから、おこられてとうぜんだ。$$, $$Ele quebrou a promessa, então é óbvio que levou bronca.$$),
    ('n2-grammar-160', $$この値段なら、品質がよくて当然です。$$, $$このねだんなら、ひんしつがよくてとうぜんです。$$, $$Com este preço, é óbvio que a qualidade seja boa.$$),
    ('n2-grammar-160', $$初めてなのだから、下手で当然だ。$$, $$はじめてなのだから、へたでとうぜんだ。$$, $$É a primeira vez, então é natural ser ruim nisso.$$),
    ('n2-grammar-160', $$お世話になったら、お礼を言って当然だ。$$, $$おせわになったら、おれいをいってとうぜんだ。$$, $$Se alguém te ajudou, é o mínimo agradecer.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一晩中起きていたのだから、眠く____。$$, $$Fiquei acordado a noite toda, então é natural estar com sono.$$),
        (2, $$毎日勉強したのだから、合格し____。$$, $$Estudei todo dia, então é óbvio que passei.$$),
        (3, $$子供なのだから、わからなく____。$$, $$É criança, então é natural não entender.$$),
        (4, $$あんなひどいことを言ったら、嫌われ____。$$, $$Dizendo uma coisa tão horrível, é óbvio que vai ser odiado.$$),
        (5, $$プロなのだから、上手____。$$, $$É profissional, então é óbvio que seja bom.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-160', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$て当然だ$$),
        (1, $$て当然です$$),
        (2, $$て当然だ$$),
        (2, $$て当然です$$),
        (3, $$て当然だ$$),
        (3, $$て当然です$$),
        (4, $$て当然だ$$),
        (4, $$て当然です$$),
        (5, $$で当然だ$$),
        (5, $$で当然です$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-161 — 〜ては / 〜では
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-161',
    'grammar',
    'N2',
    $$〜ては / 〜では$$,
    $$te wa / de wa$$,
    $$Se for assim / Se continuar / Desse jeito$$,
    $$ては ou では, no meio da frase, indica uma condição que leva a um resultado ruim ou indesejado. Equivale a "se for assim..." ou "desse jeito...".

A primeira parte mostra uma situação, e a segunda mostra que, nessa condição, algo fica difícil, impossível ou problemático. Por exemplo, "com tanto barulho, não dá para estudar".

A segunda parte costuma ser negativa, como できない, 困る ou だめだ.$$,
    $$Na fala, ては vira ちゃ e では vira じゃ.

É parecido com たら e ば, mas ては quase sempre leva a um resultado negativo.

Também é a base de expressões como てはいけない e てはならない.$$,
    $$Verbo (forma て) + は + Resultado negativo
Adjetivo い (sem い) + くては + Resultado negativo
Adjetivo な / Substantivo + では + Resultado negativo$$,
    $$ては$$,
    $$ては|では|くては$$,
    ARRAY['て', 'は']::text[],
    ARRAY['ては', 'では', 'くては', 'ちゃ', 'じゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-161', $$こんなにうるさくては、勉強できない。$$, $$こんなにうるさくては、べんきょうできない。$$, $$Com tanto barulho, não dá para estudar.$$),
    ('n2-grammar-161', $$毎日雨では、洗濯物が乾かない。$$, $$まいにちあめでは、せんたくものがかわかない。$$, $$Chovendo todo dia, a roupa não seca.$$),
    ('n2-grammar-161', $$そんなに急がされては、いい仕事ができない。$$, $$そんなにいそがされては、いいしごとができない。$$, $$Se me apressarem tanto, não consigo fazer um bom trabalho.$$),
    ('n2-grammar-161', $$こんな成績では、大学に入れない。$$, $$こんなせいせきでは、だいがくにはいれない。$$, $$Com notas assim, não vou entrar na universidade.$$),
    ('n2-grammar-161', $$今やめられては困ります。$$, $$いまやめられてはこまります。$$, $$Se você desistir agora, vou ficar em apuros.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$こんなに暑く____、眠れない。$$, $$Com este calor, não dá para dormir.$$),
        (2, $$その服装____、会社に行けないよ。$$, $$Com essa roupa, não dá para ir à empresa.$$),
        (3, $$君に来られなく____、困る。$$, $$Se você não puder vir, fico em apuros.$$),
        (4, $$この給料____、生活できない。$$, $$Com este salário, não dá para viver.$$),
        (5, $$そんなに泣かれ____、何も言えない。$$, $$Se você chorar tanto, não consigo dizer nada.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-161', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ては$$),
        (2, $$では$$),
        (3, $$ては$$),
        (4, $$では$$),
        (5, $$ては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-162 — 〜てはいられない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-162',
    'grammar',
    'N2',
    $$〜てはいられない$$,
    $$te wa irarenai$$,
    $$Não dá para ficar / Não posso continuar / Não há tempo para$$,
    $$てはいられない indica que a pessoa não pode continuar em um estado ou fazendo algo, por causa da situação. Equivale a "não dá para ficar..." ou "não posso continuar...".

Muitas vezes há uma urgência ou um motivo que obriga a pessoa a mudar de atitude. Por exemplo, "o prazo está chegando, não dá para ficar parado".

Mostra a vontade de agir ou a pressão da situação.$$,
    $$Uma expressão comum é じっとしてはいられない, "não dá para ficar parado".

É parecido com てばかりはいられない, que destaca que a pessoa só fazia aquilo.

Na fala, aparece como てらんない.$$,
    $$Verbo (forma て) + はいられない
Verbo (forma て) + もいられない$$,
    $$てはいられない$$,
    $$てはいられない|ではいられない|てもいられない|てはいられません|ではいられません$$,
    ARRAY['て', 'は', 'いられない']::text[],
    ARRAY['てはいられない', 'ではいられない', 'てもいられない', 'てはいられません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-162', $$締め切りが近いので、休んではいられない。$$, $$しめきりがちかいので、やすんではいられない。$$, $$O prazo está chegando, não dá para ficar descansando.$$),
    ('n2-grammar-162', $$子供が病気なのに、じっとしてはいられない。$$, $$こどもがびょうきなのに、じっとしてはいられない。$$, $$Meu filho está doente, não dá para ficar parado.$$),
    ('n2-grammar-162', $$もう時間がないから、迷ってはいられない。$$, $$もうじかんがないから、まよってはいられない。$$, $$Já não há tempo, não dá para ficar hesitando.$$),
    ('n2-grammar-162', $$こんなところで負けてはいられません。$$, $$こんなところでまけてはいられません。$$, $$Não posso perder num lugar como este.$$),
    ('n2-grammar-162', $$心配で、いてもたってもいられない。$$, $$しんぱいで、いてもたってもいられない。$$, $$Estou tão preocupado que não consigo ficar quieto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$試合は明日だ。のんびりし____。$$, $$A partida é amanhã. Não dá para ficar de bobeira.$$),
        (2, $$みんなが頑張っているのに、私だけ寝____。$$, $$Todos estão se esforçando, não dá para só eu ficar dormindo.$$),
        (3, $$もう大人なのだから、親に甘え____。$$, $$Já sou adulto, então não dá para continuar dependendo dos meus pais.$$),
        (4, $$ライバルが追いついてきた。止まっ____。$$, $$O rival está alcançando. Não dá para parar.$$),
        (5, $$こんなに忙しいときに、遊ん____。$$, $$Num momento tão corrido, não dá para ficar brincando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-162', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはいられない$$),
        (1, $$てはいられません$$),
        (2, $$てはいられない$$),
        (2, $$てはいられません$$),
        (3, $$てはいられない$$),
        (3, $$てはいられません$$),
        (4, $$てはいられない$$),
        (4, $$てはいられません$$),
        (5, $$ではいられない$$),
        (5, $$ではいられません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-163 — 〜てはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-163',
    'grammar',
    'N2',
    $$〜てはならない$$,
    $$te wa naranai$$,
    $$Não se deve / É proibido / Não pode$$,
    $$てはならない indica uma proibição forte, baseada em regras, moral ou bom senso. Equivale a "não se deve" ou "é proibido".

É mais formal que てはいけない e aparece em leis, regras, discursos e textos sérios. Por exemplo, "não se deve esquecer as lições da guerra".

Também é usado para falar de coisas que nunca deveriam acontecer.$$,
    $$É mais forte e formal que てはいけない.

A forma てはならぬ é ainda mais antiga e formal.

Uma expressão comum é あってはならない, "algo que não pode acontecer".$$,
    $$Verbo (forma て) + はならない
Verbo (forma て) + はなりません$$,
    $$てはならない$$,
    $$てはならない|ではならない|てはなりません|ではなりません|てはならぬ$$,
    ARRAY['て', 'は', 'ならない']::text[],
    ARRAY['てはならない', 'ではならない', 'てはなりません', 'てはならぬ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-163', $$戦争の悲劇を忘れてはならない。$$, $$せんそうのひげきをわすれてはならない。$$, $$Não se deve esquecer a tragédia da guerra.$$),
    ('n2-grammar-163', $$ここでたばこを吸ってはなりません。$$, $$ここでたばこをすってはなりません。$$, $$É proibido fumar aqui.$$),
    ('n2-grammar-163', $$このような事故は二度と起こってはならない。$$, $$このようなじこはにどとおこってはならない。$$, $$Um acidente como este não pode acontecer nunca mais.$$),
    ('n2-grammar-163', $$人の心を傷つけてはならない。$$, $$ひとのこころをきずつけてはならない。$$, $$Não se deve magoar o coração das pessoas.$$),
    ('n2-grammar-163', $$この部屋に入ってはならない。$$, $$このへやにはいってはならない。$$, $$É proibido entrar nesta sala.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$約束を破っ____。$$, $$Não se deve quebrar promessas.$$),
        (2, $$試験中に話し____。$$, $$É proibido conversar durante a prova.$$),
        (3, $$医者はミスをし____。$$, $$Um médico não pode cometer erros.$$),
        (4, $$このことを誰にも話し____。$$, $$Não se deve contar isto a ninguém.$$),
        (5, $$ここで泳い____。$$, $$É proibido nadar aqui.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-163', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てはならない$$),
        (1, $$てはなりません$$),
        (2, $$てはならない$$),
        (2, $$てはなりません$$),
        (3, $$てはならない$$),
        (3, $$てはなりません$$),
        (4, $$てはならない$$),
        (4, $$てはなりません$$),
        (5, $$ではならない$$),
        (5, $$ではなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-164 — 〜ては〜ては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-164',
    'grammar',
    'N2',
    $$〜ては〜ては$$,
    $$te wa ~ te wa$$,
    $$Ora... ora / Faz... e então / Repetidamente$$,
    $$ては〜ては indica que duas ações se repetem várias vezes, uma depois da outra. Equivale a "faz... e então..., faz... e então..." ou "ora... ora...".

Por exemplo, "escrevia e apagava, escrevia e apagava" ou "comia e dormia, comia e dormia".

Também aparece com uma única ação, ては, seguida de outra, para mostrar uma repetição, como "toda vez que chovia, o rio transbordava".$$,
    $$É uma expressão que dá ritmo à frase e mostra repetição.

Na fala, também aparece como ちゃ〜ちゃ.$$,
    $$Verbo A (forma て) + は + Verbo B (forma ます sem ます)、Verbo A (forma て) + は + Verbo B
Verbo A (forma て) + は + Verbo B (repetição)$$,
    $$ては〜ては$$,
    $$ては|では$$,
    ARRAY['て', 'は']::text[],
    ARRAY['ては〜ては', 'では〜では']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-164', $$手紙を書いては消し、書いては消しした。$$, $$てがみをかいてはけし、かいてはけしした。$$, $$Escrevia a carta e apagava, escrevia e apagava.$$),
    ('n2-grammar-164', $$休みの日は、食べては寝、食べては寝ている。$$, $$やすみのひは、たべてはね、たべてはねている。$$, $$Nos dias de folga, como e durmo, como e durmo.$$),
    ('n2-grammar-164', $$雨が降っては止み、降っては止みしている。$$, $$あめがふってはやみ、ふってはやみしている。$$, $$A chuva cai e para, cai e para.$$),
    ('n2-grammar-164', $$彼は失敗しては立ち上がった。$$, $$かれはしっぱいしてはたちあがった。$$, $$Ele falhava e se levantava de novo.$$),
    ('n2-grammar-164', $$読んでは考え、考えては読んだ。$$, $$よんではかんがえ、かんがえてはよんだ。$$, $$Lia e pensava, pensava e lia.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供は転ん____起き、転んでは起きした。$$, $$A criança caía e se levantava, caía e se levantava.$$),
        (2, $$彼女は服を着____脱ぎ、着ては脱ぎした。$$, $$Ela vestia a roupa e tirava, vestia e tirava.$$),
        (3, $$波が寄せ____返す。$$, $$As ondas vêm e voltam.$$),
        (4, $$考えては書き、書い____考えた。$$, $$Pensava e escrevia, escrevia e pensava.$$),
        (5, $$夜中に何度も目が覚め____眠った。$$, $$Acordei e dormi várias vezes durante a noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$では$$),
        (2, $$ては$$),
        (3, $$ては$$),
        (4, $$ては$$),
        (5, $$ては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-165 — 〜と同時に
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-165',
    'grammar',
    'N2',
    $$〜と同時に$$,
    $$to douji ni$$,
    $$Ao mesmo tempo que / Assim que / Junto com$$,
    $$と同時に tem dois usos principais.

O primeiro indica que duas coisas acontecem ao mesmo tempo ou logo em seguida. Equivale a "assim que" ou "no mesmo instante em que". Por exemplo, "assim que o sinal tocou, os alunos saíram".

O segundo indica que algo tem duas características ao mesmo tempo, muitas vezes opostas. Equivale a "ao mesmo tempo que". Por exemplo, "este trabalho é difícil, mas ao mesmo tempo é gratificante".$$,
    $$No primeiro uso, é parecido com とたんに, mas と同時に é mais neutro.

No segundo uso, é parecido com 一方で.$$,
    $$Verbo (forma dicionário) + と同時に
Substantivo + と同時に
Adjetivo / Substantivo + である + と同時に$$,
    $$と同時に$$,
    $$と同時に|とどうじに|と同時$$,
    ARRAY['と', '同時', 'に']::text[],
    ARRAY['と同時に', 'と同時']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-165', $$ベルが鳴ると同時に、生徒たちは教室を出た。$$, $$ベルがなるとどうじに、せいとたちはきょうしつをでた。$$, $$Assim que o sinal tocou, os alunos saíram da sala.$$),
    ('n2-grammar-165', $$卒業と同時に、結婚した。$$, $$そつぎょうとどうじに、けっこんした。$$, $$Me casei logo depois da formatura.$$),
    ('n2-grammar-165', $$この仕事は大変だと同時に、やりがいがある。$$, $$このしごとはたいへんだとどうじに、やりがいがある。$$, $$Este trabalho é difícil, mas ao mesmo tempo é gratificante.$$),
    ('n2-grammar-165', $$彼は医者であると同時に、作家でもある。$$, $$かれはいしゃであるとどうじに、さっかでもある。$$, $$Ele é médico e, ao mesmo tempo, escritor.$$),
    ('n2-grammar-165', $$ドアが開くと同時に、客が店に入ってきた。$$, $$ドアがあくとどうじに、きゃくがみせにはいってきた。$$, $$Assim que a porta abriu, os clientes entraram na loja.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$家に着く____、雨が降り出した。$$, $$Assim que cheguei em casa, começou a chover.$$),
        (2, $$就職____、一人暮らしを始めた。$$, $$Junto com o primeiro emprego, comecei a morar sozinho.$$),
        (3, $$合格してうれしい____、少し不安もある。$$, $$Estou feliz por ter passado, mas ao mesmo tempo um pouco inseguro.$$),
        (4, $$彼女は母親である____、社長でもある。$$, $$Ela é mãe e, ao mesmo tempo, presidente de empresa.$$),
        (5, $$試合終了____、観客から大きな拍手が起こった。$$, $$Assim que a partida terminou, o público aplaudiu muito.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-165', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と同時に$$),
        (1, $$とどうじに$$),
        (2, $$と同時に$$),
        (2, $$とどうじに$$),
        (3, $$と同時に$$),
        (3, $$とどうじに$$),
        (4, $$と同時に$$),
        (4, $$とどうじに$$),
        (5, $$と同時に$$),
        (5, $$とどうじに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-166 — 〜といった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-166',
    'grammar',
    'N2',
    $$〜といった$$,
    $$to itta$$,
    $$Como / Tais como / Do tipo$$,
    $$といった serve para listar exemplos de um grupo. Equivale a "como" ou "tais como".

A pessoa dá alguns exemplos e depois diz a que categoria eles pertencem. Por exemplo, "frutas como maçã e laranja".

Também aparece na forma といった + Substantivo + はない, que significa "não há nada de especial", como "não tenho nenhum hobby em especial".$$,
    $$É parecido com などの, mas といった é um pouco mais formal.

A expressão これといった〜はない significa "nada de especial".$$,
    $$Substantivo + や + Substantivo + といった + Substantivo (categoria)
Substantivo + 、Substantivo + といった + Substantivo
これといった + Substantivo + はない$$,
    $$といった$$,
    $$といった$$,
    ARRAY['と', 'いった']::text[],
    ARRAY['といった', 'これといった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-166', $$りんごやみかんといった果物が好きだ。$$, $$りんごやみかんといったくだものがすきだ。$$, $$Gosto de frutas como maçã e laranja.$$),
    ('n2-grammar-166', $$京都や奈良といった古い町を訪ねたい。$$, $$きょうとやならといったふるいまちをたずねたい。$$, $$Quero visitar cidades antigas como Kyoto e Nara.$$),
    ('n2-grammar-166', $$サッカーや野球といったスポーツが人気だ。$$, $$サッカーややきゅうといったスポーツがにんきだ。$$, $$Esportes como futebol e beisebol são populares.$$),
    ('n2-grammar-166', $$これといった趣味はありません。$$, $$これといったしゅみはありません。$$, $$Não tenho nenhum hobby em especial.$$),
    ('n2-grammar-166', $$英語、中国語、韓国語といった言語を勉強している。$$, $$えいご、ちゅうごくご、かんこくごといったげんごをべんきょうしている。$$, $$Estudo línguas como inglês, chinês e coreano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$犬や猫____ペットを飼っている人が多い。$$, $$Muitas pessoas têm animais de estimação como cães e gatos.$$),
        (2, $$寿司や天ぷら____日本料理が食べたい。$$, $$Quero comer comida japonesa, como sushi e tempurá.$$),
        (3, $$これ____理由もなく、会社を辞めた。$$, $$Saí da empresa sem nenhum motivo em especial.$$),
        (4, $$地震や台風____自然災害に備えよう。$$, $$Vamos nos preparar para desastres naturais como terremotos e tufões.$$),
        (5, $$ピアノやバイオリン____楽器を習っている。$$, $$Faço aulas de instrumentos como piano e violino.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-166', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といった$$),
        (2, $$といった$$),
        (3, $$といった$$),
        (4, $$といった$$),
        (5, $$といった$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-167 — 〜というふうに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-167',
    'grammar',
    'N2',
    $$〜というふうに$$,
    $$to iu fuu ni$$,
    $$Desta forma / Assim como / Do jeito que$$,
    $$というふうに serve para mostrar a forma ou o modo como algo é feito, geralmente dando exemplos. Equivale a "desta forma" ou "do jeito que".

A pessoa explica um padrão ou uma maneira de fazer algo, muitas vezes listando exemplos. Por exemplo, "segunda é inglês, terça é matemática, desta forma estudo uma matéria por dia".

Também pode citar o que alguém disse ou pensou, como "ele disse que viria, desse jeito".$$,
    $$É parecido com というように e のように.

Na fala, aparece muito como っていうふうに.$$,
    $$Frase + というふうに + Verbo
Frase + というふうな / というふうだ$$,
    $$というふうに$$,
    $$というふうに|というふうな|というように|っていうふうに$$,
    ARRAY['と', 'いう', 'ふう', 'に']::text[],
    ARRAY['というふうに', 'というふうな', 'というように']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-167', $$月曜日は英語、火曜日は数学というふうに、毎日違う科目を勉強している。$$, $$げつようびはえいご、かようびはすうがくというふうに、まいにちちがうかもくをべんきょうしている。$$, $$Segunda é inglês, terça é matemática, desta forma estudo uma matéria diferente por dia.$$),
    ('n2-grammar-167', $$彼は来ないというふうに言っていた。$$, $$かれはこないというふうにいっていた。$$, $$Ele disse, desse jeito, que não viria.$$),
    ('n2-grammar-167', $$朝はジョギング、夜はヨガというふうに、運動を続けている。$$, $$あさはジョギング、よるはヨガというふうに、うんどうをつづけている。$$, $$De manhã corrida, à noite ioga, desta forma continuo me exercitando.$$),
    ('n2-grammar-167', $$一人が質問して、もう一人が答えるというふうに練習してください。$$, $$ひとりがしつもんして、もうひとりがこたえるというふうにれんしゅうしてください。$$, $$Pratiquem assim: um pergunta e o outro responde.$$),
    ('n2-grammar-167', $$最初に予約して、次に支払うというふうに手続きを進めます。$$, $$さいしょによやくして、つぎにしはらうというふうにてつづきをすすめます。$$, $$O procedimento segue assim: primeiro reserva e depois paga.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$一人ずつ順番に話す____、会議を進めよう。$$, $$Vamos conduzir a reunião assim: cada um fala na sua vez.$$),
        (2, $$春は桜、秋は紅葉____、季節ごとに楽しめる。$$, $$Na primavera as cerejeiras, no outono as folhas vermelhas, desta forma dá para aproveitar cada estação.$$),
        (3, $$先生は明日休む____言っていた。$$, $$O professor disse que amanhã vai faltar.$$),
        (4, $$左手でこれを押さえて、右手で切る____してください。$$, $$Faça assim: segure isto com a mão esquerda e corte com a direita.$$),
        (5, $$毎日少しずつ貯金する____、目標を立てた。$$, $$Estabeleci uma meta desta forma: economizar um pouco todo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-167', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というふうに$$),
        (1, $$というように$$),
        (2, $$というふうに$$),
        (2, $$というように$$),
        (3, $$というふうに$$),
        (3, $$というように$$),
        (4, $$というふうに$$),
        (4, $$というように$$),
        (5, $$というふうに$$),
        (5, $$というように$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-168 — 〜ということは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-168',
    'grammar',
    'N2',
    $$〜ということは$$,
    $$to iu koto wa$$,
    $$Isso significa que / Então quer dizer que / Ou seja$$,
    $$ということは serve para tirar uma conclusão a partir de uma informação. Equivale a "isso significa que" ou "então quer dizer que".

A pessoa recebe uma informação e interpreta o que ela implica. Por exemplo, "a luz está apagada. Isso significa que ele não está em casa".

Também é usado para explicar o sentido de algo, como "estudar significa...".$$,
    $$A conclusão muitas vezes termina com ということだ, だろう ou わけだ.

Na fala, aparece como ってことは.$$,
    $$Frase + ということは、 + Conclusão
Substantivo / Frase + ということは + Explicação$$,
    $$ということは$$,
    $$ということは|ってことは$$,
    ARRAY['と', 'いう', 'こと', 'は']::text[],
    ARRAY['ということは', 'ってことは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-168', $$電気が消えている。ということは、彼は留守だ。$$, $$でんきがきえている。ということは、かれはるすだ。$$, $$A luz está apagada. Isso significa que ele não está em casa.$$),
    ('n2-grammar-168', $$「明日は祝日です。」「ということは、会社は休みですね。」$$, $$「あしたはしゅくじつです。」「ということは、かいしゃはやすみですね。」$$, $$Amanhã é feriado. Então quer dizer que a empresa estará fechada, né?$$),
    ('n2-grammar-168', $$返事がないということは、まだ決まっていないのだろう。$$, $$へんじがないということは、まだきまっていないのだろう。$$, $$Não ter resposta significa que ainda não foi decidido.$$),
    ('n2-grammar-168', $$「チケットが売り切れた。」「ってことは、行けないの？」$$, $$「チケットがうりきれた。」「ってことは、いけないの？」$$, $$Os ingressos esgotaram. Então quer dizer que não vamos poder ir?$$),
    ('n2-grammar-168', $$働くということは、責任を持つことだ。$$, $$はたらくということは、せきにんをもつことだ。$$, $$Trabalhar significa ter responsabilidade.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が笑っている。____、試験はうまくいったのだろう。$$, $$Ela está sorrindo. Isso significa que a prova deve ter ido bem.$$),
        (2, $$「店が閉まっている。」「____、今日は定休日だね。」$$, $$A loja está fechada. Então quer dizer que hoje é dia de folga, né?$$),
        (3, $$連絡がない____、元気だということだ。$$, $$Não ter notícias significa que está tudo bem.$$),
        (4, $$「彼は来月転勤するそうだ。」「____、もう会えないね。」$$, $$Dizem que ele vai ser transferido no mês que vem. Então quer dizer que não vamos mais nos ver, né?$$),
        (5, $$親になる____、子供の人生に責任を持つことだ。$$, $$Ser pai significa ter responsabilidade pela vida do filho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-168', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ということは$$),
        (1, $$ってことは$$),
        (2, $$ということは$$),
        (2, $$ってことは$$),
        (3, $$ということは$$),
        (4, $$ということは$$),
        (4, $$ってことは$$),
        (5, $$ということは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-169 — 〜というものだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-169',
    'grammar',
    'N2',
    $$〜というものだ$$,
    $$to iu mono da$$,
    $$Isso é que é / É assim que é / É isso que se chama$$,
    $$というものだ serve para dar uma opinião forte, apresentando algo como uma verdade geral ou como a definição de algo. Equivale a "isso é que é" ou "é assim que é".

A pessoa julga uma situação com base no bom senso. Por exemplo, "ajudar quem está em dificuldade, isso é que é amizade" ou "pedir isso a ele é um abuso".

É uma expressão de opinião, muitas vezes com tom de crítica ou de conclusão.$$,
    $$Na fala, aparece como ってもんだ.

Expressões comuns são それが人生というものだ e 無理というものだ.$$,
    $$Frase + というものだ
Substantivo + というものだ$$,
    $$というものだ$$,
    $$というものだ|というものです|ってもんだ|というもんだ$$,
    ARRAY['と', 'いう', 'もの', 'だ']::text[],
    ARRAY['というものだ', 'というものです', 'ってもんだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-169', $$困っている人を助けるのが、友達というものだ。$$, $$こまっているひとをたすけるのが、ともだちというものだ。$$, $$Ajudar quem está em dificuldade, isso é que é ser amigo.$$),
    ('n2-grammar-169', $$一日で全部覚えるのは無理というものだ。$$, $$いちにちでぜんぶおぼえるのはむりというものだ。$$, $$Decorar tudo em um dia é simplesmente impossível.$$),
    ('n2-grammar-169', $$思い通りにいかないのが、人生というものだ。$$, $$おもいどおりにいかないのが、じんせいというものだ。$$, $$As coisas não saírem como queremos, assim é a vida.$$),
    ('n2-grammar-169', $$約束を守らないのは、わがままというものだ。$$, $$やくそくをまもらないのは、わがままというものだ。$$, $$Não cumprir promessas é o que se chama de egoísmo.$$),
    ('n2-grammar-169', $$苦労してこそ、喜びも大きいというものです。$$, $$くろうしてこそ、よろこびもおおきいというものです。$$, $$É justamente com sofrimento que a alegria é maior, assim que é.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供に全部やらせるのは、かわいそう____。$$, $$Fazer a criança fazer tudo sozinha é uma crueldade.$$),
        (2, $$失敗から学ぶのが、成長____。$$, $$Aprender com os erros, isso é que é crescer.$$),
        (3, $$この値段でこの品質を求めるのは、ぜいたく____。$$, $$Querer esta qualidade por este preço é pedir demais.$$),
        (4, $$家族のために働くのが、親____。$$, $$Trabalhar pela família, isso é que é ser pai.$$),
        (5, $$人の物を勝手に使うのは、失礼____。$$, $$Usar as coisas dos outros sem permissão é falta de educação.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-169', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というものだ$$),
        (1, $$というものです$$),
        (2, $$というものだ$$),
        (2, $$というものです$$),
        (3, $$というものだ$$),
        (3, $$というものです$$),
        (4, $$というものだ$$),
        (4, $$というものです$$),
        (5, $$というものだ$$),
        (5, $$というものです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-170 — 〜というものではない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-170',
    'grammar',
    'N2',
    $$〜というものではない$$,
    $$to iu mono dewa nai$$,
    $$Não é bem assim que / Não é verdade que sempre / Não basta$$,
    $$というものではない serve para negar uma ideia geral ou uma crença comum. Equivale a "não é bem assim que..." ou "não é verdade que sempre...".

A pessoa mostra que a ideia não está totalmente errada, mas que não vale para todos os casos. Por exemplo, "não é verdade que, quanto mais caro, melhor".

Muitas vezes vem com ば〜ほど ou com ばいい.$$,
    $$É parecido com わけではない, mas というものではない é usado para negar uma regra geral.

Na fala, aparece como ってもんじゃない.$$,
    $$Frase + というものではない
Verbo (forma ば) + いい + というものではない$$,
    $$というものではない$$,
    $$というものではない|というものでもない|というものではありません|というものじゃない|ってもんじゃない$$,
    ARRAY['と', 'いう', 'もの', 'では', 'ない']::text[],
    ARRAY['というものではない', 'というものでもない', 'というものじゃない', 'ってもんじゃない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-170', $$高ければいいというものではない。$$, $$たかければいいというものではない。$$, $$Não é verdade que, quanto mais caro, melhor.$$),
    ('n2-grammar-170', $$勉強は長い時間すればいいというものではない。$$, $$べんきょうはながいじかんすればいいというものではない。$$, $$Não basta estudar por muitas horas.$$),
    ('n2-grammar-170', $$お金があれば幸せというものでもない。$$, $$おかねがあればしあわせというものでもない。$$, $$Não é bem assim que ter dinheiro traz felicidade.$$),
    ('n2-grammar-170', $$練習すればすぐに上手になるというものじゃない。$$, $$れんしゅうすればすぐにじょうずになるというものじゃない。$$, $$Não é verdade que, praticando, se melhora logo.$$),
    ('n2-grammar-170', $$謝ればいいというものではありません。$$, $$あやまればいいというものではありません。$$, $$Não basta pedir desculpas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$人数が多ければいい____。$$, $$Não é verdade que, quanto mais gente, melhor.$$),
        (2, $$薬はたくさん飲めば早く治る____。$$, $$Não é verdade que tomar muito remédio faz sarar mais rápido.$$),
        (3, $$有名な大学を出れば成功する____。$$, $$Não é bem assim que se formar numa universidade famosa garante sucesso.$$),
        (4, $$仕事は早ければいい____。$$, $$No trabalho, não basta ser rápido.$$),
        (5, $$言葉は覚えれば話せる____。$$, $$Não é verdade que basta decorar palavras para falar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-170', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$というものではない$$),
        (1, $$というものでもない$$),
        (1, $$というものではありません$$),
        (2, $$というものではない$$),
        (2, $$というものでもない$$),
        (2, $$というものではありません$$),
        (3, $$というものではない$$),
        (3, $$というものでもない$$),
        (3, $$というものではありません$$),
        (4, $$というものではない$$),
        (4, $$というものでもない$$),
        (4, $$というものではありません$$),
        (5, $$というものではない$$),
        (5, $$というものでもない$$),
        (5, $$というものではありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-171 — 〜と考えられる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-171',
    'grammar',
    'N2',
    $$〜と考えられる$$,
    $$to kangaerareru$$,
    $$Acredita-se que / Pode-se considerar que / É provável que$$,
    $$と考えられる expressa uma opinião ou conclusão de forma objetiva, como se fosse uma avaliação geral e não só pessoal. Equivale a "acredita-se que" ou "pode-se considerar que".

É muito usado em textos acadêmicos, relatórios, notícias e análises. Por exemplo, "acredita-se que a causa do acidente foi descuido".

A forma passiva de 考える dá um tom mais neutro e menos pessoal.$$,
    $$É parecido com と思われる, que também é usado em textos formais.

と考えられる dá a ideia de uma conclusão baseada em lógica ou dados.$$,
    $$Frase (forma simples) + と考えられる
Substantivo / Adjetivo な + だ + と考えられる$$,
    $$と考えられる$$,
    $$と考えられる|と考えられます|と考えられて|とかんがえられる$$,
    ARRAY['と', '考えられる']::text[],
    ARRAY['と考えられる', 'と考えられます', 'と考えられている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-171', $$事故の原因は不注意だと考えられる。$$, $$じこのげんいんはふちゅういだとかんがえられる。$$, $$Acredita-se que a causa do acidente foi descuido.$$),
    ('n2-grammar-171', $$この遺跡は千年前のものと考えられている。$$, $$このいせきはせんねんまえのものとかんがえられている。$$, $$Acredita-se que estas ruínas são de mil anos atrás.$$),
    ('n2-grammar-171', $$今後、高齢者はさらに増えると考えられます。$$, $$こんご、こうれいしゃはさらにふえるとかんがえられます。$$, $$É provável que o número de idosos aumente ainda mais no futuro.$$),
    ('n2-grammar-171', $$この結果から、薬の効果があると考えられる。$$, $$このけっかから、くすりのこうかがあるとかんがえられる。$$, $$A partir deste resultado, pode-se considerar que o remédio faz efeito.$$),
    ('n2-grammar-171', $$犯人はまだ近くにいると考えられる。$$, $$はんにんはまだちかくにいるとかんがえられる。$$, $$Acredita-se que o culpado ainda está por perto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$景気はゆっくり回復する____。$$, $$É provável que a economia se recupere aos poucos.$$),
        (2, $$この病気の原因はストレスだ____。$$, $$Acredita-se que a causa desta doença é o estresse.$$),
        (3, $$火事は電気の故障によるもの____。$$, $$Acredita-se que o incêndio foi causado por uma falha elétrica.$$),
        (4, $$この絵は有名な画家が描いた____。$$, $$Pode-se considerar que este quadro foi pintado por um pintor famoso.$$),
        (5, $$人口は今後減っていく____。$$, $$É provável que a população diminua daqui em diante.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-171', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$と考えられる$$),
        (1, $$と考えられます$$),
        (2, $$と考えられる$$),
        (2, $$と考えられます$$),
        (3, $$と考えられる$$),
        (3, $$と考えられます$$),
        (4, $$と考えられる$$),
        (4, $$と考えられます$$),
        (5, $$と考えられる$$),
        (5, $$と考えられます$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-172 — 〜とか（で）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-172',
    'grammar',
    'N2',
    $$〜とか（で）$$,
    $$toka (de)$$,
    $$Ouvi dizer que / Parece que / Disseram que$$,
    $$とか, no fim de uma frase, indica que a informação foi ouvida de alguém, mas sem total certeza. Equivale a "ouvi dizer que" ou "parece que".

É uma forma mais vaga e suave de transmitir uma informação, parecida com そうだ. Por exemplo, "ouvi dizer que ele vai se casar".

Na forma とかで, explica um motivo que a pessoa ouviu, como "disseram que estava doente, por isso faltou".$$,
    $$É mais vago e coloquial que そうだ.

Às vezes vem junto com 何でも ou 確か, como 何でも〜とか.$$,
    $$Frase (forma simples) + とか
Frase (forma simples) + とかで、 + Resultado$$,
    $$とか$$,
    $$とかで|とか$$,
    ARRAY['とか']::text[],
    ARRAY['とか', 'とかで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-172', $$彼は来月結婚するとか。$$, $$かれはらいげつけっこんするとか。$$, $$Ouvi dizer que ele vai se casar no mês que vem.$$),
    ('n2-grammar-172', $$田中さんは風邪をひいたとかで、今日は休みです。$$, $$たなかさんはかぜをひいたとかで、きょうはやすみです。$$, $$Disseram que o Tanaka pegou resfriado, por isso faltou hoje.$$),
    ('n2-grammar-172', $$あの店は来週閉店するとか。$$, $$あのみせはらいしゅうへいてんするとか。$$, $$Parece que aquela loja vai fechar na semana que vem.$$),
    ('n2-grammar-172', $$電車が止まったとかで、彼は遅れてきた。$$, $$でんしゃがとまったとかで、かれはおくれてきた。$$, $$Ele chegou atrasado porque disseram que o trem parou.$$),
    ('n2-grammar-172', $$明日は雪が降るとか。$$, $$あしたはゆきがふるとか。$$, $$Ouvi dizer que vai nevar amanhã.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$駅前に新しいカフェができた____。$$, $$Ouvi dizer que abriu um café novo em frente à estação.$$),
        (2, $$用事がある____、彼女は先に帰った。$$, $$Disseram que tinha um compromisso, então ela foi embora antes.$$),
        (3, $$あの二人は付き合っている____。$$, $$Parece que aqueles dois estão namorando.$$),
        (4, $$家族が入院した____、彼は急いで帰国した。$$, $$Disseram que alguém da família foi internado, então ele voltou às pressas para o país.$$),
        (5, $$今年の夏は特に暑くなる____。$$, $$Ouvi dizer que este verão vai ser especialmente quente.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-172', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とか$$),
        (2, $$とかで$$),
        (3, $$とか$$),
        (4, $$とかで$$),
        (5, $$とか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-173 — とっくに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-173',
    'grammar',
    'N2',
    $$とっくに$$,
    $$tokku ni$$,
    $$Há muito tempo / Já faz tempo / Faz tempo que$$,
    $$とっくに indica que algo aconteceu muito antes do que se imagina. Equivale a "há muito tempo" ou "já faz tempo".

Muitas vezes mostra surpresa ou impaciência, porque a outra pessoa não sabia ou está atrasada. Por exemplo, "o trem já partiu faz tempo".

É uma expressão coloquial, comum na fala.$$,
    $$É mais coloquial e enfático que もう e すでに.

A forma とっくの昔に significa "há muitíssimo tempo".$$,
    $$とっくに + Verbo (forma た / ている)
とっくに + Verbo (forma ている)$$,
    $$とっくに$$,
    $$とっくに|とっくの$$,
    ARRAY['とっくに']::text[],
    ARRAY['とっくに', 'とっくの昔に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-173', $$電車はとっくに出発した。$$, $$でんしゃはとっくにしゅっぱつした。$$, $$O trem já partiu faz tempo.$$),
    ('n2-grammar-173', $$その仕事ならとっくに終わっているよ。$$, $$そのしごとならとっくにおわっているよ。$$, $$Esse trabalho já terminou faz tempo.$$),
    ('n2-grammar-173', $$彼女はとっくに家に帰りました。$$, $$かのじょはとっくにいえにかえりました。$$, $$Ela foi para casa há muito tempo.$$),
    ('n2-grammar-173', $$締め切りはとっくに過ぎている。$$, $$しめきりはとっくにすぎている。$$, $$O prazo já passou faz tempo.$$),
    ('n2-grammar-173', $$その話ならとっくの昔に知っていた。$$, $$そのはなしならとっくのむかしにしっていた。$$, $$Essa história eu já sabia há muitíssimo tempo.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$映画は____始まっているよ。$$, $$O filme já começou faz tempo.$$),
        (2, $$宿題なら____終わった。$$, $$A lição de casa eu terminei faz tempo.$$),
        (3, $$そのニュースは____みんな知っている。$$, $$Todo mundo já sabe dessa notícia faz tempo.$$),
        (4, $$彼は____会社を辞めていた。$$, $$Ele já tinha saído da empresa há muito tempo.$$),
        (5, $$お店は____閉まっている時間だ。$$, $$É um horário em que a loja já fechou faz tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-173', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とっくに$$),
        (2, $$とっくに$$),
        (3, $$とっくに$$),
        (4, $$とっくに$$),
        (5, $$とっくに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-174 — 〜ところだった
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-174',
    'grammar',
    'N2',
    $$〜ところだった$$,
    $$tokoro datta$$,
    $$Por pouco não / Quase / Estive a ponto de$$,
    $$ところだった indica que algo quase aconteceu, mas no fim não aconteceu. Equivale a "por pouco não" ou "quase".

Geralmente é usado para coisas ruins que a pessoa evitou por pouco, o que traz alívio. Por exemplo, "por pouco não perdi o trem".

Muitas vezes aparece junto com もう少しで, 危うく ou あやうく.$$,
    $$É comum usar もう少しで ou 危うく no começo da frase para reforçar.

Também pode aparecer em frases com ば ou たら, como "se você não tivesse avisado, eu teria esquecido".$$,
    $$Verbo (forma dicionário) + ところだった
Verbo (forma ない) + ところだった$$,
    $$ところだった$$,
    $$ところだった|ところでした$$,
    ARRAY['ところ', 'だった']::text[],
    ARRAY['ところだった', 'ところでした']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-174', $$もう少しで電車に乗り遅れるところだった。$$, $$もうすこしででんしゃにのりおくれるところだった。$$, $$Por pouco não perdi o trem.$$),
    ('n2-grammar-174', $$危うく車にひかれるところだった。$$, $$あやうくくるまにひかれるところだった。$$, $$Quase fui atropelado por um carro.$$),
    ('n2-grammar-174', $$あなたが言ってくれなかったら、忘れるところだった。$$, $$あなたがいってくれなかったら、わすれるところだった。$$, $$Se você não tivesse dito, eu teria esquecido.$$),
    ('n2-grammar-174', $$もう少しで大事な書類を捨てるところでした。$$, $$もうすこしでだいじなしょるいをすてるところでした。$$, $$Por pouco não joguei fora um documento importante.$$),
    ('n2-grammar-174', $$目覚ましがなかったら、遅刻するところだった。$$, $$めざましがなかったら、ちこくするところだった。$$, $$Sem o despertador, eu teria me atrasado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$危うく階段から落ちる____。$$, $$Quase caí da escada.$$),
        (2, $$もう少しで試験に間に合わない____。$$, $$Por pouco não cheguei a tempo da prova.$$),
        (3, $$注意されなかったら、間違える____。$$, $$Se não tivessem me avisado, eu teria errado.$$),
        (4, $$もう少しで財布をなくす____。$$, $$Por pouco não perdi a carteira.$$),
        (5, $$あと一秒遅かったら、ぶつかる____。$$, $$Se fosse um segundo mais tarde, teria batido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-174', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところだった$$),
        (1, $$ところでした$$),
        (2, $$ところだった$$),
        (2, $$ところでした$$),
        (3, $$ところだった$$),
        (3, $$ところでした$$),
        (4, $$ところだった$$),
        (4, $$ところでした$$),
        (5, $$ところだった$$),
        (5, $$ところでした$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-175 — 〜ところに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-175',
    'grammar',
    'N2',
    $$〜ところに$$,
    $$tokoro ni$$,
    $$Justo quando / Bem na hora em que / No momento em que$$,
    $$ところに indica que algo inesperado aconteceu bem no momento em que a pessoa estava fazendo algo ou estava em determinada situação. Equivale a "justo quando" ou "bem na hora em que".

O acontecimento pode ser bom ou ruim, mas costuma interromper ou afetar a situação. Por exemplo, "justo quando eu ia sair, um amigo chegou".

As formas ところへ e ところを são parecidas.$$,
    $$ところへ é quase igual a ところに.

ところを é usado em expressões educadas, como お忙しいところを, e quando alguém é pego fazendo algo.$$,
    $$Verbo (forma dicionário / ている / た) + ところに
Adjetivo い + ところに
Substantivo + の + ところに$$,
    $$ところに$$,
    $$ところに|ところへ$$,
    ARRAY['ところ', 'に']::text[],
    ARRAY['ところに', 'ところへ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-175', $$出かけようとしているところに、友達が来た。$$, $$でかけようとしているところに、ともだちがきた。$$, $$Justo quando eu ia sair, um amigo chegou.$$),
    ('n2-grammar-175', $$お風呂に入っているところに、電話がかかってきた。$$, $$おふろにはいっているところに、でんわがかかってきた。$$, $$Bem na hora em que eu estava no banho, o telefone tocou.$$),
    ('n2-grammar-175', $$困っているところに、彼が助けに来てくれた。$$, $$こまっているところに、かれがたすけにきてくれた。$$, $$Justo quando eu estava em apuros, ele veio me ajudar.$$),
    ('n2-grammar-175', $$ちょうど話していたところへ、本人が現れた。$$, $$ちょうどはなしていたところへ、ほんにんがあらわれた。$$, $$Bem na hora em que falávamos dele, a própria pessoa apareceu.$$),
    ('n2-grammar-175', $$寝ようとしたところに、地震が起きた。$$, $$ねようとしたところに、じしんがおきた。$$, $$Justo quando eu ia dormir, houve um terremoto.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$食事をしている____、お客さんが来た。$$, $$Bem na hora em que estávamos comendo, chegou uma visita.$$),
        (2, $$帰ろうとした____、部長に呼ばれた。$$, $$Justo quando eu ia embora, o gerente me chamou.$$),
        (3, $$お腹がすいている____、母がケーキを持ってきた。$$, $$Justo quando eu estava com fome, minha mãe trouxe um bolo.$$),
        (4, $$家を出た____、雨が降ってきた。$$, $$No momento em que saí de casa, começou a chover.$$),
        (5, $$悩んでいる____、先生がアドバイスをくれた。$$, $$Justo quando eu estava indeciso, o professor me deu um conselho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-175', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところに$$),
        (1, $$ところへ$$),
        (2, $$ところに$$),
        (2, $$ところへ$$),
        (3, $$ところに$$),
        (3, $$ところへ$$),
        (4, $$ところに$$),
        (4, $$ところへ$$),
        (5, $$ところに$$),
        (5, $$ところへ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-176 — 〜ところを見ると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-176',
    'grammar',
    'N2',
    $$〜ところを見ると$$,
    $$tokoro wo miru to$$,
    $$A julgar por / Pelo visto / Já que$$,
    $$ところを見ると indica que a pessoa faz uma suposição com base em algo que observou. Equivale a "a julgar por" ou "pelo visto".

A primeira parte é o fato observado, e a segunda é a conclusão provável. A frase costuma terminar com らしい, ようだ, だろう ou に違いない. Por exemplo, "a julgar pelo sorriso dela, deve ter passado na prova".

É uma expressão de dedução baseada em evidências.$$,
    $$É parecido com からすると e ことから, mas ところを見ると se baseia em algo visto diretamente.

A forma ところを見れば tem o mesmo sentido.$$,
    $$Verbo (forma simples) + ところを見ると + Suposição
Adjetivo い + ところを見ると + Suposição
Adjetivo な + な + ところを見ると + Suposição$$,
    $$ところを見ると$$,
    $$ところを見ると|ところをみると|ところを見れば$$,
    ARRAY['ところ', 'を', '見る', 'と']::text[],
    ARRAY['ところを見ると', 'ところをみると', 'ところを見れば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-176', $$彼女が笑っているところを見ると、試験に合格したらしい。$$, $$かのじょがわらっているところをみると、しけんにごうかくしたらしい。$$, $$A julgar pelo sorriso dela, parece que passou na prova.$$),
    ('n2-grammar-176', $$電気がついていないところを見ると、誰もいないようだ。$$, $$でんきがついていないところをみると、だれもいないようだ。$$, $$Pelo visto, como a luz está apagada, não tem ninguém.$$),
    ('n2-grammar-176', $$毎日来るところを見ると、この店が気に入ったのだろう。$$, $$まいにちくるところをみると、このみせがきにいったのだろう。$$, $$Já que vem todo dia, deve ter gostado desta loja.$$),
    ('n2-grammar-176', $$何も言わないところを見ると、怒っているに違いない。$$, $$なにもいわないところをみると、おこっているにちがいない。$$, $$A julgar pelo silêncio, com certeza está bravo.$$),
    ('n2-grammar-176', $$道がぬれているところを見ると、雨が降ったようだ。$$, $$みちがぬれているところをみると、あめがふったようだ。$$, $$A julgar pela rua molhada, parece que choveu.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たくさん食べている____、おいしいのだろう。$$, $$Já que está comendo bastante, deve estar gostoso.$$),
        (2, $$彼が急いでいる____、約束があるらしい。$$, $$A julgar pela pressa dele, parece que tem um compromisso.$$),
        (3, $$行列ができている____、人気の店なのだろう。$$, $$A julgar pela fila, deve ser uma loja popular.$$),
        (4, $$返事が来ない____、忙しいようだ。$$, $$Pelo visto, como a resposta não chega, deve estar ocupado.$$),
        (5, $$彼女が元気な____、病気は治ったらしい。$$, $$A julgar pela disposição dela, parece que a doença sarou.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-176', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ところを見ると$$),
        (1, $$ところをみると$$),
        (2, $$ところを見ると$$),
        (2, $$ところをみると$$),
        (3, $$ところを見ると$$),
        (3, $$ところをみると$$),
        (4, $$ところを見ると$$),
        (4, $$ところをみると$$),
        (5, $$ところを見ると$$),
        (5, $$ところをみると$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-177 — 〜とも
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-177',
    'grammar',
    'N2',
    $$〜とも$$,
    $$tomo$$,
    $$Por mais que / Mesmo que / No mínimo$$,
    $$とも tem alguns usos importantes.

O primeiro, depois da forma volitiva ou de くとも, significa "mesmo que" ou "por mais que". É uma forma escrita e formal. Por exemplo, "por mais que seja difícil, não vou desistir".

O segundo vem com adjetivos de quantidade, como 遅くとも ou 少なくとも, e significa "no mínimo" ou "no máximo". Por exemplo, "no máximo até amanhã".

Também aparece no fim de frase, como もちろんですとも, para concordar com força, com o sentido de "claro que sim".$$,
    $$Expressões comuns são 遅くとも, 少なくとも, 多くとも e 何があろうとも.

O uso no fim da frase é um pouco antiquado, mas ainda aparece na fala.$$,
    $$Verbo (forma volitiva) + とも
Adjetivo い (sem い) + くとも
Adjetivo de quantidade (sem い) + くとも
Frase + とも (concordância forte)$$,
    $$とも$$,
    $$とも$$,
    ARRAY['とも']::text[],
    ARRAY['とも', 'くとも', 'うとも', 'ようとも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-177', $$どんなに辛くとも、最後まで頑張る。$$, $$どんなにつらくとも、さいごまでがんばる。$$, $$Por mais difícil que seja, vou me esforçar até o fim.$$),
    ('n2-grammar-177', $$遅くとも明日までに返事をください。$$, $$おそくともあしたまでにへんじをください。$$, $$Responda no máximo até amanhã.$$),
    ('n2-grammar-177', $$何があろうとも、あなたの味方だ。$$, $$なにがあろうとも、あなたのみかただ。$$, $$Aconteça o que acontecer, estou do seu lado.$$),
    ('n2-grammar-177', $$「手伝ってくれる？」「いいとも。」$$, $$「てつだってくれる？」「いいとも。」$$, $$Pode me ajudar? Claro que sim.$$),
    ('n2-grammar-177', $$誰が反対しようとも、私は行く。$$, $$だれがはんたいしようとも、わたしはいく。$$, $$Mesmo que alguém se oponha, eu vou.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$遅く____、九時には着きたい。$$, $$No máximo, quero chegar às nove.$$),
        (2, $$どんなに苦しく____、あきらめない。$$, $$Por mais doloroso que seja, não vou desistir.$$),
        (3, $$何を言われよう____、気にしない。$$, $$Digam o que disserem, não me importo.$$),
        (4, $$少なく____、三日はかかるだろう。$$, $$Vai levar no mínimo três dias.$$),
        (5, $$「一緒に行ってもいい？」「もちろんです____。」$$, $$Posso ir junto? Claro que sim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-177', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$とも$$),
        (2, $$とも$$),
        (3, $$とも$$),
        (4, $$とも$$),
        (5, $$とも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-178 — 〜としても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-178',
    'grammar',
    'N2',
    $$〜としても$$,
    $$to shite mo$$,
    $$Mesmo que / Ainda que / Mesmo se$$,
    $$としても indica uma suposição, e mostra que, mesmo que ela seja verdade, o resultado não muda. Equivale a "mesmo que" ou "ainda que".

A situação pode ser real ou apenas imaginada. Por exemplo, "mesmo que eu ganhe na loteria, vou continuar trabalhando".

Muitas vezes vem junto com たとえ ou 仮に no começo da frase.$$,
    $$É parecido com ても, mas としても destaca mais que a situação é uma suposição.

A forma にしても tem um sentido próximo.

Não se confunde com として, que significa "como" ou "na qualidade de".$$,
    $$Verbo (forma simples) + としても
Adjetivo い + としても
Adjetivo な / Substantivo + だ + としても$$,
    $$としても$$,
    $$としても$$,
    ARRAY['と', 'しても']::text[],
    ARRAY['としても', 'たとえ〜としても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-178', $$たとえ宝くじが当たったとしても、仕事は続ける。$$, $$たとえたからくじがあたったとしても、しごとはつづける。$$, $$Mesmo que eu ganhe na loteria, vou continuar trabalhando.$$),
    ('n2-grammar-178', $$今から急いだとしても、間に合わないだろう。$$, $$いまからいそいだとしても、まにあわないだろう。$$, $$Mesmo que corra agora, provavelmente não vai dar tempo.$$),
    ('n2-grammar-178', $$冗談だとしても、言っていいことではない。$$, $$じょうだんだとしても、いっていいことではない。$$, $$Mesmo que seja brincadeira, não é algo que se possa dizer.$$),
    ('n2-grammar-178', $$高いとしても、この品質なら買う価値がある。$$, $$たかいとしても、このひんしつならかうかちがある。$$, $$Mesmo sendo caro, com esta qualidade vale a pena comprar.$$),
    ('n2-grammar-178', $$仮に彼が来なかったとしても、計画は進める。$$, $$かりにかれがこなかったとしても、けいかくはすすめる。$$, $$Mesmo que ele não venha, vamos seguir com o plano.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$たとえ反対された____、私の気持ちは変わらない。$$, $$Mesmo que sejam contra, meu sentimento não vai mudar.$$),
        (2, $$雨が降った____、試合は行われる。$$, $$Mesmo que chova, a partida será realizada.$$),
        (3, $$本当だ____、信じられない。$$, $$Mesmo que seja verdade, não consigo acreditar.$$),
        (4, $$今から勉強した____、合格は難しい。$$, $$Mesmo que estude a partir de agora, será difícil passar.$$),
        (5, $$失敗した____、後悔はしない。$$, $$Mesmo que eu falhe, não vou me arrepender.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-178', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$としても$$),
        (2, $$としても$$),
        (3, $$としても$$),
        (4, $$としても$$),
        (5, $$としても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-179 — 〜つつ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-179',
    'grammar',
    'N2',
    $$〜つつ$$,
    $$tsutsu$$,
    $$Enquanto / Embora / Mesmo$$,
    $$つつ tem dois usos principais.

O primeiro indica que duas ações acontecem ao mesmo tempo. Equivale a "enquanto". É uma forma mais formal de ながら. Por exemplo, "pensando no futuro, escolhi o trabalho".

O segundo, muitas vezes como つつも, indica contraste. Equivale a "embora" ou "mesmo". A pessoa sabe ou sente algo, mas faz o contrário. Por exemplo, "embora saiba que faz mal, continuo fumando".$$,
    $$No primeiro uso, o sujeito das duas ações é o mesmo.

No segundo uso, expressões comuns são 悪いと知りつつ, 思いつつ e 言いつつ.

É mais formal que ながら e aparece mais na escrita.$$,
    $$Verbo (forma ます sem ます) + つつ
Verbo (forma ます sem ます) + つつも$$,
    $$つつ$$,
    $$つつ$$,
    ARRAY['つつ']::text[],
    ARRAY['つつ', 'つつも']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-179', $$体に悪いと知りつつ、たばこをやめられない。$$, $$からだにわるいとしりつつ、たばこをやめられない。$$, $$Embora saiba que faz mal, não consigo parar de fumar.$$),
    ('n2-grammar-179', $$将来のことを考えつつ、仕事を選んだ。$$, $$しょうらいのことをかんがえつつ、しごとをえらんだ。$$, $$Escolhi o trabalho pensando no futuro.$$),
    ('n2-grammar-179', $$早く寝ようと思いつつも、つい夜更かししてしまう。$$, $$はやくねようとおもいつつも、ついよふかししてしまう。$$, $$Embora pense em dormir cedo, acabo ficando acordado até tarde.$$),
    ('n2-grammar-179', $$景色を楽しみつつ、山道を歩いた。$$, $$けしきをたのしみつつ、やまみちをあるいた。$$, $$Caminhei pela trilha enquanto apreciava a paisagem.$$),
    ('n2-grammar-179', $$悪いと思いつつ、彼の手紙を読んでしまった。$$, $$わるいとおもいつつ、かれのてがみをよんでしまった。$$, $$Mesmo achando errado, acabei lendo a carta dele.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$いけないと知り____、うそをついてしまった。$$, $$Mesmo sabendo que não devia, acabei mentindo.$$),
        (2, $$音楽を聞き____、勉強する。$$, $$Estudo enquanto ouço música.$$),
        (3, $$やせたいと思い____、ケーキを食べてしまう。$$, $$Embora queira emagrecer, acabo comendo bolo.$$),
        (4, $$みんなの意見を聞き____、計画を進める。$$, $$Vamos avançar com o plano ouvindo a opinião de todos.$$),
        (5, $$返事をしなければと思い____、まだ書いていない。$$, $$Embora pense que preciso responder, ainda não escrevi.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-179', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つつ$$),
        (1, $$つつも$$),
        (2, $$つつ$$),
        (3, $$つつ$$),
        (3, $$つつも$$),
        (4, $$つつ$$),
        (5, $$つつ$$),
        (5, $$つつも$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-180 — 〜つつある
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-180',
    'grammar',
    'N2',
    $$〜つつある$$,
    $$tsutsu aru$$,
    $$Estar em processo de / Vir + gerúndio / Pouco a pouco$$,
    $$つつある indica que uma mudança está acontecendo agora, aos poucos, em uma direção. Equivale a "estar em processo de" ou "vir + gerúndio", como "vem diminuindo".

É usado com verbos de mudança, como aumentar, diminuir, mudar, melhorar e desaparecer. Por exemplo, "a população vem diminuindo".

É uma expressão formal, comum em notícias e textos.$$,
    $$É parecido com ている, mas つつある destaca que a mudança ainda está em andamento.

Não se usa com verbos que não indicam mudança, como 読む ou 食べる.$$,
    $$Verbo (forma ます sem ます) + つつある$$,
    $$つつある$$,
    $$つつある|つつあります|つつあった$$,
    ARRAY['つつ', 'ある']::text[],
    ARRAY['つつある', 'つつあります', 'つつあった']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-180', $$日本の人口は減りつつある。$$, $$にほんのじんこうはへりつつある。$$, $$A população do Japão vem diminuindo.$$),
    ('n2-grammar-180', $$景気は回復しつつあります。$$, $$けいきはかいふくしつつあります。$$, $$A economia está em processo de recuperação.$$),
    ('n2-grammar-180', $$地球の気温は上がりつつある。$$, $$ちきゅうのきおんはあがりつつある。$$, $$A temperatura da Terra vem subindo.$$),
    ('n2-grammar-180', $$古い習慣が消えつつある。$$, $$ふるいしゅうかんがきえつつある。$$, $$Os costumes antigos estão desaparecendo pouco a pouco.$$),
    ('n2-grammar-180', $$彼の病気はよくなりつつある。$$, $$かれのびょうきはよくなりつつある。$$, $$A doença dele vem melhorando.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$この町は大きく変わり____。$$, $$Esta cidade vem mudando muito.$$),
        (2, $$外国人観光客が増え____。$$, $$O número de turistas estrangeiros vem aumentando.$$),
        (3, $$森林が失われ____。$$, $$As florestas estão sendo perdidas pouco a pouco.$$),
        (4, $$台風が近づき____。$$, $$O tufão está se aproximando.$$),
        (5, $$新しい技術が広まり____。$$, $$A nova tecnologia vem se espalhando.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-180', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$つつある$$),
        (1, $$つつあります$$),
        (2, $$つつある$$),
        (2, $$つつあります$$),
        (3, $$つつある$$),
        (3, $$つつあります$$),
        (4, $$つつある$$),
        (4, $$つつあります$$),
        (5, $$つつある$$),
        (5, $$つつあります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-181 — 〜上は
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-181',
    'grammar',
    'N2',
    $$〜上は$$,
    $$ue wa$$,
    $$Já que / Uma vez que / Visto que$$,
    $$上は indica que, já que uma decisão foi tomada ou uma situação existe, é preciso agir de acordo com ela até o fim. Equivale a "já que" ou "uma vez que".

A segunda parte costuma expressar determinação, obrigação ou conselho, como なければならない, べきだ ou つもりだ. Por exemplo, "já que prometi, tenho que cumprir".

É uma expressão formal, parecida com 以上は e からには.$$,
    $$É mais formal que からには e aparece mais na escrita.

Também é escrito うえは.

A primeira parte costuma ser uma decisão ou um compromisso importante.$$,
    $$Verbo (forma dicionário / forma た) + 上は + Determinação / Obrigação$$,
    $$上は$$,
    $$上は|うえは$$,
    ARRAY['上', 'は']::text[],
    ARRAY['上は', 'うえは']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-181', $$約束した上は、必ず守らなければならない。$$, $$やくそくしたうえは、かならずまもらなければならない。$$, $$Já que prometi, tenho que cumprir sem falta.$$),
    ('n2-grammar-181', $$引き受けた上は、最後まで責任を持ちます。$$, $$ひきうけたうえは、さいごまでせきにんをもちます。$$, $$Uma vez que aceitei, vou assumir a responsabilidade até o fim.$$),
    ('n2-grammar-181', $$こうなった上は、やるしかない。$$, $$こうなったうえは、やるしかない。$$, $$Já que chegou a este ponto, só resta fazer.$$),
    ('n2-grammar-181', $$留学すると決めた上は、しっかり勉強するつもりだ。$$, $$りゅうがくするときめたうえは、しっかりべんきょうするつもりだ。$$, $$Já que decidi estudar no exterior, pretendo estudar com afinco.$$),
    ('n2-grammar-181', $$試合に出る上は、優勝を目指す。$$, $$しあいにでるうえは、ゆうしょうをめざす。$$, $$Já que vou participar da competição, vou buscar o título.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$社長になった____、会社を守らなければならない。$$, $$Já que me tornei presidente, tenho que proteger a empresa.$$),
        (2, $$ここまで来た____、あきらめるわけにはいかない。$$, $$Já que cheguei até aqui, não posso desistir.$$),
        (3, $$契約した____、条件に従うべきだ。$$, $$Uma vez que assinou o contrato, deve seguir as condições.$$),
        (4, $$やると言った____、最後までやる。$$, $$Já que disse que faria, vou fazer até o fim.$$),
        (5, $$真実を知った____、黙っているわけにはいかない。$$, $$Já que soube a verdade, não posso ficar calado.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-181', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$上は$$),
        (1, $$うえは$$),
        (2, $$上は$$),
        (2, $$うえは$$),
        (3, $$上は$$),
        (3, $$うえは$$),
        (4, $$上は$$),
        (4, $$うえは$$),
        (5, $$上は$$),
        (5, $$うえは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-182 — 〜はもとより
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-182',
    'grammar',
    'N2',
    $$〜はもとより$$,
    $$wa moto yori$$,
    $$Sem falar de / Não só... como também / É claro que$$,
    $$はもとより indica que algo é óbvio e, além disso, outra coisa também vale. Equivale a "sem falar de" ou "não só... como também".

A primeira parte é o caso mais natural ou evidente, e a segunda amplia a ideia. Por exemplo, "este restaurante é popular não só entre os moradores, como também entre os turistas". Depois, costuma vir も.

É uma expressão formal, parecida com はもちろん.$$,
    $$É mais formal que はもちろん.

Também é escrito は元より.$$,
    $$Substantivo + はもとより + Substantivo + も$$,
    $$はもとより$$,
    $$はもとより|は元より$$,
    ARRAY['は', 'もとより']::text[],
    ARRAY['はもとより', 'は元より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-182', $$この店は地元の人はもとより、観光客にも人気がある。$$, $$このみせはじもとのひとはもとより、かんこうきゃくにもにんきがある。$$, $$Esta loja é popular não só entre os moradores, como também entre os turistas.$$),
    ('n2-grammar-182', $$彼は英語はもとより、フランス語も話せる。$$, $$かれはえいごはもとより、フランスごもはなせる。$$, $$Ele fala inglês, é claro, e também francês.$$),
    ('n2-grammar-182', $$この問題は大人はもとより、子供でもわかる。$$, $$このもんだいはおとなはもとより、こどもでもわかる。$$, $$Este problema, sem falar dos adultos, até as crianças entendem.$$),
    ('n2-grammar-182', $$平日はもとより、休日も働いている。$$, $$へいじつはもとより、きゅうじつもはたらいている。$$, $$Trabalho não só nos dias úteis, como também nos feriados.$$),
    ('n2-grammar-182', $$味はもとより、見た目も美しい料理だ。$$, $$あじはもとより、みためもうつくしいりょうりだ。$$, $$É um prato bonito não só no sabor, mas também na aparência.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女は歌____、ダンスも上手だ。$$, $$Ela é boa não só no canto, como também na dança.$$),
        (2, $$この公園は春____、秋も美しい。$$, $$Este parque é bonito na primavera, é claro, e também no outono.$$),
        (3, $$日本国内____、海外でも有名な作家だ。$$, $$É um escritor famoso não só no Japão, como também no exterior.$$),
        (4, $$家族____、友人もみんな賛成してくれた。$$, $$Não só a família, mas também todos os amigos me apoiaram.$$),
        (5, $$この映画は子供____、大人も楽しめる。$$, $$Este filme diverte não só as crianças, como também os adultos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-182', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はもとより$$),
        (1, $$は元より$$),
        (2, $$はもとより$$),
        (2, $$は元より$$),
        (3, $$はもとより$$),
        (3, $$は元より$$),
        (4, $$はもとより$$),
        (4, $$は元より$$),
        (5, $$はもとより$$),
        (5, $$は元より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-183 — 〜はともかく
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-183',
    'grammar',
    'N2',
    $$〜はともかく$$,
    $$wa tomokaku$$,
    $$Deixando de lado / Independentemente de / Seja como for$$,
    $$はともかく indica que a pessoa deixa de lado um assunto, por enquanto, para falar de algo mais importante. Equivale a "deixando de lado" ou "independentemente de".

A primeira parte é algo que não importa tanto no momento, e a segunda é o ponto principal. Por exemplo, "o preço à parte, o design é ótimo".

A forma はともかくとして tem o mesmo sentido.$$,
    $$É parecido com はさておき e は別として.

Muitas vezes aparece com pares como 結果はともかく ou 見た目はともかく.$$,
    $$Substantivo + はともかく(として)、 + Frase principal
Frase + かどうか + はともかく$$,
    $$はともかく$$,
    $$はともかく$$,
    ARRAY['は', 'ともかく']::text[],
    ARRAY['はともかく', 'はともかくとして']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-183', $$値段はともかく、デザインがいい。$$, $$ねだんはともかく、デザインがいい。$$, $$Deixando o preço de lado, o design é ótimo.$$),
    ('n2-grammar-183', $$結果はともかく、よく頑張った。$$, $$けっかはともかく、よくがんばった。$$, $$Independentemente do resultado, você se esforçou muito.$$),
    ('n2-grammar-183', $$見た目はともかく、味はおいしい。$$, $$みためはともかく、あじはおいしい。$$, $$A aparência à parte, o sabor é gostoso.$$),
    ('n2-grammar-183', $$行くかどうかはともかくとして、話だけは聞いておこう。$$, $$いくかどうかはともかくとして、はなしだけはきいておこう。$$, $$Indo ou não, vamos pelo menos ouvir a proposta.$$),
    ('n2-grammar-183', $$冗談はともかく、本題に入りましょう。$$, $$じょうだんはともかく、ほんだいにはいりましょう。$$, $$Deixando as brincadeiras de lado, vamos ao assunto principal.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勝ち負け____、楽しい試合だった。$$, $$Independentemente de ganhar ou perder, foi uma partida divertida.$$),
        (2, $$他の人____、私は反対だ。$$, $$Os outros eu não sei, mas eu sou contra.$$),
        (3, $$昼____、夜は寒くなる。$$, $$De dia nem tanto, mas à noite esfria.$$),
        (4, $$費用____、まず計画を立てよう。$$, $$Deixando os custos de lado, vamos primeiro fazer um plano.$$),
        (5, $$できるかどうか____、やってみることが大切だ。$$, $$Conseguindo ou não, o importante é tentar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-183', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$はともかく$$),
        (1, $$はともかくとして$$),
        (2, $$はともかく$$),
        (2, $$はともかくとして$$),
        (3, $$はともかく$$),
        (3, $$はともかくとして$$),
        (4, $$はともかく$$),
        (4, $$はともかくとして$$),
        (5, $$はともかく$$),
        (5, $$はともかくとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-184 — わずかに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-184',
    'grammar',
    'N2',
    $$わずかに$$,
    $$wazuka ni$$,
    $$Levemente / Por pouco / Ligeiramente$$,
    $$わずかに indica uma quantidade, grau ou diferença muito pequena. Equivale a "levemente", "ligeiramente" ou "por pouco".

Por exemplo, "a temperatura subiu levemente" ou "perdeu por uma diferença mínima".

É uma palavra um pouco formal, comum em descrições e notícias. A forma わずか, sem に, também é usada antes de números, como "apenas três pessoas".$$,
    $$É parecido com 少し, mas わずか destaca que a quantidade é muito pequena.

A forma わずかな vem antes de substantivos, como わずかなお金.$$,
    $$わずかに + Verbo / Adjetivo
わずか + Número / Quantidade
わずかな + Substantivo$$,
    $$わずかに$$,
    $$わずかに|わずか|僅かに$$,
    ARRAY['わずか', 'に']::text[],
    ARRAY['わずかに', 'わずか', 'わずかな']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-184', $$気温がわずかに上がった。$$, $$きおんがわずかにあがった。$$, $$A temperatura subiu levemente.$$),
    ('n2-grammar-184', $$わずかに一点差で負けた。$$, $$わずかにいってんさでまけた。$$, $$Perdemos por uma diferença mínima de um ponto.$$),
    ('n2-grammar-184', $$窓からわずかに光が入ってくる。$$, $$まどからわずかにひかりがはいってくる。$$, $$Entra um pouquinho de luz pela janela.$$),
    ('n2-grammar-184', $$参加者はわずか三人だった。$$, $$さんかしゃはわずかさんにんだった。$$, $$Os participantes foram apenas três pessoas.$$),
    ('n2-grammar-184', $$わずかなお金しか残っていない。$$, $$わずかなおかねしかのこっていない。$$, $$Só sobrou um pouquinho de dinheiro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼の声が____震えていた。$$, $$A voz dele tremia levemente.$$),
        (2, $$売り上げは去年より____増えた。$$, $$As vendas aumentaram ligeiramente em relação ao ano passado.$$),
        (3, $$____な時間でも、勉強に使おう。$$, $$Vamos usar até o pouco tempo que temos para estudar.$$),
        (4, $$ゴールまで____届かなかった。$$, $$Faltou muito pouco para chegar ao gol.$$),
        (5, $$この町の人口は____千人だ。$$, $$A população desta cidade é de apenas mil pessoas.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-184', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$わずかに$$),
        (1, $$わずか$$),
        (2, $$わずかに$$),
        (2, $$わずか$$),
        (3, $$わずか$$),
        (4, $$わずかに$$),
        (4, $$わずか$$),
        (5, $$わずか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-185 — やがて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-185',
    'grammar',
    'N2',
    $$やがて$$,
    $$yagate$$,
    $$Em breve / Logo / Com o tempo$$,
    $$やがて indica que algo vai acontecer depois de algum tempo, de forma natural. Equivale a "em breve", "logo" ou "com o tempo".

Pode falar do futuro, como "em breve a primavera vai chegar", ou do passado, como "com o tempo, os dois se casaram".

É uma palavra um pouco formal, comum na escrita e em narrativas.$$,
    $$É parecido com そのうち e まもなく.

まもなく indica um tempo mais curto, e そのうち é mais coloquial.$$,
    $$やがて + Frase$$,
    $$やがて$$,
    $$やがて$$,
    ARRAY['やがて']::text[],
    ARRAY['やがて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-185', $$やがて春が来る。$$, $$やがてはるがくる。$$, $$Em breve a primavera vai chegar.$$),
    ('n2-grammar-185', $$雨はやがて雪に変わった。$$, $$あめはやがてゆきにかわった。$$, $$Com o tempo, a chuva virou neve.$$),
    ('n2-grammar-185', $$二人はやがて結婚した。$$, $$ふたりはやがてけっこんした。$$, $$Com o tempo, os dois se casaram.$$),
    ('n2-grammar-185', $$この悲しみもやがて消えるだろう。$$, $$このかなしみもやがてきえるだろう。$$, $$Esta tristeza também vai passar com o tempo.$$),
    ('n2-grammar-185', $$やがて日が暮れて、あたりは暗くなった。$$, $$やがてひがくれて、あたりはくらくなった。$$, $$Logo o sol se pôs e tudo ficou escuro.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちも____大人になる。$$, $$As crianças também vão crescer com o tempo.$$),
        (2, $$____電車が来るだろう。$$, $$O trem deve chegar logo.$$),
        (3, $$彼の努力は____実を結んだ。$$, $$Com o tempo, o esforço dele deu frutos.$$),
        (4, $$夏が終わり、____秋が来た。$$, $$O verão terminou e logo veio o outono.$$),
        (5, $$この町も____変わっていくだろう。$$, $$Esta cidade também deve mudar com o tempo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-185', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やがて$$),
        (2, $$やがて$$),
        (3, $$やがて$$),
        (4, $$やがて$$),
        (5, $$やがて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-186 — 〜やら〜やら
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-186',
    'grammar',
    'N2',
    $$〜やら〜やら$$,
    $$yara ~ yara$$,
    $$Entre... e / Não só... como também / Tanto... quanto$$,
    $$やら〜やら serve para listar alguns exemplos de uma situação, geralmente para mostrar que havia muitas coisas acontecendo ao mesmo tempo. Equivale a "entre... e..." ou "tanto... quanto...".

Muitas vezes transmite a ideia de confusão, cansaço ou sentimentos misturados. Por exemplo, "entre trabalho e tarefas de casa, estou muito ocupado" ou "fiquei entre feliz e envergonhado".$$,
    $$É parecido com 〜や〜など e 〜とか〜とか, mas やら〜やら destaca a sensação de muita coisa junta.

Uma expressão comum é うれしいやら恥ずかしいやら, "entre feliz e envergonhado".$$,
    $$Substantivo + やら + Substantivo + やら
Verbo / Adjetivo い (forma dicionário) + やら + Verbo / Adjetivo い + やら$$,
    $$やら〜やら$$,
    $$やら$$,
    ARRAY['やら']::text[],
    ARRAY['やら〜やら']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-186', $$仕事やら家事やらで、毎日忙しい。$$, $$しごとやらかじやらで、まいにちいそがしい。$$, $$Entre trabalho e tarefas de casa, estou ocupado todos os dias.$$),
    ('n2-grammar-186', $$褒められて、うれしいやら恥ずかしいやら。$$, $$ほめられて、うれしいやらはずかしいやら。$$, $$Me elogiaram e fiquei entre feliz e envergonhado.$$),
    ('n2-grammar-186', $$引っ越しで、掃除やら荷造りやら大変だった。$$, $$ひっこしで、そうじやらにづくりやらたいへんだった。$$, $$Com a mudança, entre limpar e empacotar, foi muito trabalhoso.$$),
    ('n2-grammar-186', $$雨は降るやら風は吹くやら、ひどい天気だった。$$, $$あめはふるやらかぜはふくやら、ひどいてんきだった。$$, $$Chovia e ventava, foi um tempo horrível.$$),
    ('n2-grammar-186', $$お菓子やらジュースやら、たくさん買ってきた。$$, $$おかしやらジュースやら、たくさんかってきた。$$, $$Comprei muita coisa, entre doces e sucos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$頭が痛いやら熱がある____で、大変だった。$$, $$Foi difícil, entre dor de cabeça e febre.$$),
        (2, $$試験やらレポート____で、寝る時間もない。$$, $$Entre provas e relatórios, não tenho nem tempo para dormir.$$),
        (3, $$驚く____喜ぶやら、みんな大騒ぎだった。$$, $$Entre surpresa e alegria, todos fizeram uma grande festa.$$),
        (4, $$服____靴やら、部屋が散らかっている。$$, $$O quarto está bagunçado, com roupas e sapatos por todo lado.$$),
        (5, $$悲しいやら悔しい____、涙が止まらなかった。$$, $$Entre triste e frustrado, as lágrimas não paravam.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-186', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$やら$$),
        (2, $$やら$$),
        (3, $$やら$$),
        (4, $$やら$$),
        (5, $$やら$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-187 — よほど / よっぽど
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-187',
    'grammar',
    'N2',
    $$よほど / よっぽど$$,
    $$yohodo / yoppodo$$,
    $$Muito / Bastante / Deve ser muito$$,
    $$よほど ou よっぽど tem alguns usos importantes.

O primeiro indica um grau muito alto, geralmente numa suposição baseada em algo observado. Equivale a "deve ser muito...". Por exemplo, "ele dormiu na hora, deve estar muito cansado". Muitas vezes vem com らしい ou のだろう.

O segundo, em comparações, significa "bem mais" ou "muito mais". Por exemplo, "é bem mais barato comprar pela internet".

よっぽど é a forma mais coloquial.$$,
    $$A forma よほどのことがない限り significa "a não ser que aconteça algo muito sério".

É parecido com かなり e ずっと, mas よほど costuma vir com suposição.$$,
    $$よほど / よっぽど + Adjetivo / Verbo + らしい / のだろう
Substantivo + より + よほど / よっぽど + Adjetivo
よほどの + Substantivo$$,
    $$よほど$$,
    $$よほど|よっぽど$$,
    ARRAY['よほど']::text[],
    ARRAY['よほど', 'よっぽど', 'よほどの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-187', $$すぐに寝てしまった。よほど疲れていたのだろう。$$, $$すぐにねてしまった。よほどつかれていたのだろう。$$, $$Dormiu na hora. Devia estar muito cansado.$$),
    ('n2-grammar-187', $$こんなに笑うなんて、よっぽど面白かったんだね。$$, $$こんなにわらうなんて、よっぽどおもしろかったんだね。$$, $$Rindo tanto assim, devia estar muito engraçado, né?$$),
    ('n2-grammar-187', $$ネットで買ったほうがよほど安い。$$, $$ネットでかったほうがよほどやすい。$$, $$É bem mais barato comprar pela internet.$$),
    ('n2-grammar-187', $$よほどのことがない限り、試合は中止にならない。$$, $$よほどのことがないかぎり、しあいはちゅうしにならない。$$, $$A não ser que aconteça algo muito sério, a partida não será cancelada.$$),
    ('n2-grammar-187', $$彼は一言も話さない。よほど緊張しているらしい。$$, $$かれはひとこともはなさない。よほどきんちょうしているらしい。$$, $$Ele não diz nenhuma palavra. Parece estar muito nervoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$彼女が泣くなんて、____悲しかったのだろう。$$, $$Ela chorando assim, devia estar muito triste.$$),
        (2, $$一人でするより、二人でしたほうが____早い。$$, $$É bem mais rápido fazer em dois do que sozinho.$$),
        (3, $$全部食べた。____お腹がすいていたらしい。$$, $$Comeu tudo. Parece que estava com muita fome.$$),
        (4, $$____の理由がなければ、休んではいけない。$$, $$Sem um motivo muito sério, não se pode faltar.$$),
        (5, $$こんなに早く来るなんて、____楽しみにしていたんだね。$$, $$Chegou tão cedo, devia estar muito ansioso por isso, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-187', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よほど$$),
        (1, $$よっぽど$$),
        (2, $$よほど$$),
        (2, $$よっぽど$$),
        (3, $$よほど$$),
        (3, $$よっぽど$$),
        (4, $$よほど$$),
        (4, $$よっぽど$$),
        (5, $$よほど$$),
        (5, $$よっぽど$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-188 — 〜より [2]
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-188',
    'grammar',
    'N2',
    $$〜より [2]$$,
    $$yori$$,
    $$A partir de / Desde / De$$,
    $$より também pode indicar o ponto de partida no tempo ou no espaço, com o mesmo sentido de から. Equivale a "a partir de", "desde" ou "de".

Esse uso é formal e aparece principalmente em avisos, anúncios, cartas e documentos. Por exemplo, "a reunião começa a partir das três" ou "uma carta do presidente".

Na fala do dia a dia, usa-se から.$$,
    $$Não se confunde com より de comparação, que significa "do que".

Expressões comuns são 本日より, 〜より始まる e 〜よりお知らせ.$$,
    $$Substantivo (tempo / lugar / pessoa) + より$$,
    $$より$$,
    $$より$$,
    ARRAY['より']::text[],
    ARRAY['より']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-188', $$会議は午後三時より始まります。$$, $$かいぎはごごさんじよりはじまります。$$, $$A reunião começa a partir das três da tarde.$$),
    ('n2-grammar-188', $$本日より営業時間が変わります。$$, $$ほんじつよりえいぎょうじかんがかわります。$$, $$A partir de hoje, o horário de funcionamento muda.$$),
    ('n2-grammar-188', $$社長よりご挨拶があります。$$, $$しゃちょうよりごあいさつがあります。$$, $$Haverá uma saudação do presidente.$$),
    ('n2-grammar-188', $$東京駅より新幹線で出発します。$$, $$とうきょうえきよりしんかんせんでしゅっぱつします。$$, $$Partiremos de trem-bala a partir da estação de Tóquio.$$),
    ('n2-grammar-188', $$お客様よりお電話がありました。$$, $$おきゃくさまよりおでんわがありました。$$, $$Houve uma ligação de um cliente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$来月一日____、料金が値上げされます。$$, $$A partir do dia primeiro do mês que vem, as tarifas vão aumentar.$$),
        (2, $$担当者____ご連絡いたします。$$, $$O responsável entrará em contato.$$),
        (3, $$式は十時____行われます。$$, $$A cerimônia será realizada a partir das dez.$$),
        (4, $$三番線____電車が発車します。$$, $$O trem parte da plataforma três.$$),
        (5, $$学校____お知らせがあります。$$, $$Há um comunicado da escola.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$より$$),
        (2, $$より$$),
        (3, $$より$$),
        (4, $$より$$),
        (5, $$より$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-189 — 〜よりほかない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-189',
    'grammar',
    'N2',
    $$〜よりほかない$$,
    $$yori hoka nai$$,
    $$Não há outra saída senão / Só resta / Não tem jeito a não ser$$,
    $$よりほかない indica que não existe outra opção, e a pessoa é obrigada a fazer algo. Equivale a "não há outra saída senão" ou "só resta".

Muitas vezes há resignação, porque a pessoa preferia não fazer aquilo. Por exemplo, "o trem parou, então só resta ir a pé".

É uma expressão um pouco formal, parecida com しかない.$$,
    $$É mais formal que しかない.

Também aparece como ほかない e ほかはない, com o mesmo sentido.$$,
    $$Verbo (forma dicionário) + よりほかない
Verbo (forma dicionário) + よりほかはない
Verbo (forma dicionário) + よりほかに方法はない$$,
    $$よりほかない$$,
    $$よりほかない|よりほかはない|よりほかありません|よりほかに|より他ない$$,
    ARRAY['より', 'ほか', 'ない']::text[],
    ARRAY['よりほかない', 'よりほかはない', 'よりほかありません', 'よりほかに方法はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-189', $$電車が止まったので、歩いて帰るよりほかない。$$, $$でんしゃがとまったので、あるいてかえるよりほかない。$$, $$O trem parou, então só resta voltar a pé.$$),
    ('n2-grammar-189', $$誰も手伝ってくれないなら、自分でやるよりほかはない。$$, $$だれもてつだってくれないなら、じぶんでやるよりほかはない。$$, $$Se ninguém vai ajudar, não há outra saída senão fazer sozinho.$$),
    ('n2-grammar-189', $$ここまで来たら、前に進むよりほかない。$$, $$ここまできたら、まえにすすむよりほかない。$$, $$Chegando até aqui, só resta seguir em frente.$$),
    ('n2-grammar-189', $$お金がないので、旅行はあきらめるよりほかありません。$$, $$おかねがないので、りょこうはあきらめるよりほかありません。$$, $$Como não tenho dinheiro, não há outra saída senão desistir da viagem.$$),
    ('n2-grammar-189', $$謝るよりほかに方法はない。$$, $$あやまるよりほかにほうほうはない。$$, $$Não há outro jeito a não ser pedir desculpas.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$終電がないので、タクシーで帰る____。$$, $$Como não tem mais trem, só resta voltar de táxi.$$),
        (2, $$医者に言われたら、手術を受ける____。$$, $$Se o médico mandou, não há outra saída senão fazer a cirurgia.$$),
        (3, $$決まったことは、従う____。$$, $$O que foi decidido, só resta obedecer.$$),
        (4, $$道がわからないから、人に聞く____。$$, $$Como não sei o caminho, só resta perguntar a alguém.$$),
        (5, $$これ以上は待てないので、出発する____。$$, $$Não dá para esperar mais, então só resta partir.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-189', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$よりほかない$$),
        (1, $$よりほかはない$$),
        (1, $$よりほかありません$$),
        (2, $$よりほかない$$),
        (2, $$よりほかはない$$),
        (2, $$よりほかありません$$),
        (3, $$よりほかない$$),
        (3, $$よりほかはない$$),
        (3, $$よりほかありません$$),
        (4, $$よりほかない$$),
        (4, $$よりほかはない$$),
        (4, $$よりほかありません$$),
        (5, $$よりほかない$$),
        (5, $$よりほかはない$$),
        (5, $$よりほかありません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-190 — 〜ようでは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-190',
    'grammar',
    'N2',
    $$〜ようでは$$,
    $$you dewa$$,
    $$Se for assim / Desse jeito / Se continuar assim$$,
    $$ようでは indica que, se uma situação ruim continuar, o resultado será negativo. Equivale a "se for assim..." ou "desse jeito...".

A primeira parte mostra uma atitude ou um estado que a pessoa critica, e a segunda mostra uma consequência ruim. Por exemplo, "se você se atrasa todo dia, não vai ser promovido".

O tom é de crítica, advertência ou preocupação.$$,
    $$Na fala, aparece como ようじゃ.

A segunda parte costuma ser だめだ, 困る, できない ou 無理だ.$$,
    $$Verbo (forma simples) + ようでは + Resultado negativo
Adjetivo い + ようでは
Adjetivo な + な + ようでは$$,
    $$ようでは$$,
    $$ようでは|ようじゃ$$,
    ARRAY['よう', 'では']::text[],
    ARRAY['ようでは', 'ようじゃ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-190', $$毎日遅刻するようでは、昇進は無理だ。$$, $$まいにちちこくするようでは、しょうしんはむりだ。$$, $$Se você se atrasa todo dia, promoção é impossível.$$),
    ('n2-grammar-190', $$こんな簡単な問題がわからないようでは、合格できない。$$, $$こんなかんたんなもんだいがわからないようでは、ごうかくできない。$$, $$Se não entende um problema tão simples, não vai passar.$$),
    ('n2-grammar-190', $$すぐにあきらめるようでは、何もできないよ。$$, $$すぐにあきらめるようでは、なにもできないよ。$$, $$Se desiste logo, não vai conseguir fazer nada.$$),
    ('n2-grammar-190', $$この程度で疲れるようじゃ、山には登れない。$$, $$このていどでつかれるようじゃ、やまにはのぼれない。$$, $$Se fica cansado com tão pouco, não vai conseguir subir a montanha.$$),
    ('n2-grammar-190', $$人の話を聞かないようでは、いいリーダーになれない。$$, $$ひとのはなしをきかないようでは、いいリーダーになれない。$$, $$Se não ouve os outros, não vai ser um bom líder.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$挨拶もできない____、社会人として失格だ。$$, $$Se não consegue nem cumprimentar, é reprovado como profissional.$$),
        (2, $$宿題を忘れる____、先生に怒られるよ。$$, $$Se esquecer a lição de casa, o professor vai brigar com você.$$),
        (3, $$こんなにミスが多い____、仕事を任せられない。$$, $$Com tantos erros assim, não dá para confiar o trabalho a você.$$),
        (4, $$毎日お酒を飲む____、体を壊すよ。$$, $$Se beber todo dia, vai acabar doente.$$),
        (5, $$自分で決められない____、困るね。$$, $$Se não consegue decidir sozinho, fica complicado, né?$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-190', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようでは$$),
        (1, $$ようじゃ$$),
        (2, $$ようでは$$),
        (2, $$ようじゃ$$),
        (3, $$ようでは$$),
        (3, $$ようじゃ$$),
        (4, $$ようでは$$),
        (4, $$ようじゃ$$),
        (5, $$ようでは$$),
        (5, $$ようじゃ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-191 — 〜ようではないか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-191',
    'grammar',
    'N2',
    $$〜ようではないか$$,
    $$you dewa nai ka$$,
    $$Vamos / Que tal / Façamos$$,
    $$ようではないか é uma forma forte e formal de convidar um grupo a fazer algo juntos. Equivale a "vamos..." ou "façamos...".

É usada em discursos, campanhas e textos de opinião, quando alguém tenta motivar várias pessoas. Por exemplo, "vamos proteger juntos o meio ambiente".

Na fala, aparece como ようじゃないか, que é mais informal.$$,
    $$É mais forte e formal que ましょう.

É usado principalmente por homens ou em discursos públicos.

A forma ようではありませんか é mais educada.$$,
    $$Verbo (forma volitiva) + ではないか
Verbo (forma volitiva) + じゃないか$$,
    $$ようではないか$$,
    $$ではないか|じゃないか|ではありませんか$$,
    ARRAY['よう', 'では', 'ない', 'か']::text[],
    ARRAY['ようではないか', 'ようじゃないか', 'ようではありませんか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-191', $$みんなで力を合わせて頑張ろうではないか。$$, $$みんなでちからをあわせてがんばろうではないか。$$, $$Vamos unir forças e nos esforçar todos juntos.$$),
    ('n2-grammar-191', $$地球の環境を守ろうではないか。$$, $$ちきゅうのかんきょうをまもろうではないか。$$, $$Façamos a proteção do meio ambiente da Terra.$$),
    ('n2-grammar-191', $$もう一度話し合おうじゃないか。$$, $$もういちどはなしあおうじゃないか。$$, $$Que tal conversarmos mais uma vez?$$),
    ('n2-grammar-191', $$未来のために行動しようではありませんか。$$, $$みらいのためにこうどうしようではありませんか。$$, $$Vamos agir pelo futuro.$$),
    ('n2-grammar-191', $$この町をもっと元気にしようではないか。$$, $$このまちをもっとげんきにしようではないか。$$, $$Vamos deixar esta cidade mais animada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供たちのために、安全な町を作ろう____。$$, $$Vamos construir uma cidade segura para as crianças.$$),
        (2, $$最後まであきらめずに戦おう____。$$, $$Vamos lutar até o fim sem desistir.$$),
        (3, $$過去の失敗から学ぼう____。$$, $$Vamos aprender com os erros do passado.$$),
        (4, $$一緒に新しい時代を作ろう____。$$, $$Vamos criar juntos uma nova era.$$),
        (5, $$困っている人を助けよう____。$$, $$Vamos ajudar as pessoas em dificuldade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-191', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ではないか$$),
        (1, $$じゃないか$$),
        (1, $$ではありませんか$$),
        (2, $$ではないか$$),
        (2, $$じゃないか$$),
        (2, $$ではありませんか$$),
        (3, $$ではないか$$),
        (3, $$じゃないか$$),
        (3, $$ではありませんか$$),
        (4, $$ではないか$$),
        (4, $$じゃないか$$),
        (4, $$ではありませんか$$),
        (5, $$ではないか$$),
        (5, $$じゃないか$$),
        (5, $$ではありませんか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-192 — 〜ようか〜まいか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-192',
    'grammar',
    'N2',
    $$〜ようか〜まいか$$,
    $$you ka ~ mai ka$$,
    $$Se faço ou não / Fazer ou não fazer / Se devo ou não$$,
    $$ようか〜まいか expressa a dúvida de uma pessoa entre fazer ou não fazer algo. Equivale a "se faço ou não" ou "fazer ou não fazer".

Muitas vezes vem com verbos como 迷う, 悩む ou 考える. Por exemplo, "estou em dúvida se vou ou não à festa".

É uma expressão formal e um pouco literária.$$,
    $$まい é uma negação de intenção, então まいか significa "se não faço".

Na fala do dia a dia, usa-se mais ようかどうか.

Para verbos do grupo 2, também se usa a raiz + まい, como 食べまい.$$,
    $$Verbo (forma volitiva) + か + Verbo (forma dicionário) + まいか + 迷う / 悩む$$,
    $$ようか〜まいか$$,
    $$まいか$$,
    ARRAY['よう', 'か', 'まい', 'か']::text[],
    ARRAY['ようか〜まいか', 'うか〜まいか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-192', $$パーティーに行こうか行くまいか迷っている。$$, $$パーティーにいこうかいくまいかまよっている。$$, $$Estou em dúvida se vou ou não à festa.$$),
    ('n2-grammar-192', $$本当のことを言おうか言うまいか悩んだ。$$, $$ほんとうのことをいおうかいうまいかなやんだ。$$, $$Fiquei na dúvida se contava ou não a verdade.$$),
    ('n2-grammar-192', $$この服を買おうか買うまいか考えている。$$, $$このふくをかおうかかうまいかかんがえている。$$, $$Estou pensando se compro ou não esta roupa.$$),
    ('n2-grammar-192', $$彼に電話しようかするまいか、一晩中迷った。$$, $$かれにでんわしようかするまいか、ひとばんじゅうまよった。$$, $$Passei a noite toda em dúvida se ligava ou não para ele.$$),
    ('n2-grammar-192', $$留学しようかするまいか、まだ決めていない。$$, $$りゅうがくしようかするまいか、まだきめていない。$$, $$Ainda não decidi se faço ou não intercâmbio.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$会社を辞めようか辞める____、悩んでいる。$$, $$Estou em dúvida se saio ou não da empresa.$$),
        (2, $$ケーキを食べようか食べる____迷った。$$, $$Fiquei em dúvida se comia ou não o bolo.$$),
        (3, $$彼女に告白しようかする____、ずっと考えている。$$, $$Estou pensando há tempos se me declaro ou não para ela.$$),
        (4, $$試験を受けようか受ける____、まだ決められない。$$, $$Ainda não consigo decidir se faço ou não a prova.$$),
        (5, $$引っ越そうか引っ越す____、家族と相談した。$$, $$Conversei com a família se mudávamos ou não.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-192', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$まいか$$),
        (2, $$まいか$$),
        (3, $$まいか$$),
        (4, $$まいか$$),
        (5, $$まいか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-193 — 要するに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-193',
    'grammar',
    'N2',
    $$要するに$$,
    $$you suru ni$$,
    $$Em resumo / Ou seja / Resumindo$$,
    $$要するに serve para resumir o que foi dito ou para chegar ao ponto principal. Equivale a "em resumo", "ou seja" ou "resumindo".

A pessoa simplifica uma explicação longa em uma ideia curta. Por exemplo, "ele falou muitas coisas, mas resumindo, não quer fazer".

É uma expressão muito usada tanto na fala quanto na escrita.$$,
    $$É parecido com つまり, mas 要するに destaca mais o resumo da ideia principal.

Às vezes tem um tom um pouco impaciente, quando a pessoa quer ir direto ao ponto.$$,
    $$Frase (explicação) + 要するに、 + Resumo$$,
    $$要するに$$,
    $$要するに|ようするに$$,
    ARRAY['要する', 'に']::text[],
    ARRAY['要するに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-193', $$いろいろ言っていたが、要するに彼はやりたくないのだ。$$, $$いろいろいっていたが、ようするにかれはやりたくないのだ。$$, $$Ele falou muitas coisas, mas resumindo, não quer fazer.$$),
    ('n2-grammar-193', $$要するに、お金が足りないということですね。$$, $$ようするに、おかねがたりないということですね。$$, $$Ou seja, falta dinheiro, é isso?$$),
    ('n2-grammar-193', $$要するに、もっと練習が必要だ。$$, $$ようするに、もっとれんしゅうがひつようだ。$$, $$Em resumo, é preciso treinar mais.$$),
    ('n2-grammar-193', $$要するに、君は何が言いたいの？$$, $$ようするに、きみはなにがいいたいの？$$, $$Resumindo, o que você quer dizer?$$),
    ('n2-grammar-193', $$要するに、計画は中止になったわけだ。$$, $$ようするに、けいかくはちゅうしになったわけだ。$$, $$Ou seja, o plano foi cancelado.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$____、明日は休みということですね。$$, $$Ou seja, amanhã é folga, é isso?$$),
        (2, $$説明は長かったが、____この案には反対だということだ。$$, $$A explicação foi longa, mas resumindo, ele é contra esta proposta.$$),
        (3, $$____、彼女は君のことが好きなんだよ。$$, $$Em resumo, ela gosta de você.$$),
        (4, $$____、時間がないということです。$$, $$Resumindo, não há tempo.$$),
        (5, $$____、全部やり直しだ。$$, $$Ou seja, vamos ter que refazer tudo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-193', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$要するに$$),
        (1, $$ようするに$$),
        (2, $$要するに$$),
        (2, $$ようするに$$),
        (3, $$要するに$$),
        (3, $$ようするに$$),
        (4, $$要するに$$),
        (4, $$ようするに$$),
        (5, $$要するに$$),
        (5, $$ようするに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-194 — 〜ざるを得ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-194',
    'grammar',
    'N2',
    $$〜ざるを得ない$$,
    $$zaru wo enai$$,
    $$Ser obrigado a / Não ter escolha senão / Ter que$$,
    $$ざるを得ない indica que a pessoa é obrigada a fazer algo, mesmo sem querer, porque não há outra opção. Equivale a "ser obrigado a" ou "não ter escolha senão".

Muitas vezes há resignação ou pressão da situação. Por exemplo, "com a chuva forte, fomos obrigados a cancelar o evento".

É uma expressão formal, comum na escrita e em falas sérias.$$,
    $$Atenção à forma de する, que vira せざるを得ない.

É parecido com しかない e よりほかない, mas ざるを得ない é mais formal.

Também é escrito ざるをえない.$$,
    $$Verbo (forma ない sem ない) + ざるを得ない
する → せざるを得ない
来る → 来ざるを得ない$$,
    $$ざるを得ない$$,
    $$ざるを得ない|ざるをえない|ざるを得ません|ざるを得なかった|ざるをえなかった$$,
    ARRAY['ざる', 'を', '得ない']::text[],
    ARRAY['ざるを得ない', 'ざるをえない', 'ざるを得ません', 'せざるを得ない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-194', $$大雨のため、イベントを中止せざるを得なかった。$$, $$おおあめのため、イベントをちゅうしせざるをえなかった。$$, $$Por causa da chuva forte, fomos obrigados a cancelar o evento.$$),
    ('n2-grammar-194', $$上司の命令なので、従わざるを得ない。$$, $$じょうしのめいれいなので、したがわざるをえない。$$, $$Como é ordem do chefe, não tenho escolha senão obedecer.$$),
    ('n2-grammar-194', $$お金がないので、旅行をあきらめざるを得ない。$$, $$おかねがないので、りょこうをあきらめざるをえない。$$, $$Como não tenho dinheiro, sou obrigado a desistir da viagem.$$),
    ('n2-grammar-194', $$これだけ証拠があれば、認めざるを得ません。$$, $$これだけしょうこがあれば、みとめざるをえません。$$, $$Com tantas provas assim, não tenho escolha senão admitir.$$),
    ('n2-grammar-194', $$体調が悪いので、仕事を休まざるをえない。$$, $$たいちょうがわるいので、しごとをやすまざるをえない。$$, $$Como não estou bem de saúde, tenho que faltar ao trabalho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電車が止まったので、歩いて行か____。$$, $$O trem parou, então sou obrigado a ir a pé.$$),
        (2, $$社長に頼まれたら、引き受け____。$$, $$Se o presidente pedir, não tenho escolha senão aceitar.$$),
        (3, $$台風で、旅行を延期せ____。$$, $$Por causa do tufão, fomos obrigados a adiar a viagem.$$),
        (4, $$彼の才能は認め____。$$, $$Não tenho escolha senão reconhecer o talento dele.$$),
        (5, $$締め切りが明日なので、徹夜せ____。$$, $$Como o prazo é amanhã, sou obrigado a virar a noite.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-194', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ざるを得ない$$),
        (1, $$ざるをえない$$),
        (1, $$ざるを得ません$$),
        (2, $$ざるを得ない$$),
        (2, $$ざるをえない$$),
        (2, $$ざるを得ません$$),
        (3, $$ざるを得なかった$$),
        (3, $$ざるをえなかった$$),
        (4, $$ざるを得ない$$),
        (4, $$ざるをえない$$),
        (4, $$ざるを得ません$$),
        (5, $$ざるを得ない$$),
        (5, $$ざるをえない$$),
        (5, $$ざるを得ません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-195 — 〜ずに済む
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-195',
    'grammar',
    'N2',
    $$〜ずに済む$$,
    $$zu ni sumu$$,
    $$Não precisar / Livrar-se de / Escapar de$$,
    $$ずに済む indica que não foi preciso fazer algo que normalmente seria necessário ou que se temia. Equivale a "não precisar" ou "livrar-se de".

Muitas vezes mostra alívio por ter evitado um trabalho, um gasto ou um problema. Por exemplo, "como um amigo me emprestou, não precisei comprar".

É a forma mais formal de なくて済む e ないで済む.$$,
    $$Atenção à forma de する, que vira せずに済む.

No passado, ずに済んだ mostra alívio por algo que não foi necessário.$$,
    $$Verbo (forma ない sem ない) + ずに済む
する → せずに済む$$,
    $$ずに済む$$,
    $$ずに済|ずにすむ|ずにすん$$,
    ARRAY['ず', 'に', '済む']::text[],
    ARRAY['ずに済む', 'ずに済んだ', 'せずに済む']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-195', $$友達が貸してくれたので、辞書を買わずに済んだ。$$, $$ともだちがかしてくれたので、じしょをかわずにすんだ。$$, $$Como um amigo me emprestou, não precisei comprar o dicionário.$$),
    ('n2-grammar-195', $$早めに薬を飲んだので、ひどくならずに済んだ。$$, $$はやめにくすりをのんだので、ひどくならずにすんだ。$$, $$Como tomei o remédio cedo, não piorou.$$),
    ('n2-grammar-195', $$近所に引っ越せば、電車に乗らずに済む。$$, $$きんじょにひっこせば、でんしゃにのらずにすむ。$$, $$Se me mudar para perto, não vou precisar pegar trem.$$),
    ('n2-grammar-195', $$事前に連絡したので、待たずに済んだ。$$, $$じぜんにれんらくしたので、またずにすんだ。$$, $$Como avisei antes, não precisei esperar.$$),
    ('n2-grammar-195', $$説明書を読めば、人に聞かずに済む。$$, $$せつめいしょをよめば、ひとにきかずにすむ。$$, $$Lendo o manual, você não precisa perguntar a ninguém.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$バスが来たので、雨の中を歩か____。$$, $$Como o ônibus chegou, não precisei andar na chuva.$$),
        (2, $$上手に説明すれば、けんかせ____。$$, $$Se explicar bem, dá para evitar a briga.$$),
        (3, $$母が作ってくれたので、料理をせ____。$$, $$Como minha mãe cozinhou, não precisei fazer comida.$$),
        (4, $$ネットで申し込めば、窓口に行か____。$$, $$Se fizer a inscrição pela internet, não precisa ir ao guichê.$$),
        (5, $$保険に入っていたので、お金を払わ____。$$, $$Como eu tinha seguro, não precisei pagar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-195', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ずに済んだ$$),
        (1, $$ずにすんだ$$),
        (2, $$ずに済む$$),
        (2, $$ずにすむ$$),
        (3, $$ずに済んだ$$),
        (3, $$ずにすんだ$$),
        (4, $$ずに済む$$),
        (4, $$ずにすむ$$),
        (5, $$ずに済んだ$$),
        (5, $$ずにすんだ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-196 — 〜にかけては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-196',
    'grammar',
    'N2',
    $$〜にかけては$$,
    $$ni kakete wa$$,
    $$Quando se trata de / Em matéria de / No que diz respeito a$$,
    $$にかけては indica uma área em que alguém tem muita habilidade ou é o melhor. Equivale a "quando se trata de" ou "em matéria de".

A segunda parte costuma elogiar a capacidade de alguém, dizendo que ninguém é melhor naquilo. Por exemplo, "quando se trata de cozinhar, ninguém supera minha mãe".

É usado para falar de habilidades e qualidades positivas.$$,
    $$É parecido com に関しては, mas にかけては é usado para destacar uma habilidade especial.

A segunda parte costuma ter expressões como 誰にも負けない ou 右に出る者はいない.$$,
    $$Substantivo (área / habilidade) + にかけては + Avaliação positiva$$,
    $$にかけては$$,
    $$にかけては|にかけても$$,
    ARRAY['に', 'かけて', 'は']::text[],
    ARRAY['にかけては', 'にかけても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-196', $$料理にかけては、母に勝てる人はいない。$$, $$りょうりにかけては、ははにかてるひとはいない。$$, $$Quando se trata de cozinhar, ninguém supera minha mãe.$$),
    ('n2-grammar-196', $$彼は数学にかけては、クラスで一番だ。$$, $$かれはすうがくにかけては、クラスでいちばんだ。$$, $$Em matéria de matemática, ele é o melhor da turma.$$),
    ('n2-grammar-196', $$速さにかけては、誰にも負けない。$$, $$はやさにかけては、だれにもまけない。$$, $$No que diz respeito à velocidade, não perco para ninguém.$$),
    ('n2-grammar-196', $$彼女は語学にかけては天才だ。$$, $$かのじょはごがくにかけてはてんさいだ。$$, $$Quando se trata de idiomas, ela é um gênio.$$),
    ('n2-grammar-196', $$この店はサービスの質にかけては、どこにも負けない。$$, $$このみせはサービスのしつにかけては、どこにもまけない。$$, $$Em matéria de qualidade de atendimento, esta loja não perde para nenhuma.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$歌____、彼の右に出る者はいない。$$, $$Quando se trata de cantar, ninguém é melhor que ele.$$),
        (2, $$パソコンの知識____、彼女が一番詳しい。$$, $$Em matéria de computadores, ela é quem mais entende.$$),
        (3, $$サッカー____、誰にも負けない自信がある。$$, $$Quando se trata de futebol, tenho certeza de que não perco para ninguém.$$),
        (4, $$記憶力____、祖父はすごい。$$, $$No que diz respeito à memória, meu avô é impressionante.$$),
        (5, $$この会社は技術力____、世界でトップクラスだ。$$, $$Em matéria de tecnologia, esta empresa está entre as melhores do mundo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-196', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかけては$$),
        (2, $$にかけては$$),
        (3, $$にかけては$$),
        (4, $$にかけては$$),
        (5, $$にかけては$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-197 — 〜ほど〜はない・〜くらい〜はない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-197',
    'grammar',
    'N2',
    $$〜ほど〜はない・〜くらい〜はない$$,
    $$hodo ~ wa nai / kurai ~ wa nai$$,
    $$Não há nada tão... quanto / Nada é mais... do que / Não existe... como$$,
    $$ほど〜はない e くらい〜はない servem para dizer que algo é o mais alto em algum aspecto, de acordo com a opinião da pessoa. Equivale a "não há nada tão... quanto" ou "nada é mais... do que".

Por exemplo, "não há nada tão divertido quanto viajar" ou "não existe pessoa tão gentil quanto ela".

É uma forma de comparação que expressa uma opinião forte e pessoal.$$,
    $$ぐらい também pode ser usado no lugar de くらい.

Expressões comuns são これほど〜はない e 〜ほど〜ものはない.$$,
    $$Substantivo + ほど + Adjetivo + Substantivo + はない
Substantivo + くらい + Adjetivo + Substantivo + はない
Verbo (forma dicionário) + ほど + Adjetivo + ことはない$$,
    $$ほど〜はない$$,
    $$ほど|くらい|ぐらい$$,
    ARRAY['ほど', 'は', 'ない']::text[],
    ARRAY['ほど〜はない', 'くらい〜はない', 'ぐらい〜はない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-197', $$旅行ほど楽しいものはない。$$, $$りょこうほどたのしいものはない。$$, $$Não há nada tão divertido quanto viajar.$$),
    ('n2-grammar-197', $$彼女くらい優しい人はいない。$$, $$かのじょくらいやさしいひとはいない。$$, $$Não existe pessoa tão gentil quanto ela.$$),
    ('n2-grammar-197', $$今年の夏ほど暑い夏はなかった。$$, $$ことしのなつほどあついなつはなかった。$$, $$Nunca houve um verão tão quente quanto o deste ano.$$),
    ('n2-grammar-197', $$家族と過ごす時間ぐらい大切なものはない。$$, $$かぞくとすごすじかんぐらいたいせつなものはない。$$, $$Nada é mais importante do que o tempo com a família.$$),
    ('n2-grammar-197', $$一人で食事をするほど寂しいことはない。$$, $$ひとりでしょくじをするほどさびしいことはない。$$, $$Não há nada tão solitário quanto comer sozinho.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$健康____大切なものはない。$$, $$Nada é mais importante do que a saúde.$$),
        (2, $$この映画____感動した映画はない。$$, $$Não há filme que me emocionou tanto quanto este.$$),
        (3, $$富士山____美しい山はない。$$, $$Não existe montanha tão bonita quanto o monte Fuji.$$),
        (4, $$母の料理____おいしいものはない。$$, $$Não há nada tão gostoso quanto a comida da minha mãe.$$),
        (5, $$友達に裏切られる____悲しいことはない。$$, $$Não há nada tão triste quanto ser traído por um amigo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-197', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ほど$$),
        (1, $$くらい$$),
        (1, $$ぐらい$$),
        (2, $$ほど$$),
        (2, $$くらい$$),
        (2, $$ぐらい$$),
        (3, $$ほど$$),
        (3, $$くらい$$),
        (3, $$ぐらい$$),
        (4, $$ほど$$),
        (4, $$くらい$$),
        (4, $$ぐらい$$),
        (5, $$ほど$$),
        (5, $$くらい$$),
        (5, $$ぐらい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;

-- n2-grammar-198 — 〜をきっかけに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-198',
    'grammar',
    'N2',
    $$〜をきっかけに$$,
    $$wo kikkake ni$$,
    $$A partir de / Por causa de / Aproveitando$$,
    $$をきっかけに indica que um acontecimento foi o motivo ou o ponto de partida para algo começar ou mudar. Equivale a "a partir de" ou "por causa de".

O acontecimento pode ser grande ou pequeno, como um encontro, uma viagem ou um livro. Por exemplo, "a partir de uma viagem ao Japão, comecei a estudar japonês".

É uma expressão muito comum, usada tanto na fala quanto na escrita.$$,
    $$É parecido com を契機に, que é mais formal.

A palavra きっかけ sozinha significa "motivo" ou "oportunidade", como em 何がきっかけ.$$,
    $$Substantivo + をきっかけに / をきっかけとして
Verbo (forma simples) + の + をきっかけに$$,
    $$をきっかけに$$,
    $$をきっかけに|をきっかけとして|がきっかけで$$,
    ARRAY['を', 'きっかけ', 'に']::text[],
    ARRAY['をきっかけに', 'をきっかけとして', 'をきっかけにして', 'がきっかけで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-198', $$日本旅行をきっかけに、日本語の勉強を始めた。$$, $$にほんりょこうをきっかけに、にほんごのべんきょうをはじめた。$$, $$A partir de uma viagem ao Japão, comecei a estudar japonês.$$),
    ('n2-grammar-198', $$ある本との出会いをきっかけに、人生が変わった。$$, $$あるほんとのであいをきっかけに、じんせいがかわった。$$, $$A minha vida mudou a partir do encontro com um livro.$$),
    ('n2-grammar-198', $$入院したのをきっかけに、たばこをやめた。$$, $$にゅういんしたのをきっかけに、たばこをやめた。$$, $$A partir da internação, parei de fumar.$$),
    ('n2-grammar-198', $$友達の紹介をきっかけとして、二人は付き合い始めた。$$, $$ともだちのしょうかいをきっかけとして、ふたりはつきあいはじめた。$$, $$Os dois começaram a namorar a partir da apresentação de um amigo.$$),
    ('n2-grammar-198', $$小さなけんかがきっかけで、二人は別れた。$$, $$ちいさなけんかがきっかけで、ふたりはわかれた。$$, $$Por causa de uma briguinha, os dois terminaram.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$留学____、海外で働きたいと思うようになった。$$, $$A partir do intercâmbio, passei a querer trabalhar no exterior.$$),
        (2, $$結婚____、料理を習い始めた。$$, $$Aproveitando o casamento, comecei a fazer aulas de culinária.$$),
        (3, $$あの映画を見たの____、医者を目指した。$$, $$A partir de quando vi aquele filme, decidi ser médico.$$),
        (4, $$ボランティア活動____、多くの友達ができた。$$, $$A partir do trabalho voluntário, fiz muitos amigos.$$),
        (5, $$引っ越し____、新しい趣味を始めた。$$, $$Aproveitando a mudança, comecei um novo hobby.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-198', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$をきっかけに$$),
        (1, $$をきっかけとして$$),
        (2, $$をきっかけに$$),
        (2, $$をきっかけとして$$),
        (3, $$をきっかけに$$),
        (3, $$をきっかけとして$$),
        (4, $$をきっかけに$$),
        (4, $$をきっかけとして$$),
        (5, $$をきっかけに$$),
        (5, $$をきっかけとして$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
