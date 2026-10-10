-- n3-grammar-118 — 〜ために
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-118',
    'grammar',
    'N3',
    $$〜ために$$,
    $$tame ni$$,
    $$Para / A fim de / Por causa de$$,
    $$ために tem dois usos principais.

O primeiro é indicar objetivo ou finalidade: "para", "a fim de". A pessoa faz algo com uma intenção clara. Por exemplo, "estudo japonês para trabalhar no Japão" ou "trabalho duro pela minha família". Nesse uso, ele vem depois de verbos de ação na forma de dicionário, ou de substantivos com の.

O segundo é indicar causa: "por causa de", "devido a". Por exemplo, "por causa da neve, os trens pararam". Nesse uso, ele soa formal e aparece muito em avisos e notícias. Ele vem depois de substantivos com の e de verbos no passado ou na forma simples.

No uso de objetivo, o sujeito das duas partes costuma ser o mesmo, e o verbo antes de ために indica uma ação controlável. Para verbos de possibilidade ou estados, usa-se ように.

Antes de um substantivo, usa-se ための: 日本語を勉強するための本 (um livro para estudar japonês).$$,
    $$A diferença entre ために e ように é importante: ために é para ações intencionais (comprar, estudar, ir); ように é para resultados que não dependem só da vontade (conseguir, poder, não esquecer).

No uso de causa, ために soa mais formal que から ou ので, e é comum em anúncios de atraso.

Para pessoas, のために expressa dedicação: "fazer algo pela família".$$,
    $$Objetivo:
Verbo na forma de dicionário + ために + Ação
Substantivo + の + ために + Ação
… + ための + Substantivo

Causa (formal):
Substantivo + の + ために + Resultado
Verbo (forma simples) + ために + Resultado$$,
    $$ために$$,
    $$ために|為に|ための$$,
    ARRAY['ため', 'に']::text[],
    ARRAY['ために', 'ための', '為に']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-118', $$日本で働くために、日本語を勉強している。$$, $$にほんではたらくために、にほんごをべんきょうしている。$$, $$Estou estudando japonês para trabalhar no Japão.$$),
    ('n3-grammar-118', $$家族のために、一生懸命働いている。$$, $$かぞくのために、いっしょうけんめいはたらいている。$$, $$Trabalho duro pela minha família.$$),
    ('n3-grammar-118', $$健康のために、毎朝走っています。$$, $$けんこうのために、まいあさはしっています。$$, $$Corro toda manhã pela saúde.$$),
    ('n3-grammar-118', $$大雪のために、電車が止まった。$$, $$おおゆきのために、でんしゃがとまった。$$, $$Por causa da nevasca, os trens pararam.$$),
    ('n3-grammar-118', $$病気のために、学校を休みました。$$, $$びょうきのために、がっこうをやすみました。$$, $$Faltei à escola por causa de uma doença.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$車を買う____、お金を貯めている。$$, $$Estou juntando dinheiro para comprar um carro.$$),
        (2, $$子供の____、おもちゃを買った。$$, $$Comprei um brinquedo para o meu filho.$$),
        (3, $$試験に合格する____、毎日勉強している。$$, $$Estudo todo dia para passar na prova.$$),
        (4, $$台風の____、試合が中止になった。$$, $$Por causa do tufão, a partida foi cancelada.$$),
        (5, $$事故があった____、道が混んでいる。$$, $$Por causa de um acidente, o trânsito está ruim.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ために$$),
        (2, $$ために$$),
        (3, $$ために$$),
        (4, $$ために$$),
        (5, $$ために$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
