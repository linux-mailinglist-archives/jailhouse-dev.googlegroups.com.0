Return-Path: <jailhouse-dev+bncBC6PHVWAREERBY7EWS2AMGQEOL3YPYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb37.google.com (mail-yb1-xb37.google.com [IPv6:2607:f8b0:4864:20::b37])
	by mail.lfdr.de (Postfix) with ESMTPS id B75A292B9F7
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2024 14:51:49 +0200 (CEST)
Received: by mail-yb1-xb37.google.com with SMTP id 3f1490d57ef6-dfd377669d6sf1418767276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jul 2024 05:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1720529508; x=1721134308; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7iC1LWTGCdeYrQ0h3m2ZAl5BEdg0v32A5tDRfLeS/c=;
        b=ZBCr/OhOyFmND2UvCCKVnwwt6a7PSiAc+dfjgbpIGIYc47MntZ2eJSiL+NOdSYj0+E
         XCQ/baHkJDh75yu3CMoLNjF4hqUI54LzdXO0+2N5TErf9iGKjd9hkUEnT8J5t29NFqOO
         MQOl1U+4oGG/FtKLq9KB0m7tzmnotUEGb/mIdfFS157ywMxpkeAjJMo8auogj1Rapex/
         MECWwOUql67JrqO0hOne+WfSS4Z5uSN2JLG0UwgAMLmha3F+e43IQP+TkHCCRlb6I1V8
         Wj0bGrI2cmdqwPLfM1pBI3oO1EwyeZBPOxLSkzJTDW9Q/xEnIAMbt4wBKNX6FrSopAr0
         7cow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720529508; x=1721134308; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M7iC1LWTGCdeYrQ0h3m2ZAl5BEdg0v32A5tDRfLeS/c=;
        b=l1XjFO88NzC3OOz7KblxlnuZykQyb+Y8H9eqtfwQqGLzTXdb9+WChg6xl3jQeSoWre
         F+STfbLcSvNltoChafy8H6p270hk7exoVt2LZdc6ZVtX93zkG+bvCsLrnHrsTW3stmKg
         7C16pMmC5xzbYLHRtEfDBFqWc1JF8kqioyP7yx4E/KOvfYHCi+958W6gasXNuNqti8e+
         0v6+Rxb08K3bJqqHWCqi96AVsV91Iq5I9qOfEQN/jMWLYdrFfYulxkso1S535HusR7tE
         fcXYrTmFh0blgmLKcJ0e1PXCmlGxSP24YkttkNjUnWIC9J4VlhcFypKdZu0Ltv55H2Ug
         orIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720529508; x=1721134308;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M7iC1LWTGCdeYrQ0h3m2ZAl5BEdg0v32A5tDRfLeS/c=;
        b=grePuOu1ebre3EwY2OntyJLFRht+KmsnMKFbjj3/jHOnXyJ3Oq7EPKxWrq1cc2ilyO
         3y7VW66unNEdXJuwUZNjZH2suhRLGF0U56+5wOu/QNvfWiXksnDaEAcw9uT6XqMDe3RZ
         ywsWWVJdZVNyU0Laagj2t7bAojwSN4WQ5QiudhxIhOrKMGM96P0sNNyn7/voPqclv1DN
         0u1YKk0xP0RlzUNOoPML4T7Mz35avjEa6AolRNoD0bp1sEnkjEGXHmvEkN53usG2LL1b
         rQ8DVgF8TrG9ccG8C7hxifin0/qWRW5ASY+gRr0SMm7hVKwBaZ+svuobX07rj8vEibsa
         mfng==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCU7+Zd03rnfKQ5Msq8QDiNHqt2TvI0xmjWO8iCueSJErBg83hg4/0GAwL62ncuSH3hasWhDV04tPBHGK+pU5bGlYJ+SAh7un/rn3gU=
X-Gm-Message-State: AOJu0YzSBrS6OZ5pQxPcZK+9ZLs0sevTWkJV5O/NwMJqeVqCINhrtT8f
	zWN2SjSQ3o6Ek/1gc5EquuetnktgNDHjJ36Guwg1tRpslNhYTIHb
