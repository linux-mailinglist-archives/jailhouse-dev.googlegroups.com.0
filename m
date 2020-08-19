Return-Path: <jailhouse-dev+bncBCZKRDGF7APRB4EN6T4QKGQEIJ3HQQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x137.google.com (mail-il1-x137.google.com [IPv6:2607:f8b0:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ED9249B50
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 13:03:14 +0200 (CEST)
Received: by mail-il1-x137.google.com with SMTP id i66sf16504707ile.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 04:03:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597834993; cv=pass;
        d=google.com; s=arc-20160816;
        b=0os7FAJvPA5Au6DfxDpFwvCOIx68iqso11bxqdJZc4PFMnEAIrI2VXe6A0ATOm0lxz
         FtHG+vHVKsP8j77XtlimbXjClcjhLbULUPqgqPAuu+1lJHDKfCeOOEbsawDV+r2FTmKE
         ph0dzOp5TawBSTy4jTrECoTcwYayuvpFOcWu200BclOBNH3WWzskRnbbMs6CzpO8Exyy
         YA+L+cQD9IBcquyK2dOT/kYr1++5ilOe1XZimZ7qxD+GrZn68BqoYXOvTX1kDlaSqSNx
         mRV8UVfn9T8Wfd1Sm4eo6gapuWjwmYlKkGW672be81Fh/93TW/801G51dxlikrDqj1/o
         eWnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature;
        bh=5qrqwub6LaV0WePTPFWS4GQJoE1CRs15LipT90++Lqw=;
        b=NSLb7X5eah0Iis8F/ie3tE8Q7ecMvUMIlkWaMnEXf/zk1RhYTfG7vxWWC2hI2fpuCH
         l8ePM2jE8lVbZHFNFl9+DZX2YgxIuzMnzBbWuOrzfRCy+Yw4gALVvf9VTxUJwP+amIXd
         EdrEdAt1HHulZA7it5H/zRMHoeiZzD7VmTLYJLvnl+sUPA1BWuTtkMIQ+tBAI4iGTq8T
         0mqZBAblqarup+mp22/RGnlSyBirDwlD2wcZxazu6OEGn9dkS5oVjskvq6P75bgnfkuP
         lfytLf3bVKJjOd/5DQUG9eVzljp0QBswvYN1nQbS/U8RP9+tvaHT5YVk7rnEzHKDgdIx
         Vd9w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=a1MdKYjj;
       spf=neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5qrqwub6LaV0WePTPFWS4GQJoE1CRs15LipT90++Lqw=;
        b=KAjjGsIq2JHVIhK1SF8cWsOXE2g16ZH31+Puv+YnTbNK6Q+BAJ8jpxlq1jCWOvH5FT
         Zhg8AFIf5j6i3rWVt4J5hNscS4HRyZgXTRXxGIrd7NoWltsU0VYeXSRyultbih1cPwdC
         7vGsDDDIRrl1BoXz9iUBYVWn1GHJBO76J1ldHI2AZImZc9N93qkkBwDGYe63g1nCXjKL
         KBp6Ix84ZXC5DIfeGSNQ/xmMTo9FEnTEfDcEYcxwrrXk9kYQYRCzeERnVCdpcWbA+kcx
         sLtJ00fJkXTxrZ2UEKqIlkv7K/3WsqD4graiQO1XD6nBPl3e5c84G/aLx9u3I0s6OJ2p
         JcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5qrqwub6LaV0WePTPFWS4GQJoE1CRs15LipT90++Lqw=;
        b=Pb9mRh15H22ANAdznmBCSBpRio0YRMLWwIJnbZmK6Xv4acC+c/XO5XVi2vl6h8MWzf
         Slerc8VSgP4Q4NDkNF27opxtXpdyT3fpo1y5l/LS4kn4FPS5bw+D5xgG/BgoA50bKf0a
         jNQLj+Ljl0gEf7HjbU4thjDI9yj6JrxEBAUWG4QCzNSeIzdmutelZK0rtwJav/1KFvwQ
         bziSeYH3VsUOR80dB7YImc9CkbHQ5QZlBo9EucwNdxG2HGJf7Ar9Zfdkx29IfSusungN
         CZbnvexhOMpTWO9qDhCB5Ho7iaD7XGBCmZ0hFy5Phhe5N75DIfTQm2O0vmNA7bE88iMm
         zAOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5337ZI9m/3L32a0ozu1Ros8fl6OrRU+8t5P8QSwngk47RqqYUKq9
	lWbxa0rGd7HzAtVHELLyyU8=
X-Google-Smtp-Source: ABdhPJxFXJDc6XPFCDzwxdfPsbPDBAHiVrCncVQm3YZNDEzriJNwxgBBij1IXdzNNsPfAhfhbCLplQ==
X-Received: by 2002:a05:6e02:12a3:: with SMTP id f3mr11636525ilr.83.1597834993061;
        Wed, 19 Aug 2020 04:03:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:85c4:: with SMTP id f187ls5879953ilh.1.gmail; Wed, 19
 Aug 2020 04:03:12 -0700 (PDT)
X-Received: by 2002:a92:9e48:: with SMTP id q69mr22718375ili.170.1597834992084;
        Wed, 19 Aug 2020 04:03:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597834992; cv=none;
        d=google.com; s=arc-20160816;
        b=UESZbZgzPurDNv3mYiEM6Lwje5tLQBuLSJNH5+RLdQ2w2ySjNKpSndezCjaLY1cs7X
         rrQCIDJ6DPpQWkdQjsFiqurjO5Rj+YQkKwVG5wouIjsU1pbpz4TrflRoWMYD9gtVl6K/
         GIY1zh0zBRv6zv4kEuLhjr2OgEKR54geiVGvwOC3l67HsUh5m0D/afGDY+Do8QNmtQhu
         HVgaoApj7oVPuEHERgRJCD4YWRUUxRuyfrN93XarEJ/sGvgjVEssE+FwBY84XhE7YFOq
         fgEGk2RNdvHjkxQagxCHYnyIfflDYQbZWfrdyXiHUX3A98dvAJLYlDOOVupgJ3pnXBg+
         2c+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Q0yjaWJogmvzpH/0IpY11UngEqMzwco7ra6vKGyUqAM=;
        b=kKWvcyjTS8L9vduse+Q4iYSxoodVVoH0zJOyE+AHrOb7Wuci0WGlNNQELr0RwhV2wE
         yk3+n1Ns6ByQjqb2OvV+YmilHXdTPwM4TJBReJ1OOUd4DjvNUzIr94b01Gvne9sMDfuL
         YVY4/pssqiHGt7o80Cg7PTGxEQAxvisnhTE8z5V+aTfPlVHYBlZ4nw51RK0Q3QbSpRon
         bl0dq8y7tFT4ihDP0fELAzvsxyDVw46UQ/Sfr5TazDCvUoXo5iYFXMC0k6oh8uusGNUA
         JRPFGO3ZTtFJQPs7jbYTjaBUbyn2Nhhu3a2fcLnDpu91vCu+W+yNneNVUGSQoF0Y6UUL
         Q/cQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623 header.b=a1MdKYjj;
       spf=neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com. [2607:f8b0:4864:20::343])
        by gmr-mx.google.com with ESMTPS id u9si1199436ilg.0.2020.08.19.04.03.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2020 04:03:11 -0700 (PDT)
Received-SPF: neutral (google.com: 2607:f8b0:4864:20::343 is neither permitted nor denied by best guess record for domain of jakub@luzny.cz) client-ip=2607:f8b0:4864:20::343;
Received: by mail-ot1-x343.google.com with SMTP id v6so18677836ota.13
        for <jailhouse-dev@googlegroups.com>; Wed, 19 Aug 2020 04:03:11 -0700 (PDT)
X-Received: by 2002:a05:6830:4c2:: with SMTP id s2mr18345033otd.183.1597834991218;
 Wed, 19 Aug 2020 04:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200817171736.78100-1-jakub@luzny.cz> <57c67012-fee7-d7f1-1201-25415e39034a@siemens.com>
 <CAGdCPwtX9JoP_RocDeB-MF3XTz+yyrXYL2LBCOs_-xa_TVA6Ug@mail.gmail.com> <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
In-Reply-To: <83d289a5-8928-0fc2-68aa-64df76e8ee16@siemens.com>
From: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Date: Wed, 19 Aug 2020 13:03:00 +0200
Message-ID: <CAGdCPwsyLjLLaPEsnhr6bwO9ioXQRvSz2Vg+48ym-R5kV_V1nA@mail.gmail.com>
Subject: Re: [PATCH] configs: arm64: Add support for RPi4 with more than 1G of memory
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="0000000000000fc50505ad38f329"
X-Original-Sender: jakub@luzny.cz
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@luzny-cz.20150623.gappssmtp.com header.s=20150623
 header.b=a1MdKYjj;       spf=neutral (google.com: 2607:f8b0:4864:20::343 is
 neither permitted nor denied by best guess record for domain of
 jakub@luzny.cz) smtp.mailfrom=jakub@luzny.cz
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

--0000000000000fc50505ad38f329
Content-Type: text/plain; charset="UTF-8"

That PCI MMIO config space is for a virtual host controller that
> Jailhouse provides. If has to be placed into a free range in the
> physical address space of that target. If you relocate that range in the
> system config, also update the non-root cell device tree. The root cell
> will get that information automatically.
>
> Could you share /proc/iomem (without reservations) from your larger RPi?
>

I know, I was just wondering where that address comes from. So it's just a
randomly chosen address from free space? Or are there any special
requirements that do not apply for the other memory regions and I might be
not aware of them? I'll have to check it over again to share the error I
was getting when I was trying to move it.

/proc/iomem from 8G RPi4 with linux-raspberrypi 4.19 and (almost) default
config.txt:
enable_uart=1
dtoverlay=vc4-fkms-v3d
arm_64bit=1

00000000-3b3fffff : System RAM
  00000000-00000fff : reserved
  00080000-00c5ffff : Kernel code
  00c60000-00d5ffff : reserved
  00d60000-00f8ffff : Kernel data
  1ec00000-2ebfffff : reserved
  2eff5000-2effffff : reserved
  373f7000-3b3fefff : reserved
  3b3ff000-3b3fffff : reserved
40000000-fbffffff : System RAM
fd500000-fd50930f : pcie@7d500000
fd580000-fd58ffff : genet@7d580000
  fd580e14-fd580e1c : unimac-mdio.-19
fd5d2200-fd5d222b : thermal@7d5d2200
fe007000-fe007aff : dma@7e007000
fe007b00-fe007eff : dma@7e007b00
fe00a000-fe00a023 : watchdog@7e100000
fe00b840-fe00b87b : mailbox@7e00b840
fe00b880-fe00b8bf : mailbox@7e00b880
fe100000-fe100113 : watchdog@7e100000
fe101000-fe102fff : cprman@7e101000
fe104000-fe10400f : rng@7e104000
fe200000-fe2000b3 : gpio@7e200000
fe201000-fe2011ff : serial@7e201000
  fe201000-fe2011ff : serial@7e201000
fe215000-fe215007 : aux@7e215000
fe215040-fe21507f : serial@7e215040
fe300000-fe3000ff : mmcnr@7e300000
fe340000-fe3400ff : emmc2@7e340000
fec00000-fec03fff : hub
fec04000-fec07fff : core0
fec11000-fec1101f : watchdog@7e100000
100000000-1ffffffff : System RAM
  1f7000000-1f7dfffff : reserved
  1f7fc2000-1ffdfffff : reserved
  1fff00000-1fff5ffff : reserved
  1fff60000-1fff60fff : reserved
  1fff61000-1fffc0fff : reserved
  1fffc3000-1fffc3fff : reserved
  1fffc4000-1fffc6fff : reserved
  1fffc7000-1ffffefff : reserved
  1fffff000-1ffffffff : reserved
600000000-603ffffff : pcie@7d500000
  600000000-6000fffff : PCI Bus 0000:01
    600000000-600000fff : 0000:01:00.0
      600000000-600000fff : xhci-hcd


> Hmm, do not recall the background for that anymore. Why does the overlay
> not work with that currently used DT?
>
> RPi is an (out-of-tree) mess...
>

It's about where the DTBs are taken from. There are two sources, although
the result should be the same:

1) raspberrypi/firmware GitHub repository, where the prebuilt *dtb and
*.dtbos are. That's what is used in jailhouse-images.
2) arch/arm/boot/dts/[overlays] in linux-raspberrypi. That where I can
easily add them with a patch, but they won't make it to the boot partition.

