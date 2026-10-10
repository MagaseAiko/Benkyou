-- n1-grammar-91 — 〜ないものか / 〜ないものだろうか
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-91',
    'grammar',
    'N1',
    $$〜ないものか / 〜ないものだろうか$$,
    $$nai mono ka / nai mono darou ka$$,
    $$Será que não há como / Será que não dá para / Quem dera$$,
    $$ないものか e ないものだろうか expressam um desejo forte de que algo aconteça, mesmo sendo difícil. Equivalem a "será que não há como...?" ou "quem dera...".

A pessoa procura uma forma de realizar algo que parece complicado. Por exemplo, "será que não há como resolver este problema?".

Costumam vir com a forma potencial do verbo, como できないものか ou 行けないものか.$$,
    $$É parecido com ないかなあ, mas ないものか é mais formal e expressa um desejo mais forte.

A forma ないものでしょうか é usada para fazer pedidos educados.$$,
    $$Verbo (forma potencial, forma ない) + ものか
Verbo (forma potencial, forma ない) + ものだろうか
Verbo (forma ない) + ものか$$,
    $$ないものか$$,
    $$ないものか|ないものだろうか|ないものでしょうか|ないもんか$$,
    ARRAY['ない', 'もの', 'か']::text[],
    ARRAY['ないものか', 'ないものだろうか', 'ないものでしょうか']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-91', $$この問題を何とか解決できないものか。$$, $$このもんだいをなんとかかいけつできないものか。$$, $$Será que não há como resolver este problema de algum jeito?$$),
    ('n1-grammar-91', $$もっと安く旅行できないものだろうか。$$, $$もっとやすくりょこうできないものだろうか。$$, $$Será que não dá para viajar mais barato?$$),
    ('n1-grammar-91', $$彼の病気が早く治らないものか。$$, $$かれのびょうきがはやくなおらないものか。$$, $$Quem dera a doença dele sarasse logo.$$),
    ('n1-grammar-91', $$締め切りを少し延ばしていただけないものでしょうか。$$, $$しめきりをすこしのばしていただけないものでしょうか。$$, $$Será que não seria possível estender um pouco o prazo?$$),
    ('n1-grammar-91', $$毎日の通勤時間をもっと短くできないものか。$$, $$まいにちのつうきんじかんをもっとみじかくできないものか。$$, $$Será que não há como encurtar o tempo de deslocamento diário?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$何とかして彼女に会え____。$$, $$Será que não há como eu encontrá-la de algum jeito?$$),
        (2, $$この渋滞は何とかなら____。$$, $$Será que este congestionamento não tem solução?$$),
        (3, $$もう少し値段を下げられ____。$$, $$Será que não dá para baixar um pouco o preço?$$),
        (4, $$戦争のない世界は作れ____。$$, $$Será que não é possível criar um mundo sem guerras?$$),
        (5, $$早く春が来____。$$, $$Quem dera a primavera chegasse logo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-91', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ないものか$$),
        (1, $$ないものだろうか$$),
        (2, $$ないものか$$),
        (2, $$ないものだろうか$$),
        (3, $$ないものか$$),
        (3, $$ないものだろうか$$),
        (3, $$ないものでしょうか$$),
        (4, $$ないものか$$),
        (4, $$ないものだろうか$$),
        (5, $$ないものか$$),
        (5, $$ないものだろうか$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
