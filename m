Return-Path: <jailhouse-dev+bncBCT7DIPSUIGBBV442X4AKGQEUT2B5CY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DE3225983
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 09:57:13 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id z23sf7702421ote.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S8RWW2d7LJDeTLXJmJSbVixK46FiI+AHZ26uWG/kHB4=;
        b=LmxeTEdJo+VIv0N1/FriIPeHoMle0H/8bOa3Wj7MgGNVc6AcK5l7SDgkKQqE3h9LE5
         /jpnJOcqge0N/UfN90kzfCz3AL6Q9q83EimFORLsqU1z+wBZjZBzTWW8FOpHBM26OnKI
         21yjtQPx3ZwihaxvdAYr8tnByIL7JK36gYsZ2HDbTVhhis60BWMPw6wVmM0uCUNGE+TS
         MffjMihO2xRMuHB6/TaPADceaAlXlA8BSNlfDuo2R0BKLTOdQOVFYwCdqcXIFtoVatjD
         TmPXXSb4JJ/rhy8F1YBpNkATJhnjdYkd7BaS+q2Big2082bHRA7mUtSx7ZdT136RzpJJ
         8RQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S8RWW2d7LJDeTLXJmJSbVixK46FiI+AHZ26uWG/kHB4=;
        b=PXwMLeqTyZ+Br2/A/w3VA9MUQlbsw9j+GNwGvseydpGDVwyuKCCxyI7LR4A1VP3Qrh
         7GNNuRh6ARLX0DeO1eXkL5WRkDidxrqrnY0+w93lekz3IHoUeB29J8P76bG6A9kOgNMr
         IoHXUyOX9whmqviJhwrwQkoawxaeyfk2kns8vTu81qqctBw82rUOVRL7dKwOahFgJEDU
         1RaVpOSjJaDI+YKVUTF7mxWpEryKjvP4iqXDhp2ikHlEbmKqneM/EbqN/pjwthno7h4H
         Xt1f5mlm+Dt/EhFbITn0x9E352tHpFJtq3tH6i7HL/Tz6bjsgbefuyPsOm4JQor9F0yc
         BPKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327QvOAFktaM0qUv+Ijee8DmBomD53R4OkVW8WXF1J3dxrDGlRB
	kOfHakF0bkiTYnJdgSaUkGw=
X-Google-Smtp-Source: ABdhPJwSzl7rmlfv+5P0D9c39rr8EAWCN42gMhEprwMkzIxCZIZkXi857hlZDfl+ZhA5k53r1tzTAQ==
X-Received: by 2002:aca:8d2:: with SMTP id 201mr15921413oii.7.1595231832053;
        Mon, 20 Jul 2020 00:57:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:f413:: with SMTP id s19ls2684114oih.8.gmail; Mon, 20 Jul
 2020 00:57:11 -0700 (PDT)
X-Received: by 2002:aca:b809:: with SMTP id i9mr17536962oif.174.1595231831186;
        Mon, 20 Jul 2020 00:57:11 -0700 (PDT)
Date: Mon, 20 Jul 2020 00:57:10 -0700 (PDT)
From: Rick Xu <cutfield@126.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <4f73eee2-1784-4049-8fc0-6a889e2ea419o@googlegroups.com>
Subject: Is Jailhouse already used on products? And if not what's the gap?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3360_1337938976.1595231830645"
X-Original-Sender: cutfield@126.com
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

------=_Part_3360_1337938976.1595231830645
Content-Type: multipart/alternative; 
	boundary="----=_Part_3361_2074833963.1595231830645"

------=_Part_3361_2074833963.1595231830645
Content-Type: text/plain; charset="UTF-8"

Hi,
    I'm very interested in this project. 
For 3 reasons, first, it uses a LINUX as a host OS and then changes it to a 
guest OS, so a running host OS was saved. 
Second, less virtualization and more real-time. 
Third,  it's easy to use.
So, I want to evaluate the feasibility of using it in an automotive system.
I want to know is it mature enough to already been used in some products, 
so I can use this information to enhance the customer's confidence. 
And if it has not been used for products, why?
Looking forward to your reply.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/4f73eee2-1784-4049-8fc0-6a889e2ea419o%40googlegroups.com.

------=_Part_3361_2074833963.1595231830645
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>=C2=A0 =C2=A0 I&#39;m very interested in this proj=
ect.=C2=A0</div><div>For 3 reasons, first, it uses a LINUX as a host OS and=
 then changes it to a guest OS, so a running host OS was saved.=C2=A0</div>=
<div>Second, less virtualization and more real-time.=C2=A0</div><div>Third,=
=C2=A0 it&#39;s easy to use.</div><div>So, I want to evaluate the feasibili=
ty of using it in an automotive system.</div><div>I want to know is it matu=
re enough to already been used in some products, so I can use this informat=
ion to enhance the customer&#39;s confidence.=C2=A0</div><div>And if it has=
 not been used for products, why?</div><div>Looking forward to your reply.<=
br></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/4f73eee2-1784-4049-8fc0-6a889e2ea419o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/4f73eee2-1784-4049-8fc0-6a889e2ea419o%40googlegroups.co=
m</a>.<br />

------=_Part_3361_2074833963.1595231830645--

------=_Part_3360_1337938976.1595231830645--
