-- n2-grammar-45 — 〜かねない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-45',
    'grammar',
    'N2',
    $$〜かねない$$,
    $$kanenai$$,
    $$Pode acabar / Há o risco de / Não é impossível que$$,
    $$かねない é usado para dizer que existe o risco de algo ruim acontecer. Equivale a "pode acabar...", "há o risco de..." ou "não é impossível que...".

Ele vem depois do verbo na forma ます sem ます. Por exemplo, 事故になりかねない (pode acabar virando um acidente) ou 誤解されかねない (há o risco de ser mal interpretado).

O resultado é sempre negativo. A ideia é alertar para um perigo ou uma consequência indesejada, muitas vezes como aviso ou crítica.

Também pode descrever uma pessoa capaz de fazer algo ruim: "ele seria capaz de dizer uma coisa dessas".

Apesar da forma negativa, o sentido é afirmativo: "pode acontecer".$$,
    $$かねない é usado só para possibilidades negativas. Para algo positivo, usa-se かもしれない.

É muito comum em avisos, notícias e alertas de segurança.

Não confunda com かねる (N2), que significa "não poder fazer" de forma educada.$$,
    $$Verbo na forma ます sem ます + かねない
Verbo sem ます + かねません (educado)

Escrita: かねない / 兼ねない$$,
    $$かねない$$,
    $$かねない|かねません|兼ねない$$,
    ARRAY['かねない']::text[],
    ARRAY['かねない', 'かねません']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-45', $$このままでは、大きな事故になりかねない。$$, $$このままでは、おおきなじこになりかねない。$$, $$Se continuar assim, pode acabar virando um grande acidente.$$),
    ('n2-grammar-45', $$そんなことを言ったら、誤解されかねない。$$, $$そんなことをいったら、ごかいされかねない。$$, $$Se disser uma coisa dessas, há o risco de ser mal interpretado.$$),
    ('n2-grammar-45', $$無理をすると、病気になりかねない。$$, $$むりをすると、びょうきになりかねない。$$, $$Se exagerar, pode acabar ficando doente.$$),
    ('n2-grammar-45', $$彼なら、そんなひどいことも言いかねない。$$, $$かれなら、そんなひどいこともいいかねない。$$, $$Ele seria capaz de dizer até uma coisa tão cruel dessas.$$),
    ('n2-grammar-45', $$スピードを出しすぎると、事故を起こしかねません。$$, $$スピードをだしすぎると、じこをおこしかねません。$$, $$Correr demais pode acabar causando um acidente.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$寝不足が続くと、体を壊し____。$$, $$Se continuar dormindo pouco, pode acabar prejudicando a saúde.$$),
        (2, $$このままでは、会社が倒産し____。$$, $$Se continuar assim, a empresa pode acabar falindo.$$),
        (3, $$不注意な一言が、人を傷つけ____。$$, $$Uma palavra descuidada pode acabar magoando alguém.$$),
        (4, $$彼はうそもつき____人だ。$$, $$Ele é uma pessoa capaz de mentir.$$),
        (5, $$確認しないと、大きなミスにつながり____。$$, $$Se não conferir, pode acabar levando a um grande erro.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-45', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$かねない$$),
        (1, $$かねません$$),
        (2, $$かねない$$),
        (2, $$かねません$$),
        (3, $$かねない$$),
        (3, $$かねません$$),
        (4, $$かねない$$),
        (5, $$かねない$$),
        (5, $$かねません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
