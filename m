Return-Path: <jailhouse-dev+bncBDPNRNUM4INBBUHA6CHAMGQESKRCETQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 767D548994C
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jan 2022 14:10:41 +0100 (CET)
Received: by mail-wr1-x43b.google.com with SMTP id i23-20020adfaad7000000b001a6320b66b9sf2294945wrc.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Jan 2022 05:10:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1641820241; cv=pass;
        d=google.com; s=arc-20160816;
        b=IamWe0biEO1HxcmiBkUrmfDQHE/PTeGg0onExhXZ7cTIMgsO0uDReB0Xj5x7zotGN4
         iNKdyhp8OXiOvXRAOdvsjc5BhuVE3dsD78YWWf01L1bFZFQ5YA+llEwzF0+FefWwFzXg
         toX4e2C3zO4yXxz2tzPNndmcdWxQLWm87u6rhW369OFTSVDcL/B9DfTD/5cEp/1WDzym
         3i1O4J39JRP2uySYq5vmgaFvP7lIxj3TWZ5nMA5UcgTPbqLKsjWqRo1DRDfpIbjg6WOy
         EEUTtG4TrpKDCB+cdhjnclWOirBS8Yg9M7xr1Oot+5x3VUsvsGKr5v1f55QeXM3yQIDX
         /MmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :reply-to:mime-version:sender:dkim-signature:dkim-signature;
        bh=MSukUyUBol2z3ZqwIbwZk44rPfoDlO8ghYEypegaiQQ=;
        b=eFcfpjeRMIQWbw/XiSrjAyoJdS2SG6uvyMaWBoIQrOIPh2mqdEZOPQDahnmZKbW497
         /YgqWEjinItcsZr2CwxJX3NZOgT3+1DOnr1KtOAtXby1mG4sfgBSUIiKBrSLpcEIb1NQ
         4E+0mFeLix7vsdL8dwtocQHVpQOP7mY5pZndmllpQ1nJhcTDtzOZVYoRdC6uKjMEqfdX
         Lsrbm76UCEsFxehaBupQoNl1AYePqleqqt2bj2jaLRkcSPf9yKmHAkUqO7ou3fbonzKy
         YRjnW8Oqcar8U8sIvsovUqJwkO0udbWlLaf0zibXG4qHEuKWCbCKKwiheYNmNYOSBJBl
         7GtQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=MxUO5WRT;
       spf=pass (google.com: domain of westernunion.benin982@gmail.com designates 2a00:1450:4864:20::131 as permitted sender) smtp.mailfrom=westernunion.benin982@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MSukUyUBol2z3ZqwIbwZk44rPfoDlO8ghYEypegaiQQ=;
        b=OhTbUzB0CJSUtcCVOUmJA7YguQSOeGqkmb4aRgmr6Yb4bOQ3UmP+P4+lIzIKzqUIMq
         qfVfhWwQJdNw1UhmOTJWO5h01AExSXxfYGQ8qHdAEInMlMHKmHzHP6D9PJizjPTIGQBB
         bGPA2V8jnVZyMYZSQXdWy2arkszy7u+oIxMvqNA9l3K9QfOLO2pYm99Twx49lzWVEuid
         8Oo81VghFNJ17bb90cfIOLgB+z4lEoPZWGiLvIqfg1mAarrdSSHk7Zs8aRMLuOvEP/m6
         w2kZdTM1l+7Eh9i5iJk1ltggyebFsLaWXyEYxU+3sEGOnCqWr1HZHfeV1lS20BBVq0Bp
         TSZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MSukUyUBol2z3ZqwIbwZk44rPfoDlO8ghYEypegaiQQ=;
        b=NKuf5OPmJ2ToOnFulBbnB1FwG2p620bfd/EGNjTowc+ys7g9dN3lYjK+hdy+/qfjaB
         5k0nxt0XHfdNUWBKho7QxboHOZXYNo9GYG0gjjXumU9n4xDI5h73c/IliTLKQeiOWDr1
         QyoWxdg7YRbesFM5k1p3xhzG218fgP8LxGjPvd1iQBDmuvLnbJHUO+M5+h5AnrKAVTTt
         VT9x3UXuwyFEgXvaIxJd/6rQiQySJsJVj/mDziUU1FGjYDpDPKibMu6+jrfQYyREpPJn
         erpo6eUllzTt/fqWAGIdo5EeUTk1eUuyZcibg8y9Kx/qI4uCczWyyGiojJHZ/LtxLCTF
         //tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:reply-to:from:date
         :message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MSukUyUBol2z3ZqwIbwZk44rPfoDlO8ghYEypegaiQQ=;
        b=C8XhaV6l3UIiEV9tdzEYosZh3FoFewfsnCqjBS0VYjl0J9VZOw4pb90S4dslB1mxl4
         rzbsryYHZFobIAnZV0LXS5igQQFP6sZhuDJceydwHhqZ188Kl42darpNkTeOgFtmvjH/
         hI+XVJhcDlHmweHJxxUJnwBw+/yhrljBVQsDTgWLdph8B2dy9jZVEfNc5IGdZqjDam9O
         MCNz7Hu2pcSZac2JzCshRUEeeN6nGyDp//6SgitQQPrDdUOfp7Lu1LOLqMDdT8lWjWph
         D+OWSc/zuOnd7qGzfvz6yBUcw+aZdOFNCaDJF2rF3aqROOSqRUETcJ46KMz0Vy7Pi9bn
         5qrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530QNci8f4dHqZW5oTFRsbeEs0tYyPWhkxV/DfmAePeeKsVuCqbQ
	DOzednu8+8mHIArrYpAsIKw=
