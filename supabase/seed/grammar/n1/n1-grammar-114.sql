-- n1-grammar-114 — 〜にかかっては / 〜にかかったら / 〜にかかると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-114',
    'grammar',
    'N1',
    $$〜にかかっては / 〜にかかったら / 〜にかかると$$,
    $$ni kakatte wa / ni kakattara / ni kakaru to$$,
    $$Nas mãos de / Diante de / Quando se trata de$$,
    $$にかかっては, にかかったら e にかかると indicam que, diante de uma pessoa com uma habilidade ou característica muito forte, ninguém consegue resistir. Equivalem a "nas mãos de" ou "diante de".

A segunda parte mostra que algo fica fácil ou impossível de evitar por causa daquela pessoa. Por exemplo, "nas mãos dele, qualquer máquina volta a funcionar" ou "diante da minha mãe, ninguém consegue mentir".

O tom pode ser de admiração ou de leve ironia.$$,
    $$Muitas vezes a segunda parte mostra impotência, como かなわない ou 勝てない.

É usado principalmente com pessoas que têm uma habilidade marcante.$$,
    $$Substantivo (pessoa) + にかかっては + Frase
Substantivo (pessoa) + にかかったら + Frase
Substantivo (pessoa) + にかかると + Frase$$,
    $$にかかっては$$,
    $$にかかっては|にかかったら|にかかると|にかかれば$$,
    ARRAY['に', 'かかって', 'は']::text[],
    ARRAY['にかかっては', 'にかかったら', 'にかかると', 'にかかれば']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-114', $$彼にかかっては、どんな機械もすぐに直ってしまう。$$, $$かれにかかっては、どんなきかいもすぐになおってしまう。$$, $$Nas mãos dele, qualquer máquina volta a funcionar na hora.$$),
    ('n1-grammar-114', $$母にかかったら、どんな嘘もすぐにばれる。$$, $$ははにかかったら、どんなうそもすぐにばれる。$$, $$Diante da minha mãe, qualquer mentira é descoberta na hora.$$),
    ('n1-grammar-114', $$あの弁護士にかかると、どんな裁判も勝ってしまう。$$, $$あのべんごしにかかると、どんなさいばんもかってしまう。$$, $$Nas mãos daquele advogado, qualquer processo acaba ganho.$$),
    ('n1-grammar-114', $$子供にかかっては、親もかなわない。$$, $$こどもにかかっては、おやもかなわない。$$, $$Diante dos filhos, nem os pais conseguem resistir.$$),
    ('n1-grammar-114', $$彼女にかかれば、どんな料理もおいしくなる。$$, $$かのじょにかかれば、どんなりょうりもおいしくなる。$$, $$Nas mãos dela, qualquer prato fica gostoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$あの先生____、どんな難しい問題も簡単に見える。$$, $$Nas mãos daquele professor, qualquer problema difícil parece fácil.$$),
        (2, $$祖父____、誰も口では勝てない。$$, $$Diante do meu avô, ninguém ganha uma discussão.$$),
        (3, $$この犬____、どんな靴もぼろぼろになる。$$, $$Nas mãos deste cachorro, qualquer sapato vira trapo.$$),
        (4, $$彼のトーク____、どんな人も笑ってしまう。$$, $$Diante da conversa dele, qualquer pessoa acaba rindo.$$),
        (5, $$あの名探偵____、どんな事件も解決する。$$, $$Nas mãos daquele grande detetive, qualquer caso é resolvido.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-114', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかかっては$$),
        (1, $$にかかったら$$),
        (1, $$にかかると$$),
        (1, $$にかかれば$$),
        (2, $$にかかっては$$),
        (2, $$にかかったら$$),
        (2, $$にかかると$$),
        (3, $$にかかっては$$),
        (3, $$にかかったら$$),
        (3, $$にかかると$$),
        (4, $$にかかっては$$),
        (4, $$にかかったら$$),
        (4, $$にかかると$$),
        (5, $$にかかっては$$),
        (5, $$にかかったら$$),
        (5, $$にかかると$$),
        (5, $$にかかれば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
