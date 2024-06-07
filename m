Return-Path: <jailhouse-dev+bncBCVZJANLUQORBINSROZQMGQENGKME5Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3f.google.com (mail-yb1-xb3f.google.com [IPv6:2607:f8b0:4864:20::b3f])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7F78FFFEB
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Jun 2024 11:55:47 +0200 (CEST)
Received: by mail-yb1-xb3f.google.com with SMTP id 3f1490d57ef6-dfa7843b501sf3264447276.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Jun 2024 02:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1717754147; x=1718358947; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBGyGZWaArQUkSKeDyY5H8PMjJw72UDoxporkRowPrM=;
        b=b9Y7IYgh+LB2uPEKU/q1RZZBoRVuqeD3oqRG9+VLdT3CjskI2HPhVHTauDiQC+j18z
         WqOC/vap/Vso9UQRGvDln5RK00ijEtmFtzY1b7/P+61VTJfqtU4UiTNgSSSSB0Qha2bw
         oe3e/ZE2sK/c2MG/yZRv/HX4ghdlG+LxXutwx4UfrIBLTlVPCEyOYQlHxLe0kMZEm0RX
         I/H1gZUzBc0MvLCmEKCRUvFLHLKpLt/8mkWAEbPyKiCIZTRQsKAL7JUHlsV+fQfFOlQ7
         gj8ftVRl5H3BDtDLPRg9QimCKTAASSq3BGfFJxpZbtGsk+8NimFRwaA7GTq5w28Rp91c
         /P+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717754147; x=1718358947; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wBGyGZWaArQUkSKeDyY5H8PMjJw72UDoxporkRowPrM=;
        b=ChcwKddxJiJsc4k/TaLgwED5bCZcJyc0yANyHLsgW65mwL6mNlI3C/BSknHXEH0OSS
         0U4dNks/emgIiqwREoo/u2sf8JxJyz5s258EZ6XTYGOuoN6YeSQTd5FMxkubkLRH6Ya8
         zV6b6KARSjWREZ8CEA+QH3kGRP+IFYhr0MuwMgVFSWfoIMHNEwYS/lrMdXQ1SkpomU5N
         4jkV1koWH7y7dxriHvY3jwilFlvmBCeoCoyjHID4UseVYdOtOdMWohEHHZZdx9SYaC/m
         aWAqGAEKL4dM6oCH1McxMz/Yq0bs/DcnwMrb78gj83+4iASSyxZMQwfg8fUUXwlMswB7
         RdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717754147; x=1718358947;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wBGyGZWaArQUkSKeDyY5H8PMjJw72UDoxporkRowPrM=;
        b=HOa2TzzWzf0FwF9oQ0Aw7CM6LnNVCjQPhc1W5o9xMNH50qvh5K3yjbz82dkAUr0Zsa
         g/njm9qvvJqf/YI51gYr/j1v4ZIAyJpRm/FirV4XQhUUYEvz33gq5IQ2Fc/lr9Aw958O
         EzTmd9SUVvvXg+qjfqTk28Wg35mYX7DE1jwVfLyJ/w5fqqi+5ESsh63Au94lbDNnHQkv
         kWe4d99lFFfEsfw5osLRq/iCVcYgzbhJRXmeGaEylOt2a1JcuFm6ZFt+3kL8vTXksSmZ
         3yWGCgcNfS7fhjP0zd14QMRJm8Xh6I/3lNWTF9yGQmNZefAatLqQSY9915XikMFUZdEk
         kC7g==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCVp/O6vcsqSxik9u9LS9LU4gf2KFQ7StmUGhTqkyxE/jmASpjan5NITH4+Zd64CxZcpIRfA0pi+A5TMbepijt3PlQU9HvYCbdocfKc=
X-Gm-Message-State: AOJu0Yx4cbd716ocCnY1aJmfi3ZQL+J6m1JhZZMdw4bsInuYAYzJa64b
	Ls3JpR0WMhatgDCeeL+oDfX9dniezS2g+hFlaK9wxnuXic1uvhky
X-Google-Smtp-Source: AGHT+IEYrx//6I1Jc0uV/yq1QouHYCHTm6MhMNyEErJsDDZR3cHZBfQYMqaeF/+W3do9J5VGLQktDg==
X-Received: by 2002:a25:ac10:0:b0:dfa:77bb:3407 with SMTP id 3f1490d57ef6-dfaf66e8bc7mr1695588276.63.1717754146779;
        Fri, 07 Jun 2024 02:55:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:b193:0:b0:df4:e746:b555 with SMTP id 3f1490d57ef6-dfaf15f1402ls1650787276.1.-pod-prod-07-us;
 Fri, 07 Jun 2024 02:55:44 -0700 (PDT)
X-Received: by 2002:a05:690c:6f92:b0:615:32e1:d82c with SMTP id 00721157ae682-62cd56a3514mr4767777b3.6.1717754144197;
        Fri, 07 Jun 2024 02:55:44 -0700 (PDT)
Date: Fri, 7 Jun 2024 02:55:43 -0700 (PDT)
From: Smith Crower <crowersmith440@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a06228d9-a760-4a5e-8778-95d2c10c81f4n@googlegroups.com>
In-Reply-To: <0f3f959e-a840-4df1-8e6f-658df17c929cn@googlegroups.com>
References: <3b4005f3-1358-4a8d-a1de-33b9d33af2b9n@googlegroups.com>
 <0f3f959e-a840-4df1-8e6f-658df17c929cn@googlegroups.com>
Subject: Re: Buy one up bars online in Houston Texas
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_177707_993343116.1717754143764"
X-Original-Sender: crowersmith440@gmail.com
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

------=_Part_177707_993343116.1717754143764
Content-Type: multipart/alternative; 
	boundary="----=_Part_177708_2028729099.1717754143764"

------=_Part_177708_2028729099.1717754143764
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


Buy all your psychedelic products with me including clone cards
All products are available for deliveries and drop offs
Fast shipping and delivery of packages to all locations worldwide=20
Let me know with your orders
Text me on telegram @Carlantonn01
You can also join my channel for more products and reviews,link below

https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01
https://t.me/psychoworldwide01

Backup channel below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87

https://t.me/trippycross1
https://t.me/trippycross1
https://t.me/trippycross1


You can let me know anytime with your orders
Prices are also slightly negotiable depending on the quantity needed

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a06228d9-a760-4a5e-8778-95d2c10c81f4n%40googlegroups.com.

------=_Part_177708_2028729099.1717754143764
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />Buy all your psychedelic products with me including clone cards<br />=
All products are available for deliveries and drop offs<br />Fast shipping =
and delivery of packages to all locations worldwide <br />Let me know with =
your orders<br />Text me on telegram @Carlantonn01<br />You can also join m=
y channel for more products and reviews,link below<br /><br />https://t.me/=
psychoworldwide01<br />https://t.me/psychoworldwide01<br />https://t.me/psy=
choworldwide01<br />https://t.me/psychoworldwide01<br /><br />Backup channe=
l below=F0=9F=91=87=F0=9F=91=87=F0=9F=91=87<br /><br />https://t.me/trippyc=
ross1<br />https://t.me/trippycross1<br />https://t.me/trippycross1<br /><b=
r /><br />You can let me know anytime with your orders<br />Prices are also=
 slightly negotiable depending on the quantity needed<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a06228d9-a760-4a5e-8778-95d2c10c81f4n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a06228d9-a760-4a5e-8778-95d2c10c81f4n%40googlegroups.co=
m</a>.<br />

------=_Part_177708_2028729099.1717754143764--

------=_Part_177707_993343116.1717754143764--
