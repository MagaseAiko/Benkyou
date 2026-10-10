-- n4-grammar-118 — 受身形（〜られる）
BEGIN;

-- grammar
INSERT INTO public.grammar (id, type, level, japanese, reading, translation, explanation, notes, structure, base_form, match_regex, tokens, variations)
VALUES (
    'n4-grammar-118',
    'grammar',
    'N4',
    $$受身形（〜られる）$$,
    $$ukemikei$$,
    $$Ser (feito) / Voz passiva / Sofrer (uma ação)$$,
    $$A forma passiva (受身形) é usada quando o foco está em quem recebe a ação, e não em quem a faz. Equivale a "ser + particípio" do português, como "ser elogiado".

A pessoa que faz a ação é marcada com に, e quem recebe a ação é o sujeito.

O japonês tem três usos principais da passiva:
• Passiva direta: alguém recebe a ação diretamente, como "fui elogiado pelo professor".
• Passiva de incômodo (迷惑の受身): a pessoa é afetada negativamente por algo que alguém fez, como "meu irmão comeu meu bolo" (e isso me incomodou). Também funciona com verbos sem objeto, como "fui pego pela chuva".
• Passiva neutra: para fatos objetivos, quando quem fez não importa, como "este templo foi construído há oitocentos anos".

A passiva de incômodo é muito característica do japonês e expressa o sentimento de quem foi prejudicado.$$,
    $$A passiva dos verbos do grupo 2 tem a mesma forma da potencial (食べられる). O contexto mostra qual é o sentido.

Em notícias e textos formais, a passiva neutra é muito comum, com expressões como 〜によって作られた.

Quando a ação é positiva, como receber ajuda, os japoneses preferem てもらう à passiva.$$,
    $$Grupo 1: último som "u" → "a" + れる (書く → 書かれる / 言う → 言われる)
Grupo 2: tire る + られる (食べる → 食べられる)
Irregulares: する → される / 来る → 来られる (こられる)

Pessoa afetada + は / が + Quem fez + に + Verbo passivo
Pessoa + は + Quem fez + に + Objeto + を + Verbo passivo (incômodo)$$,
    $$られる$$,
    $$られ|かれ|がれ|され|たれ|まれ|われ|ばれ|なれ$$,
    ARRAY['られる', 'れる']::text[],
    ARRAY['られる', 'れる', 'られた', 'れた']::text[]
);

-- examples
INSERT INTO public.examples (grammar_id, japanese, reading, translation)
VALUES
    ('n4-grammar-118', $$テストでいい点を取って、先生に褒められました。$$, $$テストでいいてんをとって、せんせいにほめられました。$$, $$Tirei uma nota boa na prova e fui elogiado pelo professor.$$),
    ('n4-grammar-118', $$弟にケーキを食べられた。$$, $$おとうとにケーキをたべられた。$$, $$Meu irmão mais novo comeu o meu bolo.$$),
    ('n4-grammar-118', $$電車の中で足を踏まれました。$$, $$でんしゃのなかであしをふまれました。$$, $$Pisaram no meu pé dentro do trem.$$),
    ('n4-grammar-118', $$雨に降られて、服が濡れてしまった。$$, $$あめにふられて、ふくがぬれてしまった。$$, $$Fui pego pela chuva e minhas roupas ficaram molhadas.$$),
    ('n4-grammar-118', $$この寺は八百年前に建てられました。$$, $$このてらははっぴゃくねんまえにたてられました。$$, $$Este templo foi construído há oitocentos anos.$$);

-- review_sentences + review_answers
WITH src (k, sentence, translation) AS (
    VALUES
        (1, $$子供のころ、よく母に叱____。$$, $$Quando criança, eu levava muita bronca da minha mãe.$$),
        (2, $$駅で知らない人に名前を呼____。$$, $$Na estação, uma pessoa desconhecida me chamou pelo nome.$$),
        (3, $$電車の中で財布を盗____。$$, $$Roubaram minha carteira dentro do trem.$$),
        (4, $$このお祭りは毎年八月に行わ____。$$, $$Este festival é realizado todo ano em agosto.$$),
        (5, $$友達に秘密を話____て、困った。$$, $$Meu amigo contou o meu segredo, e fiquei numa situação difícil.$$)
),
inserted_reviews AS (
    INSERT INTO public.review_sentences (grammar_id, sentence, translation)
    SELECT 'n4-grammar-118', sentence, translation FROM src ORDER BY k
    RETURNING id, sentence
),
ans (k, answer) AS (
    VALUES
        (1, $$られました$$),
        (1, $$られた$$),
        (2, $$ばれました$$),
        (2, $$ばれた$$),
        (3, $$まれました$$),
        (3, $$まれた$$),
        (4, $$れます$$),
        (4, $$れる$$),
        (5, $$され$$)
)
INSERT INTO public.review_answers (review_sentence_id, answer)
SELECT r.id, a.answer
FROM ans a
JOIN src s ON s.k = a.k
JOIN inserted_reviews r ON r.sentence = s.sentence
ORDER BY a.k;

COMMIT;