So the thing is that I can make jailhouse-images to use the dtbs built with
kernel instead of the prebuilt ones. Doesn't seem like a big deal. I'm just
aware of the chicken-egg dependency between jailhouse and jailhouse-images,
so I started with this patch first.

Jakub

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAGdCPwsyLjLLaPEsnhr6bwO9ioXQRvSz2Vg%2B48ym-R5kV_V1nA%40mail.gmail.com.

--0000000000000fc50505ad38f329
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">That PCI MMIO config spac=
e is for a virtual host controller that<br>
Jailhouse provides. If has to be placed into a free range in the<br>
physical address space of that target. If you relocate that range in the<br=
>
system config, also update the non-root cell device tree. The root cell<br>
will get that information automatically.<br>
<br>
Could you share /proc/iomem (without reservations) from your larger RPi?<br=
></blockquote><div><br>I know, I was just wondering where that address come=
s from. So it&#39;s just a randomly chosen address from free space? Or are =
there any special requirements that do not apply for the other memory regio=
ns and I might be not aware of them? I&#39;ll have to check it over again t=
o share the error I was getting when I was trying to move it.</div><div><br=
></div><div>/proc/iomem from 8G RPi4 with linux-raspberrypi 4.19 and (almos=
t) default config.txt:<br>enable_uart=3D1<br>dtoverlay=3Dvc4-fkms-v3d<br>ar=
m_64bit=3D1</div><div><br></div><div>00000000-3b3fffff : System RAM<br>=C2=
=A0 00000000-00000fff : reserved<br>=C2=A0 00080000-00c5ffff : Kernel code<=
br>=C2=A0 00c60000-00d5ffff : reserved<br>=C2=A0 00d60000-00f8ffff : Kernel=
 data<br>=C2=A0 1ec00000-2ebfffff : reserved<br>=C2=A0 2eff5000-2effffff : =
