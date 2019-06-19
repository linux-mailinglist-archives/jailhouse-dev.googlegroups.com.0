Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPGDVHUAKGQEG7YBJHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C644BDFE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 18:24:28 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id b67sf1837768wmd.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Jun 2019 09:24:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560961468; cv=pass;
        d=google.com; s=arc-20160816;
        b=cbdAQ7tXiDHhzqZ9L7gFlBtxtvJ11d8Hy6g+YrMyiV+EAbrEbfQ3ztE+iV6SEyYA8v
         pTPajZ/I0xg6MbgE8jSdkRDaZFSxj5/R9hG/sdxLIkv3RbkfVwG3jUKKLpcm1OafaeeZ
         Hy1D0kwg5VbjF3prIfPK5x7eeQWXk7Owp67IIK/N8/7F9IawLQ8/8fQQZye8PainbICZ
         SqgQMPZ7GW2c2j2pITbSoHQeiwOKVuWMFxEVe7XoGOaZmBEd7qUtsQ8itMxDjvT3N/CK
         0KzOvihTHbgdzgcJf1cnhDzwnQFePjoP1ZomR58HDshSmG8X6PxWpzNmFMzo+E6mpr4N
         AsSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=G/3MN4bbcZ3R3QqAHIecpJ1paHQ5xNjcsykk7bc4ddU=;
        b=Zg6b0hMA6t6vKPex/QKw8Ae/3kMDB+xAMtqRNTxl06RL3s9jnw49eEuc930FIUdUzl
         GYGB3zxWZUP+ew+a1ROlJZ7q6A6IkhJ08V2WZjk6qd3OyZc20N72JzYOKUGYWhZfT2bh
         V1x/wnMFcrzddwgqC8qBOZowx5wtqEEb3IdUj68MOk2tJzGEIo6VwgPV37POyJeMAyH3
         gv2PuPEoaC/5boeB4oa3b96Fv2rI9IREIiZEHGjQoxC46ZcJUcYMF40G38HsQI1fkN/a
         prwPgLsfr5EDVhhMxlme8nieC/NgpNdAKrF5X92r3NfatO0yAuJ/8sTIoD6kEo04Pan3
         OQrQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G/3MN4bbcZ3R3QqAHIecpJ1paHQ5xNjcsykk7bc4ddU=;
        b=JvZoJVT2fbdxWgghqLPsEj19AQq1PKiOy+eILB+vaAwQQo1qa97vmSi0RM70Dmve6U
         cG5gI5w0/eYg5Lyqmd0qp5f4BUMShoo9yhP0pnxeP33AQmmPRmDW3pxx5vZZOh5d+C4f
         O+of94RXm21JQHNqyBldFbzMbH20I2fbrJUHFRNr12tNaV/vs8LNF6NjepNPAwzvaEUv
         Gj1KfPK4QNip/j4iganIZk4ZVybM+wzRPOiqowD5PIy3Qw/8ex12/OtFoPOss+Z82+WI
         WRxtUEGzx6cAPwp1mPcISLxZnhRMaRY64cXGbgT5BSt22FEQsMwy08lTllNnn8GXy5qX
         zgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=G/3MN4bbcZ3R3QqAHIecpJ1paHQ5xNjcsykk7bc4ddU=;
        b=Ans/9S14RZaGbeD1+rPHcHRCHYjaYdVN7+7VFiZCEThZPqrMjFPbjacknfzAW6UVGh
         oiGYw6IGGF7UyNoU/HgFZV8VVcD7COhcIHatQc2FfOriyVMBYQNsvVahUsf27BLZk4nP
         /s/ojxOBuQK6ophDRIiOMYr8pErQBD33jfPxgZSpOEQ4igIT7nb79uj2opWK4xLDU9lB
         BFaRaeCQR0Nlfz//ANKVizQ2bNjORs27oe1fsbX7i1EOy6NhSUMneRIfdF1czmbPubd3
         R3yWjzXtLz6o3iuWF1cjxPvbAf8ZLEkSuq7PrELQCEzqgPDhuiRgTZzp1/gNLRe/s0xh
         ZK2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkyE9QCj9/ZHWDwhT8fdeY44JzcdnUot7jcvhY33e9t8EeQUw2
	2K0mZm7iBAU8HFc88DJSMSc=
