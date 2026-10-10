-- n4-grammar-66 — お〜になる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-66',
    'grammar',
    'N4',
    $$お〜になる$$,
    $$o ~ ni naru$$,
    $$Fazer (respeitoso)$$,
    $$お〜になる é uma forma respeitosa (尊敬語) de falar das ações de outra pessoa, como um cliente, um professor ou um superior. Ela eleva a pessoa que faz a ação.

Ela é formada colocando お antes do verbo na forma ます sem ます, e になる depois. Por exemplo, "voltar" vira お帰りになる, e "ler" vira お読みになる.

O significado do verbo continua o mesmo; só o nível de respeito muda. Ela é muito usada em situações de trabalho, atendimento e com pessoas mais velhas.

Assim como outros verbos respeitosos, ela nunca é usada para as próprias ações.$$,
    $$Alguns verbos não usam お〜になる porque têm formas respeitosas próprias: いる / 行く / 来る → いらっしゃる, する → なさる, 言う → おっしゃる, 見る → ご覧になる, 食べる → 召し上がる.

Verbos com forma ます de uma só sílaba, como 見る (見ます) e 寝る (寝ます), também não usam essa estrutura.

Para pedir algo respeitosamente, a forma relacionada é お〜ください.$$,
    $$お + Verbo na forma ます sem ます + になる
お + Verbo sem ます + になります (educado)

Passado: お〜になった / お〜になりました$$,
    $$お〜になる$$,
    $$お帰りにな|お待ちにな|お読みにな|お書きにな|お使いにな|お出かけにな|お会いにな|お休みにな|お決めにな|お聞きにな|お持ちにな$$,
    ARRAY['お', 'になる']::text[],
    ARRAY['お〜になる', 'お〜になります', 'お〜になりました']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-66', $$社長はもうお帰りになりました。$$, $$しゃちょうはもうおかえりになりました。$$, $$O presidente já foi embora.$$),
    ('n4-grammar-66', $$先生はこの本をお読みになりましたか。$$, $$せんせいはこのほんをおよみになりましたか。$$, $$O professor já leu este livro?$$),
    ('n4-grammar-66', $$部長は何時にお出かけになりますか。$$, $$ぶちょうはなんじにおでかけになりますか。$$, $$A que horas o gerente vai sair?$$),
    ('n4-grammar-66', $$このペンをお使いになりますか。$$, $$このペンをおつかいになりますか。$$, $$O senhor vai usar esta caneta?$$),
    ('n4-grammar-66', $$少しお休みになったらいかがですか。$$, $$すこしおやすみになったらいかがですか。$$, $$Que tal o senhor descansar um pouco?$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$先生は何時ごろ____か。（帰る）$$, $$A que horas o professor volta? (voltar)$$),
        (2, $$お客様がロビーで____います。（待つ）$$, $$O cliente está esperando no saguão. (esperar)$$),
        (3, $$社長はこの資料をもう____か。（読む）$$, $$O presidente já leu este documento? (ler)$$),
        (4, $$田中先生にはもう____か。（会う）$$, $$O senhor já se encontrou com o professor Tanaka? (encontrar)$$),
        (5, $$どちらの部屋に____か。（決める）$$, $$Qual quarto o senhor escolheu? (decidir)$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-66', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$お帰りになります$$),
        (2, $$お待ちになって$$),
        (3, $$お読みになりました$$),
        (4, $$お会いになりました$$),
        (5, $$お決めになりました$$),
        (5, $$お決めになります$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
