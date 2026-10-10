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
