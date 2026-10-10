-- n4-grammar-124 — 〜ようだ
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-124',
    'grammar',
    'N4',
    $$〜ようだ$$,
    $$you da$$,
    $$Parece que / Parece / Como se fosse$$,
    $$ようだ tem dois usos principais e é a versão mais formal de みたいだ.

O primeiro é fazer uma suposição baseada no que a pessoa percebe com os próprios sentidos ou em informações que tem. Equivale a "parece que". Por exemplo, ver as luzes apagadas e concluir que todos já foram dormir.

O segundo é fazer uma comparação, dizendo que algo se parece com outra coisa. Equivale a "parece" ou "como se fosse". É comum junto com まるで.

ようだ funciona como um substantivo. Por isso, vem depois de substantivos com の, depois de adjetivos な com な, e depois da forma simples de verbos e adjetivos い.

É mais comum na escrita e em situações formais. Na conversa casual, みたいだ é mais usado.$$,
    $$A diferença de ligação é importante: com ようだ, usa-se の depois de substantivos (休みのようだ); com みたいだ, não (休みみたいだ).

Comparando suposições: ようだ se baseia em observação direta; らしい, em informação ouvida; そうだ (aparência), na impressão visual imediata.

ようです é uma forma educada e cautelosa de dar uma informação sem afirmar com certeza absoluta.$$,
    $$Verbo / Adjetivo い (forma simples) + ようだ
Adjetivo な + な + ようだ
Substantivo + の + ようだ

Educado: ようです
Comparação: まるで + Substantivo + の + ようだ$$,
    $$ようだ$$,
    $$ようだ|ようです$$,
    ARRAY['よう', 'だ']::text[],
    ARRAY['ようだ', 'ようです']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-124', $$玄関で音がした。誰か来たようです。$$, $$げんかんでおとがした。だれかきたようです。$$, $$Teve um barulho na entrada. Parece que alguém chegou.$$),
    ('n4-grammar-124', $$彼は風邪をひいているようだ。$$, $$かれはかぜをひいているようだ。$$, $$Parece que ele está resfriado.$$),
    ('n4-grammar-124', $$みんなコートを着ている。外は寒いようですね。$$, $$みんなコートをきている。そとはさむいようですね。$$, $$Todo mundo está de casaco. Parece que está frio lá fora, né?$$),
    ('n4-grammar-124', $$電気が消えている。この店は今日休みのようだ。$$, $$でんきがきえている。このみせはきょうやすみのようだ。$$, $$As luzes estão apagadas. Parece que esta loja está fechada hoje.$$),
    ('n4-grammar-124', $$彼女はまるで人形のようだ。$$, $$かのじょはまるでにんぎょうのようだ。$$, $$Ela parece até uma boneca.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$電気が消えている。みんなもう寝た____。$$, $$As luzes estão apagadas. Parece que todos já foram dormir.$$),
        (2, $$道が濡れているから、雨が降った____。$$, $$A rua está molhada, então parece que choveu.$$),
        (3, $$田中さんは今日、忙しい____です。$$, $$Parece que o Tanaka está ocupado hoje.$$),
        (4, $$いつも人が並んでいる。あの店は人気がある____。$$, $$Sempre tem fila. Parece que aquela loja é popular.$$),
        (5, $$この部屋は静かで、まるで図書館の____。$$, $$Este quarto é tão silencioso que parece uma biblioteca.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-124', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ようだ$$),
        (1, $$ようです$$),
        (2, $$ようだ$$),
        (2, $$ようです$$),
        (3, $$よう$$),
        (4, $$ようだ$$),
        (4, $$ようです$$),
        (5, $$ようだ$$),
        (5, $$ようです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
