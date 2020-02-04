Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5WD4TYQKGQERTSRPQQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2AC15169C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Feb 2020 08:49:11 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id o193sf946694wme.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Feb 2020 23:49:11 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580802551; cv=pass;
        d=google.com; s=arc-20160816;
        b=cSGhKJgeXeG8QIVMu2j+Jjcg6oqIYampHcRAaUsdwgS4Z3vRr+zeSQYI5Z/zWZK9LT
         yvYvwv631Uymkw19SV1P53ko4RsXkWLgOep8Fy7VMrfpFKzCwOHn/cayqRrI0thsxEke
         LHCyw58ToOXCn+up7iouIvohi8kI9JUX7Tmg28ReqxS5JyKAJv+MMYjFYWhxnlyX7wua
         A6f0k6XteExzFclTRsbCvgYjMTPvM7NkM55RwKHs4cgNAH2xRBzzgKAR8mSIhg46kcOW
         66l64nmxqiodmVq8AP4giG8Lr2pOaBWwdPi77Nmu/9DScFbsk/S/m59GGe4p7xTWTNol
         Q0HQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=+wvNgFSmOATwdd2Iaec+CB9mBp9gsBmnmlmGGlCk900=;
        b=JZxwytCbSKOgjFi6ooHSxnAylqPeZ+67BwKi+W+CDW5p5BO401+CWD8QONoYkuqSTt
         sjhK0I2+TiRxk3e9RxH0D7H+Purs8GAmAQbi6cAxmwOiJn0j3YYMRyDD7HDlCtvMYR2E
         Mrf05Y+XhAVUyjZPb25MkNXmWe/fSQC8GQyR6zPlYrgJUl5GHO8bSQExr+moIrTIxWiV
         0D979xjmSNR81ujH+5CWGLU8oDUROr94ppWBe3YhUtgGIeKufkhcgLdFteGMBaePQthx
         FYBdH3BA9unITnnREz8LzA5kG4/uQ0OoN5+H6wxHv0sxBuiR+54L4LZ8kpY9B4q3VW7H
         KjEw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+wvNgFSmOATwdd2Iaec+CB9mBp9gsBmnmlmGGlCk900=;
        b=ZTBNoLCAyPHHav1QRdprokmszYjkrHIbc+LUTxzwVGrKK9kwWE8IkyeTo9a4cQvjek
         zp8sC8BVT1LC9FxIbH/qBwMaTbDpP3O3Kdtaod7uDbI35iYqnfSYnhtuW3MuF5I/+jat
         6EIWunMuD5SF0Mfz03sk0gKFebgVClKs0IuWXMrjPxnko3LjfQTBbPfU5u2vCFrU0+cf
         rDo614/S9JLtoVoUAPZAfbizuwoV+xz6qlL4Y5aF7IvKh7ywhAtdZymeS6DqxJ0z9OGO
         REJTUSqfxpdH5nIbI+zKE3dJRmxFJbJLk4EyBhVzJWF2hUVpdlWMjEmkoLdU7W8QlAGh
         h7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+wvNgFSmOATwdd2Iaec+CB9mBp9gsBmnmlmGGlCk900=;
        b=bGmVBMkZmIM5zcKb7zLP5Jk8VhNeXYxU5GKlwzVgYa1GyoN3gbmTZEHU714Ygntb4W
         YUn+YfuKDCRJ25fgSTS3mJ6o2bkyzNR8zZ7NgJEUmIip90RczrvFOGc+p+QP9+Vz63+h
         jRvva0wzxcRIh2ZVYbm2Fz6dYynEaAMFfyyz2Kcg+WIGU0+Nqgom/scg1E79UE7wTPvc
         iOCnJ7eq7g7GbOuOUZcHvJpxOaIBzg3K+4tzCh1k0e1H1ALc46Wk/Goeo5uQlwq3cUfu
         NrmSrkFOF++aNewxcV9BMkzNHQM2m2NKW4AlstjF80wG5SgUFB3TU4VWvtwq/FH+X4oI
         qSQQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWfewRmTozp5kBthL4fCn5gfCwP/TL9384Wpc/5oo9HwjL62+me
	OcNsTaJZP2KMci8dnw6jEbA=
X-Google-Smtp-Source: APXvYqyuLWE4M183RVa9TVWD/q86Ol5XrKnAi2XMYhwmbe5aSZ8HeuiXniSRQ99xjJwkr0IXC7YjOQ==
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr4254367wml.110.1580802551092;
        Mon, 03 Feb 2020 23:49:11 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c4d0:: with SMTP id g16ls2049634wmk.2.canary-gmail; Mon,
 03 Feb 2020 23:49:10 -0800 (PST)
