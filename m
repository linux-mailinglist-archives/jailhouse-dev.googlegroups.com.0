Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB74OZHUAKGQEDTVQ3FY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id CB01155410
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 18:10:39 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id c6sf8121351wrp.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 09:10:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561479039; cv=pass;
        d=google.com; s=arc-20160816;
        b=hcnmcmuzxIvI+xPAZhBJemeUjRc16c3EcKpMzgIZnH5/gOQo1ZMey+z+zgCrZGOZjt
         yKGMi2DVkzaaKxRUB5cRVIfSsPILQTAR5xLRhJry23RsurLo6A0t3/Ox94FItfD5/+CU
         zaCIen/AKS8MgrDVOOYQv5QSS/hepOWt6h2+shqZu7R2oeiJ1/u81E9+SONXsA2ohWQi
         Jup02lqHSK8NguP8NeoqmKesrqPnMDzyk5mt3qbobFn9RNdcsigioqXtWdwBuIJwJe/5
         uSPhK6Ozhylf25grVoF97g9s1Rwb+ZyYu1IaB7XDyV+7COA0vVlnd1vYLiTO6VpnNE0/
         70SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=5WX8nbD0/gMNWKWWNzpng75IxIvmoS8IWwzjRCux5A8=;
        b=jWbBXGeQIYOypSoQYZeAN/kyLoh15Mm5DhHx4PIKQJtj8JxLI4RceNKT5KT7d50wQJ
         k9Flcg59pBmGiXO6LCofz7cGQKQ+TDW+m4HVmvClb9jo9QgEHQ2CjoVcMJ9AFFLM3DCC
         ji/6+7ZeTD+oGVUI4FNgbfe4LgBsKhHEmwfqqgmgIwFHKYJHO+mOU6+jpE4l1iHg61Os
         1R5NE9EDZfwrcvFK0u06h6baHUL3ub0Gsq7bvWsdWn70Qar0ZsAiun9frOpD0ndJQx+u
         pLyn0nkx88U3Ek8I8Gvi2jkVk5QkZsxUy0pWoPFlW//79G8SEiciKcCo255AH9CS8IZm
         6s7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5WX8nbD0/gMNWKWWNzpng75IxIvmoS8IWwzjRCux5A8=;
        b=q7Bje9SoSAUkaslgGt3N+3PR4gjJvsaF7X8vzvmqGXwlLNpuPml12z/6j3NGpyMvF8
         X5KAEWCWa9TTxU6B2AIPF8bIC4yWwRBXfYER02xnn1ipCHN6WSAsQvW6SgqjnsC1xVqQ
         f+SsmdcrSvngwGoAFx/iPkaxVLDU8GiHyeFQOvHLhz/Y6eI36Yp3pV60G4RhnYbgRos2
         AmZwn9h36jjQHPQmELrU5eu8Ap0julBoXskChgEdbvcNG1RJiu3T3MASoCj46pHHlV8M
         9QrbBp1pJnOwhIbRfEkZlahgK9SGR6OzZZLvWLORgWi87WP4SS5l+LZX4pHfQA4F41q0
         fGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=5WX8nbD0/gMNWKWWNzpng75IxIvmoS8IWwzjRCux5A8=;
        b=HYRI+abSa9sOa2NZ6xSCXW9dBoSf0FcAvivadIyeKudQh9/Qq69ykAmqSM6T7mntL6
         eAR1gMTZYmHWxWwyWbzRRzdFWnMdBU5XGzQIfxGBmDfGV77/WILO/+xtqagiHqfRPWKI
         eVTgn0gBYfvYKef6GYYdAzS0HyDSxKtiWLayJX2/qUtKS82fwVXBZRm89wdvZNM/X/4L
         pqTwyD1Z7uHg3hVNuyHwVWM0GDRP75AWzmLrd8mANOz+gOid3NiTUP05WWhYFvvWUcy3
         +sX73UocTbRlMp813O68NkQlYCBhknMjfGdVElqtYb6kRmcFGGWb22U9fOm9qLNlCuA1
         tu/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV7sNTliTOzaZI6UUGN8Mf8r/Pi1R8xS0dPuBjtvDqMdX9eujz1
	EPKuLHoC5vIHBL1S3CG7zng=
X-Google-Smtp-Source: APXvYqyGlkfzQV3wo7Uv07FRiPWXAqzvtgVG9AX9dCWPoQxN0ydJBAmj6p27mkWE3YPLo6eAxj07ww==
X-Received: by 2002:a1c:3b45:: with SMTP id i66mr21099800wma.48.1561479039503;
        Tue, 25 Jun 2019 09:10:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:5f86:: with SMTP id t128ls759791wmb.3.canary-gmail; Tue,
 25 Jun 2019 09:10:38 -0700 (PDT)
