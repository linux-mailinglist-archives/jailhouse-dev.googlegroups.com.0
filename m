Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRBA7MY2DAMGQEDXXQLMY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73a.google.com (mail-qk1-x73a.google.com [IPv6:2607:f8b0:4864:20::73a])
	by mail.lfdr.de (Postfix) with ESMTPS id 152EA3B00F1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 12:05:57 +0200 (CEST)
Received: by mail-qk1-x73a.google.com with SMTP id 81-20020a370e540000b02903aacdbd70b7sf17289241qko.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Izq279emoWZrET0oHk7ZoEw/zMNW5kIljiI8wMtj+P0=;
        b=oEPem1U2nKThIXWOcOOePyWwG0j2NuDGnm/CdAAdfC+VcBsgOmsg2zc+uWDDuQUovA
         oR7KPePyq2wT6sUH/XJh98nzxfmygj3dEvjy3JU6oPS24QYbtMgtg/iQrlLhNgyG9/uE
         PbtM2Kd+8c4jizSQ3+DLzYzWv5Ishoo1dNyq/5pSMYHkD8ucio8JGfSI9lLuefsp5L78
         GyZzFNiWhzpyHaM50TtyBTqrEQ5V/xsnR+RRYiQJcFYDA48S3wOsyH0phxqJ5RMwVgCN
         R40L9MRfY25YgHcsjVY1vuhebcX4HoPThqFcPpUFqRRvGuGyab5tl7pPjfv1zaoPcLb4
         Cmeg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Izq279emoWZrET0oHk7ZoEw/zMNW5kIljiI8wMtj+P0=;
        b=d3M4CSQQUiDMHBDnlYFefUisBYYvXBHx6wmn/DmfH5yAACnVFAEYuJuMUq0LAV7fit
         517MBuz3pSAIaGsIkbqFXb4lj+xE4kEqdoxJiwugrZn288Nz0WDWGOVTJn8LILG4Puj9
         8J7mnxhVZeFQIDF3s7nUChUL5H9SU6NBzFlU1BTkhaJy0CP359BqePNTQLWRvagK1gm8
         /9G86pmtCTF1b5E/Af1D5i7Xp/rPlKeCFEDHlJZ6S9+k67wzxUxT5zSPuBN3B53feBg7
         pUNoD8qjUK3Zb5LYB9XKcRgj3q/VOXOQS+uN5XLCLux0TBG58RNZRna1VGGHR1+sSSLg
         Vo9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Izq279emoWZrET0oHk7ZoEw/zMNW5kIljiI8wMtj+P0=;
        b=k2Zh8/GCOUuJo+nMs63htfOZdNuKpi9+6t3koJJNjNX41ADfHvB1He/susqI79SXSU
         unmhr8tNgho8ihxRAiYnS1zuAXTvzLObbJ5EZop0hBYNcOZlTJZPohi73Erv7k0j1dl3
         df8s799GnVwiM4V//UB1L63y+PI60Q6k9+KB8Zpf3IhMTkRQBLJiesygCRirTyhB83yz
         2UYQdSgBSjDv0yqaunFNqgP998Vzwkgskg8SkLQFqanxud0FetfHT/DUh8JQ5rEn9q1D
         A1pGVilaD5Q+/Mx+D/QXcYsM/Jg2DRXIleBDcf9AUXpBG8hbS67uZ70DKqQO2hsCd/vG
         5y0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532f5N56B2FVycMBrhXqjYR+ofdlEQi4lGar1Ubbiw4dxQPFb6IQ
	yIrik3eU2HFP+Im5+5UUfHk=
X-Google-Smtp-Source: ABdhPJxlf8NJXbemR3+3xVZmbohnzAs4blkmpmqtH4QBb73hvMW81o/C9ICccPCXy+1g5L74oOv0Dg==
X-Received: by 2002:a37:b447:: with SMTP id d68mr3284003qkf.45.1624356356038;
        Tue, 22 Jun 2021 03:05:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:4641:: with SMTP id f1ls625863qto.3.gmail; Tue, 22 Jun
 2021 03:05:55 -0700 (PDT)
X-Received: by 2002:ac8:5f52:: with SMTP id y18mr2641000qta.385.1624356355454;
        Tue, 22 Jun 2021 03:05:55 -0700 (PDT)
Date: Tue, 22 Jun 2021 03:05:55 -0700 (PDT)
From: along li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <bc9a4b42-034e-4be9-b364-ee5f6e2964a1n@googlegroups.com>
Subject: Will jailhouse support RISC-V in the future?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_764_1225854610.1624356355022"
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

------=_Part_764_1225854610.1624356355022
Content-Type: multipart/alternative; 
	boundary="----=_Part_765_1477720149.1624356355022"

------=_Part_765_1477720149.1624356355022
Content-Type: text/plain; charset="UTF-8"

Hello community!
RISC-V is very hot now.
Hypervisor on RISC-V is  starting.  
Xvisor is doing some for RISC-V  Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf 
<http://xhypervisor.org/pdf/Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf>
And this video in youtube 
<https://www.youtube.com/watch?v=eNUn9uMPcCs&ab_channel=TheLinuxFoundation>
 .
Will jailhouse support RISC-V in the future ?





-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bc9a4b42-034e-4be9-b364-ee5f6e2964a1n%40googlegroups.com.

------=_Part_765_1477720149.1624356355022
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello community!<br><div>RISC-V is very hot now.<br></div><div>Hypervisor o=
n RISC-V is&nbsp; starting.&nbsp;&nbsp;</div><div>Xvisor is doing some for =
RISC-V&nbsp; <a href=3D"http://xhypervisor.org/pdf/Xvisor_Embedded_Hypervis=
or_for_RISCV_v5.pdf">Xvisor_Embedded_Hypervisor_for_RISCV_v5.pdf</a></div><=
div>And this video in&nbsp;<a href=3D"https://www.youtube.com/watch?v=3DeNU=
n9uMPcCs&amp;ab_channel=3DTheLinuxFoundation">youtube</a>&nbsp;.<br></div><=
div>Will jailhouse support RISC-V in the future ?</div><div><br></div><div>=
<br></div><div><br></div><div><br></div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/bc9a4b42-034e-4be9-b364-ee5f6e2964a1n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/bc9a4b42-034e-4be9-b364-ee5f6e2964a1n%40googlegroups.co=
m</a>.<br />

------=_Part_765_1477720149.1624356355022--

------=_Part_764_1225854610.1624356355022--
