Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4GXYDTAKGQEAMCZMPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B2114A07
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 May 2019 14:43:28 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id z9sf5208210wrs.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 May 2019 05:43:28 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557146608; cv=pass;
        d=google.com; s=arc-20160816;
        b=y4C0r3bJ+iSCEXTAw3NfFZrEEk1ZamFOuVNhsP5USTIhxHEJZSb0Dy2/FXDxHskKlC
         4O4SxU57C1z8UoKWWQkunxEBjWVsL3jiQxJVhVWgsi/aBLLoxSeszWchvhvafX79aQAY
         Y6SkIeKDwdrTr67OpUJnNxgVGK+AKU4QcjczOIOqJi6IEe2VrxDUj6xNkanTBGarXpfY
         Hg4ajTaJE78sxfsSmoIml2j+VWvMDl+0e6UUm+LMLCP0fnO7uiD5hRYaoYVEP66rX4uI
         cPSZnbDCeiUnFeyXNb/vBgyUcS4bUF4O+PV/XJ/5IuGIOWrCfeMxc4uGZm5YICNeQWQa
         j+fQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ar//sJ05HwL79txeJxHUJ8D8XYxJav7yclyDVHfTFfQ=;
        b=d824iUd2jiHozKwuAcvoj/PjKsY87oF2o7fuBUTcsWC0w+oquuFcvxvtGPbyYpXJpk
         5wQZeONFhlJJkUnYIe7JD/irjRyiOZlD18nBHAfT1qUzksdrzSz86MRXnoytIHnaAgg+
         gTdUDUKv7lKETpsS+CK+esDLPx8iCVSqtS15NjLYZYqz8Iv5sC+zisIwNoB4syIE5lp8
         CY3br1oNlViqUL1pm+pYEeVGqTA5hnUXuf/BsQ4Cp1VuDPmoPlTyysW6iSjS5n+IJxJZ
         CajGdjpk7o7v6JPFih2xEyyvFwgbgdssQOYYgb+5jiXoZwWhdiHUZei0gkV4968zsXIq
         5iHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ar//sJ05HwL79txeJxHUJ8D8XYxJav7yclyDVHfTFfQ=;
        b=k4sJtxr5WX6FDAS1UCaZGpv9D1cILV0LhU/DcniNmJDHYylcVdjT3HSWPNPQH62U24
         IPWGogx25kdPDdw+C9q1d8p1In5MXipOGLF2kkFwYWTd1/TgsWiDzzlokvzrCiMvvKGD
         qsnihgx35CrKLorsOkP6e7aWARy5LCkbP64wabbfSRYsxanxDvrXcxrKeCoa6PkkIjTR
         EAkqIOYNgNF6VmF4Ptqd1KWIQpJ8Ph3EDQqKdYl8xqqgXWQ5MKdT4xRAaPNwojYqiVF6
         qJBP3M8DOO7g0nAr2cnKoINtMQvXQ1+Smmt2IXlFd3O69IxXw/9GsdHDZQtoZtdvjRJq
         YE7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ar//sJ05HwL79txeJxHUJ8D8XYxJav7yclyDVHfTFfQ=;
        b=tlgrCjy6oa20FepWRA3sDhsH6q9co4ZujzxouQrz1ig2jK4kFOjFwA3pwVaC7PXupQ
         qDEKdr6c7tUF1wiWRf5P9GjTK887g7mq7e21I4THaNU1+MJ1tvOVKVMVzZBpaKsT9ZaP
         e2v8N635Kbfc/PLNdofPhZck1gxENgxvhmqvpVmGS1zR46cRdHqGDvB7JkciLguHVEOz
         4vHdbMdrvGfBhNYZmsIpw4Oryswx9ekdY86AkLntnO6rU/H8XW405fuF+SitPGYEJyCt
         BpazVMoKmq81C9FihO1oX1nb6pCKaB2/KNy0/NnIHgV+ey6pN9JwGSuWbiVW2325myDG
         ueSg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWKMFhkwYnuTPMFnvbkNyiSMF+pfukI9tH0/G0oeszt1tvnLhCi
	Diw1IEZVtrACjHkHPpq/9XI=
X-Google-Smtp-Source: APXvYqxFKKqxaOaacXUpUSop3w0VPElR2W0xiH0+VEqz/mann2EBdF0a2pUR2Y5nbvuTv0RQ8odKAw==
X-Received: by 2002:a1c:4b03:: with SMTP id y3mr16822800wma.113.1557146608621;
        Mon, 06 May 2019 05:43:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ffc1:: with SMTP id x1ls3065572wrs.5.gmail; Mon, 06 May
 2019 05:43:28 -0700 (PDT)