reserved<br>=C2=A0 373f7000-3b3fefff : reserved<br>=C2=A0 3b3ff000-3b3fffff=
 : reserved<br>40000000-fbffffff : System RAM<br>fd500000-fd50930f : pcie@7=
d500000<br>fd580000-fd58ffff : genet@7d580000<br>=C2=A0 fd580e14-fd580e1c :=
 unimac-mdio.-19<br>fd5d2200-fd5d222b : thermal@7d5d2200<br>fe007000-fe007a=
ff : dma@7e007000<br>fe007b00-fe007eff : dma@7e007b00<br>fe00a000-fe00a023 =
: watchdog@7e100000<br>fe00b840-fe00b87b : mailbox@7e00b840<br>fe00b880-fe0=
0b8bf : mailbox@7e00b880<br>fe100000-fe100113 : watchdog@7e100000<br>fe1010=
00-fe102fff : cprman@7e101000<br>fe104000-fe10400f : rng@7e104000<br>fe2000=
00-fe2000b3 : gpio@7e200000<br>fe201000-fe2011ff : serial@7e201000<br>=C2=
=A0 fe201000-fe2011ff : serial@7e201000<br>fe215000-fe215007 : aux@7e215000=
<br>fe215040-fe21507f : serial@7e215040<br>fe300000-fe3000ff : mmcnr@7e3000=
00<br>fe340000-fe3400ff : emmc2@7e340000<br>fec00000-fec03fff : hub<br>fec0=
4000-fec07fff : core0<br>fec11000-fec1101f : watchdog@7e100000<br>100000000=
-1ffffffff : System RAM<br>=C2=A0 1f7000000-1f7dfffff : reserved<br>=C2=A0 =
1f7fc2000-1ffdfffff : reserved<br>=C2=A0 1fff00000-1fff5ffff : reserved<br>=
=C2=A0 1fff60000-1fff60fff : reserved<br>=C2=A0 1fff61000-1fffc0fff : reser=
ved<br>=C2=A0 1fffc3000-1fffc3fff : reserved<br>=C2=A0 1fffc4000-1fffc6fff =
: reserved<br>=C2=A0 1fffc7000-1ffffefff : reserved<br>=C2=A0 1fffff000-1ff=
ffffff : reserved<br>600000000-603ffffff : pcie@7d500000<br>=C2=A0 60000000=
0-6000fffff : PCI Bus 0000:01<br>=C2=A0 =C2=A0 600000000-600000fff : 0000:0=
1:00.0<br>=C2=A0 =C2=A0 =C2=A0 600000000-600000fff : xhci-hcd<br>=C2=A0<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hmm, do not recall =
the background for that anymore. Why does the overlay<br>
not work with that currently used DT?<br>
<br>
RPi is an (out-of-tree) mess...<br></blockquote><div><br></div><div>It&#39;=
s about where the DTBs are taken from. There are two sources, although the =
result should be the same:<br><br>1)=C2=A0raspberrypi/firmware GitHub repos=
itory, where the prebuilt *dtb and *.dtbos are. That&#39;s what is used in =
jailhouse-images.<br>2) arch/arm/boot/dts/[overlays] in linux-raspberrypi. =
That where I can easily add them with=C2=A0a patch, but they won&#39;t make=
 it to the boot partition.</div><div><br>So the thing is that I can make ja=
ilhouse-images to use the dtbs built with kernel instead of the prebuilt on=
es. Doesn&#39;t seem like a big deal. I&#39;m just aware of the chicken-egg=
 dependency between jailhouse and jailhouse-images, so I started with this =
patch first.</div><div><br></div><div>Jakub</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAGdCPwsyLjLLaPEsnhr6bwO9ioXQRvSz2Vg%2B48ym-R5kV_V=
1nA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups=
.google.com/d/msgid/jailhouse-dev/CAGdCPwsyLjLLaPEsnhr6bwO9ioXQRvSz2Vg%2B48=
ym-R5kV_V1nA%40mail.gmail.com</a>.<br />

--0000000000000fc50505ad38f329--
