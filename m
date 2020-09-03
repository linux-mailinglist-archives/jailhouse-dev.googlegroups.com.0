Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOP5YT5AKGQEGWBLK4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id D612825C918
	for <lists+jailhouse-dev@lfdr.de>; Thu,  3 Sep 2020 21:06:34 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id i9sf1268713ljc.12
        for <lists+jailhouse-dev@lfdr.de>; Thu, 03 Sep 2020 12:06:34 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599159994; cv=pass;
        d=google.com; s=arc-20160816;
        b=nC20ftjeFBbPG02AWO6wTSuyk/x8tBso9ACG79hdbmiN6oAMuDhW+aXZs3Fq9wewkG
         pdfgE62oGCIdaaL0AGcXwnX3BPneWqLEleAj61m1Sa+P3JFg1jYogU6NERf2UOiAKgrn
         MQYi7xBTWIOP8EhJ6mtsu2jSEdGLAqZDVXdGEfg6c/2Z+XiFdOzGGQ3zDdFHS8+DrVve
         p3im+jIYretxccDtOE6ViPR19fQLjfRi6nH2NacAXN9M7aEo03NRFJAkQf9u5Yl78Mcw
         wtmgMybh9mwS8g/2OZi9AW9QEkcDr5w6W+M9EBk5xTxS5O5GBTQsz2l0AtDdZ9nG1jrm
         IIaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=KXL5BkMWuFCioJ+/51GGR8BApnSW6u++VVmzKrQWftY=;
        b=NeatFwbTV4wWUCbpiHTxrxs/gdyhAX783nVAakjZwSU8rvJ1BL+krrfGmUddaO1AOV
         +zs/JGSp4J3zkIHdnL/wglLCtewoQeonWUp9Wf/Lbexgg/RdorAkBmWPuN70STvwGnSu
         IXopAFJ1N8vEoRMJRAbJsMTPwGEl0QO2n0q4AY0/udylDplxa+ehKJjK3t+dfvQmRfd5
         4qf5bpYcvsvnFwPX0lPrB1qxfwJXipCNxVOmKmPeAjld/M5oZr1J7gHRmm+354CbDZ+3
         s/o1fxbKkdA2EP/SN6zYqx8TgSGFL7XQdjQRgNBO/sEKqE5jbVc3Ts/DDGXBiWcS565c
         v0pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KXL5BkMWuFCioJ+/51GGR8BApnSW6u++VVmzKrQWftY=;
        b=Zs9kqh9TSz6psEwpxF2sxAGgtOeuT2SLPWwuSMXa4mls6nk1b+jDkrLURQRy1pnD9+
         C5mTG7rOoE1L05PoKLOAgCoHduHzmlDalwHKIMletF5ruwYIrGayHu+mpdsdg9xrBbWn
         n9ezdBdGVE4SqASfmMWbeadsQcqQ9q1Y32BDIHtiVE2gXY3tkSts3QGP95sbR9RA/rFk
         OxYQAJwe36qojMdCLAVnA03sOMiO8L2yMw1MQRM9X/55M6rkUXIxwwQ7+8KYmgw65XC5
         mONVrEziFefLEOdxPP+mXM65JIhfYWKlafvNZMwxKKhbvB7qc81Y1/7kBzjSGq7RGF0i
         FOAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=KXL5BkMWuFCioJ+/51GGR8BApnSW6u++VVmzKrQWftY=;
        b=LVTKIWrYS1VGX4HEuJwaiDSQHEpdtOk8+bFTQAKeL2upluGnmAXPF48MmajTHdwKO4
         EF+LloTiGgH9WPEOg/+8GYOhec5MeP7Uf7K7QDJqZmN7tJ7si3xPhRMA2+w7kTMe2EY0
         5fimKLo8KRMq1hOf4TLVyneVz7zTo/NbCq5X+RSqsZ8UxAMIdN5grGjElgFMgTkDvQ/r
         LxvJsF+D4nLJGz9BG8hWGZh6BxyDyQ/YWbmkI6tOvTkdvxNGVFlGyWi3UY7xIPkSQXiB
         9l5D+jWu4nsOOmOGkiaiKTxHYZRxif7aPup7NPKJSmeZfsFOQ5tL+nD8K9f17TuLEKlp
         Ge+Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531c6EAaynKxYESfRN32o7e6pSknQm6iL0YuVzdstbauSm7yCzHn
	CMnqAAlXoTw6ZZhK4AH02hg=
