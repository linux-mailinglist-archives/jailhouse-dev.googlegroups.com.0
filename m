Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBGG4XWZAMGQEU7OXCQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id C74898CD85F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2024 18:26:01 +0200 (CEST)
Received: by mail-ed1-x53c.google.com with SMTP id 4fb4d7f45d1cf-574ebea4810sf2772494a12.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 May 2024 09:26:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1716481561; cv=pass;
        d=google.com; s=arc-20160816;
        b=MivSonZ9xXEN9N/HlaKEYnq1shzGejJTH8cC/6U8g1m1sV+vt70lZVMXGIuHr6Ulgw
         KAp5pVIR5liGYMhtDFh95xX0SLDDv7pXPlp9MJPr4l999OzZHlv0G5bVgk30pSqYjK2u
         HJP6Nk8WgPZgptgfcSWP+zUXn+QUFatkpY9V+l5039zy2wEkZC/DosPyPt2sP3YXYfMX
         FwIbSjgyeKOAynucQ1TRKCW7OD3yj+19xGpuP8U8FVwvJFxF6RYEUnwQWcGERkn9FI/d
         4xSjpAtN+qDIz6iJ7x3Esal5YESBKmljbTVPxppfW+fZJrzQVLUXFQEsi1bInIIiHuYq
         77hQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:content-language:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=e1h8RhXv1qcLW3X/9BQFnb9HgczWP38woZiUpazMLaA=;
        fh=SjfGrZ5LkZltz2kdudTxEhdlkEjW/dTzvECSAnedYkE=;
        b=my1+y8gVTll6tTt0QA3QJTj/l2sjKVr5BkakvfK5znRV0mDyvLXrREkRdcreXl4r1z
         PUqvvH+xIOf7GMlLq0ZQKQDSKP4WIT/c6VXNCKDaH0jMunzGIotqh2yvS4pL8M1igzij
         m8/335CAsIuw6wd5Oanfs4YkJta7/f0a/cyXDdSP1fgmiyr6DNfDmOudjfDMDCoVTf1A
         1MDXowcFu16+egvgOhK8wIMDQlcizNGJIwAGALpsOtDPLPo45WZvahIUhXv4lgHc7/4Y
         1LNTXCG7o9W8zvKe5gfvRk8enRlo/VnZ+SSVjbdAN2CRnzauYD3Tr8zbJ5xiyD9bqOW6
         DWOg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=EqyrWWJR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1716481561; x=1717086361; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1h8RhXv1qcLW3X/9BQFnb9HgczWP38woZiUpazMLaA=;
        b=lfdttXGRWsTQyZZUmS8y7L7RIfZJGt6ESJtZRdKH0yXRHNPWJxi7dofN1sFdpSwWex
         JMu7pr1LbMyhE0+LWOsWG/vZsApGnJNKz1YLGpM/q8VlG+4MA5ZvGrGDIeHtxq7PdURV
         IWdZHuvPX4rzVJdf7H+9ePY5QXx4Yq4njAsE7n/ZrDqLCpFhQNB8FyaG3k+QR56xzPPK
         4Cnn6h4Y4iKG+GNLhi0w12hsc/A38uRWKtFQkDX680ALjOjEaccu3Vivr/VcVniWyVRt
         On1Ip0bLsZ+D0BT8NORS4eDNFps3+8jP/4y9jQnsyeeBVMpGFRtvPEgz11bHzASYwMIp
         On4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716481561; x=1717086361;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e1h8RhXv1qcLW3X/9BQFnb9HgczWP38woZiUpazMLaA=;
        b=jBmmhbUv5dtwENoA2oiNz20EwPyZ9xQS+pqY4BXesjEbzJUOaAxtY3lsrmrUSZZR0e
         zrtalS8kw9+UvLMUelT4GN2gmu8c0FZ4OHnTkTEZJud+wb/GeUcHezOciKPHm5SzlsgN
         SpYQddA0EF02gdNTiTMgJ0i9umyUkdWhisCJG6M/YMYihRXRA0vxo82lYTflApx70pIs
         wqmKGyakj9zAWDI9ro24Ndi9YRwhtrKBnSFfiYhATAk1moscBmCfEWwdZVWenaNS7PYG
         H46nu7+mHr54shwyQWXr2P87sgF5AdHX1Tae3e12TMksfP49D/cjfCEZp7bqM/r9PuvN
         kWGQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=2; AJvYcCXE2KX/cTbTTMOLn6UoMVNdIfvzMAaoSCAqugw1JCl20CDqyUB65qhhfzl2bJeQLybSjyh1RHGsOS0fwxMvEGJF+UDq6TplavRDS8Q=