X-Google-Smtp-Source: APXvYqxtn3QEJC68nd5Z+ZNYCekGI2WdMRkdOR66QP/I+Yd5XAj6oyiuAcv/MF3nIzorqZDoN9SuQw==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr10722707wrr.235.1560961468273;
        Wed, 19 Jun 2019 09:24:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5f86:: with SMTP id t128ls722085wmb.3.canary-gmail; Wed,
 19 Jun 2019 09:24:27 -0700 (PDT)
X-Received: by 2002:a1c:9ecd:: with SMTP id h196mr9426619wme.98.1560961467638;
        Wed, 19 Jun 2019 09:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560961467; cv=none;
        d=google.com; s=arc-20160816;
        b=Ao0PRRXeWsIbBmbFPrD6Q4RwaskGq/W8f+G55aYkXAUWlrInHX1zsmB7sAB3RiGRXu
         47f+vAPaOojPV95BTw0ovsEzl4K7iRc8rNKCVkGE8lji/ld7T5zWjF+L1xxhiX1E70Xu
         ak21iqYIyyclEuONsqT2LYtJ8L5XAlPUdgNtwr2BfZHn+No4PrFtF47x6m2xUHRTK1YA
         bVorY2U8R4CHLupFI+H0ujwi2QEgsJHtWhj/Cekq36iJkVbDbphj5eHswNbamD0+gZy9
         KZMb0jMUr2h8Z/PbMmSi++bN0pnedPMLFPgotz3kyBYOZEzKm4VO/7HWXSUi7EgYyFFZ
         Llxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=PCt++eLMiZvAgwPq+I23cKgqwwdyyWDf74eGPTbCtDw=;
        b=vQ743PfBaov3N4ZO9+gCDk9vzcSJPoJ2hmBSE5MkIWipACEINSbQI++xLk7yIsi7KO
         W6U7JvNfcXRqdLRRNoYH+0bV7MzGruwOAat9un/RGvDeP5CXDHbyqk1sk/EAqRC4RcQi
         4PTYCyc9bJTyxKYyCIdBtco5TihYFis+It/SneaYx7G/kLcAsDwy6JcUOcpbMdBiuJ/g
         f4WXMM1FDGqblU5yd95/lOgv1xeI+2F4j2pyiUjtk72SDq9QhHLT+691LOMZbp++QCo6
         g/U/3ktO/P2NhWndryzhheWLtCqhQPGG5ezd/uqGLkAH07NXKFkK3eJ1GCce9795pfwp
         Gv2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id n10si144324wmh.0.2019.06.19.09.24.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 09:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x5JGORRw018077
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Jun 2019 18:24:27 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5JGOQ3k020278;
	Wed, 19 Jun 2019 18:24:26 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <bd92264a-60c1-6f76-07f0-93cb9bd08a01@siemens.com>
 <CA++Khc0seBDnN2hD7EJh3g25unUEFqBuiRSm5HwOE+1JEX0D2Q@mail.gmail.com>
 <63552042-48d0-cb32-e893-28ae4ab29ccd@siemens.com>
 <CA++Khc3Mj=SFen+_f7RE5g1Paq1AhHQOrBX3HqNoJvvbymQh0w@mail.gmail.com>
 <5b90a899-c42a-a360-8398-c3af35920765@siemens.com>
 <CA++Khc0whU3=U86WGNEtLUZoOkKuYLiEA+nqOjW1UFcRDeGTRQ@mail.gmail.com>
 <0da95034-9bd0-4415-4d3b-5f6687a84563@siemens.com>
 <CA++Khc1Xjt8yMT39shFraJnzSWp8Ctc9-Cv-mNxOqf+UkxhyxA@mail.gmail.com>
 <36306f60-8b63-f32d-2559-3a1ca6f53e87@siemens.com>
 <CA++Khc3hURr3dFrw2ga=uf9A02KZ1OEEtMAPOVJyCAP3Fs+fmw@mail.gmail.com>
 <889c96a9-a7dc-4385-28e5-437fbc4d5008@siemens.com>
 <CA++Khc2-Cv==+eJCS8cN-ShK7q==Qs7UpW-ZfoUcEZ2Tam5c7Q@mail.gmail.com>
 <3bb0abe5-55ca-b9b5-edff-6bc8d0ef85af@siemens.com>
 <CA++Khc2YjAfFL1x-uU_N9FoUhZUMSsKQ2bKHAbd17U=HA_90Nw@mail.gmail.com>
 <CA++Khc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX+OHYxDNsA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3660acb8-e530-9625-bcac-177b8c84b642@siemens.com>
