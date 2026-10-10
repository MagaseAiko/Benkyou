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