X-Gm-Message-State: AOJu0YwArgYAMUdUIo4oG+Nq/pJA+W805M+duMZ5QPedRD7tdStogw/s
	LGvv7q5XBzhxflv4fThWyBvXY4lOs/ARZcvUaz2bTqyQeh18hgd2
X-Google-Smtp-Source: AGHT+IGcqeizjitQli3vyYWzvEFmdWEWiNfOtZBoK7UUX+o0qjZno/s3uigUFDdybM6zdcUud/Gc5A==
X-Received: by 2002:a50:d713:0:b0:572:3b3c:754f with SMTP id 4fb4d7f45d1cf-57843c6f33fmr2597263a12.4.1716481560917;
        Thu, 23 May 2024 09:26:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:5383:b0:574:f706:7c59 with SMTP id
 4fb4d7f45d1cf-5784f9ac8c8ls81497a12.1.-pod-prod-00-eu; Thu, 23 May 2024
 09:25:58 -0700 (PDT)
X-Received: by 2002:a50:99da:0:b0:578:4fd7:8f99 with SMTP id 4fb4d7f45d1cf-5784fd78fd0mr117770a12.18.1716481558103;
        Thu, 23 May 2024 09:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716481558; cv=none;
        d=google.com; s=arc-20160816;
        b=Ejuut1em/fqpRMb1i6NZewj6BQvJcPwmoLl0vgXNbw3cbFXkh/L017V6Hc362CA0JA
         ZSgSYOo5xx94ssnu7ztgsLD5SjMkOp7waeGXXWuUq1/LmZx6DjQjzmL39YBgr97xRTaB
         uMxgJBvjkgdmkdKnxANxlW6+qPbO0RpQ4+dOmMlessbeRk7IZAsQvxs+vkKDtBN/MNlb
         pDrwwxOHlWkLe/niPj98jtPRYqVx57nvqowMU2OCNxQBnxgbPUj9uwGQcasPwx+ubaTL
         uYt47E9fV7N/z98SsP4RkvAEfs/YdSb7rY2L+w31j0FekoEkZ51A4YJIf6sRlHx5cLpg
         G+xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=6hiRjCVndLObZjntmMCFTLY77mxJ0aAGVxr1eu9sJXM=;
        fh=0KNrnX+9XWNItaHIAcg8EYrA/ds6ElBc4l2D4jIAUGs=;
        b=bB2Lcp1km8ShGlCHzTkTE5sZaDTh56KShsPhAXd3KT42iHOHVTJ8GPuwtx4OjUdSh3
         zy7Zq5puajlfarm8Pe0km/ITnZDp/nLi/IZelopFZlPCKVFN/nkWdED07SYHGWK0Yo2S
         3TLe6QajHPlIoaouAb6rFsOnPn+h1XUHU69ao/TKPhyXpYLELnWFK+X8beqbAz5oaCV1
         u7xrdEx019yBlsVknB2znEtDX+LNrAA+ZpJ7Rgd8hUY9TS99fp8ymPkXBQzwwF1htMSo
         4FDPTHUIqe7NUPj12ksBH7UtYbl5nRmcqJ+5+zYbaUpnz2vYUL8OqBt4l5fGnWNekKeR
         pudA==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=EqyrWWJR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from b2752.mx.srv.dfn.de (b2752.mx.srv.dfn.de. [194.95.235.60])
        by gmr-mx.google.com with ESMTPS id 4fb4d7f45d1cf-5733be9586dsi1595907a12.1.2024.05.23.09.25.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 09:25:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.235.60 as permitted sender) client-ip=194.95.235.60;
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de [IPv6:2001:638:a01:1096::11])
	by b2752.mx.srv.dfn.de (Postfix) with ESMTPS id F0A883E0199;
	Thu, 23 May 2024 18:25:56 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4VlYSg606Tzxq4;
	Thu, 23 May 2024 18:25:55 +0200 (CEST)
