-- n2-grammar-60 — 〜ことにはならない
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-60',
    'grammar',
    'N2',
    $$〜ことにはならない$$,
    $$koto ni wa naranai$$,
    $$Não significa que / Não equivale a / Não conta como$$,
    $$ことにはならない é usado para dizer que uma ação não é suficiente para ser considerada outra coisa. Equivale a "não significa que", "não equivale a" ou "não conta como".

A ideia é corrigir uma conclusão apressada. Por exemplo, "só assistir uma vez não significa que você entendeu" ou "comprar o livro não conta como estudar".

Muitas vezes, a primeira parte usa だけでは ou ただ, mostrando que aquilo é pouco para chegar à conclusão.

Ele vem depois da forma た do verbo (ou da forma simples) + ことにはならない. Também é comum a forma ということにはならない.$$,
    $$Essa estrutura é muito útil em argumentos e conselhos, para mostrar que algo é insuficiente.

Compare com ことになる (fica decidido / resulta em), que é a forma afirmativa.

É comum em falas de professores e pais: 謝ればいいということにはならない ("pedir desculpas não resolve tudo").$$,
    $$… + だけでは、 + Verbo na forma た + ことにはならない
Frase + ということにはならない

Educado: ことにはなりません$$,
    $$ことにはならない$$,
    $$ことにはならない|ことにはなりません|ことにならない$$,
    ARRAY['こと', 'に', 'は', 'ならない']::text[],
    ARRAY['ことにはならない', 'ことにはなりません', 'ということにはならない']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-60', $$一度見ただけでは、理解したことにはならない。$$, $$いちどみただけでは、りかいしたことにはならない。$$, $$Só ter visto uma vez não significa que você entendeu.$$),
    ('n2-grammar-60', $$謝っただけでは、責任を取ったことにはならない。$$, $$あやまっただけでは、せきにんをとったことにはならない。$$, $$Só pedir desculpas não equivale a assumir a responsabilidade.$$),
    ('n2-grammar-60', $$本を買っただけでは、勉強したことにはならない。$$, $$ほんをかっただけでは、べんきょうしたことにはならない。$$, $$Só comprar o livro não conta como estudar.$$),
    ('n2-grammar-60', $$黙っていても、問題を解決したことにはならない。$$, $$だまっていても、もんだいをかいけつしたことにはならない。$$, $$Ficar calado não significa que o problema foi resolvido.$$),
    ('n2-grammar-60', $$一回勝っただけでは、強いということにはならない。$$, $$いっかいかっただけでは、つよいということにはならない。$$, $$Vencer uma vez só não significa que você é forte.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$授業に出ただけでは、勉強した____。$$, $$Só ir à aula não significa que você estudou.$$),
        (2, $$計画を立てただけでは、実行した____。$$, $$Só fazer o plano não equivale a executá-lo.$$),
        (3, $$知っているだけでは、できる____。$$, $$Só saber não significa conseguir fazer.$$),
        (4, $$謝れば許される____。$$, $$Pedir desculpas não significa que você será perdoado.$$),
        (5, $$一度話しただけで、友達になった____。$$, $$Ter conversado uma vez não significa que viraram amigos.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-60', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことにはならない$$),
        (1, $$ことにはなりません$$),
        (2, $$ことにはならない$$),
        (2, $$ことにはなりません$$),
        (3, $$ことにはならない$$),
        (3, $$ことにはなりません$$),
        (4, $$ことにはならない$$),
        (4, $$ことにはなりません$$),
        (5, $$ことにはならない$$),
        (5, $$ことにはなりません$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
