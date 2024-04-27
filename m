Return-Path: <jailhouse-dev+bncBCAYF6GBVYFBBDWUWKYQMGQERSBJ3NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113b.google.com (mail-yw1-x113b.google.com [IPv6:2607:f8b0:4864:20::113b])
	by mail.lfdr.de (Postfix) with ESMTPS id E91978B44E5
	for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Apr 2024 09:32:32 +0200 (CEST)
Received: by mail-yw1-x113b.google.com with SMTP id 00721157ae682-61b57c7b151sf6898057b3.1
        for <lists+jailhouse-dev@lfdr.de>; Sat, 27 Apr 2024 00:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1714203151; x=1714807951; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVp4yZwE2mYgiZXbxIvYapMnMdPNzTXBFdAmChmOhF4=;
        b=ZbUGZYNeWW1J30Jsf1l4TJHxqX5WEGlH6pt2E85FsZfMVXyZlTV3wbNU+E/c+Hnd/C
         vJCOGRZz4tgBrfEX8Gb57xBTMyoXSjdsZ7pKkXngsgTXB5lNDmRcP0s4zwuQxHxc0FMH
         9SCRPT10d423/WCTHhIjcE1lbpXOOi9gFTk+hb8Rfgvi0mLwS40Cvxa9HWXWFsy6gH6d
         oxUNRbgw1NplqMYuLpYjWOwUl7uAKGdayBIyXKUY496s0mqiTug5bMG8+WKG9rYNhHlP
         bnjE8fq1n/zsBQq0n0KNjZ3Cnwb/e2OyyEph13yRHda/tAbVq0e+pmK9JzQc4dOqvdlL
         aC3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714203151; x=1714807951; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GVp4yZwE2mYgiZXbxIvYapMnMdPNzTXBFdAmChmOhF4=;
        b=Pi9grWNP1RfgaoptFEkcPNjJIl0aHKj1TAjONW1ydEYytPt3zAOdg86CZe9JfPPAfm
         AWeCevcWdz0Lr5bgrki6LFRx0bRFFcgG9g//VEVHXT5QqFb2tqlvMDW3sDm/91YRj9cD
         F58nuY91fZ8M0MOKUFYWaJP4tirP9UdeLKLH2+BwR5Q4zVlc75qOFnqUAHgtgCjcXnh9
         ZF8MuME8lX2j7ww1XOylp39G+APgwAaV0PhVJUvTjM0zkwyxQ8RimKEzmRF4eqFE/zEe
         TjRsEGgqv2fN0kcr2D9BB84m2uuZb4l/Wum6GJjJ4J405RmLtdiQCbO2+IFp+9PVU8Q8
         s9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714203151; x=1714807951;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GVp4yZwE2mYgiZXbxIvYapMnMdPNzTXBFdAmChmOhF4=;
        b=lzRH1gifUw2cKD9zHE3B7qZf59P+wQGyauyp6jLYr1jfZNqr/M4gcVbh1ncjLZZAsk
         Nyat3dr02N1qvfA9Hq+TDI2e2337m2hsW8LCzm/BAKozkE5eysLR4zFoTguvUglHWfHO
         gI4sEJqDtMEj/IDbNR4+MkDkF2POF6MoordrsNYwEAnBsw576CtnS1i0i/0aClijVrpm
         98b2wtcO88uKF0mj/iYRsAVUvNzpC5D96oGwvDmydhUUCb7erJZCkewi/ecKy9XI1QBO
         tzHaFlVOLG9OT3cu4xQpqAbQSnC75GQ+lAJ3K+Q1KPPxfqLq1A8RKian4YVT6rsqCkKw
         qsmA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXI02D1XBXTyKM4dEKYzwiBkLiwz4w8kH59oJiNO3a2Me19fct3YhxyVz+ua4Yui8IVZHI5dz2Wiuwo6QKPCYeIClcLcddn/Aobm8c=
X-Gm-Message-State: AOJu0YyAw+d86lI3WQq0I9xgA1AZ1SZQvSRH8iM7lpBSxSxtlqwBgtE6
	E9SPShFZw3y9XMisVpbeAxxroCACJgF+JvSh1ZMZ/EKPjQlZKkSi
X-Google-Smtp-Source: AGHT+IHnwzeRDP6jyORWV90CynLohGWxHbecr01muFQIcW22/DanC+JVXH+JFe0kTDsOXZwjiwwcSQ==
X-Received: by 2002:a25:688c:0:b0:de5:53c8:f2b8 with SMTP id d134-20020a25688c000000b00de553c8f2b8mr4821648ybc.4.1714203151689;
        Sat, 27 Apr 2024 00:32:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2d4:0:b0:de5:a88f:94bd with SMTP id 3f1490d57ef6-de5a88f96dels1046377276.1.-pod-prod-08-us;
 Sat, 27 Apr 2024 00:32:30 -0700 (PDT)
X-Received: by 2002:a81:7144:0:b0:618:92c6:64b1 with SMTP id m65-20020a817144000000b0061892c664b1mr1167469ywc.3.1714203150067;
        Sat, 27 Apr 2024 00:32:30 -0700 (PDT)
Date: Sat, 27 Apr 2024 00:32:29 -0700 (PDT)
From: Yulon Liao <lylguagn@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1ff469b4-4266-4f46-9694-715582b58fecn@googlegroups.com>
Subject: Which program turns off the clock of the non-root cell console?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_17676_1851334900.1714203149196"
X-Original-Sender: lylguagn@gmail.com
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

------=_Part_17676_1851334900.1714203149196
Content-Type: multipart/alternative; 
	boundary="----=_Part_17677_182831764.1714203149196"

------=_Part_17677_182831764.1714203149196
Content-Type: text/plain; charset="UTF-8"

Hi, everyone,

I use chip: arm64 a55x4(rk3568)
root cell: linux (uart2 for console)
non-root cell: rtthread (uart3 for console)


5 minutes after starting non-root cell, uart3 will get stuck.
After a lot of tests, it was found that the clock of uart3 was turned off.

In the rk3568 TRM manual
CRU Register(Start Address: 0xFDD20000)
CRU_GATE_CON28(offset: 0x370)
sclk_uart3_en(Bit: 7)

When excecute
sudo io -4 -w 0xfdd20370 0xf0ff66 to
uart3 will works again.

So, things are almost clear.

But, how to locate which program turned off the clock. 
Does anyone have relevant experience?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1ff469b4-4266-4f46-9694-715582b58fecn%40googlegroups.com.

------=_Part_17677_182831764.1714203149196
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, everyone,<br /><br />I use chip: arm64 a55x4(rk3568)<br />root cell: li=
nux (uart2 for console)<br />non-root cell: rtthread (uart3 for console)<br=
 /><br /><br />5 minutes after starting non-root cell, uart3 will get stuck=
.<br />After a lot of tests, it was found that the clock of uart3 was turne=
d off.<br /><br />In the rk3568 TRM manual<br />CRU Register(Start Address:=
 0xFDD20000)<br />CRU_GATE_CON28(offset: 0x370)<br />sclk_uart3_en(Bit: 7)<=
br /><br />When excecute<br />sudo io -4 -w 0xfdd20370 0xf0ff66 to<br />uar=
t3 will works again.<br /><br />So, things are almost clear.<br /><br />But=
, how to locate which program turned off the clock. <br />Does anyone have =
relevant experience?

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1ff469b4-4266-4f46-9694-715582b58fecn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1ff469b4-4266-4f46-9694-715582b58fecn%40googlegroups.co=
m</a>.<br />

------=_Part_17677_182831764.1714203149196--

------=_Part_17676_1851334900.1714203149196--