Received: from [IPV6:2001:638:a01:8068:d5bc:30b3:ace4:bf3d]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 23 May
 2024 18:25:55 +0200
Message-ID: <26b3f6ff-eea8-4734-9363-d6ba9afe6c14@oth-regensburg.de>
Date: Thu, 23 May 2024 18:25:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXT] Re: Necessary change to fit mainline kernel.
To: Ke Li <cnnblike@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <98597217-94d8-484d-a8cc-d6be44452dd4n@googlegroups.com>
 <fbb5a1ef-f872-4a2a-9731-ca40866d84e8@oth-regensburg.de>
 <CA+8fi3v7n9P2i8HxhQRrFSbxV_0XFe9Uq4-H9yckc3g6iHXeyQ@mail.gmail.com>
 <3b5da0aa-3c1a-40ac-80c2-92f3becdeb94@oth-regensburg.de>
 <CA+8fi3v0zgPH-S9LdipmnAcGEvhtmLKWRL-My78vYktoYiZWMw@mail.gmail.com>
 <af08ae11-7643-4ec4-9b9a-ed8c3e95ef62@oth-regensburg.de>
 <CA+8fi3sc8-VWk+NupDpxMTnoJFotdmD6J6VLuptDzpRrkEOZCw@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Content-Language: en-US
In-Reply-To: <CA+8fi3sc8-VWk+NupDpxMTnoJFotdmD6J6VLuptDzpRrkEOZCw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=EqyrWWJR;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.235.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

On 23/05/2024 17:25, Ke Li wrote:
> Hi, Ralf,
>=20
> I've double verified that the UART is working as expected by=20
> "root@rockpi-s:~# echo "random test text" > /dev/ttyS1" and I DID=20
> receive corresponding text on work machine, this not only validated the=
=20
> dts setup is correct but also the USB-UART converter and the connection=
=20
> between them are all as expected.

Alright, ttyS1 in deed is 0xff0b0000:
[    0.946678] ff0b0000.serial: ttyS1 at MMIO 0xff0b0000 (irq =3D 28,=20
base_baud =3D 5078125) is a 16550A

Ok, so we don't have an issue here. I'm just looking for common mistakes.

>=20
> Dmesg is also attached just in case you need to check if anything is=20
> suspicious.
>=20
> I checked the mail-list on kernel.org <http://kernel.org> around=20
> potential issues with the DesignWave based 8250-UART IP from RockChip,=20
> found this[1]. Another chat behind the difference should be this one [2]=
=20
> around the AllWinner difference from RockChip, I may take a deep=20
> investigation into the detail behind this and let you know.
>=20
> Tried applying the patch you mentioned, still no text came out - which=20
> also surprises me.

Ok, crap. Now it's getting difficult. The thing is, we don't know yet=20
what is wrong: We can either have an issue with the UART driver, or,=20
what is also possible, we might already crash /before/ we initialise the=20
UART. Without any possibility of interaction with the device it's hard=20
to find out what happens.

Next thing I would try is to try to write to the UART from inside kernel=20
space, without starting the hypervisor. Just to know where we hang.=20
Would you please try (untested pseudocode, but you should get the idea):