Date: Wed, 19 Jun 2019 18:24:26 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc0Kev1DGnKeKr2Dd3B4qHWZxZFrgDsMFQ1PX+OHYxDNsA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 19.06.19 18:15, Wayne wrote:
> Hi Jan:
>=20
> I figured out my problem with Jailhouse throwing the "Cannot allocate mem=
ory"=20
> error when trying to create a guest cell with more than 200MB RAM.=C2=A0 =
I had to=20
> increase my hypervisor memory size from 6MB to 64MB.=C2=A0 Now I can unpa=
ck my larger=20

Ah, makes sense. You should see the allocation stats after each major opera=
tion=20
on the Jailhouse console. Forgot to point to that out because I thought we=
=20
weren't that tight but rather had another problem that caused excessive mem=
ory need.

> root initramfs (~70MB) successfully, but now that falls into the dracut=
=20
> emergency shell too.=C2=A0 This appears to be occurring when the kernel t=
ries to=20
> pivot/switch to the "real" root filesystem.

Yeah, dracut won't give you a "real" system without much more work.

>=20
> I can boot into a real kernel prompt with your rootfs.cpio, but I really =
would=20
> like to be running a copy of the full root linux....just with the filesys=
tem=20
> being entirely in the ramdisk.=C2=A0 Any thoughts on how to accomplish th=
is?=C2=A0 It=20
> seems like buildroot can generate images based on busybox, with the ash s=
hell. =20
> I really would like bash support.
>=20

You should achieve that by packing a regular rootfs into a cpio.

Jan

> Thanks for all of your help getting to this point,
> Wayne
>=20
> On Tue, Jun 18, 2019 at 1:09 PM Wayne <racedrive1503@gmail.com=20
> <mailto:racedrive1503@gmail.com>> wrote:
>=20
>     Jan:
>=20
>     To summarize:
>     1. My smaller guest initramfs (~30MB) unpacks properly, but then fall=
s into
>     the dracut emergency shell.=C2=A0 Now that i'm using minicom it no lo=
nger scrolls
>     repeatedly.=C2=A0 I still can't get to a proper kernel login prompt.
>     2. My larger root initramfs (~70MB) fails to unpack, and also jailhou=
se
>     fails to create the guest if I attempt to allocate more memory.
>     3. I can get to the kernel login prompt (and login successfully) if I=
 use
>     your rootfs.cpio binary.=C2=A0 This option so far is the most promisi=
ng.
>=20
>     Thanks for your assistance,
>     Wayne
>=20
>     On Tue, Jun 18, 2019 at 12:01 PM Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>         On 18.06.19 17:48, Wayne wrote:
>          > Jan/Ralf:
>          >
>          > Ok, with the rootfs.cpio you just provided I can see the follo=
wing on
>         my serial
>          > port:
>          >
>          > Welcome to Buildroot
>          > jailhouse login:
>          >
>          > So that's progress.=C2=A0 Is there a default user name and pas=
sword to use to
>          > complete the login?=C2=A0 That would point to the problem bein=
g booting
>         against my
>          > initramfs files.
>=20
>         "root" without password is the login.
>=20
>          >
>          > Also, the issue where my serial output scrolled continuously w=
as due
>         to the
>          > capture method.=C2=A0 I switched to minicom and no longer see =
that occur.
>=20
>         OK, consistent sign. Then we are back to a size issue, not a form=
at
>         problem: You
>         larger image is too large, but enlarging the inmate does not work=
. If it
>         would,
>         your larger image will likely boot as well.
>=20
>          >
>          > Any further thoughts on why jailhouse fails to load the guest =
when I
>         set the
>          > memory region greater than 200MB?
>=20
>         I need to analyze your config, maybe try it out.
>=20
>         Jan
>=20
>         --=20
>         Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>         Corporate Competence Center Embedded Linux
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/3660acb8-e530-9625-bcac-177b8c84b642%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
