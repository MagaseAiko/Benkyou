-- n3-grammar-53 — 〜くらい・〜ぐらい
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-53',
    'grammar',
    'N3',
    $$〜くらい・〜ぐらい$$,
    $$kurai / gurai$$,
    $$Cerca de / Tanto que / Pelo menos / Ninguém tão... quanto$$,
    $$くらい (ou ぐらい) tem vários usos importantes no N3.

• Quantidade aproximada: "cerca de", "mais ou menos", como "uns dez minutos".
• Grau: indica o quanto algo é intenso, com um exemplo, como "estava tão triste que queria chorar". É parecido com ほど.
• Mínimo esperado: indica algo simples que, no mínimo, deveria ser feito, com um tom de crítica, como "pelo menos o seu quarto, limpe você mesmo".
• Comparação máxima: com ない, indica que ninguém ou nada é tão... quanto aquilo, como "não há ninguém tão gentil quanto ele".

くらい e ぐらい são usadas da mesma forma. ぐらい é um pouco mais comum depois de substantivos e na fala.$$,
    $$Para horários, usa-se ごろ, e não くらい: 三時ごろ (por volta das três), mas 三時間くらい (cerca de três horas).

No uso de "pelo menos", くらい costuma ter um tom de cobrança, como algo que é o mínimo esperado.

Para grau, くらい é um pouco mais coloquial que ほど.$$,
    $$Número / Quantidade + くらい (cerca de)
Verbo / Adjetivo (forma simples) + くらい (grau: tanto que)
Substantivo + くらい + Verbo (pelo menos: crítica)
Substantivo + くらい + Adjetivo + Substantivo + は + ない (ninguém tão... quanto)

Escrita: くらい / ぐらい$$,
    $$くらい$$,
    $$くらい|ぐらい$$,
    ARRAY['くらい', 'ぐらい']::text[],
    ARRAY['くらい', 'ぐらい']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-53', $$家から駅まで歩いて十分くらいです。$$, $$いえからえきまであるいてじゅっぷんくらいです。$$, $$De casa até a estação são uns dez minutos a pé.$$),
    ('n3-grammar-53', $$その映画は、泣きたいくらい悲しかった。$$, $$そのえいがは、なきたいくらいかなしかった。$$, $$Esse filme foi tão triste que deu vontade de chorar.$$),
    ('n3-grammar-53', $$自分の部屋ぐらい自分で掃除しなさい。$$, $$じぶんのへやぐらいじぶんでそうじしなさい。$$, $$Pelo menos o seu quarto, limpe você mesmo.$$),
    ('n3-grammar-53', $$彼くらい優しい人はいない。$$, $$かれくらいやさしいひとはいない。$$, $$Não há ninguém tão gentil quanto ele.$$),
    ('n3-grammar-53', $$その知らせを聞いて、声が出ないくらい驚いた。$$, $$そのしらせをきいて、こえがでないくらいおどろいた。$$, $$Fiquei tão surpreso com a notícia que perdi a voz.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$毎日二時間____勉強しています。$$, $$Estudo cerca de duas horas todo dia.$$),
        (2, $$お腹が痛くて、立てない____だった。$$, $$Estava com tanta dor de barriga que não conseguia ficar de pé.$$),
        (3, $$朝の挨拶____ちゃんとしなさい。$$, $$Pelo menos o bom-dia, dê direito.$$),
        (4, $$母____料理が上手な人はいない。$$, $$Não há ninguém que cozinhe tão bem quanto minha mãe.$$),
        (5, $$疲れて、もう一歩も歩けない____だ。$$, $$Estou tão cansado que não consigo dar mais nem um passo.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-53', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$くらい$$),
        (1, $$ぐらい$$),
        (2, $$くらい$$),
        (2, $$ぐらい$$),
        (3, $$くらい$$),
        (3, $$ぐらい$$),
        (4, $$くらい$$),
        (4, $$ぐらい$$),
        (5, $$くらい$$),
        (5, $$ぐらい$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
