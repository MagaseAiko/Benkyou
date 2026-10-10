-- n4-grammar-94 — 〜ていた
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-94',
    'grammar',
    'N4',
    $$〜ていた$$,
    $$te ita$$,
    $$Estava fazendo / Fazia / Tinha (estado)$$,
    $$ていた é o passado de ている. Ele tem os mesmos usos de ている, mas olhando para o passado.

Os usos principais são:
• Ação em andamento no passado: o que alguém estava fazendo em certo momento, como "estava vendo TV quando o telefone tocou".
• Estado no passado: uma situação que durava, como "morava em Osaka quando era criança".
• Hábito no passado: algo que a pessoa fazia regularmente, como "corria todo dia quando era estudante".
• Descoberta de um estado: ao chegar a um lugar, encontrar algo já de certo jeito, como "quando acordei, estava nevando".

É muito usado em histórias e relatos, para dar o contexto em que outra ação aconteceu.$$,
    $$Compare: 食べた indica uma ação concluída; 食べていた indica que a ação estava acontecendo naquele momento.

Junto com とき, ていた descreve o pano de fundo de um acontecimento: "quando X aconteceu, eu estava fazendo Y".

Na fala, ていた costuma ser reduzido para てた.$$,
    $$Verbo na forma て + いた
Verbo na forma て + いました (educado)

Negativo: ていなかった / ていませんでした
Fala casual: てた$$,
    $$ていた$$,
    $$ていた|でいた|ていました|でいました$$,
    ARRAY['て', 'いた']::text[],
    ARRAY['ていた', 'ていました', 'でいた', 'てた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-94', $$昨日の夜は、ずっとテレビを見ていた。$$, $$きのうのよるは、ずっとテレビをみていた。$$, $$Ontem à noite, fiquei vendo TV o tempo todo.$$),
    ('n4-grammar-94', $$電話が鳴ったとき、お風呂に入っていました。$$, $$でんわがなったとき、おふろにはいっていました。$$, $$Quando o telefone tocou, eu estava no banho.$$),
    ('n4-grammar-94', $$子供のころ、大阪に住んでいた。$$, $$こどものころ、おおさかにすんでいた。$$, $$Quando eu era criança, morava em Osaka.$$),
    ('n4-grammar-94', $$朝起きたら、雪が降っていました。$$, $$あさおきたら、ゆきがふっていました。$$, $$Quando acordei de manhã, estava nevando.$$),
    ('n4-grammar-94', $$学生のころ、毎日ジョギングをしていました。$$, $$がくせいのころ、まいにちジョギングをしていました。$$, $$Na época de estudante, eu corria todos os dias.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$昨日の三時ごろ、何をし____か。$$, $$O que você estava fazendo ontem por volta das três?$$),
        (2, $$彼が来たとき、私は本を読ん____。$$, $$Quando ele chegou, eu estava lendo um livro.$$),
        (3, $$十年前、父は銀行で働い____。$$, $$Dez anos atrás, meu pai trabalhava num banco.$$),
        (4, $$家に帰ったら、ドアが開い____。$$, $$Quando voltei para casa, a porta estava aberta.$$),
        (5, $$昔、この町には大きな川が流れ____。$$, $$Antigamente, passava um rio grande por esta cidade.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-94', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ていました$$),
        (2, $$でいました$$),
        (2, $$でいた$$),
        (3, $$ていました$$),
        (3, $$ていた$$),
        (4, $$ていました$$),
        (4, $$ていた$$),
        (5, $$ていました$$),
        (5, $$ていた$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
