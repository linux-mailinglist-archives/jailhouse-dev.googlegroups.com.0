Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYG5TSDAMGQEWLCWFLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F493A6002
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Jun 2021 12:26:41 +0200 (CEST)
Received: by mail-ed1-x53e.google.com with SMTP id a16-20020aa7cf100000b0290391819a774asf18068675edy.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Jun 2021 03:26:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623666401; cv=pass;
        d=google.com; s=arc-20160816;
        b=pOIO2NbzE/YR5eXsiJ9XTrDx/pWSnb9TTy1Dc2lowwm9qzIYBKgp9g9X2HxJUfhSik
         8Ds/B2NiYpPqHUXcz0Rp/ceuCslwBeLhaNUldjPxurCGyHJBHlF4O4LIgR11ByeeRf6R
         9ihj3S6eZWmj2s84G19K1KyNVt/G5QcHk4Pnowbpc+OQqzm/tF9EhMPmPB3QwGAkuLAu
         4ZYFuydMmSxTAnmaUCzcZHZRxvwpu04D4XQsOMHnVrIptiegBGhc4HhzRL+itvMU7Hhj
         xtJoE/zHCsBQv2LeX1vkx1yzy3bdk9K842jnQruVzcF5foGwr2izFx1vn0+4sqouovYy
         CVqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=sncJEWUjspbi68ZEyz133rloaGnABvwKt+ptIEGv+HA=;
        b=PLsYpiCjKbFqgHdMsmGwDMvc+qRB3jFlOZFtEWIuVsgdPFNrWg5Zo3PfTvfqY2YLmw
         obDIymW/jyiW8GSZwnLjx7ogmGxaJ/NGn/la7ZvSDZQynI4EAeVtrF3AlAKSonohxEVE
         otfgmRKTsMS2zsXdW4FPLMKfrdDhzwbmt1wtG7obOJFFF5dLRrsLl7ImzzuIHdXixsxr
         3fknzqTko9LKuxKBHFCXk4Boawdiu1bWRofp3yvnGqb83jIVhU977VrENoHp2Lwcqm+l
         ug1aCS+xT3XuCVJUuEe0B+dPT0sIxzPVv9gULD0DX+cbgNGc3EyismCYN28Aqml5O3Q7
         Hv1A==
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
        bh=sncJEWUjspbi68ZEyz133rloaGnABvwKt+ptIEGv+HA=;
        b=Comx4heb59+Tht6AEFBpl7r42BRU6KiN+nk7JdO5h/O06cmgYZh/CxDeMO8qyoOm6m
         SlLwgaL49ey6Egk53lXPRmfZRagd/7WIqxJ7a19HvKWoeMoXfMEkNLWfQX47KYGE3Zdl
         nAarEDIwV4/6zsyOqeqD6Mm9PHNf1h40d10oi7FSx5ZbVcX7rVlif9e3wd/cnu4iderh
         SW110KMeCAsWqFEZDMVxYaBFUyujZoeUcJbKFHUUdGcM0Z08Hx6RqnfKH5b+Tqqpnl7m
         Ak3JvGijUDMWSuzRaKefmgEtUXf8qODFTO0gJ1IZoimALSVlG75EjAXs/lyyV3wrIw8n
         /8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=sncJEWUjspbi68ZEyz133rloaGnABvwKt+ptIEGv+HA=;
        b=UtEgEECp/ChTTBQlvA+LWHIH/6X1v/3NfaNum372X1gpodRlD4tTb8SeIdCkVES/F0
         R6TFCmqXT+5iq2vB5I8ppw/873m93/rcfv2VaLi8e04FT0dq0q/C7R35C4Yb3nl8LynR
         UgJhfgZpxMfr+6Y1EaaGjF4W+zK0v5A5LYqfi8fEugYNSZ+dLl4ZoG5QUL13kp+tKsaV
         vRkmFRfQfC2sUnUaWhl09RdRiWMxgxw8Hmo6B7YhhX5GXdNzAx/OaWEKM5Xc2VA4XZBe
         qGbUVSHB9WNE3bAQTEvYoXmw5CZqmAVTJo5J2ihIuY36zlrUfXF/LYm2P5UxLhFE46YS
         le9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531SSGEp8+WfSWI/B9d8oAn14sp3tyDYvW2ANZfGS/6JgqAE2YTp
	uZiBX7NtCpKxIRdDCYPQA0c=
X-Google-Smtp-Source: ABdhPJwbOVBNcFE1wZbIDv3J5d/1ycD95zMVEMQpaWJyTmGK4pm/YFhhvuivJb84rME9iPrqOZuVPA==
X-Received: by 2002:aa7:cf0f:: with SMTP id a15mr16216323edy.313.1623666401136;
        Mon, 14 Jun 2021 03:26:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1c97:: with SMTP id cy23ls5790728edb.0.gmail; Mon,
 14 Jun 2021 03:26:39 -0700 (PDT)
