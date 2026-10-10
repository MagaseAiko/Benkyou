-- n2-grammar-49 — 〜から見ると
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-49',
    'grammar',
    'N2',
    $$〜から見ると$$,
    $$kara miru to$$,
    $$Do ponto de vista de / Visto por / Para$$,
    $$から見ると é usado para indicar o ponto de vista de alguém ou de um grupo, mostrando como algo parece a partir dessa perspectiva. Equivale a "do ponto de vista de", "visto por" ou "para".

A primeira parte indica quem está olhando (crianças, estrangeiros, pais, especialistas), e a segunda mostra a impressão ou o julgamento a partir desse olhar.

Por exemplo, "do ponto de vista das crianças, os adultos parecem saber tudo" ou "para os estrangeiros, os costumes japoneses são curiosos".

As formas から見れば, から見て e から見ても também são usadas. から見ても significa "mesmo do ponto de vista de", reforçando a avaliação.

Também pode indicar um ponto de vista físico: "vista de fora, esta casa parece muito velha".$$,
    $$Comparado a から言うと, から見ると foca mais na percepção de alguém, e から言うと, no critério usado para julgar.

É muito útil para falar de diferenças culturais.

Para a própria opinião, 私から見て ("do meu ponto de vista") soa natural e modesto.$$,
    $$Substantivo (pessoa / grupo) + から見ると / から見れば / から見て、 + Impressão / Julgamento
Substantivo + から見ても + … (mesmo do ponto de vista de)

Escrita: から見ると / からみると$$,
    $$から見ると$$,
    $$から見ると|からみると|から見れば|からみれば|から見て|から見ても$$,
    ARRAY['から', '見ると']::text[],
    ARRAY['から見ると', 'から見れば', 'から見て', 'から見ても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-49', $$子供から見ると、大人は何でも知っているようだ。$$, $$こどもからみると、おとなはなんでもしっているようだ。$$, $$Do ponto de vista das crianças, os adultos parecem saber tudo.$$),
    ('n2-grammar-49', $$外国人から見ると、日本の習慣は不思議だ。$$, $$がいこくじんからみると、にほんのしゅうかんはふしぎだ。$$, $$Para os estrangeiros, os costumes japoneses são curiosos.$$),
    ('n2-grammar-49', $$親から見れば、子供はいつまでも子供だ。$$, $$おやからみれば、こどもはいつまでもこどもだ。$$, $$Para os pais, os filhos são sempre crianças.$$),
    ('n2-grammar-49', $$私から見て、彼は努力家だ。$$, $$わたしからみて、かれはどりょくかだ。$$, $$Do meu ponto de vista, ele é muito esforçado.$$),
    ('n2-grammar-49', $$専門家から見ても、この絵は素晴らしい。$$, $$せんもんかからみても、このえはすばらしい。$$, $$Mesmo do ponto de vista de um especialista, este quadro é maravilhoso.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$若者____、昔の音楽は新鮮だ。$$, $$Para os jovens, a música antiga é uma novidade.$$),
        (2, $$先生____、彼はいい学生だ。$$, $$Do ponto de vista do professor, ele é um bom aluno.$$),
        (3, $$外____、この家はとても古く見える。$$, $$Vista de fora, esta casa parece muito velha.$$),
        (4, $$日本人____、ブラジルの十二月の夏は不思議だろう。$$, $$Para os japoneses, o verão de dezembro no Brasil deve ser estranho.$$),
        (5, $$客の立場____、この店のサービスは悪い。$$, $$Do ponto de vista do cliente, o atendimento desta loja é ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-49', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$から見ると$$),
        (1, $$から見れば$$),
        (2, $$から見ると$$),
        (2, $$から見れば$$),
        (3, $$から見ると$$),
        (3, $$から見れば$$),
        (4, $$から見ると$$),
        (4, $$から見れば$$),
        (5, $$から見ると$$),
        (5, $$から見れば$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
