Return-Path: <jailhouse-dev+bncBCS35VONUYNBB4NK363AMGQEFIOF5EI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x139.google.com (mail-il1-x139.google.com [IPv6:2607:f8b0:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12096AF7B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2024 05:35:15 +0200 (CEST)
Received: by mail-il1-x139.google.com with SMTP id e9e14a558f8ab-39d4ba9c42asf72846455ab.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Sep 2024 20:35:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1725420914; cv=pass;
        d=google.com; s=arc-20240605;
        b=NhpltztiuuCRGNyJVK/DQFtu+YdpFETjN01EY0yGIGjHVK7KcoYnp+LAYX5WWIkwPJ
         IstPcPENQu7LdtxuswJvKy+OgPxjeEl2jhIxib7fQ528jkem77kspXbC6EhTkOCgDNV7
         1ETjIgM4DQ3z3SR54Bcq4WupBwSrHCppmvXieQwNcKRWZXRJiw0wZ4/Ln3uSqaliBiFg
         n0WXpJBY8Q1mwPoGCylm772VyCNDcSIDScBCk3Iu25NCusPqEK+/8DCKVUemog24RHZq
         D7UcfapfeNf0G87Xm7zNDHgm54ydP92JjV/0mBY7cKP6tvv5Ap+NYIky7lguR0pgnC6c
         36FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=Z6a4LE3aTs7nPHIIqT+yoZT4BkA+EPEybwmMnRWQSE0=;
        fh=aaB93SeYeU/p3nD2mrXf9PgfFFiX4J7vjCA5XmKihBs=;
        b=DQ5fMsXstfhtVfa8aDd6Sla6MxcuFHFFnfMSaXZVoF9g0O56595E5nURmNpbBmgiZ6
         XSOSgNrH82plAmMWRhuCkYTcjL2+MJu/zdGo+nDYCP5wNOhNEovh9PiyJljSFxpsSI12
         sOLJ9e9w5D3v90QRkacc9735dDFzZoEffiWx0enThHrrErMQs+GlXNVmlcSRJrZ/mWBp
         4yiWiXdgSgy9yN1guDopUwTJvNGwX9xwT4sAB8UCM2dHp0vOFvE/sjdY52QbA9Dr9AUQ
         GrpTC0wiX39Whv/L+Yp39sGUumYc5hjqHziWh082dyy9D+9tv/3N9ojgtKGh97JQ1fYI
         Cw6Q==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFvHSlqO;
       spf=pass (google.com: domain of qiangxu431@gmail.com designates 2607:f8b0:4864:20::102a as permitted sender) smtp.mailfrom=qiangxu431@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1725420914; x=1726025714; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6a4LE3aTs7nPHIIqT+yoZT4BkA+EPEybwmMnRWQSE0=;
        b=h1ew+w8vFRlfI3vCWk6eeujRRVVR1sTvvGx3rVBKN4KJU7isH+uvW3fKoK81H7gVTo
         +Q9Y+MBFxFBmbzuPIcW/8npwwEN7XV0dyvOZ8tJoccfXbzrx4B79LVmnMG3QLQQ4fP7u
         4dtsLnI5oXUvLU+XKlSFVQQZFoAnvxqRrww7HzRiv/NseKs1etBBheg/GHb1goCnS80m
         Bxi/F3RGJ2p5toE07z70FpsTSH/7FyFvIB+yAjVyS2D1HGYAP11xThVaUG5trXp423EX
         L/sRkoVAhpqiNA5Huoaf0ay9iU5CCLOWUkd2yNiNdCAsQYrlmafF0oFQyA69AcrufzdZ
         Xm8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725420914; x=1726025714; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z6a4LE3aTs7nPHIIqT+yoZT4BkA+EPEybwmMnRWQSE0=;
        b=GEnX/kf7tCclnHyP9tDmidwKspU34o9+Gcdy5AK8Ez0EcLiXAFEWe5k6BC6QEqOT2J
         SZ/nuB/AAUWDQJTOt79qzC+rXziZZa1wCMJCq909WWZpVZpbIxlgyZh0tDyOn+wgjPRu
         y06e2uP4iBzbG/gq9J8pYORfYCk0rWEzoQLt0uVY/LMm6Y41pz7aRc3+tM7gix5BSiWe
         QoGvQRdBETLFqIJ1ShjcD55SVSxSRaECyzKvy+GFWSd847c3rP5v8yioixal1nNfPb3Z
         jeMiR3HoVDbhmaSQxsjX1Dy1f1o83vLuP+S/+GDtKU+rMLztuSp5v6D7C8d7WeI5PE4w
         0KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725420914; x=1726025714;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-beenthere:x-gm-message-state
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Z6a4LE3aTs7nPHIIqT+yoZT4BkA+EPEybwmMnRWQSE0=;
        b=VNKZXOFu79v41btCYCJNniNCkjlTb3EkCNyEkuSrkqxcr4Njwkqo4eWQS0oV8nMRwN
         LJzA5xAyopsPjokgETzM4tqpGz3wESBGWCrS5tWRNg9Kr/EB5Jk62uC0HOAVdBEVyoBR
         ITTuaYi64IXBvmbzEujYEzC35XyIztbexeBPa07ujhOhZ/4MkKJ3tlV28zVMrtUkMRtz
         fPs3Cvfkrb6pFvUns1xh8EbREf7cK2SQ6CMxftIqi1zrXwEm4VebuKdlltIZHUmtQk6M
         8AoymJFNbee+4gPVAAFLE3bf0e6FHRKmZMbvS82OpUCyBHukyJPkf24RKSWcG5CnyYUM
         75JA==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCVObNH9imknMpE6g+i5ikCJON5VWUXsNOEtTvoF780+CNb0CYVZkNYSiyo+PnOnYptM/qs4Vg==@lfdr.de
X-Gm-Message-State: AOJu0Yw2f5UGYQ0fmbEc8HQgxNfFqAfvQMFYXvba4EIOdgkGzPmSfHjA
	tLaJl0UewcZvsBxA6AY6lTFZOvcmmHkcVSQ26ogc2GSOU6RTe4W7
X-Google-Smtp-Source: AGHT+IGIlpnv1kTQfx5+Me3bH1FqF862jbvd8x7rflsI9oqoMSwq3GNLzCByr9qzhcy5yccpna1/Lw==
X-Received: by 2002:a05:6e02:52c:b0:39f:558a:e404 with SMTP id e9e14a558f8ab-39f558ae637mr106147995ab.4.1725420914288;
        Tue, 03 Sep 2024 20:35:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:4aa:b0:39f:5281:28bb with SMTP id
 e9e14a558f8ab-39f52812f72ls18601475ab.0.-pod-prod-08-us; Tue, 03 Sep 2024
 20:35:12 -0700 (PDT)
X-Received: by 2002:a05:6e02:1c2f:b0:39f:3227:8d27 with SMTP id e9e14a558f8ab-39f378566ccmr229045375ab.24.1725420912724;
        Tue, 03 Sep 2024 20:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725420912; cv=none;
        d=google.com; s=arc-20240605;
        b=OLRwV2RlCTXb6dIaEAbJb0zTXpPGfnJGm9VYkVPc5JJk3HgrJYXVxgb6sZPUxa8fRu
         GQNZnoAcCNjTIEnTta3C7ZG6N8ppzsWqqLD7T41NmQwAZ0UVOX37YTFf554bWosY+mFp
         13oRDxSDwcQdZnWe8fecNvMQUY+72Q/uTeNgMn4L/LSph/Fec5m2rNUvwOhMBFyng4Ue
         7Y2qJ2KT73am+Xl2QF0Z/HRr21nZDfW0D+Y12cQwAD40+x0DjJmVvmd8sKcHFNsC36c2
         9pc4+P1h3N4dovhS+BBo+uyqyDV0/MyTT98Qc+OYFvadvA2E/I2uObLl/rDIaN9vqp3I
         ANSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=moW7qgdF4+i3XdB51YVE069CybMh0P0+fov8qulShbI=;
        fh=2tQzQ7BDCTqJm82PDY7f/SoNACc8xWmtm+Icohy5zLg=;
        b=XXktvqb7r/Bh4fYPORxW4a1aAVRmYYAtyrA3qXSDKMY83SQVRVTGS+yrNsa2ht/h7b
         CEuDI++qKC5q4nWI4J4eNosXHyIYeCpnn9kcU1OW/FXilKCHn97w6/KVnCrNe2y+xrRM
         DU76AJ7ml3WhyRnpINrNbQF25J875K6HYLPmLa8WKHc5WSVohMNAnL8S8OK/vaOferzp
         EusG+R+nMCKNL+YYfWKsun/GM/wyHARQOYrcQdHjBqWkbYizt2sOO7X6JVn8Zao6QNzG
         kSPxLjvKIcV3Pv+x0Opj3iYgHXtCItH7zY9sQEpzREor3d7r/NDn/W++zzVUhqMKF1Zp
         0xEw==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=dFvHSlqO;
       spf=pass (google.com: domain of qiangxu431@gmail.com designates 2607:f8b0:4864:20::102a as permitted sender) smtp.mailfrom=qiangxu431@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=pass header.i=@googlegroups.com
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com. [2607:f8b0:4864:20::102a])
        by gmr-mx.google.com with ESMTPS id e9e14a558f8ab-39f47386fe2si3272535ab.5.2024.09.03.20.35.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Sep 2024 20:35:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qiangxu431@gmail.com designates 2607:f8b0:4864:20::102a as permitted sender) client-ip=2607:f8b0:4864:20::102a;
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2d8b679d7f2so2353604a91.1
        for <jailhouse-dev@googlegroups.com>; Tue, 03 Sep 2024 20:35:12 -0700 (PDT)