X-Google-Smtp-Source: ABdhPJzQW/dgy+cVn2LuhmB5EvullOIjHrrcvLmWmJMmNx+3pQPGejaiQ2ucuKlJM4ADgRj4TFw5UQ==
X-Received: by 2002:a2e:7408:: with SMTP id p8mr1854656ljc.451.1599159994435;
        Thu, 03 Sep 2020 12:06:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2c01:: with SMTP id s1ls289891ljs.10.gmail; Thu, 03 Sep
 2020 12:06:33 -0700 (PDT)
X-Received: by 2002:a2e:9655:: with SMTP id z21mr2012353ljh.410.1599159993494;
        Thu, 03 Sep 2020 12:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599159993; cv=none;
        d=google.com; s=arc-20160816;
        b=DwRKW/7joghDTSgQnuX5cFgiXybrqFUZFvf4JyCrSJ4OB+jRPK/EBOKy9BX2crL6Wu
         YUvYQLpFLBSMVZ2UmIwvHctWD1DxjWVDup8vyM1V1saxnNlD6NgNup8xPPWBGo8qFbRw
         BIXfX1KHBJDqmaHWqT5Co3WyLpuPp6MD6S6oVHxbrrb78/EsWU7g1HaHWCUGqE5FCMS/
         H4T8SlD0OQMA+Gp8tmMP4jna5Nal1F73Lj9DvNlJfpZ1/VldnvEg+42kb8fXUyiPsrLl
         iqO8A8JstkufxcHyk/BCQE2eHB/+m/8L3H0gKmQ+Ncohdn9A9e9ydG2MDWtrYw00TahK
         8/LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=ea8wV11BElp84bnnuCnvjWax2UEc/tWb2ACKxpn+Z3c=;
        b=XMNjFp2EwL3FN3pcaC+csCa5HziU2cAlpqoJiA4eFU8u8ZOQ424C8pqMX9rLOA3GjU
         a0UTWJPlIAM/3A5lEB8ueQ99gBSpe7mm4ZEJ4akylgEipL3fHcWaqL57lSymSYXlI3PZ
         VehPRrRvXGXJdwHqUKwiodAsRnbgjZw+YYmecg04p960H7f5F693CzLZbFjdZEt9gii/
         CaNm0QJdkLyLzQjogxJ7EPFYOMDdc/wH4jGTN5pWrTTFzM7hV2FgT9i+c86iIiiR4dkl
         gdhMnrvw1890QKOI2EhCMIcc2PcXUVRAXHQqKB1WJe9i7p3xrVf4Kf641ToytImz9ntv
         unIA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a23si172800lji.7.2020.09.03.12.06.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Sep 2020 12:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 083J6Wc9018494
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 3 Sep 2020 21:06:32 +0200
Received: from [167.87.132.24] ([167.87.132.24])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 083J6TCn031148;
	Thu, 3 Sep 2020 21:06:30 +0200
Subject: Re: [PATCH] rpi4: Pick up dtbs from self-built kernel
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <db026424-191f-5fe7-1cd0-d2777e4bbd4c@siemens.com>
 <CAGdCPwsT+DGtNmS=AvXiRpv2APTLpz=g3MO8meyS-CL9P2BKxw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <6a058dab-0000-5342-7022-dd06089ae230@siemens.com>
Date: Thu, 3 Sep 2020 21:06:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwsT+DGtNmS=AvXiRpv2APTLpz=g3MO8meyS-CL9P2BKxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 03.09.20 21:03, Jakub Lu=C5=BEn=C3=BD wrote:
> Nice, that's the way I wanted to do it, but haven't found room to dive
> into Isar.
>=20