X-Received: by 2002:a05:6402:51:: with SMTP id f17mr7678761edu.359.1623666399896;
        Mon, 14 Jun 2021 03:26:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623666399; cv=none;
        d=google.com; s=arc-20160816;
        b=Ilf/+1NgLGE6RDpiqR/xhFoj4gb14PfV+oI/Okg9l7CBjuyxn2tzTYBGdyNyho0aBA
         0mgPnTCHTSwwS8hs2v2Fx2G9jU9BzMSLC0MACmNJ/qFI9yNxhoNRJlESZ6DEvdufs3aj
         eLW3Py4l01i+EvekqT6JBikpN63RExKHtuPFI1FDeUVwyQIH7xCEa/ZfwrdGfuFkJQfZ
         dq71W/508tR9vHIjadwvNirkY2PkjnlYoan/GEz9w3nYVZAi8qavwa5YRRFAzYM2rkA2
         En0QlluAHiClZ3aN20OfhiyB2bKXBuBzE5N3d8MEnLR1gSoK9TOeO3+vl++DWmymSGpI
         INjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=/10V8on/sty5X0DqU44dhYpBXKB0lN0EiZJo0hlqKN4=;
        b=efXwNJJV6RyoI7jYKGq3divAgUigk1ds84jX1A4da1E3TOvr9eDeeHEuP+8tGFGkKn
         1hvg7jNBAETYxByF+5nSEhHLqMcNHkeOPfXdLsNDXrYuv3uWSiHXuMemLGLKIUaTF12X
         JB88sxuux/XidPpOMR+qpImxUbZ2NBl+MvOOCuDEzBMxgq82O1DIBFnP7LdIYhgjA6RM
         oDYx5nK8dd5VWS/3nXtyMKFxuG5GSbecQdpekHxP3XESNNbYQxeHvh2raNvQmh7HBjV5
         VIijOpq5FeHQeSXkgtjUndZ2PnGfCQihpFU5N+QOX7h8U1fXTqdRgmoKJwMTCFShQYC0
         QgYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id s18si264022ejo.1.2021.06.14.03.26.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:26:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 15EAQcvq011497
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Jun 2021 12:26:39 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15EAQbjQ014013;
	Mon, 14 Jun 2021 12:26:38 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
        Jan Kiszka <jan.kiszka@web.de>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
 <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
 <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
 <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
 <1fb2994e-bc44-c9d6-1678-d574abaabbf4@siemens.com>
 <b38f413b91cd4b4686d636b57fe3665f@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <345af092-2503-9ce8-0c09-cdd6e3e679dc@siemens.com>
Date: Mon, 14 Jun 2021 12:26:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b38f413b91cd4b4686d636b57fe3665f@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
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

On 14.06.21 10:18, Moustafa Noufale wrote:
> Hi Mr. Kiszka,=20
> I spent the last two weeks trying to compile Jailhouse on Coral-Board [Li=
nux 4.14.98-imx aarch 64]. I have been=20

Historic 4.14... NXP ships much fresher downstream kernels by now...

facing this error:
> home/mendel/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54: err=
or: no include path in which to search for dt-bindings/interrupt-controller=
/arm-gic.h

But that file was added in 3.10 to the kernel. It is part of their
kernel as well
(https://coral.googlesource.com/linux-imx/+/refs/heads/master/include/dt-bi=
ndings/interrupt-controller/arm-gic.h).

> I followed a thread about OrangePi [1] and tried to provide absolute path=
s:
> sudo make $KDIR=3D/usr/src/linux-headers-4.14.98-imx/include/linux/irqchi=
p/

Wrong path, KDIR must point the kernel build dir (which might be the
kernel source dir as well).

Jan

> I get no rule to make target 'modules' stop error.
>=20
> What I understand is that he kernel source tree binaries are not appropri=
ately built. (.dtb)
> Then a comment from Mr. Ramsauer mentioned that the kernel must be patche=
d in the same thread[1]. So, I would like to ask, if you can give me any re=
commendations?
> Thanks in advance.
> [1] https://groups.google.com/g/jailhouse-dev/c/pwYGLSX_2Rc/m/AhzdSz90AwA=
J=20
>=20
>=20
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@siemens.com>=20
> Gesendet: Montag, 31. Mai 2021 18:47
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.k=
iszka@web.de>; Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; jailhouse-d=
ev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>=20
> On 30.05.21 13:30, Moustafa Noufale wrote:
>> Hi Mr. Kiszka,
>>> To enable Jailhouse on the Coral board as well, you likely have three
>>> options:
>>> - ad-hoc compilation on the board, using their "Mendel Linux" (also
>>>  Debian)
>>> - integrating Jailhouse into Mendel Linux
>>> - defining a new target "Coral dev board" in jailhouse-images,=20
>>> porting  the integration from Mendel Linux over
>> I have just got the Coral board and I think I would go with the first op=
tion. The planed workflow is:
>> 1- duplicate imx8mm.c /imx8mm-inmate-demo.c/ imx8mm-linux-demo.c and edi=
t it with the memory addresses in Coral Board, which is also using an imx8m=
.
>> 2- compile jailhouse on the board.
>> 3- insemod jailhouse and run.
>> I am only asking, whether I am going in the right path.
>=20
> Sounds reasonable. Problems can lie in the details, but those you will on=
ly find when trying things out.
>=20
> Jan
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>=20

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/345af092-2503-9ce8-0c09-cdd6e3e679dc%40siemens.com.
