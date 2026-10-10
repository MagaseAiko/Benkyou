-- n2-grammar-95 — 〜に応えて
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-95',
    'grammar',
    'N2',
    $$〜に応えて$$,
    $$ni kotaete$$,
    $$Atendendo a / Em resposta a / Correspondendo a$$,
    $$に応えて indica que alguém age para atender a um pedido, uma expectativa ou um desejo de outras pessoas. Equivale a "atendendo a" ou "em resposta a".

Costuma vir com palavras como pedido, expectativa, desejo, voz e apoio. Por exemplo, "atendendo aos pedidos dos fãs, a banda fez um bis".

É uma expressão formal, comum em notícias e anúncios.$$,
    $$Palavras comuns antes são 期待, 要望, 声援, 希望 e リクエスト.

Não se confunde com に答えて, que é responder a uma pergunta.$$,
    $$Substantivo + に応えて
Substantivo + に応える + Substantivo$$,
    $$に応えて$$,
    $$に応えて|に応え|にこたえて|に応える$$,
    ARRAY['に', '応えて']::text[],
    ARRAY['に応えて', 'に応え', 'に応える', 'にこたえて']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-95', $$ファンの声援に応えて、選手は手を振った。$$, $$ファンのせいえんにこたえて、せんしゅはてをふった。$$, $$Em resposta à torcida, o atleta acenou.$$),
    ('n2-grammar-95', $$客の要望に応えて、営業時間を延長した。$$, $$きゃくのようぼうにこたえて、えいぎょうじかんをえんちょうした。$$, $$Atendendo ao pedido dos clientes, ampliamos o horário de funcionamento.$$),
    ('n2-grammar-95', $$両親の期待に応えて、彼は医者になった。$$, $$りょうしんのきたいにこたえて、かれはいしゃになった。$$, $$Correspondendo às expectativas dos pais, ele se tornou médico.$$),
    ('n2-grammar-95', $$アンコールに応え、もう一曲歌った。$$, $$アンコールにこたえ、もういっきょくうたった。$$, $$Atendendo ao pedido de bis, cantou mais uma música.$$),
    ('n2-grammar-95', $$市民の声に応える政治が必要だ。$$, $$しみんのこえにこたえるせいじがひつようだ。$$, $$É preciso uma política que responda à voz dos cidadãos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$リクエスト____、その曲をもう一度演奏した。$$, $$Atendendo ao pedido, tocaram aquela música mais uma vez.$$),
        (2, $$社員の希望____、在宅勤務を導入した。$$, $$Atendendo ao desejo dos funcionários, adotamos o trabalho remoto.$$),
        (3, $$皆さんの期待____、全力で頑張ります。$$, $$Para corresponder às expectativas de todos, vou me esforçar ao máximo.$$),
        (4, $$読者の要望____、続編が出版された。$$, $$Atendendo ao pedido dos leitores, a continuação foi publicada.$$),
        (5, $$観客の拍手____、歌手は再び登場した。$$, $$Em resposta aos aplausos do público, a cantora voltou ao palco.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-95', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$に応えて$$),
        (1, $$に応え$$),
        (1, $$にこたえて$$),
        (2, $$に応えて$$),
        (2, $$に応え$$),
        (2, $$にこたえて$$),
        (3, $$に応えて$$),
        (3, $$に応え$$),
        (3, $$にこたえて$$),
        (4, $$に応えて$$),
        (4, $$に応え$$),
        (4, $$にこたえて$$),
        (5, $$に応えて$$),
        (5, $$に応え$$),
        (5, $$にこたえて$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
