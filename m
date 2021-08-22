Return-Path: <jailhouse-dev+bncBC653PXTYYERBOGVRCEQMGQE4WAOZCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73d.google.com (mail-qk1-x73d.google.com [IPv6:2607:f8b0:4864:20::73d])
	by mail.lfdr.de (Postfix) with ESMTPS id 043CB3F3F00
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 12:45:14 +0200 (CEST)
Received: by mail-qk1-x73d.google.com with SMTP id v21-20020a05620a0a9500b003d5c1e2f277sf8961138qkg.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Aug 2021 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Q4fja6QoppsSsjuEDTMk6IAbUFyDrcu8FI7phECXdKA=;
        b=Mw/ESzfoDprFupPk/Hl+EycjFs8+7iu7OEXnQkgllupocj7UoOJm7yEmaB5WuyymW1
         4WwJImN5Fa7FJlUw4C5Aw8edK/HTAsTnimZitDCO8kZGQWbiVEbg2U3cO1boTROXk8Xj
         38luBzd18Dii2FEApCDxbEFfq+oji8p7MtcAxqm4/kaCBFOhHgJR0AJ8AKSaB+pD5Sg4
         N6f3nl9YRsco5EeUcf5oLJHFo4CnKIrJGAHob6lf64We0VTjd4USARela+6sz2PbB6CM
         FbAH7P+S14YojstzFfAUhj7iLdlHrPKzCbkNrky9oUvKV590iw8liRAqtAOLyp5DrQS6
         xiWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q4fja6QoppsSsjuEDTMk6IAbUFyDrcu8FI7phECXdKA=;
        b=Zj7FodGC/ODfGE7H/9QePkUODKATo/eHhyte8xMO1nDkTOVwnBJaG5BgnwWup9PoM3
         od4P5FvmO3cjyGFTtNtF+Z3RyVVIOApi/H0sJvxUbXMM4NS7Yt4TSv9JEyY0RpEobiPV
         3d+jLsUs5sG5idYasWLvoilqTjr1eqQGbLY37ZQffx0Ps6KBesePG1AWFGHy7V/KT46f
         IcktkKPcZHeO7YXG7whgI1xCMVcQ97HcJ2nKR0WOUq0EWbaKzEuiCgX6pH5+4XkXoI4b
         NWqHTgtoKbg6S/3NTJUnKbyq0ylGnzk1oDQc9FmvEDYxbzAxyBQwrIKEcNfU/O107lmL
         TkTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q4fja6QoppsSsjuEDTMk6IAbUFyDrcu8FI7phECXdKA=;
        b=c6lUIkbMUmaC5lC64HWRog5jDz1CwmvPtFH36TBzkq74TA5sVzFXM47gaQUVB1PPC/
         LH66xbaub4GyGmpkdswAOkdbYH37RUS1RI375f7gcKlJVUGq9tDnsYuksvxDXMZLUpwY
         Y/K37pV72jrgTh4hIJ6leyEfFanWbl3VLoJF9TFh4OMCqrnomg7oa4TxxMCpFVohyL8a
         hHP/iojWQLp50wwxnGfoyCsUIKjhDDt3b9auTS/9LtWNXvhEXL4wf6qgI9A2d1YsI1Hl
         iZl/Tgd7qCPDx5QxcPjhrtgeoci4DN5hEDzafl0E+NOyqtNNzFhIBvFYCFgYYsDUTGAa
         lOzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533fFy7mIhG19JAtfF2fJQnCaOymEhmOAECcvlZzReGoPoOcLwKP
	umhMBpVXlR/wD2I9Xrw/tIM=
X-Google-Smtp-Source: ABdhPJyufaCWSSFC1gAhYPLlvEWaTzqHbAHt9bNGMXWPPGXc//nViLkQMWX7j+Uh2lGnrsPfC9iQtQ==
X-Received: by 2002:a37:2754:: with SMTP id n81mr16451653qkn.297.1629629112989;
        Sun, 22 Aug 2021 03:45:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ad4:4c12:: with SMTP id bz18ls3936864qvb.6.gmail; Sun, 22
 Aug 2021 03:45:12 -0700 (PDT)
X-Received: by 2002:a05:6214:23c6:: with SMTP id hr6mr27775436qvb.22.1629629112210;
        Sun, 22 Aug 2021 03:45:12 -0700 (PDT)
Date: Sun, 22 Aug 2021 03:45:11 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cd1adc59-e867-4ce1-a6ea-371ae1754cdan@googlegroups.com>
Subject: Editing Inmate to add GPIO for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6010_588848759.1629629111578"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_6010_588848759.1629629111578
Content-Type: multipart/alternative; 
	boundary="----=_Part_6011_94065911.1629629111578"

------=_Part_6011_94065911.1629629111578
Content-Type: text/plain; charset="UTF-8"


Hi, 
I build Jailhouse on RPi4 using 5.3 Kernel and it is working nice. I need 
to toggle a GPIO pin. I tried baremetal code but I figured out, that I must 
map the peripheral using specifically this function:
p->mem_fd = open("/dev/mem", O_RDWR|O_SYNC);
So, I need the following headers to be included:
/*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PROT_WRITE*/
#include <sys/mman.h>
/* For open(), creat() */
#include <unistd.h>
/* For O_RDWR */
#include <fcntl.h>
What could be a clean way, to add such headers into jailhouse, I have my 
own header-which describes addresses of GPIO registers- added to 
/inmates/lib/include, but is there any possible way to add these headers?

Thanks in advance
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754cdan%40googlegroups.com.

------=_Part_6011_94065911.1629629111578
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br>Hi, <br>I build Jailhouse on RPi4 using 5.3 Kernel and it is working ni=
ce. I need to toggle a GPIO pin. I tried baremetal code but I figured out, =
that I must map the peripheral using specifically this function:<br>p-&gt;m=
em_fd =3D open("/dev/mem", O_RDWR|O_SYNC);<br>So, I need the following head=
ers to be included:<br>/*For munmap, MAP_FAILED, MAP_SHARED, PROT_READ, PRO=
T_WRITE*/<br>#include &lt;sys/mman.h&gt;<br><div>/* For open(), creat() */<=
/div><div>#include &lt;unistd.h&gt;</div>/* For O_RDWR */<br>#include &lt;f=
cntl.h&gt;<br>What could be a clean way, to add such headers into jailhouse=
, I have my own header-which describes addresses of GPIO registers- added t=
o /inmates/lib/include, but is there any possible way to add these headers?=
<br><br>Thanks in advance<br>Moustafa Noufale<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754cdan%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/cd1adc59-e867-4ce1-a6ea-371ae1754cdan%40googlegroups.co=
m</a>.<br />

------=_Part_6011_94065911.1629629111578--

------=_Part_6010_588848759.1629629111578--
