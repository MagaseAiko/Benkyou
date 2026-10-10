-- n1-grammar-97 — 〜ならでは
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-97',
    'grammar',
    'N1',
    $$〜ならでは$$,
    $$nara dewa$$,
    $$Típico de / Só mesmo / Exclusivo de$$,
    $$ならでは indica que algo só é possível ou só existe por causa de uma pessoa, lugar ou situação específica. Equivale a "típico de" ou "só mesmo".

É usado para elogiar algo único e especial. Por exemplo, "um sabor que só mesmo esta loja tem" ou "uma experiência típica do Japão".

A forma mais comum é ならではの, antes de substantivos.$$,
    $$É usado principalmente com elogios.

Também aparece como ならではの味, ならではの経験 e ならではの魅力.$$,
    $$Substantivo + ならではの + Substantivo
Substantivo + ならでは + だ$$,
    $$ならでは$$,
    $$ならでは$$,
    ARRAY['なら', 'では']::text[],
    ARRAY['ならでは', 'ならではの']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-97', $$これは京都ならではの景色だ。$$, $$これはきょうとならではのけしきだ。$$, $$Esta é uma paisagem típica de Kyoto.$$),
    ('n1-grammar-97', $$この店ならではの味を楽しんでください。$$, $$このみせならではのあじをたのしんでください。$$, $$Aproveite o sabor que só mesmo esta loja tem.$$),
    ('n1-grammar-97', $$子供ならではの自由な発想だ。$$, $$こどもならではのじゆうなはっそうだ。$$, $$É uma imaginação livre típica de criança.$$),
    ('n1-grammar-97', $$手作りならではの温かさがある。$$, $$てづくりならではのあたたかさがある。$$, $$Tem o calor que só o feito à mão tem.$$),
    ('n1-grammar-97', $$これは日本ならではの文化だ。$$, $$これはにほんならではのぶんかだ。$$, $$Esta é uma cultura exclusiva do Japão.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$地元の人____の情報を教えてもらった。$$, $$Recebi informações que só mesmo os moradores conhecem.$$),
        (2, $$この料理は、プロ____の技術が光る。$$, $$Este prato mostra uma técnica que só mesmo um profissional tem.$$),
        (3, $$北海道____の新鮮な海の幸を味わった。$$, $$Provei frutos do mar frescos típicos de Hokkaido.$$),
        (4, $$旅行____の楽しみがある。$$, $$Há prazeres que só as viagens trazem.$$),
        (5, $$あの先生____の分かりやすい説明だった。$$, $$Foi uma explicação clara que só mesmo aquele professor sabe dar.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-97', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ならでは$$),
        (2, $$ならでは$$),
        (3, $$ならでは$$),
        (4, $$ならでは$$),
        (5, $$ならでは$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
