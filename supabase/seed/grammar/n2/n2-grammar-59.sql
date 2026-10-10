-- n2-grammar-59 — 〜ことに
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n2-grammar-59',
    'grammar',
    'N2',
    $$〜ことに$$,
    $$koto ni$$,
    $$Para minha surpresa / Infelizmente / Felizmente$$,
    $$ことに é usado no começo de uma frase para expressar o sentimento de quem fala sobre o que vai ser dito. Ele aparece depois de adjetivos ou verbos de sentimento.

As formas mais comuns são:
• 驚いたことに: para minha surpresa.
• うれしいことに: para minha alegria, felizmente.
• 残念なことに: infelizmente.
• 不思議なことに: curiosamente.
• 幸いなことに: por sorte, felizmente.
• 困ったことに: para piorar, o problema é que.

A ideia é: "o que é surpreendente / triste / bom é que...". O sentimento vem primeiro, e o fato vem depois.

Ele vem depois de adjetivos い, adjetivos な com な e verbos na forma た.$$,
    $$ことに soa um pouco formal e aparece muito em textos, notícias e relatos.

Na conversa, as pessoas costumam dizer simplesmente 驚いたけど ou 残念だけど.

幸いなことに é muito comum em notícias, como em "felizmente, não houve feridos".$$,
    $$Adjetivo い (sentimento) + ことに、 + Fato
Adjetivo な + な + ことに、 + Fato
Verbo de sentimento na forma た + ことに、 + Fato$$,
    $$ことに$$,
    $$ことに$$,
    ARRAY['こと', 'に']::text[],
    ARRAY['ことに']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n2-grammar-59', $$驚いたことに、彼は試験に合格した。$$, $$おどろいたことに、かれはしけんにごうかくした。$$, $$Para minha surpresa, ele passou na prova.$$),
    ('n2-grammar-59', $$うれしいことに、来週友達が遊びに来る。$$, $$うれしいことに、らいしゅうともだちがあそびにくる。$$, $$Para minha alegria, um amigo vem me visitar semana que vem.$$),
    ('n2-grammar-59', $$残念なことに、雨で試合は中止になった。$$, $$ざんねんなことに、あめでしあいはちゅうしになった。$$, $$Infelizmente, a partida foi cancelada por causa da chuva.$$),
    ('n2-grammar-59', $$不思議なことに、誰もそのことを覚えていなかった。$$, $$ふしぎなことに、だれもそのことをおぼえていなかった。$$, $$Curiosamente, ninguém se lembrava disso.$$),
    ('n2-grammar-59', $$幸いなことに、けが人はいなかった。$$, $$さいわいなことに、けがにんはいなかった。$$, $$Felizmente, não houve feridos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$残念な____、彼はパーティーに来られなかった。$$, $$Infelizmente, ele não pôde vir à festa.$$),
        (2, $$驚いた____、彼女は一人で全部やった。$$, $$Para minha surpresa, ela fez tudo sozinha.$$),
        (3, $$困った____、財布を忘れてしまった。$$, $$O problema é que acabei esquecendo a carteira.$$),
        (4, $$うれしい____、試験に合格した。$$, $$Para minha alegria, passei na prova.$$),
        (5, $$面白い____、二人は同じ日に生まれた。$$, $$Curiosamente, os dois nasceram no mesmo dia.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n2-grammar-59', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$ことに$$),
        (2, $$ことに$$),
        (3, $$ことに$$),
        (4, $$ことに$$),
        (5, $$ことに$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
