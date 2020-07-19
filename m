Return-Path: <jailhouse-dev+bncBDSMF24UTUGRBG7WZ74AKGQESURTZFA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33c.google.com (mail-ot1-x33c.google.com [IPv6:2607:f8b0:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 1997722507A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jul 2020 09:49:49 +0200 (CEST)
Received: by mail-ot1-x33c.google.com with SMTP id i5sf6414341ots.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 19 Jul 2020 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cuH8i2hNaeJPBKSGkOrgLBp1jYXSz3zrqV20t2QdNkg=;
        b=CddlNpk8RaAC8HKW65826ziCVDs422luHak8D1/K+ziTfXfr4oKpb2vnezXA3sny3H
         UtwawDRvK+nNKc/zqBuYI8cD/QIL6Y95O5fdcKbDC63qnQgj6Y7ZTpINn8nbSSTOFvg7
         tqCHOT1BNEDVZo7VDoXoR6QNZQUS2FCU7cMPUDpLqJQwD2TZpUEvP1BDSXIY0BT8zrKT
         hqDHtGkPEb4F6TCt3bQZCd8jbdZr87nkx+vOOv1umCh0KKO1+nQ6iQdyL2h2UgQZscMa
         AFpuyK2svQlrD+3UqUqEDg8wvKq31VHICCus6Aa9WR4VdliFsFGg4k1YhZsu03XZX7l7
         WPPA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=cuH8i2hNaeJPBKSGkOrgLBp1jYXSz3zrqV20t2QdNkg=;
        b=Lvl0fRVmL/4Df7/JhPxk27cwwQunFYIN+Jdid6VRIXEzr6FvGrUNBNjMYIFxpyMiWq
         wuoGhq6G7eNhlApWRvqIeN/tCL8Ewwstu+GkDj/LsTIPeB5DvJPyxw3mrztM+GgMmspV
         saElD0vQBuaGq48j6afgRORyxaeUyRa/loXfesRnJDAm2ON7dRK6MulgpmL+It/m49GN
         5jU5fB96K9IBQT95CxWDu3VNHUSODAndVrm5dVGx/AvWvyiDLlOGgmAT3pSnwxft69f3
         ivmbvWVSXntpfIj5Mvxo7D4yeodfQkNEc6nwKQuo+lhwzG29kY2HUQ1rS1L6b5/2qNt1
         TCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cuH8i2hNaeJPBKSGkOrgLBp1jYXSz3zrqV20t2QdNkg=;
        b=KAf+GRKdaBwQiTSrijG1yNLGw2+FwmzGNPf15AOZ4sd0rrbejdAw2S09F9o4cA7lBb
         8r9AcIXcUiuLLzqoLBZ+WTLYbjtMmGtaKylbQjOBh94TOK8JFeU5GI1asM8z6glX0WXS
         lx4Qw+o6s/QhYl8aNo4FWs3ywMnN2B7QJ6yMcH4Nsxm5xwxFl+tDYapv+G2SpPw+VWK3
         4cvWpTVqsFolxnYbOsK/dcMohEgGlVStA7TgMF/S2oguNeF3Zh1ZwKS0AXP28RXdIw2K
         OokomqSbwgtCGQtQUXpFQnoC5SBjQavSYBAaOGWIJUU6DxBVTnjsu/3+Up8R7HSu00mU
         kgZg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532gWJ+EzuleAfFcO6N+ZMVCKY14DkWrgZx4CoYTwrPd4so6Amsn
	DhzGwAoO9bxTQxLlUHEeiXE=
X-Google-Smtp-Source: ABdhPJx8JM39FxmD4Lc6TCSVgtTbJiwSQPSw1ws1ABHGOS06QsMWSkzTKp+EnpdLWa+2bnroeRna7w==
X-Received: by 2002:a9d:6659:: with SMTP id q25mr13988962otm.330.1595144987692;
        Sun, 19 Jul 2020 00:49:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:c38e:: with SMTP id t136ls2280061oif.10.gmail; Sun, 19
 Jul 2020 00:49:47 -0700 (PDT)
X-Received: by 2002:aca:50d5:: with SMTP id e204mr14125869oib.60.1595144986947;
        Sun, 19 Jul 2020 00:49:46 -0700 (PDT)
Date: Sun, 19 Jul 2020 00:49:46 -0700 (PDT)
From: Parth Dode <dodecoder@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e0b7a626-4ea2-4e79-a749-ff96e97c4974o@googlegroups.com>
In-Reply-To: <f0166430-3052-799e-acb4-c01ecbf86b25@siemens.com>
References: <375baf50-dcb2-486b-9ddf-3de231f22ea8o@googlegroups.com>
 <eb8f71d2-b861-4136-2968-fa2407c7207a@siemens.com>
 <5d346985-f668-4940-8f6f-520f72cf1842o@googlegroups.com>
 <f0166430-3052-799e-acb4-c01ecbf86b25@siemens.com>
Subject: Re: error: implicit declaration of function 'cpu_down'
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3107_493136694.1595144986236"
X-Original-Sender: dodecoder@gmail.com
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

------=_Part_3107_493136694.1595144986236
Content-Type: multipart/alternative; 
	boundary="----=_Part_3108_1054908243.1595144986236"

------=_Part_3108_1054908243.1595144986236
Content-Type: text/plain; charset="UTF-8"

I apologise for top posting .

Parth

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e0b7a626-4ea2-4e79-a749-ff96e97c4974o%40googlegroups.com.

------=_Part_3108_1054908243.1595144986236
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I apologise for top posting .<div><br></div><div>Parth</di=
v></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e0b7a626-4ea2-4e79-a749-ff96e97c4974o%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e0b7a626-4ea2-4e79-a749-ff96e97c4974o%40googlegroups.co=
m</a>.<br />

------=_Part_3108_1054908243.1595144986236--

------=_Part_3107_493136694.1595144986236--
