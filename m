Return-Path: <jailhouse-dev+bncBD7236HKXYJRBEU4WL3QKGQE6EXMYYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc39.google.com (mail-oo1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9882005FD
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 12:06:11 +0200 (CEST)
Received: by mail-oo1-xc39.google.com with SMTP id a15sf4210486oop.7
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jun 2020 03:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8BE0vOaIacJTBKRPuW8kH3fEVObZwoR7TXOvW6mQf4A=;
        b=UwyQpRmU4pz8vH40OI2fxXGXfDd3iyxRQwmPbkbH0qGvecnhN/mElLlKaR8dJXdMr2
         sk3or+FCF5dTcclkBshDrZoxs17XWovpcwMlzYLo2cLYB7XLSaDIEGxnDse4+aBc06XM
         dMw7jL6MMUsgNibKONwzY65BuYJA7+MxTNuoHkwgY5vsyaK3i/DKRV8+uMVUHMx4SVdW
         g9fUslznhTyoenJgQFWoswkvQAGcNyUxYCAfUvqL7KPuqYLBejnCwvY4O3jfupDe9pN6
         QJ6Yt3m6zhiX/U9b0iJ/cLRjxGqegXDstFBGTaJtwbeCQlIBHTRDrN/KRkYB5/5M0Yoi
         FA2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8BE0vOaIacJTBKRPuW8kH3fEVObZwoR7TXOvW6mQf4A=;
        b=DHrxROnjy2w1W7V6YIPYVzpu0acseRcUJRUYrfTMkSFG0sxLpS7i/MUJuH5yq0UOl4
         xcRMA4NxUOXH4Eseg4kspll6ppPZmrxHPPFCCU1arf4clHcc1X7EBTucrf8F2xS2L369
         gkWPjPujHZtItUSyPhoABBDDN/XNvyhjLwGxGwI3IK9BA0/giUf4j1wlyxc3gMLj/zRy
         CdJM6LIUHV/JGHWwV0uy+CijV7VvT1M5jvQ43aJ5ryQcTOT8ZlKiteJZZqKxu0RWQZIY
         ZLx6WoKM8uQJ2/YI0gwIiBlABmibnHc0+lVqa5cof2ZUrWFK7/GhCnIf4F7/4EEd9U0c
         5p7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8BE0vOaIacJTBKRPuW8kH3fEVObZwoR7TXOvW6mQf4A=;
        b=RyvQK0JQXrm9ViR/tczH/CJg8USjCb8kUxpGLhjt4q0RTzbOFx80XfMr+53T6M/sAp
         TjBpg8yJQSRaiTq1L0TEL71IEXnsf5DzCRPyb9Oh6755lrYOqOaTFPLsyKvMrhJtp8B0
         hB+FlySFqzt4O0ewzq0naAvnZlxhoiVyLkjn8C5I1fT2XwqX/1R06yF/S7K+Zag8VyjL
         OeVtzRbR2EHXPCVwHu1tUYQY+c8nZREf/r2HVNhDuQuYkY/uC0B7RSvGl6CHTkzrV3nw
         NSzpffw6vd66Dn77kPeC49gLuylQGHP4CkT04tyRlAx+LbdiM6E5UwEp49m8fsVUC90X
         VS5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Sfwl7ynqFhbJ/JVZUPkOq6TkKCBDUAvGPudUIqTBFBzfkp7PA
	jvpuGt1FMzKMcVTQ654Tom4=
X-Google-Smtp-Source: ABdhPJzkgh62U1v2dAMTvFY+N7bNymYSqsoZl7qf3yhZul1TMI6yj1QdVAtts4CNOXaAVsB5XvPlPw==
X-Received: by 2002:a05:6830:4a8:: with SMTP id l8mr2199245otd.351.1592561170417;
        Fri, 19 Jun 2020 03:06:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4549:: with SMTP id p9ls1940977oti.11.gmail; Fri, 19 Jun
 2020 03:06:09 -0700 (PDT)
X-Received: by 2002:a9d:62da:: with SMTP id z26mr2459818otk.369.1592561169662;
        Fri, 19 Jun 2020 03:06:09 -0700 (PDT)
Date: Fri, 19 Jun 2020 03:06:08 -0700 (PDT)
From: "contact....@gmail.com" <contact.thorsten@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <01c3bb6e-fef3-4910-826d-8d0d30ac94bbn@googlegroups.com>
Subject: [minor bug] pyjailhouse: config_parser parses/imports trailing
 zeros into cell.name
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_153_651489221.1592561168791"
X-Original-Sender: contact.thorsten@gmail.com
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

------=_Part_153_651489221.1592561168791
Content-Type: multipart/alternative; 
	boundary="----=_Part_154_1387027277.1592561168791"

------=_Part_154_1387027277.1592561168791
Content-Type: text/plain; charset="UTF-8"

Minor formatting issue that shows up when piping config check to a file.
(no patch available, I have no idea of Python.)

jailhouse-config-check prints *cell.name* in some occasions but it contains 
trailing zero characters, which are also printed. I suspect the cause to be 
in pyjailhouse/config_parser.py:165.

Thorsten

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/01c3bb6e-fef3-4910-826d-8d0d30ac94bbn%40googlegroups.com.

------=_Part_154_1387027277.1592561168791
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Minor formatting issue that shows up when piping config check to a fil=
e.</div><div>(no patch available, I have no idea of Python.)</div><div><br>=
</div><div>jailhouse-config-check prints <i>cell.name</i> in some occasions=
 but it contains trailing zero characters, which are also printed. I suspec=
t the cause to be in pyjailhouse/config_parser.py:165.<br></div><div><br></=
div><div>Thorsten<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/01c3bb6e-fef3-4910-826d-8d0d30ac94bbn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/01c3bb6e-fef3-4910-826d-8d0d30ac94bbn%40googlegroups.co=
m</a>.<br />

------=_Part_154_1387027277.1592561168791--

------=_Part_153_651489221.1592561168791--
