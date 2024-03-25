Return-Path: <jailhouse-dev+bncBDZ335W4UAMBBMVYQSYAMGQEAY4KDIQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id E313688915F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Mar 2024 07:39:48 +0100 (CET)
Received: by mail-yb1-xb3e.google.com with SMTP id 3f1490d57ef6-dcc15b03287sf5785707276.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 24 Mar 2024 23:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711348787; x=1711953587; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmbnZ/qeThJNG2eXLdoU0glbOmecnAk6dAZSapsTX2Y=;
        b=c4r3eNQJ3e6jOmFR47v1Fg0GhgMx/qFFDNti+J+LTiCidqL68KSu0XCiiz7xTQmdUf
         YTb0RMBxKBWy2CNhCF9i2nHpiFp96HJw4+otiDQ9f7AdBAdJL5i/cuCivP+MHefq+ciS
         33qzZcEVnY6bR9scaHlrDtq2QV6YFQPPBjyRdWBWvov6AgSgdyeUBDj0g/1o+dppKsi6
         QATMT7Ar5ZX9344coEvjt84bnrbhrwzB31IUvud/wVrnQvMyKPGvOFahBflNJfF+eThH
         E1EYCaht8D4obRzHwUim++paP5vd3B9d2grG7e0CPyu5ZIBHkX7uwdJ3ba50UQbMznfo
         +Fog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711348787; x=1711953587; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mmbnZ/qeThJNG2eXLdoU0glbOmecnAk6dAZSapsTX2Y=;
        b=EqDXJhuJGFvr4Nl/hn3citAjh+/8zfEKLBRZGmLzG3VOUzp6iZefkPABOJ5hvgidn5
         CX7cu1Xoh4MCF38iWhm0F9zGQliJNULE4B2yc2uwb1+XsbtrCvQylWRmq2ufMSv7Pdrz
         p+MN5L4y/fYvcFfvRT/bNZM9NG33pv76Ii6J1tKns+fFeopAUVs5q3A6Y3MmTs6F5QMi
         jYQlYcOlBRy1qKvV9dmVNi+KpMCltQpGuw3zJo5lCVdqOuPsIfLL2d5xi6TyMUOGDxq/
         c8YOSmR/ROkDus+ZEl15zY7z/fsrvVL15cLqnEQxEPhx50ZpXcjUvbOKXAml0hBz+0u5
         g+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711348787; x=1711953587;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmbnZ/qeThJNG2eXLdoU0glbOmecnAk6dAZSapsTX2Y=;
        b=mI5rxL4XqlI8CKPbVvGbUnB0u125q6avanYvMO90ELQzWzWLBMakUYGcniDfboCAim
         G0HCXguAzDW63YxhEsH76+fWNTL6zl7MvW1a2ZadVSCoBOENR0Hpj78fuWfgdNr+Xg//
         gOa4wxoCEL8N7jgGCXePhukgU4HCPZCSEFFIzE2sRupmEXw+uOyhj1q2sq7mEug/53IO
         y8uvEVHvUMJF9LpAiSCCGPxQig8H+9pzDANvFUWxmy9slpLHrJHiNzmZqQOlG8+OiaNr
         zJOLyxCGCdQN2jPPACpJKlClm94vzwKi8/6F3E7XML/Zy18qZfjRYF4EqyvGq4cVT1qV
         FkFA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXjF1cM8odkhCtGHnCBEAaiUCbIgXYRUGenPQ2RzZpX60kK+I6gq8QQcNRoauapjK536+CkaafC72qZw5rQeZ5BDTkmBwpzyUu6Nro=
X-Gm-Message-State: AOJu0YykepKmuiljSYeyWKj6ioyy2N1jbS3y6afEx08HV7oiyY7gI/Gt
	7Z1+UPgvgfRZ9gj+qMg/d7SYBqIzA25ui48ZFwmAxyOaJnSsfez1
