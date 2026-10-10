-- n2-grammar-65 — 全く〜ない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-65',
    'grammar',
    'N2',
    $$全く〜ない$$,
    $$mattaku ~ nai$$,
    $$Nem um pouco / De jeito nenhum / Absolutamente não$$,
    $$全く junto com uma forma negativa reforça a negação de forma total. Equivale a "nem um pouco", "de jeito nenhum" ou "absolutamente não".

Indica que não existe nenhuma exceção ou quantidade. Por exemplo, "não entendi absolutamente nada" ou "não estou nem um pouco cansado".

Também pode aparecer sozinho, como interjeição, para mostrar irritação, com o sentido de "francamente!".$$,
    $$É parecido com 全然〜ない, mas 全く soa um pouco mais formal.

Com frases afirmativas, 全く significa "realmente" ou "completamente", como em "concordo completamente".$$,
    $$全く + Verbo (forma ない)
全く + Adjetivo い (forma くない)
全く + Adjetivo な / Substantivo + ではない$$,
    $$全く〜ない$$,
    $$全く|まったく$$,
    ARRAY['全く', 'ない']::text[],
    ARRAY['全く〜ない', 'まったく〜ない', '全く〜ません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-65', $$彼の話は全くわからなかった。$$, $$かれのはなしはまったくわからなかった。$$, $$Não entendi absolutamente nada do que ele disse.$$),
    ('n2-grammar-65', $$この薬は全く効かない。$$, $$このくすりはまったくきかない。$$, $$Este remédio não faz efeito nenhum.$$),
    ('n2-grammar-65', $$昨日のことは全く覚えていない。$$, $$きのうのことはまったくおぼえていない。$$, $$Não me lembro de nada de ontem.$$),
    ('n2-grammar-65', $$この映画は全く面白くなかった。$$, $$このえいがはまったくおもしろくなかった。$$, $$Este filme não teve graça nenhuma.$$),
    ('n2-grammar-65', $$彼女はお酒を全く飲みません。$$, $$かのじょはおさけをまったくのみません。$$, $$Ela não bebe nada de álcool.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$その件については____知りません。$$, $$Não sei absolutamente nada sobre esse assunto.$$),
        (2, $$ここからは山が____見えない。$$, $$Daqui não dá para ver a montanha de jeito nenhum.$$),
        (3, $$試験の結果は____よくなかった。$$, $$O resultado da prova não foi nada bom.$$),
        (4, $$彼は____反省していないようだ。$$, $$Parece que ele não está nem um pouco arrependido.$$),
        (5, $$この問題は____難しくない。$$, $$Este problema não é nem um pouco difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-65', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$全く$$),
        (1, $$まったく$$),
        (2, $$全く$$),
        (2, $$まったく$$),
        (3, $$全く$$),
        (3, $$まったく$$),
        (4, $$全く$$),
        (4, $$まったく$$),
        (5, $$全く$$),
        (5, $$まったく$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
