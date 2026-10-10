-- n4-grammar-65 — お〜ください
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-65',
    'grammar',
    'N4',
    $$お〜ください$$,
    $$o ~ kudasai$$,
    $$Por favor (faça) (muito educado)$$,
    $$お〜ください é uma forma muito educada de pedir que alguém faça algo. É mais respeitosa do que てください.

Ela é formada colocando お antes do verbo na forma ます sem ます, e ください depois. Com verbos do tipo "substantivo + する" de origem chinesa, usa-se ご no lugar de お, como em ご連絡ください.

É muito usada por funcionários de lojas, hotéis, estações e empresas, e em avisos públicos. Também aparece em e-mails formais.

Ela pertence ao 尊敬語, porque eleva a pessoa que vai fazer a ação.$$,
    $$Alguns verbos têm formas respeitosas especiais e não seguem a regra, como 見る (ご覧ください), 来る (お越しください) e 食べる (お召し上がりください).

Verbos de uma só sílaba na forma ます, como 見る e 寝る, normalmente não usam essa estrutura.

少々お待ちください é uma das frases mais ouvidas no atendimento ao cliente no Japão.$$,
    $$お + Verbo na forma ます sem ます + ください
ご + Substantivo de ação (origem chinesa) + ください

Exemplos de formação: 待つ → お待ちください / 入る → お入りください / 連絡する → ご連絡ください$$,
    $$お〜ください$$,
    $$お待ちください|お入りください|お座りください|お掛けください|お使いください|お書きください|お持ちください|お取りください|お降りください|お選びください|お気をつけください|ご連絡ください|ご覧ください|ご確認ください|ご注意ください|ご利用ください$$,
    ARRAY['お', 'ください']::text[],
    ARRAY['お〜ください', 'ご〜ください']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-65', $$少々お待ちください。$$, $$しょうしょうおまちください。$$, $$Aguarde um momento, por favor.$$),
    ('n4-grammar-65', $$どうぞお入りください。$$, $$どうぞおはいりください。$$, $$Entre, por favor.$$),
    ('n4-grammar-65', $$こちらにお名前をお書きください。$$, $$こちらにおなまえをおかきください。$$, $$Escreva seu nome aqui, por favor.$$),
    ('n4-grammar-65', $$ご自由にお使いください。$$, $$ごじゆうにおつかいください。$$, $$Fique à vontade para usar.$$),
    ('n4-grammar-65', $$階段では足元にご注意ください。$$, $$かいだんではあしもとにごちゅういください。$$, $$Cuidado com os degraus na escada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$どうぞ、こちらに____。$$, $$Sente-se aqui, por favor.$$),
        (2, $$お帰りの際は、どうぞ____。$$, $$Na volta, tome cuidado, por favor.$$),
        (3, $$こちらのペンを____。$$, $$Use esta caneta, por favor.$$),
        (4, $$何かあれば、いつでも____。$$, $$Se precisar de algo, entre em contato a qualquer momento.$$),
        (5, $$お客様、次の駅で____。$$, $$Senhor, desça na próxima estação, por favor.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お座りください$$),
        (1, $$お掛けください$$),
        (2, $$お気をつけください$$),
        (3, $$お使いください$$),
        (4, $$ご連絡ください$$),
        (5, $$お降りください$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