X-Received: by 2002:a17:90a:c38a:b0:2d8:8cef:3d64 with SMTP id
 98e67ed59e1d1-2da7482c228mr3941334a91.6.1725420911584; Tue, 03 Sep 2024
 20:35:11 -0700 (PDT)
MIME-Version: 1.0
From: qiang xu <qiangxu431@gmail.com>
Date: Wed, 4 Sep 2024 11:35:00 +0800
Message-ID: <CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm+5WSxvr3-A@mail.gmail.com>
Subject: Jailhouse triggered exception #14
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="00000000000085ef3a062142dc63"
X-Original-Sender: qiangxu431@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20230601 header.b=dFvHSlqO;       spf=pass
 (google.com: domain of qiangxu431@gmail.com designates 2607:f8b0:4864:20::102a
 as permitted sender) smtp.mailfrom=qiangxu431@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;       dara=pass header.i=@googlegroups.com
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

--00000000000085ef3a062142dc63
Content-Type: text/plain; charset="UTF-8"

Hi Jailhouse Team,

    I am trying to run Jailhouse on a real physical machine(x86).When I run
jailhouse enable xx.cell. I encounter the following error. I'm not sure
what is happening. Can you help me?

'Initializing Jailhouse hypervisor v0.12 on CPU 2
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 48/974, remap 0/131072
Initializing processors:
 CPU 2... (APIC ID 4) OK
 CPU 3... (APIC ID 6) OK
 CPU 1... (APIC ID 2) OK
 CPU 0... (APIC ID 0) OK