diff --git a/driver/main.c b/driver/main.c
index c8572470..e4482181 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -585,6 +585,14 @@ static int jailhouse_cmd_enable(struct=20
jailhouse_system __user *arg)

         error_code =3D 0;

+	pr("Mapping console %lx\n", config->debug_console.address);
+       console =3D ioremap(config->debug_console.address,=20
config->debug_console.size);
+       if (!console) {
+               pr("Error!\n");
+       } else {
+               writel('X', console + 0x0);
+       }
+
+
         preempt_disable();


Can you see the X on the serial line?

   Ralf


>=20
> [1]https://patchwork.kernel.org/project/linux-rockchip/patch/201702062330=
00.3021-1-dianders@chromium.org/ <https://patchwork.kernel.org/project/linu=
x-rockchip/patch/20170206233000.3021-1-dianders@chromium.org/>
> [2]https://groups.google.com/g/linux-sunxi/c/4iYuzbWt79k/m/IFEarUoMDAAJ=
=20
> <https://groups.google.com/g/linux-sunxi/c/4iYuzbWt79k/m/IFEarUoMDAAJ>
>=20
> On Thu, May 23, 2024 at 6:58=E2=80=AFPM Ralf Ramsauer=20
> <ralf.ramsauer@oth-regensburg.de=20
> <mailto:ralf.ramsauer@oth-regensburg.de>> wrote:
>=20
>     Hi,
>=20
>     On 23/05/2024 09:43, Ke Li wrote:
>      > Hi, Ralf,
>      > I've taken your advice and do the following:
>      > 1. Revert the change on JAILHOUSE_BASE to=C2=A00xffffc0200000. (bt=
w, I
>     got
>      > the idea of modifying it from the talk "Tutorial: Bootstrapping th=
e
>      > Partitioning Hypervisor Jailhouse"
>      > <https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>     <https://www.youtube.com/watch?v=3D7fiJbwmhnRw>
>      > <https://www.youtube.com/watch?v=3D7fiJbwmhnRw
>     <https://www.youtube.com/watch?v=3D7fiJbwmhnRw>>> time stamp 1:28:31)
>=20
>     Outdated. Don't touch the code at the moment, just configuration.
>=20
>      > 2. Update the RootCellConfig and add whatever memory region I can
>     find
>      > (except gic-v2). Info collected from below, the latest version
>     can be
>      > found here:
>      >
>     https://github.com/siemens/jailhouse/compare/master...cnnblike:jailho=
use-rk:working-branch <https://github.com/siemens/jailhouse/compare/master.=
..cnnblike:jailhouse-rk:working-branch> <https://github.com/siemens/jailhou=
se/compare/master...cnnblike:jailhouse-rk:working-branch <https://github.co=
m/siemens/jailhouse/compare/master...cnnblike:jailhouse-rk:working-branch>>
>      >=C2=A0 =C2=A0 a. from RK3308 Technical Programming Manual p12-p13
>      >
>     (https://dl.radxa.com/rockpis/docs/hw/datasheets/Rockchip%20RK3308TRM=
%20V1.1%20Part1-20180810.pdf <https://dl.radxa.com/rockpis/docs/hw/datashee=
ts/Rockchip%20RK3308TRM%20V1.1%20Part1-20180810.pdf> <https://dl.radxa.com/=
rockpis/docs/hw/datasheets/Rockchip%20RK3308TRM%20V1.1%20Part1-20180810.pdf=
 <https://dl.radxa.com/rockpis/docs/hw/datasheets/Rockchip%20RK3308TRM%20V1=
.1%20Part1-20180810.pdf>>)
>      >=C2=A0 =C2=A0 b. the live dts I pulled from a working armbian kerne=
l (you
>     can find
>      > it from
>      > https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e
>     <https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e>
>      >
>     <https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e
>     <https://gist.github.com/cnnblike/f758596d59899f4d300eefb55ef5f81e>>)
>=20
>     Please no links, just simple attachments in the future. It's
>     horrible to
>     clock-navigate through github to get what i need: raw content.
>=20
>      >=C2=A0 =C2=A0 c. the iomem result:
>      > https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5
>     <https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5>
>      >
>     <https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5
>     <https://gist.github.com/cnnblike/eb6ba4ce958d058edb0b7ae4ddd124e5>>
>=20
>     Alright, just a short analysis: Jailhouse reservation is placed
>     correctly. iomem confirms the reservation. Hypervisor base addresses =
in
>     the configuration are correct. So there's nothing odd here.
>=20
>      > 3. I have also done multiple experiments on my side, all leading
>     to "no
>      > output" result except the following that may help in troubleshooti=
ng:
>      >=C2=A0 =C2=A0 a. I changed the cpus section from 0b1111 to 0b0111, =
thinking
>     maybe
>      > one leftover core could at least allow the kernel to have a
>     chance to
>      > emit something for=C2=A0diagnosis. It turns out it DID emit someth=
ing
>     with
>      > one core left:
>=20
>     Nonono, don't do that! Jailhouse needs all CPUs. That won't work!
>=20
>      > https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf
>     <https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf>
>      >
>     <https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf
>     <https://gist.github.com/cnnblike/34dd8d241846c8b8cf43f01cc4124dcf>>
>      >=C2=A0 =C2=A0 b. map the peripheral memory region as a whole
>      > (0xff000000~0xfffdffff, sram configed same as ram) to physic
>     address, no
>      > output.
>      >=C2=A0 =C2=A0 c. same as b but without gic, no output.
>=20
>     GIC seems to be configured correctly.
>=20
>      > With so many experiment, I'm wondering, if it could be some other
>     reason
>      > behind such weird freeze kernel result.
>=20
>     So the thing is, no matter what mistakes in the memory region you mig=
ht
>     have in your configuration, you should at least see a Hello world fro=
m
>     the hypervisor on the UART. That's the first thing we need to get
>     running. The rest is something for later.
>=20
>     So why doesn't the UART work?
>=20
>     You already confirmed, that echoing to /dev/ttysomething on that line
>     works, right? Are you *absolutely* sure that you use the right uart
>     line? Please attach output of dmesg.
>=20
>     Anyway, base address and size of the UART are fine... In another
>     project, some time ago, I also had some issue with the designware UAR=
Ts
>     (8250_dw). There, it was the Fifo Control Register for some reason.
>     Let's try that. And let's print a early 'X' to see if we get here.
>=20
>     Could you please try the patch below?
>=20
>=20
>      =C2=A0 =C2=A0Ralf
>=20
>=20
>=20
>     diff --git a/hypervisor/uart-8250.c b/hypervisor/uart-8250.c
>     index e6112820..7b29af0e 100644
>     --- a/hypervisor/uart-8250.c
>     +++ b/hypervisor/uart-8250.c
>     @@ -19,6 +19,7 @@
>      =C2=A0 #define UART_TX=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0
>      =C2=A0 #define UART_DLL=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x0
>      =C2=A0 #define UART_DLM=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x1
>     +#define UART_FCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A00x2
>      =C2=A0 #define UART_LCR=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x3
>      =C2=A0 #define=C2=A0 UART_LCR_8N1=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x03
>      =C2=A0 #define=C2=A0 UART_LCR_DLAB=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x80
>     @@ -54,6 +55,10 @@ static void uart_init(struct uart_chip *chip)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0chip->=
reg_in =3D reg_in_mmio8;
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>=20
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip->reg_out(chip, UART_FCR, 0);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip->reg_out(chip, UART_LCR, UART_LCR_8N=
1);
>     +=C2=A0 =C2=A0 =C2=A0 =C2=A0chip->reg_out(chip, UART_TX, 'X');
>     +
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* only initialise if divider is n=
ot zero */
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chip->debug_console->divider)
>      =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return=
;
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/26b3f6ff-eea8-4734-9363-d6ba9afe6c14%40oth-regensburg.de.