This part is actually fairly similar to OE, though still not identical.

> I've just verified this on 2G, 4G & 8G. Boots and runs a Linux cell as
> before.

Great, thanks!

Jan

>=20
> Jakub
>=20
> On Tue, 1 Sep 2020 at 12:04, Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     From: Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>
>=20
>     This should avoid firmware updates when the only difference is a new =
dtb
>     or overlay with some adjusted or new bindings. Apparently, the same
>     pattern is used also by meta-raspberrypi on the OE side.
>=20
>     Suggested-by: Jakub Lu=C5=BEn=C3=BD <jakub@luzny.cz <mailto:jakub@luz=
ny.cz>>
>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>
>     ---
>=20
>     This depends on v2 of "Updates, support for all RPi4 variants".
>=20
>     =C2=A0conf/machine/rpi4.conf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-
>     =C2=A0.../files/debian/rpi-firmware.install=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 17 +++++++++--------
>     =C2=A02 files changed, 11 insertions(+), 9 deletions(-)
>=20
>     diff --git a/conf/machine/rpi4.conf b/conf/machine/rpi4.conf
>     index a683b7a..8ccef6b 100644
>     --- a/conf/machine/rpi4.conf
>     +++ b/conf/machine/rpi4.conf
>     @@ -23,8 +23,9 @@ IMAGE_BOOT_FILES =3D " \
>     =C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/fixup4x.dat;fixup4x.dat \
>     =C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/start4.elf;start4.elf \
>     =C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/start4x.elf;start4x.elf \
>     -=C2=A0 =C2=A0 /usr/lib/rpi-firmware/bcm2711-rpi-4-b.dtb;bcm2711-rpi-=
4-b.dtb \
>     =C2=A0 =C2=A0 =C2=A0/usr/lib/rpi-firmware/overlays/*;overlays/ \
>     +=C2=A0 =C2=A0 /usr/lib/linux-image-*/broadcom/bcm2711-rpi-4-b.dtb \
>     +=C2=A0 =C2=A0 /usr/lib/linux-image-*/overlays/*;overlays/ \
>     =C2=A0 =C2=A0 =C2=A0/usr/lib/arm-trusted-firmware/rpi4/bl31.bin;bl31.=
bin \
>     =C2=A0 =C2=A0 =C2=A0/vmlinuz;kernel8.img \
>     =C2=A0 =C2=A0 =C2=A0"
>     diff --git
>     a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
>     b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
>     index 701a984..dba3266 100644
>     --- a/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
>     +++ b/recipes-bsp/rpi-firmware/files/debian/rpi-firmware.install
>     @@ -1,8 +1,9 @@
>     -boot/bootcode.bin=C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-firmware/
>     -boot/LICENCE.broadcom=C2=A0 usr/lib/rpi-firmware/
>     -boot/*.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rp=
i-firmware/
>     -boot/*.dtb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rp=
i-firmware/
>     -boot/*.elf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib/rp=
i-firmware/
>     -boot/overlays/*=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 usr/lib/rpi-firmware/overlays/
>     -debian/cmdline.txt=C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firmware/
>     -debian/config.txt=C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-firmware/
>     +boot/bootcode.bin=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 us=
r/lib/rpi-firmware/
>     +boot/LICENCE.broadcom=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 usr/lib/rpi-=
firmware/
>     +boot/*.dat=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firmware/
>     +boot/*.dtb=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firmware/
>     +boot/*.elf=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0usr/lib/rpi-firmware/
>     +boot/overlays/README=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0usr/lib=
/rpi-firmware/overlays/
>     +boot/overlays/jailhouse.dtbo=C2=A0 =C2=A0usr/lib/rpi-firmware/overla=
ys/
>     +debian/cmdline.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0us=
r/lib/rpi-firmware/
>     +debian/config.txt=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 us=
r/lib/rpi-firmware/
>     --=20
>     2.26.2
>=20
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
jailhouse-dev/6a058dab-0000-5342-7022-dd06089ae230%40siemens.com.