X-Google-Smtp-Source: ABdhPJx8rbxFBXcCLjQAGbLWbILzDWfIZRJiL8ZOiI5yCLsUxoRBvn66RrVWjig6wjatxfnhKQULAQ==
X-Received: by 2002:adf:f1cf:: with SMTP id z15mr3165030wro.134.1641820241117;
        Mon, 10 Jan 2022 05:10:41 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2142:: with SMTP id h63ls6538405wmh.0.canary-gmail; Mon,
 10 Jan 2022 05:10:40 -0800 (PST)
X-Received: by 2002:a7b:c40c:: with SMTP id k12mr4938521wmi.185.1641820240206;
        Mon, 10 Jan 2022 05:10:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641820240; cv=none;
        d=google.com; s=arc-20160816;
        b=S07qKqLRv6iFwiU6hGgkZopsQOF2xXQ6g7wwacxaFY/ZmNs/fcOWVB2yz8QLeFTxAi
         BgLPA9QMWjyxfFkTVc+FTorLwHy1HIw4MoFKqB3nrZEH8cmJiNzkYfW7a07b8ibkkGNG
         XPgitJ6qivPPY/+QJQrhMgKGRDS6bZcyieJL5HVlayz6wAtCQKZyzE+ttGyvIgb9F8bl
         87Mtu0R1vSo3BTuovt1bORfSCFVimeMTt93ixCaUKl3EyaPV8gJh2T67Jg83tyhFd/gF
         n1K0aHSzwqbxi0ZFyRNf/gvV9XAitpgCjw/bP9pNrXuVvTpAPzlaHVkM8QYSTCgcFSEP
         25Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=STst/NZz7XpLuhkw/fjT1YooCLQUEgoChj9j28RAYfs=;
        b=kXNwyZVxU/iugnp+6axboFGxrbUVordg1edX1AtBUPcmCmy5zkBo031JBDmm1n91G4
         T9auTy1Ju5XXimZ4GCnkQBqbQAHVz224jv2W2i5O6fMOorHB833UizfIOFGXKJujgmSk
         3pa4zXSH45J1YMT5Z1habOCSw7iXEYwX4fm2ZF87Vy8/cLAuXuG+LHa3vm5OAv5G9DkB
         dgsqQukXe67FKAPNSmzplmaplSX0+aGyVtd1G17nyPWZ02gpgfBcHP38RMhAu6psBk9c
         wtxYFFPLgsDv4dlwNHYs2nNkuPrmwZubgKlJrN79FXP4Y4knpBfa3XtlImUIjg2uGOoh
         RNUg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=MxUO5WRT;
       spf=pass (google.com: domain of westernunion.benin982@gmail.com designates 2a00:1450:4864:20::131 as permitted sender) smtp.mailfrom=westernunion.benin982@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com. [2a00:1450:4864:20::131])
        by gmr-mx.google.com with ESMTPS id ay4si275423wrb.2.2022.01.10.05.10.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jan 2022 05:10:40 -0800 (PST)