X-Google-Smtp-Source: AGHT+IE5dp9V6jSGz+qzriyxTUYYRh6MdlcTbj5IvU8+EfOZULa07htpz5KchSfgd1pV/XR39tThNQ==
X-Received: by 2002:a05:6902:4c7:b0:dcb:dd25:74c4 with SMTP id v7-20020a05690204c700b00dcbdd2574c4mr4098698ybs.52.1711348787650;
        Sun, 24 Mar 2024 23:39:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:e052:0:b0:dcc:717f:41b7 with SMTP id x79-20020a25e052000000b00dcc717f41b7ls597038ybg.0.-pod-prod-07-us;
 Sun, 24 Mar 2024 23:39:46 -0700 (PDT)
X-Received: by 2002:a05:6902:1141:b0:dd9:3a6b:11f8 with SMTP id p1-20020a056902114100b00dd93a6b11f8mr2050648ybu.5.1711348786223;
        Sun, 24 Mar 2024 23:39:46 -0700 (PDT)
Date: Sun, 24 Mar 2024 23:39:45 -0700 (PDT)
From: hongyao he <hehye0312@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <2b241937-ed0e-480d-873f-aed0f3e57837n@googlegroups.com>
Subject: jailhouse: HYP mode not available
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_6572_1452180389.1711348785548"
X-Original-Sender: hehye0312@gmail.com
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

------=_Part_6572_1452180389.1711348785548
Content-Type: multipart/alternative; 
	boundary="----=_Part_6573_2059365696.1711348785548"

------=_Part_6573_2059365696.1711348785548
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All
I am trying to test  jailhouse on the T113-i=EF=BC=8CDual core ARM Cortex-A=
7.
I had compiled jailhouse-master and copied it into the system.
I take the steps:
1.cp ./hypervisor/jailhouse.bin /lib/firmware/
2.cp tools/jailhouse /usr/bin/
3.insmod ./driver/jailhouse.ko
4.jailhouse enable configs/arm/t113-arm.cell
when i enable root-cell,i get the error:
jailhouse: HYP mode not available
JAILHOUSE_ENABLE: No such device
I know Linux must starts in EL2,but i do not konw how to operation it.
i see kernel source in linux-5.4/arch/arm/kernel/head.S that  it will=20
operate "ensure svc mode and all interrupts masked",how can i start Linux=
=20
in EL2.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2b241937-ed0e-480d-873f-aed0f3e57837n%40googlegroups.com.

------=_Part_6573_2059365696.1711348785548
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All<div>I am trying to test=C2=A0 jailhouse on the=C2=A0<span style=3D"c=
olor: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, =
Arial, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microso=
ft YaHei&quot;, &quot;WenQuanYi Micro Hei&quot;, sans-serif; text-indent: 2=
8px;">T113-i=EF=BC=8C</span>Dual core ARM Cortex-A7.</div><div>I had compil=
ed=C2=A0jailhouse-master and copied it into the system.<br /></div><div>I=
=C2=A0take the steps:</div><div>1.cp ./hypervisor/jailhouse.bin /lib/firmwa=
re/<br /></div><div>2.cp tools/jailhouse /usr/bin/</div><div>3.insmod ./dri=
ver/jailhouse.ko</div><div>4.jailhouse enable configs/arm/t113-arm.cell</di=
v><div>when i enable root-cell,i get the error:</div><div>jailhouse: HYP mo=
de not available<br /></div><div>JAILHOUSE_ENABLE: No such device<br /></di=
v><div>I know=C2=A0<span style=3D"color: rgb(80, 0, 80);">Linux must starts=
 in EL2,but i do not konw how to=C2=A0</span>operation it.</div><div>i see =
kernel source in linux-5.4/arch/arm/kernel/head.S that=C2=A0 it will operat=
e "ensure svc mode and all interrupts masked",how can i start Linux in EL2.=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2b241937-ed0e-480d-873f-aed0f3e57837n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/2b241937-ed0e-480d-873f-aed0f3e57837n%40googlegroups.co=
m</a>.<br />

------=_Part_6573_2059365696.1711348785548--

------=_Part_6572_1452180389.1711348785548--
