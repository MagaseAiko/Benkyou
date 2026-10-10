-- n1-grammar-164 — 〜さ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-164',
    'grammar',
    'N1',
    $$〜さ$$,
    $$sa$$,
    $$Ora / Claro que / É isso aí$$,
    $$さ, no fim da frase, é uma partícula coloquial usada para afirmar algo de forma leve, despreocupada ou um pouco confiante. Equivale a "ora", "claro que" ou "é isso aí".

Por exemplo, "vai dar tudo certo, ora" ou "claro que eu sei".

É usada principalmente por homens, em conversas informais. Também aparece no meio da frase como uma espécie de pausa, como "então, sabe...".$$,
    $$Soa casual e um pouco masculino.

Não se usa com superiores ou em situações formais.

Expressões comuns são 何とかなるさ, いいさ e そんなものさ.$$,
    $$Verbo / Adjetivo い (forma simples) + さ
Substantivo / Adjetivo な + さ
Frase + のさ / んださ$$,
    $$さ$$,
    $$るさ|いさ|のさ|のものさ|んださ|ものさ$$,
    ARRAY['さ']::text[],
    ARRAY['さ', 'のさ', 'んださ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-164', $$心配するな。何とかなるさ。$$, $$しんぱいするな。なんとかなるさ。$$, $$Não se preocupe. Vai dar tudo certo, ora.$$),
    ('n1-grammar-164', $$失敗してもいいさ。また頑張ればいい。$$, $$しっぱいしてもいいさ。またがんばればいい。$$, $$Tudo bem errar. É só tentar de novo.$$),
    ('n1-grammar-164', $$人生なんて、そんなものさ。$$, $$じんせいなんて、そんなものさ。$$, $$A vida é assim mesmo, ora.$$),
    ('n1-grammar-164', $$そのくらい、僕だってわかるさ。$$, $$そのくらい、ぼくだってわかるさ。$$, $$Isso aí até eu entendo, claro.$$),
    ('n1-grammar-164', $$彼はきっと来るさ。$$, $$かれはきっとくるさ。$$, $$Claro que ele vem.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$大丈夫、すぐ慣れる____。$$, $$Tudo bem, você vai se acostumar logo, ora.$$),
        (2, $$気にするな。誰にでもミスはある____。$$, $$Não liga. Todo mundo erra, ora.$$),
        (3, $$いい____、もう過ぎたことだ。$$, $$Tudo bem, ora, já passou.$$),
        (4, $$明日になれば、雨もやんでいる____。$$, $$Amanhã a chuva já terá parado, é isso aí.$$),
        (5, $$それが現実というもの____。$$, $$Essa é a realidade, ora.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-164', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$さ$$),
        (2, $$さ$$),
        (3, $$さ$$),
        (4, $$さ$$),
        (5, $$さ$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
