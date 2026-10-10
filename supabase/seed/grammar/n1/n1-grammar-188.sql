-- n1-grammar-188 — 〜てしかるべきだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-188',
    'grammar',
    'N1',
    $$〜てしかるべきだ$$,
    $$te shikarubeki da$$,
    $$Deveria / Seria natural que / É justo que$$,
    $$てしかるべきだ indica que algo deveria ser feito, porque é natural ou justo. Equivale a "deveria" ou "seria natural que".

Muitas vezes a pessoa critica o fato de algo não ter sido feito. Por exemplo, "o governo deveria ter agido mais cedo" ou "um esforço desses merece reconhecimento".

É uma expressão formal.$$,
    $$É parecido com べきだ e のが当然だ, mas てしかるべきだ é mais formal.

A forma しかるべき, antes de substantivos, significa "adequado", como しかるべき処置.$$,
    $$Verbo (forma て) + しかるべきだ
Adjetivo い (sem い) + くてしかるべきだ
Adjetivo な / Substantivo + でしかるべきだ$$,
    $$てしかるべきだ$$,
    $$てしかるべき|でしかるべき$$,
    ARRAY['て', 'しかるべき', 'だ']::text[],
    ARRAY['てしかるべきだ', 'てしかるべきです', 'でしかるべきだ']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-188', $$彼の努力は、もっと評価されてしかるべきだ。$$, $$かれのどりょくは、もっとひょうかされてしかるべきだ。$$, $$O esforço dele deveria ser mais reconhecido.$$),
    ('n1-grammar-188', $$事故の責任者は、謝罪してしかるべきだ。$$, $$じこのせきにんしゃは、しゃざいしてしかるべきだ。$$, $$O responsável pelo acidente deveria pedir desculpas.$$),
    ('n1-grammar-188', $$この問題は、もっと早く解決されてしかるべきだった。$$, $$このもんだいは、もっとはやくかいけつされてしかるべきだった。$$, $$Este problema deveria ter sido resolvido mais cedo.$$),
    ('n1-grammar-188', $$これだけ働いたのだから、給料はもっと高くてしかるべきだ。$$, $$これだけはたらいたのだから、きゅうりょうはもっとたかくてしかるべきだ。$$, $$Trabalhando tanto assim, o salário deveria ser mais alto.$$),
    ('n1-grammar-188', $$子供の意見も尊重されてしかるべきです。$$, $$こどものいけんもそんちょうされてしかるべきです。$$, $$A opinião das crianças também deveria ser respeitada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$ミスをしたのだから、彼は謝っ____。$$, $$Ele errou, então deveria pedir desculpas.$$),
        (2, $$彼女の才能は、もっと注目され____。$$, $$O talento dela deveria receber mais atenção.$$),
        (3, $$国はこの問題に対策をとっ____。$$, $$O país deveria tomar medidas contra este problema.$$),
        (4, $$お世話になったのだから、お礼を言っ____。$$, $$Já que te ajudaram, você deveria agradecer.$$),
        (5, $$社員の意見も聞かれ____。$$, $$A opinião dos funcionários também deveria ser ouvida.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-188', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$てしかるべきだ$$),
        (1, $$てしかるべきです$$),
        (2, $$てしかるべきだ$$),
        (2, $$てしかるべきです$$),
        (3, $$てしかるべきだ$$),
        (3, $$てしかるべきです$$),
        (4, $$てしかるべきだ$$),
        (4, $$てしかるべきです$$),
        (5, $$てしかるべきだ$$),
        (5, $$てしかるべきです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