X-Google-Smtp-Source: AGHT+IF//JuT6ZWWjN2pkS/Id+I93+hRLs/33Jj0UuFR02O6ftem4vrPIcC542n7JY7EDjbhHGZ7bg==
X-Received: by 2002:a25:84cb:0:b0:e03:af0f:f487 with SMTP id 3f1490d57ef6-e041af41bcamr2387555276.0.1720529508399;
        Tue, 09 Jul 2024 05:51:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6902:18c4:b0:e03:6457:383f with SMTP id
 3f1490d57ef6-e03bd13cf8els2467121276.1.-pod-prod-09-us; Tue, 09 Jul 2024
 05:51:47 -0700 (PDT)
X-Received: by 2002:a05:6902:188f:b0:dfb:b4e:407a with SMTP id 3f1490d57ef6-e041b1153e5mr265214276.9.1720529507113;
        Tue, 09 Jul 2024 05:51:47 -0700 (PDT)
Date: Tue, 9 Jul 2024 05:51:46 -0700 (PDT)
From: ecstasyclinic pharmacy <ecstasyclinicpharmacy@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bc2ff443-e0d0-460c-bdfa-829d0db42c6cn@googlegroups.com>
Subject: pregabalin for sale
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_133224_287366613.1720529506492"
X-Original-Sender: ecstasyclinicpharmacy@gmail.com
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

------=_Part_133224_287366613.1720529506492
Content-Type: multipart/alternative; 
	boundary="----=_Part_133225_1497686606.1720529506492"

------=_Part_133225_1497686606.1720529506492
Content-Type: text/plain; charset="UTF-8"

Your best online shop to get plantinum quality products online, 
pain,anxiety pills, and research chemicals.
Be 100% assured about the quality and genuineness of the product, and you 
will also be able to buy legal hallucinogens at a fair price.

ORDER DIRECTLY ON OUR Telegram
message @Clackderby1

Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv

Buy  mdma champagne ,ketamine for sale,order crystal meth online,Roxicodone 
for sale,buy vicodin online,order oxycontin online,mantrax for 
sale,tramadol for sale,buy xanax online,pregabalin for sale,buy 
morphine,order amphetamine online,viagra for sale,retaline for sale,buy 
vyvanse online,ephedrine for sale, lsd for sale online ,cocaine for 
sale,dmt for sale ,ecstasy pills for sale online .

Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv
Telegram : https://t.me/ukverifiedv

-100% Discreet and Confidential ,
-Your personal details are 100% SECURE.,
-Your orders are 100% Secure and Anonymous.,
-Fast Worldwide Delivery (You can track and trace with your tracking number 
provided).

 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc2ff443-e0d0-460c-bdfa-829d0db42c6cn%40googlegroups.com.

------=_Part_133225_1497686606.1720529506492
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Your best online shop to get plantinum quality products online, pain,anxiet=
y pills, and research chemicals.<br />Be 100% assured about the quality and=
 genuineness of the product, and you will also be able to buy legal halluci=
nogens at a fair price.<br /><br />ORDER DIRECTLY ON OUR Telegram<br />mess=
age @Clackderby1<br /><br />Telegram : https://t.me/ukverifiedv<br />Telegr=
am : https://t.me/ukverifiedv<br />Telegram : https://t.me/ukverifiedv<br /=
>Telegram : https://t.me/ukverifiedv<br /><br />Buy =C2=A0mdma champagne ,k=
etamine for sale,order crystal meth online,Roxicodone for sale,buy vicodin =
online,order oxycontin online,mantrax for sale,tramadol for sale,buy xanax =
online,pregabalin for sale,buy morphine,order amphetamine online,viagra for=
 sale,retaline for sale,buy vyvanse online,ephedrine for sale, lsd for sale=
 online ,cocaine for sale,dmt for sale ,ecstasy pills for sale online .<br =
/><br />Telegram : https://t.me/ukverifiedv<br />Telegram : https://t.me/uk=
verifiedv<br />Telegram : https://t.me/ukverifiedv<br />Telegram : https://=
t.me/ukverifiedv<br /><br />-100% Discreet and Confidential ,<br />-Your pe=
rsonal details are 100% SECURE.,<br />-Your orders are 100% Secure and Anon=
ymous.,<br />-Fast Worldwide Delivery (You can track and trace with your tr=
acking number provided).<br /><br />=C2=A0<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bc2ff443-e0d0-460c-bdfa-829d0db42c6cn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bc2ff443-e0d0-460c-bdfa-829d0db42c6cn%40googlegroups.co=
m</a>.<br />

------=_Part_133225_1497686606.1720529506492--

------=_Part_133224_287366613.1720529506492--
