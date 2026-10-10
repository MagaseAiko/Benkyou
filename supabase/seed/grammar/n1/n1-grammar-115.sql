-- n1-grammar-115 — 〜にかかっている
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n1-grammar-115',
    'grammar',
    'N1',
    $$〜にかかっている$$,
    $$ni kakatte iru$$,
    $$Depende de / Está nas mãos de / Tudo depende de$$,
    $$にかかっている indica que um resultado depende totalmente de algo ou de alguém. Equivale a "depende de" ou "está nas mãos de".

A pessoa destaca o fator decisivo para o sucesso ou fracasso. Por exemplo, "o futuro da empresa depende de vocês" ou "passar ou não depende do esforço".

Muitas vezes aparece com かどうか ou か antes.$$,
    $$É parecido com 次第だ e によって決まる.

A forma 命がかかっている significa "a vida está em jogo".$$,
    $$Substantivo + にかかっている
Frase + かどうかは + Substantivo + にかかっている$$,
    $$にかかっている$$,
    $$にかかっている|にかかっています|に懸かっている|にかかってる$$,
    ARRAY['に', 'かかって', 'いる']::text[],
    ARRAY['にかかっている', 'にかかっています', 'に懸かっている']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n1-grammar-115', $$会社の将来は、君たちの努力にかかっている。$$, $$かいしゃのしょうらいは、きみたちのどりょくにかかっている。$$, $$O futuro da empresa depende do esforço de vocês.$$),
    ('n1-grammar-115', $$試合に勝てるかどうかは、最後の五分にかかっている。$$, $$しあいにかてるかどうかは、さいごのごふんにかかっている。$$, $$Vencer ou não a partida depende dos últimos cinco minutos.$$),
    ('n1-grammar-115', $$成功するかどうかは、準備にかかっています。$$, $$せいこうするかどうかは、じゅんびにかかっています。$$, $$Ter sucesso ou não depende da preparação.$$),
    ('n1-grammar-115', $$この国の未来は、若者にかかっている。$$, $$このくにのみらいは、わかものにかかっている。$$, $$O futuro deste país está nas mãos dos jovens.$$),
    ('n1-grammar-115', $$患者の命は、医者の判断にかかっている。$$, $$かんじゃのいのちは、いしゃのはんだんにかかっている。$$, $$A vida do paciente depende da decisão do médico.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$合格できるかどうかは、これからの頑張り____。$$, $$Passar ou não depende do esforço daqui em diante.$$),
        (2, $$チームの勝利は、彼の活躍____。$$, $$A vitória do time depende do desempenho dele.$$),
        (3, $$この計画の成否は、資金集め____。$$, $$O sucesso deste plano depende da captação de recursos.$$),
        (4, $$店が続けられるかは、お客様の評価____。$$, $$Se a loja vai continuar depende da avaliação dos clientes.$$),
        (5, $$地球の環境は、私たち一人一人の行動____。$$, $$O meio ambiente da Terra depende das ações de cada um de nós.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n1-grammar-115', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にかかっている$$),
        (1, $$にかかっています$$),
        (2, $$にかかっている$$),
        (2, $$にかかっています$$),
        (3, $$にかかっている$$),
        (3, $$にかかっています$$),
        (4, $$にかかっている$$),
        (4, $$にかかっています$$),
        (5, $$にかかっている$$),
        (5, $$にかかっています$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