X-Received: by 2002:a1c:113:: with SMTP id 19mr4285669wmb.95.1580802550141;
        Mon, 03 Feb 2020 23:49:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580802550; cv=none;
        d=google.com; s=arc-20160816;
        b=YLfLeLbCTIXtJo9cu/Ti5eH+IrW651GzmGD52HliRhHtzKxYjJdimoerryBci1QnEX
         ozetnOfJ0prx+8zQM0X8vIo+COXkFBrTknbAduZ+BoC2BwB/zyLgRTQTM11hgv+NG9XA
         nwhdBwTqNP+N9UzwkGB9hVy17TvOij+szY72JKVzDffFM8r8IqfMf/9IR3uNZnyygwia
         aLX2Q+JnFeWERlgS/Te+GzaXBoHV8TNfwX0NEF9whdealebYDiXR4vh0syftCnuG88vS
         7lvRDkrgb8zpdY7eUCdgYJnFHDEgmAt58BLhZUAT8La8tDDt1yt25u5nw8RoKIXCJSo1
         qdVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=e3vv3KkO7flvhpUV2S+LxJVRBF+z1JZE6QQvmUVH10c=;
        b=zx2KItHhiYLwivfRvT4XhLKLMWYEQ8gcrhUWJb8Kg6e12dLxtGJifyXl5/GVupIHZX
         gM4BP0Rsw8IDdfIQ9AvY1a9+EZwhUtDtvrDBCSOMD6CqWEPkFg1fBAxvsER4N+/1hsBp
         DcZPoGQWlWifTgqNS1XUBK7YXTsxmCLCODnuvRqN9FvqFilv/btWaSVlh2I6MDoVkFV8
         AHyvt+fPXHhMTi8CTznbs+VHfMIIcnBynAax4se1LSbePkoxyfMiwNTO7yLMoV6U70ub
         pyc9SGYWX/WI0RuCn6BmmZJQUprSxzsw8MmGyBjjaIyB/wtZqJl+eXf6I9S3w6SZnj1R
         7M1Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id i15si771671wro.2.2020.02.03.23.49.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Feb 2020 23:49:10 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 0147n9ns029913
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Feb 2020 08:49:09 +0100
Received: from [167.87.48.192] ([167.87.48.192])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 0147n8lL002125;
	Tue, 4 Feb 2020 08:49:08 +0100
Subject: Re: mem_region_request failed for hypervisor memory in jetson-tx2 kit
To: Saroj Sapkota <samirroj2016@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <aef00f02-8d3b-4916-aace-f30233559859@googlegroups.com>
 <6e69283d-90dd-4579-7640-c5d585a2a9ad@siemens.com>
 <73f42baf-5afe-4a77-80d1-8e4bc9419f62@googlegroups.com>
 <72876f0a-4d50-45e3-cd21-751f8bf223fb@siemens.com>
 <3f267078-10bf-4a5c-86df-9a2cf0d4abd4@googlegroups.com>
 <77fe6716-0d3b-8547-ba86-3797a33706e2@siemens.com>
 <e1d54c91-d2bf-4d23-9e43-b50a1ccc0f3f@googlegroups.com>
 <f34d7c4b-add2-7aef-666d-f132f30da6e9@siemens.com>
 <af79c7dc-6eb8-45c0-a93f-6e0e4da069ab@googlegroups.com>
 <251365ff-7d39-451c-2b85-e6be4567d3b0@web.de>
 <262dbcd3-986b-4e42-9427-00b6fcd0e567@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <593714bf-cfbc-4a41-05b5-ef06f6d1d8ae@siemens.com>
Date: Tue, 4 Feb 2020 08:49:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <262dbcd3-986b-4e42-9427-00b6fcd0e567@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 03.02.20 19:53, Saroj Sapkota wrote:
> Thank you heartily for providing and guiding. As per your suggestion,
> I changed the configuration file according to /proc/iomem=C2=A0 (edittx2.=
c)=20
> and tried to enable jailhouse with it hypervisor still continue to=20
> crash. Please have a look at this file serial console output, edittx2.c=
=20

Actually, it looks like it's still Linux that crashes, no hypervisor=20
output visible anywhere (you can see the normal output pattern when=20
trying the qemu-arm64 target of jailhouse-images).

> and iomemtx2.txt
> what are the mistakes? what will be the easiest way to enable jailhouse=
=20
> in tx2?

Is there regular RAM at 0x271000000 when you start Linux without mem=3D...?

Jan

> Thank you
>=20
>=20
> On Saturday, February 1, 2020 at 3:34:55 AM UTC-6, Jan Kiszka wrote:
>=20
>     On 30.01.20 22:00, Saroj Sapkota wrote:
>      > Thank you for the prompt reply Jan.
>      >
>      > ##>This means I have to compare jetson-tx2.c with /proc/iomem
>     addresses
>      > and change if there is any deviation?
>=20
>     Yep.
>=20
>      >
>      > ##>How the address for inmate is allocated, its the spaces of
>     system RAM?
>=20
>     That's what mem=3D or device tree reservations are for: Keep root Lin=
ux
>     away from some memory that can then be used for non-root inmates and
>     the
>     hypervisor itself.
>=20
>      >
>      > ##>where and how can i find the .gicd_base =3D 0x03881000,(.gicc_b=
ase,
>      > .gich_base, .gicv_base) addresses of the board?
>      >
>=20
>     Check the device tree of your target.
>=20
>      > ##> last thing how to define .irqchip; pin_base and pin_bitmap?
>      >
>=20
>     pin_base for the first gicd is always 32 (first SPI). The pin_bitmap =
of
>     the root cell should cover all possible SPIs. If those do not fit int=
o
>     one irqchip, add another one with an appropriate pin_base.
>=20
>     For non-root cells, you only specify the SPIs that those should "stea=
l"
>     from the root cell.
>=20
>     Jan
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-0=
0b6fcd0e567%40googlegroups.com=20
> <https://groups.google.com/d/msgid/jailhouse-dev/262dbcd3-986b-4e42-9427-=
00b6fcd0e567%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.


--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/593714bf-cfbc-4a41-05b5-ef06f6d1d8ae%40siemens.com.
