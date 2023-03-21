Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBFGO46QAMGQE4GKIJEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6736C380A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Mar 2023 18:19:17 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id a17-20020a05651c031100b0029c8878f9cbsf2096885ljp.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Mar 2023 10:19:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1679419157; cv=pass;
        d=google.com; s=arc-20160816;
        b=dMePNQiFQ+L+92MY0eGZCQV5OjKtMufSfR3uj7yHvSkDjABox/isENuRKt6naKnZ7A
         l0yQoxwBAVyaAy4enGunZ8ApStCTOllLczwWD9Si+rMDQP0nZ4o0XhcWC/MdbpSqZ8GR
         R8+nlBeHg3lAXX+TO2KZC0qq+CRsblOw5sv/QzXRJ+JpuqL2OAQ1S9qo4rtQp+DvL0HP
         eXQUvYi2rSw9UmO5AZXsU6O5fuhuSNB/nKLzlZTHzpq8/H472FB2DYkrsfM5L4vQmR/p
         6w7GOrRceA5zsZ4uyiBpJqn8JPQDmVnsqIaIxdZt8uC8hQBE5CJP4DCiJ89x3z65YDlF
         YBjg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=N0CsVm09bLU8Ov5dxVGrycNDy2xLCJA86rT3CTT7+4Y=;
        b=0igIW1+0gx6t1ocddyJA/bZ1Ne78gEZQW4AAvjhHFl+jVRQDivkE0SWIBruVAPt30s
         wqWREtWE4XrzvaiFbe1NCLAci3OnZC70SOEhkxSRWTAAgWkA08+OgauCHyQU+DlH2IfY
         XgcBGhqrag3gpKXF74aZwJODP2HZaHh/hiPV/akgwv8Aj1lvgFDKluMN0TycfC31KqLZ
         Rave7L+S5xpjWk/8D+Dx56v/r1bfzTKdNQzKxmRyacoj6fGIpxSNafEopMrfva//Plsj
         oJvIkyoxGM/r5fLD9SRbAh+eYL5XdIt6GpxDeRV6ER31a5MLagvZ3lV80LphjW6bzaVJ
         X5gw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=bg8bsDnN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1679419157;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=N0CsVm09bLU8Ov5dxVGrycNDy2xLCJA86rT3CTT7+4Y=;
        b=Y1cNisk3J6E6BeYMYOkQyB8vBJQ/SIzWhewWz6gGfx2+woCJOpYu6W41EMB6TuLE5f
         MALM/+aGG2h3dYfmW9PONM6WLT4idNY8moXoLgZmMX7uolI5Q12UZw8dgi716sX64+jd
         OyZbGUlg8hRR/Et2/s4xtpvN8V7+2MDVv+shOCT2Jqqs7GkCpR1afWqv/6ozHsH2EoUe
         +UZRaIPognYEx2Z0NZKlJJGGmpDgFcf+8Hi0bEn6/QBOCVL5tm5xzefWgdkdjVFYGo5A
         jQowwAioItETr7C7J6lhboDQG58f4Z+oFwpYiuahu3N5WRLh5/jLf2Zs7kcFH/yGt2kD
         NpnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419157;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N0CsVm09bLU8Ov5dxVGrycNDy2xLCJA86rT3CTT7+4Y=;
        b=brTKWIguwanZOo8R3Vi07zmDfbtQWs6Ry/GrCttjn9eyG8+S/0iGpINmQ21Evnv6Xi
         WguJGUkkFQAVQqbQf5X7W7pobzleQFUqtrDWHjMgPHpUqgoSlzu8teYx2psn0kPHGSy0
         OlpvqCr47wSPp+XerESH7m2bL7aTlE1lB+aouIOd0x+VLHuWmNJbAP/V86tuNR0QPP5s
         lzA6vOTBZty0hBiFxMn+mpIdbhW/WqLWgKickfvFXv3ZKzTU0QdFo8gLg1XtToOwBMEn
         AOqEzxdCb1Lg7PANFgwkKJ4CMVEWzQkPuELNmfOXuJV8FOCT+ZMaDOj8F2hWkkcWU97Q
         8z2w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKX6MXws0Gj6oxXsvMhhyZRySxebxHYkvHSNkiqG1qsij4Xdli4g
	QsSKgJkBxpQM4Qpt2bAgxSY=
X-Google-Smtp-Source: AK7set+kN/TCyJ4QwjzKU2/gYEoC3b5F6+CBRIeQDavzDDUTgRJlTFuS1pBWUUQgS5HIOmIjQ53+9Q==
X-Received: by 2002:ac2:50d7:0:b0:4dd:a4c5:2b43 with SMTP id h23-20020ac250d7000000b004dda4c52b43mr1059343lfm.9.1679419157051;
        Tue, 21 Mar 2023 10:19:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:b29:b0:29c:88a4:18d0 with SMTP id
 b41-20020a05651c0b2900b0029c88a418d0ls1312892ljr.0.-pod-prod-gmail; Tue, 21
 Mar 2023 10:19:14 -0700 (PDT)