X-Received: by 2002:adf:fd45:: with SMTP id h5mr14955278wrs.52.1557146608052;
        Mon, 06 May 2019 05:43:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557146608; cv=none;
        d=google.com; s=arc-20160816;
        b=pmY80kXUop31qXJlRliQ9CvaFY1HKoSML+jIGbYihgZHTIGmdh/QOm6AIMRXmeNGld
         TRLXFk9WABXvWsKsjw9FeI4yDxpF04Ugf+wdfQUzyHPMTMjf4fXuWJ7iJaAdV2UbDnxd
         7QLbiBJhICKJmpDFDu5boC/aFl00M016EwrnhwCrGwH5qcEW1ZV9a16bzYkT9A1dVHHQ
         LehpQ53hg/4Cl9VYqU7Q7ys1zh70M6nawZI/ng7GCYJqwzG42dSI19XPxBH6/UQczRJV
         Rx1R99fgaybOLYDIAUnQO/h5OS4jAHA2ljUFfP7Q039yIgJQHNPvg+lIrBgRQCuugItp
         U6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=pgc9FeFCnL9znaK/J9B4KMReaMfYOwzIa/P25o7Y2Bs=;
        b=NiN43IJ39p0EfmdjZ4lbszylc9vovADiLKZu3s72FAidHZ2a5EMTkUzJZOU7rMRvPu
         py/rla6uCSu1BUXTiMGh9yZ2sI07xBafjHhZxJzW7apl/K3XYZUFIzRPDPdnIC58g4so
         NkxmxQQaI0A+sS9YT3pKbbKmPNfVboQVSuiuug6NTpnor2bbiKauuttAq07XwonqYQLC
         ufr37AN6VbsJgHKcLnY74lH3YH4t6LhMucNpQuyXE0+aAnTAKfmkUU3lC/WNA9n/xZTX
         12F7Ia5QgIgbkKL6rZQ0BVbPahYqGwMiiRFHbC/9DUgP9Fsld9MeOcvzrMhWL9yxtJNg
         w46w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x18si409946wmh.2.2019.05.06.05.43.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 May 2019 05:43:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x46ChRe6027110
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 May 2019 14:43:27 +0200
Received: from [139.23.115.55] ([139.23.115.55])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x46ChQSa028714;
	Mon, 6 May 2019 14:43:27 +0200
Subject: Re: Building on Orange Pi
To: =?UTF-8?Q?Arvid_Ros=c3=a9n?= <arvid@softube.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
 <75218ca9-fd8f-6afd-8972-0852c8121060@siemens.com>
 <225DD87D-67CA-4969-A334-B1B27FB05B9E@softube.com>
 <36943512-5495-d84b-888f-e3752adb4a4e@web.de>
 <6CB50872-A7FF-4688-BB7D-123AF52DD87B@softube.com>
 <454361b4-b5fd-de0b-5d5f-d4c51f4b786b@web.de>
 <HE1PR0201MB23325FA2853B5CF1B9DB9963A1340@HE1PR0201MB2332.eurprd02.prod.outlook.com>
 <e65bfedc-880a-b2d0-d21c-506e5eea7008@web.de>
 <1B499BC3-8628-4DB7-A37C-B68F02B2592B@softube.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <67ff0ff9-f648-0482-ac1c-32e1c4431d66@siemens.com>
Date: Mon, 6 May 2019 14:43:25 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <1B499BC3-8628-4DB7-A37C-B68F02B2592B@softube.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 06.05.19 00:24, Arvid Ros=C3=A9n wrote:
> Hi, again.
> Se below.
>=20
>> =EF=BB=BFOn 2019-05-05, 09:54, "Jan Kiszka" <jan.kiszka@web.de> wrote:
>>
>>    On 02.05.19 16:28, Arvid Ros=C3=A9n wrote:
>>     > Hi again,
>>     >
>>     > Thanks. I=E2=80=99ll try the same thing with the stock kernel sour=
ce to see if it=E2=80=99s a
>>     > toolchain or source problem. This kernel came with the orange pi D=
ebian image. I
>>     > guess it=E2=80=99s patched for that Allwinner chip or something.
>>     >
>>     > Does the jailhouse build derive compiler flags etc. from the kerne=
l headers
>>     > somehow? That could explain the problem too maybe. I=E2=80=99ll re=
port back.
>>    =20
>>     For the hypervisor and the inmates, we should not use the kernel's f=
lags. We
>>     rather try to overload them with our own needs. But that may fail if=
 we are unlucky.
>>    =20
>>     Compare "make V=3D1" builds to find out differences. If you post you=
r logs, we may
>>     help with understanding the switching, and hopefully what went wrong=
.
>  =20
> Some, more information about this issue. After some more testing I can no=
w confirm that the kernel config flag "CONFIG_THUMB2_KERNEL" is causing the=
 assembly problem I saw, which was roughly what I expected early on.
> So, the stock OrangePi Armbian kernel seems to be compiled using the THUM=
B2 instruction set, but the jailhouse assembly files are not THUMB2 compati=
ble, and then some instructions are missing.
> I have no idea how this is usually handled, or if this is the only place =
the build will fail if we use thumb2.
> I'm rebuilding the kernel now with the .config taken from the jailhouse-i=
mages repo instead. Let's see how that goes!

What is the gcc output for such a thumb-enabled build? Maybe we need to fil=
ter=20
something. OTOH, we set KBUILD_CFLAGS in hypervisor/Makefile which is suppo=
sed=20
to avoid such effects.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
