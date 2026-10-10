-- n3-grammar-82 — 〜にしても
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n3-grammar-82',
    'grammar',
    'N3',
    $$〜にしても$$,
    $$ni shite mo$$,
    $$Mesmo que / Ainda que / Mesmo sendo$$,
    $$にしても é usado para admitir uma situação e, mesmo assim, apresentar uma opinião, uma crítica ou uma exigência que continua valendo. Equivale a "mesmo que", "ainda que" ou "mesmo sendo".

A primeira parte reconhece um fato ou uma possibilidade ("mesmo que esteja ocupado", "mesmo que fosse brincadeira"). A segunda parte mostra que, ainda assim, algo deveria ser diferente ("pelo menos ligar dá", "ela ficou magoada").

O tom é muitas vezes de crítica ou de cobrança.

Ele também aparece em pares, A にしても B にしても, com o sentido de "seja A ou B", mostrando que a conclusão vale para qualquer caso.

Vem depois da forma simples de verbos e adjetivos, e diretamente depois de substantivos.$$,
    $$それにしても, no começo da frase, significa "mesmo assim" ou "de qualquer forma", e é muito usado na conversa.

Em textos mais formais, にせよ e にしろ têm o mesmo sentido, e aparecem no N2.

Diferente de ても, にしても costuma expressar uma opinião de quem fala, muitas vezes com tom de crítica.$$,
    $$Verbo / Adjetivo (forma simples) + にしても、 + Opinião / Crítica
Substantivo + にしても
A + にしても、 + B + にしても (seja A ou B)

Variações formais: にせよ / にしろ$$,
    $$にしても$$,
    $$にしても$$,
    ARRAY['に', 'しても']::text[],
    ARRAY['にしても', 'にしても〜にしても']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n3-grammar-82', $$冗談にしても、言っていいことと悪いことがある。$$, $$じょうだんにしても、いっていいこととわるいことがある。$$, $$Mesmo sendo brincadeira, há coisas que se pode e que não se pode dizer.$$),
    ('n3-grammar-82', $$忙しいにしても、電話くらいはできるでしょう。$$, $$いそがしいにしても、でんわくらいはできるでしょう。$$, $$Mesmo ocupado, pelo menos uma ligação dá para fazer, né?$$),
    ('n3-grammar-82', $$行くにしても、行かないにしても、早く連絡してください。$$, $$いくにしても、いかないにしても、はやくれんらくしてください。$$, $$Vá ou não vá, me avise logo, por favor.$$),
    ('n3-grammar-82', $$遅れるにしても、連絡はするべきだ。$$, $$おくれるにしても、れんらくはするべきだ。$$, $$Mesmo que vá se atrasar, deveria avisar.$$),
    ('n3-grammar-82', $$冗談だったにしても、彼女は傷ついた。$$, $$じょうだんだったにしても、かのじょはきずついた。$$, $$Mesmo que tenha sido brincadeira, ela ficou magoada.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$疲れている____、挨拶ぐらいはしなさい。$$, $$Mesmo cansado, pelo menos cumprimente as pessoas.$$),
        (2, $$失敗した____、あきらめないで。$$, $$Mesmo que tenha falhado, não desista.$$),
        (3, $$パーティーに来ない____、連絡はしてほしい。$$, $$Mesmo que não venha à festa, queria que avisasse.$$),
        (4, $$子供のいたずら____、これはひどすぎる。$$, $$Mesmo sendo travessura de criança, isso é demais.$$),
        (5, $$高い____、一度は行ってみたい。$$, $$Mesmo sendo caro, quero ir pelo menos uma vez.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n3-grammar-82', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$にしても$$),
        (2, $$にしても$$),
        (3, $$にしても$$),
        (4, $$にしても$$),
        (5, $$にしても$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