X-Received: by 2002:a2e:9d05:0:b0:298:591b:9786 with SMTP id t5-20020a2e9d05000000b00298591b9786mr1158561lji.52.1679419154523;
        Tue, 21 Mar 2023 10:19:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679419154; cv=none;
        d=google.com; s=arc-20160816;
        b=cpw3Gj6GcPbNXSYW/hQJtvB/gjUoaWCXoH0VKcHDel9g+AGR9x83wj0fBn2kPBicqC
         T4QMh4mu/1SwbaCaGBStZeFmuqioAkZACTeQ9wbCfIHEnoOC0oUte7zmCeloMsXZSNA2
         3qjjp8bHLx0iISWSBZCw6c0pZKxPO4IAtZ5CYffFE19X8JvuSGry4qQu4fzTY26j12fi
         3d9BhLfH5RaPTMZ2lLe0C2RHSfAmQ5YpYl+n3ZA8mxad7JK2NOXHqGxExxnDiywTZ0hd
         zC6Ni5PxS4FZN/MYCxHJ2/LoDs0tbWCwAJ6FJbesdaWjEETy6X8nsQ2WMuljE0k5Xj6N
         U/5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8tEEzlCGLhhZsGZW82E/Uo/wsBzhsgz6xm1ei3xYaZY=;
        b=GPU7BZlM5eti1WY1gUxL00pWofFHtibZpmzNTYosnIeHhzAdM0ef0TGqL0dasQahv/
         BRoaC1JKBCr3OzRQvezJ5eCgaQAAiE/2pVoZ09+FiIkR4gzpvJieHT+DTaIzQv+MdTGs
         irX+H5thXjINZQ7hJPi3+hatuFx1BrS7LY4JjNQqNEfodQm7BR4UcH9U+ohwAhwREQxk
         88xyTCGndyNKDpJqiIJ5E9h6EhUe7bpeabx5wq8Ural/SRPJ/IloRiB88P5yQqrslNKQ
         MokYH3hXM1RwSHFZ9S9pa0K5KUJp8J9PG8lY0lHopgYQ4AhKKgcL+fIZjXi+Hw0VjXrl
         dnpA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=bg8bsDnN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id x32-20020a2ea9a0000000b002983b01eb8dsi594264ljq.7.2023.03.21.10.19.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 10:19:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Pgyy94vB1zyKc;
	Tue, 21 Mar 2023 18:19:13 +0100 (CET)
Received: from [IPV6:2a01:598:90f5:ad02:c48d:cd7:f23c:c045]
 (2001:638:a01:8013::226) by E16S03.hs-regensburg.de (2001:638:a01:8013::93)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Tue, 21 Mar
 2023 18:19:13 +0100
Message-ID: <cac44592-744a-047c-80b1-c01cb9ba04f3@oth-regensburg.de>
Date: Tue, 21 Mar 2023 18:19:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [EXT] Re: Question: integrating Jailhouse in the Linux kernel
 tree
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@gmail.com>
CC: Jailhouse <jailhouse-dev@googlegroups.com>
References: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
 <83472a1d-e6cf-3336-a4a8-df3c6bcc2cab@siemens.com>
 <a22210d5-6ea5-4926-acc4-fec65ca36884n@googlegroups.com>
 <e442d6f8-e9f3-467e-8a9e-5ef053b6e46d@oth-regensburg.de>
 <CAEnQRZA+VCWGRPjuXSDwaRuadNAy2j9UOKpQr0KYiNdo8SNHyA@mail.gmail.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <CAEnQRZA+VCWGRPjuXSDwaRuadNAy2j9UOKpQr0KYiNdo8SNHyA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=bg8bsDnN;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 17/03/2023 15:19, Daniel Baluta wrote:
> On Fri, Mar 17, 2023 at 4:13=E2=80=AFPM Ralf Ramsauer
> <ralf.ramsauer@oth-regensburg.de> wrote:
>>
>>
>>
>> On 17/03/2023 14:49, Daniel Baluta wrote:
>>>
>>>      What you can already do is pushing the setup into an initramfs.
>>>
>>>
>>> This won't really help in our case. Our driver (Sound Open Firmware)
>>> runs at boot and somehow
>>> it already expects that the jailhouse to be enabled in a controlled way=
.
>>
>> Why? What happens?
>=20
> Our driver loads the "inmate" firmware like here: (1)
>=20
> https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof/c=
ore.c#L238
>=20
> And then later "starts" it, like here (2)
>=20
> https://github.com/thesofproject/linux/blob/topic/sof-dev/sound/soc/sof/c=
ore.c#L252
>=20
> By the point our SOF driver code reaches point (1) we already need the
> jailhouse hypervisor to already
> have been setup and the inmate enabled.

I still don't get why that must be the case. Why can't Jailhouse be=20
enabled later?

Anyway - You could have both as kernel modules: snd-sof and jailhouse,=20
and first enable jailhouse, and after that loading snd-sof.

   Ralf

>=20
> So, we somehow need to be able to call into Jailhouse API from within
> the kernel (or a linux kernel module).
>=20
> Daniel.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/cac44592-744a-047c-80b1-c01cb9ba04f3%40oth-regensburg.de.