Received-SPF: pass (google.com: domain of westernunion.benin982@gmail.com designates 2a00:1450:4864:20::131 as permitted sender) client-ip=2a00:1450:4864:20::131;
Received: by mail-lf1-x131.google.com with SMTP id o12so44208319lfk.1
        for <jailhouse-dev@googlegroups.com>; Mon, 10 Jan 2022 05:10:40 -0800 (PST)
X-Received: by 2002:a05:6512:b1d:: with SMTP id w29mr63965537lfu.219.1641820239421;
 Mon, 10 Jan 2022 05:10:39 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6504:15d1:0:0:0:0 with HTTP; Mon, 10 Jan 2022 05:10:38
 -0800 (PST)
Reply-To: gtbank107@yahoo.com
From: Barr Robert Richter <westernunion.benin982@gmail.com>
Date: Mon, 10 Jan 2022 14:10:38 +0100
Message-ID: <CAP=nHBLx9+oZZEXh4NOqjqVYOsF7h6SEbjGzy47zap3iwt--uQ@mail.gmail.com>
Subject: Contact GT Bank-Benin to receive your transfer amount of $18.5m US Dollars.
To: undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: westernunion.benin982@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=MxUO5WRT;       spf=pass
 (google.com: domain of westernunion.benin982@gmail.com designates
 2a00:1450:4864:20::131 as permitted sender) smtp.mailfrom=westernunion.benin982@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

Attn,Dear
I need you to know that the fear of the LORD is
the beginning of wisdom, and knowledge of the Holy One is
understanding. As power of God Most High. And This is the confidence
we have in approaching God, that if we ask anything according to his
will, he hears us. I will make you know that Slow and steady wins the race.
It is your turn to receive your overdue compensation funds total
amount $18.5Milion  USD.
I actualized that you will receive your transfer today without any more delay
No More fee OK, Believe me , I am your Attorney standing here on your favor.
I just concluded conversation with the Gt Bank Director, Mrs Mary Gate
And She told me that your transfer is ready today

So the Bank Asked you to contact them immediately by re-confirming
your Bank details asap.
Because this is the Only thing holding this transfer
If you did not trust me and Mrs Mary Gate,Who Else will you Trust?
For we are the ones trying to protect your funds here
and make sure that your funds is secure.
So Promisingly, I am here to assure you, that Grate Miracle is coming on
your way, and this funds total amount of $18.500,000 is your
compensation, entitlement inheritance overdue funds on your name.
Which you cannot let anything delay you from receiving your funds now,

Finally i advised you to try your possible best and contact Gt Bank Benin
once you get this message to receive your transfer $18.5 USD today.
I know that a journey of thousand miles begins with a single step.
Always put your best foot forward
Try as hard as you can, God give you best.
take my advice and follow the due process of your payment, the
transfer will be released to
you smoothly without any hitches or hindrance.

Contact DR.MRS MARY GATE, Director Gt bank-Benin to receive your
transfer amount of $18.5m US Dollars
It was deposited and registered to your name this morning.
Contact the Bank now to know when they will transfer to your
country today

Email id: gtbank107@yahoo.com
Tel/mobile, +229 99069872
Contact person, Mrs Mary Gate,Director Gt bank-Benin.
Among the blind the one-eyed man is king

As you sow, so you shall reap, i want you to receive your funds
Best things in life are free
Send to her your Bank Details as i listed here.

Your account name-------------
Your Bank Name----------------
Account Number----------
your Bank address----------
Country-----------
Your private phone number---------
Routing Numbers-------------
Swift Code-----------

Note, Your funds is %100 Percent ready for
transfer.
Everything you do remember that Good things come to those who wait.
I have done this work for you with my personally effort, Honesty is
the best policy.
now your transfer is currently deposited with paying bank this morning.
It is by the grace of God that I received Christ, having known the truth.
I had no choice than to do what is lawful and justice in the
sight of God for eternal life and in the sight of man for witness of
God & His Mercies and glory upon my life.

send this needed bank details to the bank today, so that you receive
your transfer today as
it is available for your confirmation today.
Please do your best as a serious person and send the fee urgent, Note
that this transfer of $18.500.000 M USD is a Gift from God to Bless
you.

If you did not contact the bank urgent, finally the Bank will release
your transfer of $18.500.000M USD to  Mr. David Bollen as your
representative.
So not allow another to claim your Money.
Thanks For your Understanding.

Barr Robert Richter, UN Attorney At Law Court-Benin

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAP%3DnHBLx9%2BoZZEXh4NOqjqVYOsF7h6SEbjGzy47zap3iwt--uQ%40mail.gmail.com.
