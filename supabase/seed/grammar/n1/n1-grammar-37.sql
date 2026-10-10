-- n1-grammar-37 — 〜いかんだ / 〜いかんでは / 〜いかんによっては
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-37',
    'grammar',
    'N1',
    $$〜いかんだ / 〜いかんでは / 〜いかんによっては$$,
    $$ikan da / ikan dewa / ikan ni yotte wa$$,
    $$Depende de / Dependendo de / Conforme$$,
    $$いかん indica que algo depende de uma condição. Equivale a "depende de" ou "dependendo de".

いかんだ fica no fim da frase, como "o resultado depende do seu esforço". いかんでは e いかんによっては indicam que, dependendo da condição, algo especial pode acontecer, como "dependendo do resultado, o plano pode ser cancelado".

É uma expressão muito formal, usada em documentos, notícias e discursos.$$,
    $$É uma forma formal de 次第だ e によって.

Expressões comuns são 結果いかん, 努力いかん e 対応いかん.$$,
    $$Substantivo + いかんだ
Substantivo + の + いかんでは / いかんによっては
Substantivo + いかんで$$,
    $$いかんだ$$,
    $$いかんだ|いかんでは|いかんによっては|いかんによって|いかんで|いかんです$$,
    ARRAY['いかん', 'だ']::text[],
    ARRAY['いかんだ', 'いかんでは', 'いかんによっては', 'いかんで']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-37', $$合格できるかどうかは、本人の努力いかんだ。$$, $$ごうかくできるかどうかは、ほんにんのどりょくいかんだ。$$, $$Passar ou não depende do esforço da própria pessoa.$$),
    ('n1-grammar-37', $$結果いかんでは、計画を中止することもある。$$, $$けっかいかんでは、けいかくをちゅうしすることもある。$$, $$Dependendo do resultado, o plano pode ser cancelado.$$),
    ('n1-grammar-37', $$天候のいかんによっては、試合が延期されます。$$, $$てんこうのいかんによっては、しあいがえんきされます。$$, $$Dependendo do tempo, a partida será adiada.$$),
    ('n1-grammar-37', $$今後の対応いかんで、会社の評価が決まる。$$, $$こんごのたいおういかんで、かいしゃのひょうかがきまる。$$, $$A avaliação da empresa será definida conforme a resposta daqui em diante.$$),
    ('n1-grammar-37', $$成功するかどうかは準備いかんです。$$, $$せいこうするかどうかはじゅんびいかんです。$$, $$Ter sucesso ou não depende da preparação.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$勝敗は選手の体調____。$$, $$A vitória ou derrota depende da condição física dos atletas.$$),
        (2, $$成績の____、奨学金がもらえないこともある。$$, $$Dependendo das notas, pode ser que não receba a bolsa.$$),
        (3, $$交渉の結果____、値段が変わる。$$, $$O preço muda conforme o resultado da negociação.$$),
        (4, $$参加者数の____、会場を変更します。$$, $$Dependendo do número de participantes, mudaremos o local.$$),
        (5, $$この計画が成功するかは、資金____。$$, $$Se este plano terá sucesso depende dos recursos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-37', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$いかんだ$$),
        (1, $$いかんです$$),
        (2, $$いかんでは$$),
        (2, $$いかんによっては$$),
        (3, $$いかんで$$),
        (3, $$いかんによって$$),
        (4, $$いかんでは$$),
        (4, $$いかんによっては$$),
        (5, $$いかんだ$$),
        (5, $$いかんです$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
