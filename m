Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB2EFUWJQMGQEUY76SKA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83e.google.com (mail-qt1-x83e.google.com [IPv6:2607:f8b0:4864:20::83e])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BEA511833
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 15:19:37 +0200 (CEST)
Received: by mail-qt1-x83e.google.com with SMTP id w18-20020ac857d2000000b002f1fa23a40esf1058646qta.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Apr 2022 06:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=6ROjdv1ijZiFj1pJn+sVq2omlAieN/DmqGbdKcfd7DQ=;
        b=mJto59n+2wzpszcyf/UGchfN+570hUfE+Y0x2sv0aXFDrRrU1ob3TF+yl5hbpn5ZtY
         7m5XKMokxLSn0Z6iDUnqcWJhaexHuVvtwv1+i5B7xxIEtKrr3H84i9t9VHhZNSstUMQj
         gmX5tsB8k58FHDEAxp4Fw/h51gqHkPEIQ2mPm1T2XkifL4yWJTfAGW74lyDi0tKFI74p
         qD5AFTf6zt/F0WlcZWNFALtG5QZXYIEia4PZyXDMjxm+yXMSpjk9VKvWbakuUzKlE5EI
         pjg+2G2Pp26qjYKv1Oc4oLcNBAszYlXjI62NoHOi6Fkod9yUG9498djVcsJc0Z5YlwmH
         okCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6ROjdv1ijZiFj1pJn+sVq2omlAieN/DmqGbdKcfd7DQ=;
        b=QGRcFBKLlEpsvcJVJ0X1kuWiCt1BsjmdR+xS2pcdm0r0V/V8PruNjZejTuIiydKBFv
         8qzTzhCi70OydIvzt/Y8JUuvgamm3pYKVpL6zzYKlig0pzZEcJD4FexQDowuWGw/Ed91
         /MKhXnIHnDb1KZPs3uPRtp2VStrvhykMZ7McmMnu/cMZ5Q1MZsSoDd7nqnoXIedCYwdx
         ZS66Ugt2kY09DiDr96kuqwcdbQ6NjoY/XkKH56YZEhtJJAjDafWr2CgpGnC6YFqEP/6v
         HrhOJzI2oF//WBVYYoNEcrZ+Xczclc4G7KMit0hRZzvIQi0ea1lFxkwl06JgacoiFADV
         iP5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6ROjdv1ijZiFj1pJn+sVq2omlAieN/DmqGbdKcfd7DQ=;
        b=hgHbNtlO6vIkzi4GeKrRcy5IUw5+Yfb3N/t7p5nwrq+YhYgkqwnqdQ+oixZod9USz0
         9GMWiaUTWH+yoQWo1hy5Sdlxpg2Da+rA80OUV/rRtvMyZPjigJI6fC5Qsy4NpMlRunpM
         ItZlKx0FrturFrqaUQIpcx922vKNREyy0EZVzGSh8ydjbMdPQAaKi+exLe8OsCvEwXDC
         heiYgCt7IpHXu1zp9rrlUzI7GuuTb7Hm/9Djz8YXCQ093YPz8k/uU9Q++zdEAvv8Ucg7
         NZhlHRs1LLpj8OAJFPnlc2TDRJ9KxJjXE1GMhl6Pxytar3CpFdIRlMlkZRFgI03K8NWf
         xPwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Wnl1J2lyc/2Dllv9MFiUvsOVEHc9+cKGmTSSP5g7QW0yHbBe5
	cg03qVUo6hMoPtF5I+znO6A=
X-Google-Smtp-Source: ABdhPJzUOeOEIddifcOsdb/JYNb6zhRz9OmGqurWVJZMMWNAwKWV3NvgETHzGps8X9VYIXuG5N4N3g==
X-Received: by 2002:a05:622a:296:b0:2f3:6b72:89dc with SMTP id z22-20020a05622a029600b002f36b7289dcmr9015508qtw.670.1651065576466;
        Wed, 27 Apr 2022 06:19:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:f14:b0:69b:dd23:cc12 with SMTP id
 v20-20020a05620a0f1400b0069bdd23cc12ls3144645qkl.9.gmail; Wed, 27 Apr 2022
 06:19:35 -0700 (PDT)
X-Received: by 2002:a05:620a:14b5:b0:69e:9ccf:de5e with SMTP id x21-20020a05620a14b500b0069e9ccfde5emr16297238qkj.596.1651065575551;
        Wed, 27 Apr 2022 06:19:35 -0700 (PDT)
Date: Wed, 27 Apr 2022 06:19:35 -0700 (PDT)
From: Prabhakar Lad <prabhakar.csengg@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <400480ed-70db-467a-b47d-b4c3f3641777n@googlegroups.com>
Subject: Linux and u-boot requirements
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1978_620190106.1651065575032"
X-Original-Sender: prabhakar.csengg@gmail.com
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

------=_Part_1978_620190106.1651065575032
Content-Type: multipart/alternative; 
	boundary="----=_Part_1979_580074985.1651065575032"

------=_Part_1979_580074985.1651065575032
Content-Type: text/plain; charset="UTF-8"

Hi All,

I recently tried to build the v0.12 tag with the upstream kernel 
(v5.18-rc4) for emconrzg1h, but the build failed due to api changes 
(cpu_up/cpu_down mainly).

So I wanted to check what are the strict requirements for Linux and u-boot 
as I plan to add new arm64 platform.

Also is there any document/link that I can refer to porting on new platform?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/400480ed-70db-467a-b47d-b4c3f3641777n%40googlegroups.com.

------=_Part_1979_580074985.1651065575032
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi All,</div><div><br></div><div>I recently tried to build the v0.12 t=
ag with the upstream kernel (v5.18-rc4) for emconrzg1h, but the build faile=
d due to api changes (cpu_up/cpu_down mainly).<br></div><div><br></div><div=
>So I wanted to check what are the strict requirements for Linux and u-boot=
 as I plan to add new arm64 platform.<br></div><div><br></div><div>Also is =
there any document/link that I can refer to porting on new platform?<br></d=
iv><div><br></div><div>Cheers,</div><div>Prabhakar<br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/400480ed-70db-467a-b47d-b4c3f3641777n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/400480ed-70db-467a-b47d-b4c3f3641777n%40googlegroups.co=
m</a>.<br />

------=_Part_1979_580074985.1651065575032--

------=_Part_1978_620190106.1651065575032--
