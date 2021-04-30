Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBXWZVWCAMGQEIJJWTGQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id 238C036F416
	for <lists+jailhouse-dev@lfdr.de>; Fri, 30 Apr 2021 04:35:12 +0200 (CEST)
Received: by mail-qt1-x840.google.com with SMTP id p8-20020a05622a0488b02901bab8dfa0c5sf8575213qtx.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 29 Apr 2021 19:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FpRbLikuHJ68ePqxYUxF5cTy+yie/sMeOTTyd5Mj8X8=;
        b=EJXJSkz8KHsLPfhq5j9NpukNv9TPUBB3U8LDEWXgMFc1FqsSjdXl990fx343tuslYV
         lddwJveYmvDWIdIrrPMgYPEV2AyRq26gpSP+CyEFR7MbS+zMMFb3zuzGOUTRr6QLxvhS
         ofTxBd2Ss8oIGNz8pu+Ou0dsCe1CzbHPYzQp1Ej0QVy5L9LdCQfut2Y17A0eqpAtB2FD
         hS2e3yHSjcy5wtoOhiYh0UGCC3/RQUqN22SG6TMECcXMA4IkXnTdt3XCN3uBn7Q0pgeF
         OJJ63Eu/6W5M7sfEJA49Z6RpH+o5g0HwsQhwZZAMtLdnizl+giCEhH51gOOj3i/gDzNN
         BfNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FpRbLikuHJ68ePqxYUxF5cTy+yie/sMeOTTyd5Mj8X8=;
        b=KSZoPdX/9dijPi+DOKjYrC0uIqfbjAjZIQ511chQ+jka11pxLThLeOMncUdF9UNn4c
         D0wBdoU4myDRsWZr0sGQ/FGrEZbsR+HfVAsEZbZAFEeSi+VEyoLrkEvCeYtsU++OTxn0
         7b9yFfYeyljIc/aysK4xCAyL9Z2pMlc1YIR0KgGw139apUuK74QpA96q3g0ZjbP6akik
         cNPGe17+vp4y72T7hPznKXFtzWf7iAUwJYzA5B5hqZBOlJPquuHEOXlYqiDgIxSo6VaC
         syLZCtsXzCjGaiyR9qd5uh3Z5l7ymL62SRzMZRQel07zhZFLcaIeCzWVUzSVjWZvVLRX
         14Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FpRbLikuHJ68ePqxYUxF5cTy+yie/sMeOTTyd5Mj8X8=;
        b=G0RNhTa6bxtZo1w9zvdXKbBosjLOde0HFqx9Dfv7qzeousT+6M3QlQ9SWFYFVHtUHv
         R2pP82zPjMyjdLLQ7hprnd9Vx61Z+tQDwP4wkyr/wKSZqKMeIN1QqzG1BEOg29ljg1Z0
         M7K+bumohlLDg+kqkUaFpeyiCdlJec6Z8dGEQk38kNaayiF2EexpgT1iFfgght2JQDZU
         HDwfzycdy5rN+WOTfl3fOlXuxmSOdGdm5+bKhtruCdSwVYFINCat0+M3KDP91iEwp+aH
         wCPtRcX/XfB/gU2Y9oepWVGHzZFL4hEtZ7jGJhBrqn1pW0wyaowcn6foZOGsf1U9OqxS
         /Gbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53312WzWBNjW+mtdJIS+jLKhUPyqb5oEmJQvXam0p5ydfKiOzetI
	kb1Ocr5/ttyQv3He0QsvRBI=
X-Google-Smtp-Source: ABdhPJw1dPonjkKdRmWR8RAZNMLWlpiQJxGYq0Rwo7dWgABn5UMeLeGteXkiO3/KZrBJ3rDnDgpJxQ==
X-Received: by 2002:a0c:c590:: with SMTP id a16mr2877402qvj.30.1619750111012;
        Thu, 29 Apr 2021 19:35:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:202:: with SMTP id k2ls2114513qtg.5.gmail; Thu, 29 Apr
 2021 19:35:10 -0700 (PDT)
X-Received: by 2002:ac8:5508:: with SMTP id j8mr2441312qtq.386.1619750110145;
        Thu, 29 Apr 2021 19:35:10 -0700 (PDT)
Date: Thu, 29 Apr 2021 19:35:09 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <62da4e40-0182-45bb-8944-eb26fcb14456n@googlegroups.com>
Subject: can none-PCI devices  be partitioned into cells?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_90_1758445099.1619750109459"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_90_1758445099.1619750109459
Content-Type: multipart/alternative; 
	boundary="----=_Part_91_696401794.1619750109459"

------=_Part_91_696401794.1619750109459
Content-Type: text/plain; charset="UTF-8"

PCI devices can be partitioned into cells, as we all know.
But  some arm board  don't have PCI  bus.  The devices is  designed  into 
SOC. 

can none-PCI devices  be partitioned into cells? 
for example  network card in raspberry pi 4,    Can it be partitioned into 
cells?

Any  demo or sugessition is wellcome!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/62da4e40-0182-45bb-8944-eb26fcb14456n%40googlegroups.com.

------=_Part_91_696401794.1619750109459
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

PCI devices can be partitioned into cells, as we all know.<div>But&nbsp; so=
me arm board&nbsp; don't have PCI&nbsp; bus.&nbsp; The devices is&nbsp; des=
igned&nbsp; into SOC.&nbsp;</div><div><br><div>can none-PCI devices&nbsp; b=
e partitioned into cells?&nbsp;<br></div></div><div>for example&nbsp; netwo=
rk card in raspberry pi 4,&nbsp; &nbsp; Can it be partitioned into cells?</=
div><div><br></div><div>Any&nbsp; demo or sugessition is wellcome!</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/62da4e40-0182-45bb-8944-eb26fcb14456n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/62da4e40-0182-45bb-8944-eb26fcb14456n%40googlegroups.co=
m</a>.<br />

------=_Part_91_696401794.1619750109459--

------=_Part_90_1758445099.1619750109459--