Initializing unit: VT-d
DMAR unit @0xfed90000/0x1000
DMAR unit @0xfed91000/0x1000
Reserving 120 interrupt(s) for device f0:1f.0 at index 0
Initializing unit: IOAPIC
Initializing unit: Cache Allocation Technology
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:01.0 at index 120
Adding PCI device 00:02.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:02.0 at index 121
Adding PCI device 00:14.0 to cell "RootCell"
Reserving 8 interrupt(s) for device 00:14.0 at index 122
Adding PCI device 00:14.2 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:14.2 at index 130
Adding PCI device 00:16.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:16.0 at index 131
Adding PCI device 00:17.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:17.0 at index 132
Adding PCI device 00:1c.0 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1c.0 at index 133
Adding PCI device 00:1f.0 to cell "RootCell"
Adding PCI device 00:1f.2 to cell "RootCell"
Adding PCI device 00:1f.3 to cell "RootCell"
Reserving 1 interrupt(s) for device 00:1f.3 at index 134
Adding PCI device 00:1f.4 to cell "RootCell"
Adding PCI device 01:00.0 to cell "RootCell"
Reserving 8 interrupt(s) for device 01:00.0 at index 135
Adding PCI device 01:00.1 to cell "RootCell"
Reserving 4 interrupt(s) for device 01:00.1 at index 143
Adding PCI device 01:00.2 to cell "RootCell"
Reserving 3 interrupt(s) for device 01:00.2 at index 147
Adding PCI device 01:03.0 to cell "RootCell"
Reserving 16 interrupt(s) for device 01:03.0 at index 150
FATAL: Jailhouse triggered exception #14
Error code: 9
Physical CPU ID: 4
RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef50 FLAGS: 10093
CR2: 0xffffff800400b000
Stopping CPU 2 (Cell: "RootCell")'

