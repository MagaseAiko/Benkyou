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
