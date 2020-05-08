Return-Path: <jailhouse-dev+bncBC2PTC4R4MNBBPOG2X2QKGQEO7FYPEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C87B81CB0ED
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 May 2020 15:48:46 +0200 (CEST)
Received: by mail-oi1-x238.google.com with SMTP id c6sf6381265oib.12
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 May 2020 06:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zlCmblzpOr1jx09x3vqoMAdZzpw/Fj38CRhYeIV21zo=;
        b=OTlunanhQgNS56C/8YsXnFj/ObEfbR6qttcwXOGK743SzoXhAQQ2LvFejvXc/BgnFK
         kMaCnO5ULXb8eeqjEHMNiUlKQTzAyzgOVlUDQSpOTSQUPrhP/YdDr7LP1uF4OLvzTEry
         hJ258s4uMha/aCW6GZ5PIqw0dbduwEB6OgZEG/I5Z8Gqxmea+sK8ULWmBL4SzOJNvYCi
         YKLPQArJUOoVq6qr54QxJDPjrG5ADb/1js9Ofj/sWLnEaWpX1X1svaC5hmJDkT/ncV7v
         fjh9RZoHSBxhI7VMVCcjaKr4flarXeg9VUjGn8Xe41AzPPapWy/W6AlRLq6cF1lfDX7q
         Vcgg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zlCmblzpOr1jx09x3vqoMAdZzpw/Fj38CRhYeIV21zo=;
        b=ux1Ov2u+7nFZrA7OqKZxRXxHezL0APHj2kZ+pkZUADkeGXzYSvVU4VnjEADHcE89sC
         IKSOM1XerT5v21CSGy6bs44994SpuN6/Tt8y/5fD35eEJxYEeJXq8LHpCHVEdihXmY3L
         cHAwLMnmXENwu6H8DmPH+gH3i4XsP/Win5mOBTQIR5IsdkS3/7Vr7GmdVxbP1y0XhttM
         odylAxGDfg+a7akrtlBGYREQAuJ8fFcNWnFeEtlYFMufb1PQj1epYNy5FzeJNN5G2t9E
         dzXrZJLH4T+iym9DML4HT00HH8RA9TsLAKnhK+7qFPWzNPmdeaXKzxpgSLfj/sezaCAZ
         6FQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zlCmblzpOr1jx09x3vqoMAdZzpw/Fj38CRhYeIV21zo=;
        b=jk6U+qT64mbFCk5JQTYWMHoabJ4bg8SDMH1XOKo+KAI07aGlvLfoKy3biFPPtNDlyD
         NlE9GgmzKwo8k8jxwtLWd+xFYb2UwEULAQS3t2p8zxzbQgPR8OlIawDV1Jgcg/nl3DcV
         FbaQL48rjl5qHZMsnG3oqyx/kxew8IeMNfeJVZLz0gxrTKYBgOQyySS0cR9QP8AlxcYg
         JdfwG0i+P8YEoF7ajHp2AdY/yLzZDMs8JEMvbgAJKMgL3gD7xaevvldJZeb74eQaiQ+B
         l4SZZqhx2kdbJYyzzD/f37gyeH2+cd6RflaG+6oXRVjZh/MhWfrL+8+bII3Gjj3/md6b
         47qA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuYU5wTJR69wlHdq3omuRLcQtKzqgl98g+7OGwHVF+eKayGeLBeN
	53jz4ek7OFWS/7WLsE+qMWY=
X-Google-Smtp-Source: APiQypIkwvuT4faYCx13RXKTN80jMyDpF9MSpYnv7YWisg2krUEugIrTsdxk+J3D7Qtn1UYORJAMMg==
X-Received: by 2002:aca:4155:: with SMTP id o82mr10956017oia.16.1588945725534;
        Fri, 08 May 2020 06:48:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6808:84:: with SMTP id s4ls2284271oic.2.gmail; Fri, 08
 May 2020 06:48:45 -0700 (PDT)
X-Received: by 2002:a05:6808:356:: with SMTP id j22mr10820274oie.147.1588945724848;
        Fri, 08 May 2020 06:48:44 -0700 (PDT)
Date: Fri, 8 May 2020 06:48:44 -0700 (PDT)
From: Chung-Fan Yang <sonic.tw.tp@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <0fabe986-8e7d-4905-89af-75ec7e4d20ff@googlegroups.com>
Subject: Ivshmem-2 driver for x86_64 root Linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_460_2077997103.1588945724245"
X-Original-Sender: Sonic.tw.tp@gmail.com
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

------=_Part_460_2077997103.1588945724245
Content-Type: multipart/alternative; 
	boundary="----=_Part_461_1422889495.1588945724245"

------=_Part_461_1422889495.1588945724245
Content-Type: text/plain; charset="UTF-8"

Hi, 

I am upgrading from v9.1 to most recent version of Jailhouse recently.

As the ivshmem version has changed, the old drivers and way of doing no 
longer works.

I am curious should I cherry-pick the commits on the jailhouse-linux git to 
my kernel source?

http://git.kiszka.org/?p=linux.git;a=shortlog;h=refs/heads/queues/jailhouse 

Or I can just use the Jailhouse enabled branches in

https://github.com/siemens/linux

Or both way it will work?

I am curious that besides of the special ivshmem2 driver and patches to 
uio, are there any other significant changes to the kernel source?

Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx and it works 
like a charm without any noticeable bugs.

BR,

Yang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0fabe986-8e7d-4905-89af-75ec7e4d20ff%40googlegroups.com.

------=_Part_461_1422889495.1588945724245
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi, <br></div><div><br></div><div>I am upgrading from=
 v9.1 to most recent version of Jailhouse recently.</div><div><br></div><di=
v>As the ivshmem version has changed, the old drivers and way of doing no l=
onger works.</div><div><br></div><div>I am curious should I cherry-pick the=
 commits on the jailhouse-linux git to my kernel source?</div><div><br>http=
://git.kiszka.org/?p=3Dlinux.git;a=3Dshortlog;h=3Drefs/heads/queues/jailhou=
se <br></div><div><br></div><div>Or I can just use the Jailhouse enabled br=
anches in<br></div><div><br></div><div>https://github.com/siemens/linux</di=
v><div><br></div><div>Or both way it will work?</div><div><br></div><div>I =
am curious that besides of the special ivshmem2 driver and patches to uio, =
are there any other significant changes to the kernel source?</div><div><br=
></div><div>Because I am using stock 4.19 with PREEMPT_RT, i can run Nuttx =
and it works like a charm without any noticeable bugs.<br></div><div><br></=
div><div>BR,<br></div><div><br></div><div>Yang<br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/0fabe986-8e7d-4905-89af-75ec7e4d20ff%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/0fabe986-8e7d-4905-89af-75ec7e4d20ff%40googlegroups.com<=
/a>.<br />

------=_Part_461_1422889495.1588945724245--

------=_Part_460_2077997103.1588945724245--