Regards,
Qiang

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr3-A%40mail.gmail.com.

--00000000000085ef3a062142dc63
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jailhouse Team,<div><br>=C2=A0 =C2=A0 I am trying to ru=
n Jailhouse on a real physical machine(x86).When I run jailhouse enable xx.=
cell. I encounter the following error. I&#39;m not sure what is happening. =
Can you help me?</div><div><br>&#39;Initializing Jailhouse hypervisor v0.12=
 on CPU 2<br>Code location: 0xfffffffff0000050<br>Using x2APIC<br>Page pool=
 usage after early setup: mem 48/974, remap 0/131072<br>Initializing proces=
sors:<br>=C2=A0CPU 2... (APIC ID 4) OK<br>=C2=A0CPU 3... (APIC ID 6) OK<br>=
=C2=A0CPU 1... (APIC ID 2) OK<br>=C2=A0CPU 0... (APIC ID 0) OK<br>Initializ=
ing unit: VT-d<br>DMAR unit @0xfed90000/0x1000<br>DMAR unit @0xfed91000/0x1=
000<br>Reserving 120 interrupt(s) for device f0:1f.0 at index 0<br>Initiali=
zing unit: IOAPIC<br>Initializing unit: Cache Allocation Technology<br>Init=
ializing unit: PCI<br>Adding PCI device 00:00.0 to cell &quot;RootCell&quot=
;<br>Adding PCI device 00:01.0 to cell &quot;RootCell&quot;<br>Reserving 1 =
interrupt(s) for device 00:01.0 at index 120<br>Adding PCI device 00:02.0 t=
o cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 00:02.0 =
at index 121<br>Adding PCI device 00:14.0 to cell &quot;RootCell&quot;<br>R=
eserving 8 interrupt(s) for device 00:14.0 at index 122<br>Adding PCI devic=
e 00:14.2 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for devi=
ce 00:14.2 at index 130<br>Adding PCI device 00:16.0 to cell &quot;RootCell=
&quot;<br>Reserving 1 interrupt(s) for device 00:16.0 at index 131<br>Addin=
g PCI device 00:17.0 to cell &quot;RootCell&quot;<br>Reserving 1 interrupt(=
s) for device 00:17.0 at index 132<br>Adding PCI device 00:1c.0 to cell &qu=
ot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 00:1c.0 at index 1=
33<br>Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;<br>Adding PCI =
device 00:1f.2 to cell &quot;RootCell&quot;<br>Adding PCI device 00:1f.3 to=
 cell &quot;RootCell&quot;<br>Reserving 1 interrupt(s) for device 00:1f.3 a=
t index 134<br>Adding PCI device 00:1f.4 to cell &quot;RootCell&quot;<br>Ad=
ding PCI device 01:00.0 to cell &quot;RootCell&quot;<br>Reserving 8 interru=
pt(s) for device 01:00.0 at index 135<br>Adding PCI device 01:00.1 to cell =
&quot;RootCell&quot;<br>Reserving 4 interrupt(s) for device 01:00.1 at inde=
x 143<br>Adding PCI device 01:00.2 to cell &quot;RootCell&quot;<br>Reservin=
g 3 interrupt(s) for device 01:00.2 at index 147<br>Adding PCI device 01:03=
.0 to cell &quot;RootCell&quot;<br>Reserving 16 interrupt(s) for device 01:=
03.0 at index 150<br>FATAL: Jailhouse triggered exception #14<br>Error code=
: 9<br>Physical CPU ID: 4<br>RIP: 0xfffffffff000b250 RSP: 0xfffffffff023ef5=
0 FLAGS: 10093<br>CR2: 0xffffff800400b000<br>Stopping CPU 2 (Cell: &quot;Ro=
otCell&quot;)&#39;<br></div><div><br>Regards,<br>Qiang</div><div><br></div>=
</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm%2B5WSxvr=
3-A%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CACFR-a7pkHV775KSG-Jn_Yn70mWSZ66jcU4-RRKm=
%2B5WSxvr3-A%40mail.gmail.com</a>.<br />

--00000000000085ef3a062142dc63--
