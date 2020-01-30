Return-Path: <jailhouse-dev+bncBCPOXAO4SYIBBVXKZLYQKGQELSUWRCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23f.google.com (mail-oi1-x23f.google.com [IPv6:2607:f8b0:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 849BB14D948
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 11:52:08 +0100 (CET)
Received: by mail-oi1-x23f.google.com with SMTP id e22sf1304479oig.1
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 Jan 2020 02:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BEdoJk7RrgWTfrTfmYfFCcbryiJ81DKV14i5DVurmw4=;
        b=h1gRxEjMnhwaZsMStxSm25BZ5kt6Jo2X54JqEpKijjsT0FHWPr2Oh16jyjoAmuiWOC
         AALNvmeAz96/H2M7V2xW+/LbGSXgDM3MpP6/liJI8AFEXvA1Y2L+hnN6bAHYVDhS2FhZ
         0hHqVBVPmNr7W6d77eX8KOj/0x9uW4LyFPXOI9JhvoRnglocr3Tz8FJYJwjTlwBebak5
         AhO9BbkqSjzMoZsVc85n+87mqRb4hYSFGibiZS8OrfI0oX1kHmae0qmNx6PgwZ5iM6Tl
         /NHqFm4PH6EXAx3EC3OP9HqNSPG+z3nbN9jswSbh3A17GhhJN0x0DBV+bmUk17OljWl3
         A1mA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BEdoJk7RrgWTfrTfmYfFCcbryiJ81DKV14i5DVurmw4=;
        b=H4Sz5+7qELk/r1fF1N9wboLpnKPy/+Z9NTNV0RIwlZBELJEowCh5+vR/8czj/H8iIv
         IGO5DYYDwhjIlddslzTZHgHYDjL4R0sY8e3TagKLbOeLf+VJsA2jmayznNmFDip3GneR
         SIZ1Jbqv3lu4ojv9xJDgpdLKOYyKsStgjAWjnBLOgNTmeeUqs0dcJPOjW1vYNIWK/mKt
         /AjHtgGBRckefKPHXa98upXZUpUahobtQMTlLA2DdAql9WSUVUAaJWsAy7a4RcdwPTFo
         CP9pNbAjq/LTeaOymVzSPWXNsuNf2FH7PxhmL8DuybEI4/BAKo43gV5RXp3wUjuJgAHb
         VaAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=BEdoJk7RrgWTfrTfmYfFCcbryiJ81DKV14i5DVurmw4=;
        b=Nmu87JmfkMXcA63ZY74VgN7GrYpQhuR1afTLG1gT6QgzdSIfKHubKuQx7FRxKamV/Y
         DXQNF9MjWvSh1o8gNybROGNhTIclrfTKSxB/5voMaiVQ0b0zDB1bfrlvf5iiGeIb/D28
         hR4Kf7JkfPrNVlAoQeL0ObPMZO4lwpOSoSk8VGeqdjz0rIEdIOANUxOjMGLa/XmAPz5i
         DuRI+4o1I/7dCBSY3AipLme8lRtD1KpKCB8v6iDRIBwH/hEzJ/AzZ84TBAzC9Yr++rw5
         Kx7wE4cxQj5FfDBZDV0/bg+4Ai54FCM9eGuMgQ2yks/hKN2rFZDz9pcDQDuphV5erOpX
         oYGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX1r4+9TyVhK4AgY3xYkQgcpRYcuHIk6jr521io8C+OLWH2od8C
	lq3QpohsZr+S57dxCJd5S4k=
X-Google-Smtp-Source: APXvYqztArYEepMd+cnYkGohXXWsHyrHzyQ2h5Rl2SsfKsraFUURJmwNBT13vqs03I3mhRX28N29NQ==
X-Received: by 2002:aca:f44a:: with SMTP id s71mr2452975oih.7.1580381527206;
        Thu, 30 Jan 2020 02:52:07 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:7dd6:: with SMTP id k22ls691694otn.5.gmail; Thu, 30 Jan
 2020 02:52:06 -0800 (PST)
X-Received: by 2002:a9d:811:: with SMTP id 17mr3095478oty.369.1580381526051;
        Thu, 30 Jan 2020 02:52:06 -0800 (PST)
Date: Thu, 30 Jan 2020 02:52:05 -0800 (PST)
From: vijai kumar <vijaikumar.kanagarajan@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <001789de-def6-48a6-992a-bfcdf07c756e@googlegroups.com>
Subject: Query on RAM regions in linux demo
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1648_405319410.1580381525404"
X-Original-Sender: vijaikumar.kanagarajan@gmail.com
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

------=_Part_1648_405319410.1580381525404
Content-Type: multipart/alternative; 
	boundary="----=_Part_1649_357508589.1580381525404"

------=_Part_1649_357508589.1580381525404
Content-Type: text/plain; charset="UTF-8"

Hi All,

I see that there are two RAM regions defined in ARM linux demos. One mapped 
to virtual address 0 and the other 1:1.

I am not sure what the first region is for. Can anyone please help me 
understand that?

For Example in qemu-arm64-linux-demo.c

I am not sure what the below region is for.

    /* RAM */ {
                        .phys_start = 0x7f900000,
                        .virt_start = 0,
                        .size = 0x10000,
                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                JAILHOUSE_MEM_EXECUTE | 
JAILHOUSE_MEM_LOADABLE,
                },

Thanks,
Vijai Kumar K

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/001789de-def6-48a6-992a-bfcdf07c756e%40googlegroups.com.

------=_Part_1649_357508589.1580381525404
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi All,</div><div><br>I see that there are two RAM re=
gions defined in ARM linux demos. One mapped to virtual address 0 and the o=
ther 1:1.<br></div><div><br></div><div>I am not sure what the first region =
is for. Can anyone please help me understand that?</div><div><br></div><div=
>For Example in qemu-arm64-linux-demo.c</div><div> </div><div><br></div><di=
v>I am not sure what the below region is for.</div><div><br></div><div>=C2=
=A0=C2=A0=C2=A0 /* RAM */ {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 .phys_start =3D 0x7f900000,<br>=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .virt_start =3D 0,<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x10000,<b=
r>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |<br>=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 },<br></div><div><br></div><div>Thanks,</div><div>Vijai Kumar K<br><=
/div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/001789de-def6-48a6-992a-bfcdf07c756e%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/001789de-def6-48a6-992a-bfcdf07c756e%40googlegroups.com<=
/a>.<br />

------=_Part_1649_357508589.1580381525404--

------=_Part_1648_405319410.1580381525404--
