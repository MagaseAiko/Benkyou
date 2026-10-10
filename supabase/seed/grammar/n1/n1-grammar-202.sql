-- n1-grammar-202 — 〜といったらない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-202',
    'grammar',
    'N1',
    $$〜といったらない$$,
    $$to ittara nai$$,
    $$Indescritível / Não tem palavras / Demais$$,
    $$といったらない indica que um sentimento ou característica é tão intenso que não há palavras para descrevê-lo. Equivale a "indescritível" ou "não tem palavras".

Pode ser usado com coisas boas ou ruins. Por exemplo, "a beleza daquela paisagem é indescritível" ou "a vergonha que passei foi enorme".

A forma といったらありはしない e a forma coloquial ったらない também existem.$$,
    $$Costuma vir com substantivos formados com さ, como 美しさ, 寒さ ou 悔しさ.

Na fala, aparece como ったらない ou ったらありゃしない.$$,
    $$Adjetivo い + といったらない
Adjetivo な / Substantivo + といったらない
Adjetivo い (raiz) + さ + といったらない$$,
    $$といったらない$$,
    $$といったらない|といったらなかった|ったらない|といったらありはしない|といったらありません$$,
    ARRAY['と', 'いったら', 'ない']::text[],
    ARRAY['といったらない', 'ったらない', 'といったらありはしない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-202', $$あの景色の美しさといったらない。$$, $$あのけしきのうつくしさといったらない。$$, $$A beleza daquela paisagem é indescritível.$$),
    ('n1-grammar-202', $$試合に負けた時の悔しさといったらなかった。$$, $$しあいにまけたときのくやしさといったらなかった。$$, $$A frustração quando perdemos a partida foi indescritível.$$),
    ('n1-grammar-202', $$彼の話のつまらなさといったらない。$$, $$かれのはなしのつまらなさといったらない。$$, $$A conversa dele é chata demais.$$),
    ('n1-grammar-202', $$人前で転んだ時の恥ずかしさといったらありはしない。$$, $$ひとまえでころんだときのはずかしさといったらありはしない。$$, $$A vergonha que passei ao cair na frente dos outros foi indescritível.$$),
    ('n1-grammar-202', $$この子のかわいさったらない。$$, $$このこのかわいさったらない。$$, $$Esta criança é fofa demais.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$初めて富士山を見た時の感動____。$$, $$A emoção quando vi o monte Fuji pela primeira vez foi indescritível.$$),
        (2, $$今朝の寒さ____。$$, $$O frio desta manhã é indescritível.$$),
        (3, $$合格を知った時のうれしさ____。$$, $$A alegria quando soube que passei foi indescritível.$$),
        (4, $$彼の部屋の汚さ____。$$, $$A sujeira do quarto dele é indescritível.$$),
        (5, $$赤ちゃんの寝顔のかわいさ____。$$, $$A fofura do rostinho do bebê dormindo é indescritível.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-202', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$といったらなかった$$),
        (2, $$といったらない$$),
        (3, $$といったらなかった$$),
        (4, $$といったらない$$),
        (5, $$といったらない$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