X-Received: by 2002:a7b:c247:: with SMTP id b7mr17431845wmj.13.1561479038933;
        Tue, 25 Jun 2019 09:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561479038; cv=none;
        d=google.com; s=arc-20160816;
        b=JtQMOUQH6at4L+x/YJiX/FgSWa8GgyhISfynQTE/I9m33aTOCLet9PCeYxLdvfFbD0
         fCmBDml5jYTUvZUb+6gPIbhZLVmEXHNcJ+CJG96OLwELRYPDr0dKtN5WaeNWpW4ToIzO
         q69Oq2rNORwTE7TdO9AE1NnjU9NJKPyd0S+fdPM7LRKOl/Y7/jvZKdyGQath6sDN7vc+
         Mvfyupgw303FDfgHv8sL+u56CYytFGVn1We33xZJaCeSe7CwCKI3y44BBN9NZ54ssE5F
         WCmzMsn6KlUBCAqDCh2FKQDQ9dR7WHtTrlLvpew7wA+596/pU8POWYv45xqMnyrvrXmF
         n9rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=xTiAfIv8hdINHfYjR7h6jlOoaiB2JQ6ghGrWcsqT+2Y=;
        b=gag4mGgIAGC4oHgtQX8NR9O1WoWxNDT7t1UD32r1mBWb9NmobEi98gX5OacrlcDTNH
         t0FrNspoqR4hBVJJ0AFVcrVqbUzSM3WdiNVWKL96UWUM+Coisn1jTOGMBM809FdX16LH
         xkwAQHMCYVIWUVDBxfCz7oOQUsGZCroTIpBSYmu/y3+F3xzFQuv8dvxLdpO8rxCuNTif
         d3tyRsVNeh7BvABr2XFQZKbFV2M1y5z7l6FLFwq7dMciLtRN0fLN1jxXXAZAUPAVJHUr
         3+uV1R1/5M9Oo0BFuucSPkiOOr4KiAe7/xuMfStFLMVX2cTJN5qxeUN7V0nQTNKzqMg3
         M8+Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id a1si124083wmb.2.2019.06.25.09.10.38
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 09:10:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x5PGAcGc005465
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Jun 2019 18:10:38 +0200
Received: from [139.22.35.41] ([139.22.35.41])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5PGAbcb007707;
	Tue, 25 Jun 2019 18:10:37 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
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
 <3660acb8-e530-9625-bcac-177b8c84b642@siemens.com>
 <CA++Khc0Fxz3NKS5p0ApbTtos5j5GtuJzBOJ+4jT31faXn7fbrw@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <d61ddf73-8872-23f5-23e2-06a3401aa490@siemens.com>
Date: Tue, 25 Jun 2019 18:10:36 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc0Fxz3NKS5p0ApbTtos5j5GtuJzBOJ+4jT31faXn7fbrw@mail.gmail.com>
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

On 24.06.19 22:55, Wayne wrote:
> Hi Jan,
>=20
> I have a couple more questions on serial device (UART) allocation.=C2=A0 =
If I have=20
> two serial devices, ttyS0 (IRQ4 w/address 0x3f8) and ttyS1(IRQ3 w/address=
=20
> 0x2f8).=C2=A0 Is the setup below the correct way to allocate ttyS0 to the=
 root linux=20
> and the ttyS1 to a non-root linux guest?
>=20
> // .irq chips array in the root config
> .irqchips =3D {
> {
> .address =3D 0xfec00000,
> .id =3D 0x1f0ff,
> .pin_bitmap =3D {
> 0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
> },
> },
>=20
> //.irq chips array in the guest config
> .irqchips =3D {
> {
> .address =3D 0xfec00000,
> .id =3D 0x1f0ff,
> .pin_bitmap =3D { 0x00008 }, /*remap ttyS1 to the linux guest, root keeps=
 ttyS0 */
> },

These look good.

>=20
> //.pio_bitmap root (keep ttyS0, lose ttyS1)
> .pio_bitmap =3D {
> [ 0x2f8/8 ... =C2=A00x2ff/8] =3D -1, /* serial2 */
> [ 0x3f8/8 ... =C2=A00x3ff/8] =3D 0, /* serial1 */
> },
>=20
> //.pio_bitmap guest (keep ttyS1, lost ttyS0)
> .pio_bitmap =3D {
> [ 0x2f8/8 ... =C2=A00x2ff/8] =3D -1, /* serial2 */
> [ 0x3f8/8 ... =C2=A00x3ff/8] =3D 0, /* serial1 */
> },

These look identical, thus something is wrong.

>=20
> Also, is there any way to prevent the non-root from trying to probe again=
st=20
> ttyS0 at startup and causing a memory access violation?=C2=A0 I'm aware o=
f the=20
> 8250.nr_uarts=3D1, but it seems to default to enumerating ttyS0.

I don't recall details, but the x86 platform is way less flexible in config=
uring=20
resources. I would recommend configuring the root cell to step away from po=
rt 0=20
(setserial) and use that with the non-root cell.

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/d61ddf73-8872-23f5-23e2-06a3401aa490%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
