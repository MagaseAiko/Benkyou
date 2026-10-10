-- n3-grammar-79 — 〜に慣れる
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-79',
    'grammar',
    'N3',
    $$〜に慣れる$$,
    $$ni nareru$$,
    $$Acostumar-se com / Habituar-se a$$,
    $$に慣れる é usado para dizer que alguém se acostumou com uma situação, um lugar, uma atividade ou um ambiente. Equivale a "acostumar-se com" ou "habituar-se a".

A coisa com que a pessoa se acostuma é marcada com に. Pode ser um substantivo, como "a vida no Japão", ou uma ação transformada em substantivo com こと, como "usar hashi".

Na forma ている, 慣れている indica que a pessoa já está acostumada. Na forma てきた, 慣れてきた indica que ela está se acostumando aos poucos.

Na forma negativa, まだ慣れていない significa "ainda não me acostumei", muito usado por quem acabou de chegar a algum lugar.$$,
    $$A expressão もう慣れました é uma resposta comum quando alguém pergunta se você já se adaptou a um lugar novo.

O substantivo 慣れ significa "costume" ou "prática", como em 慣れが必要だ (é preciso prática).

Para "deixar alguém acostumado", usa-se 慣らす.$$,
    $$Substantivo + に + 慣れる
Verbo + こと + に + 慣れる

Já acostumado: 慣れている / 慣れています
Acostumando-se aos poucos: 慣れてきた
Ainda não: まだ慣れていない

Escrita: 慣れる / なれる$$,
    $$に慣れる$$,
    $$慣れ$$,
    ARRAY['に', '慣れる']::text[],
    ARRAY['に慣れる', 'に慣れた', 'に慣れている', 'に慣れてきた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-79', $$日本に来て一年、日本の生活に慣れました。$$, $$にほんにきていちねん、にほんのせいかつになれました。$$, $$Faz um ano que vim ao Japão, e me acostumei com a vida aqui.$$),
    ('n3-grammar-79', $$新しい仕事にまだ慣れていない。$$, $$あたらしいしごとにまだなれていない。$$, $$Ainda não me acostumei com o novo trabalho.$$),
    ('n3-grammar-79', $$早く新しい学校に慣れるといいですね。$$, $$はやくあたらしいがっこうになれるといいですね。$$, $$Tomara que você se acostume logo com a nova escola.$$),
    ('n3-grammar-79', $$寒さに慣れるまで、時間がかかった。$$, $$さむさになれるまで、じかんがかかった。$$, $$Levou um tempo até eu me acostumar com o frio.$$),
    ('n3-grammar-79', $$最近、箸を使うことに慣れてきた。$$, $$さいきん、はしをつかうことになれてきた。$$, $$Ultimamente, estou me acostumando a usar hashi.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$日本の食べ物にもう____。$$, $$Já me acostumei com a comida japonesa.$$),
        (2, $$引っ越したばかりで、新しい環境にまだ____。$$, $$Acabei de me mudar e ainda não me acostumei com o novo ambiente.$$),
        (3, $$早く仕事に____ように頑張ります。$$, $$Vou me esforçar para me acostumar logo com o trabalho.$$),
        (4, $$満員電車に____まで、大変だった。$$, $$Até me acostumar com os trens lotados, foi difícil.$$),
        (5, $$一人暮らしにも少しずつ____。$$, $$Estou me acostumando aos poucos a morar sozinho.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-79', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$慣れました$$),
        (1, $$慣れた$$),
        (2, $$慣れていない$$),
        (2, $$慣れていません$$),
        (3, $$慣れる$$),
        (4, $$慣れる$$),
        (5, $$慣れてきた$$),
        (5, $$慣れてきました$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
