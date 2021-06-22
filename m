Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB2GUY6DAMGQEAX4XQYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 794B43B062E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 15:49:30 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id o15-20020a2e9b4f0000b029015ae56d3aa0sf10758643ljj.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Jun 2021 06:49:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1624369770; cv=pass;
        d=google.com; s=arc-20160816;
        b=JLjVZFa2WzkOFwPChGxSlh2GdervpW52TyOjKB6cPl43qs5d7QmTyB56yOZ2Pinkf6
         rSmgTbmZjsjndv11jln0vgrh7+TSglqZYxEjurtFQdfKRNcK/aJFvX4zH3rOknKvSazu
         s2EWdhxCmH2MyXHU6vPtAZj2uNbn2/mZ8sRcCz75kidBnMkzwXGDKMpmhjmasEAxd4oK
         2DPTs7lzlTOmSkMqJW+h2BGDn1N4HneYyoqnYzezOuDQNdaX2jsEQ3HVfLGNq80YviCh
         fMAkkRun6ru1TQ23xjSTmQb3KCBvYh9JrRwRON/2n+sgx5a376Sk4O62q0wyT4PhcH9/
         gnDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=LSD9NsMQsvR2IM0Bi0BiXrsI190jrUHpiodPIhf6uCw=;
        b=PXTKUmejaSDCMe8CsaOaTsDdhE6j2HXzMvtXsVB1Rx7N1etT7QblBn8S9iFxG3nb3b
         wx74tEz7FHRxZqXNu6v9houUvXjyPaDvGkKDBUY62YcT8Mxt7AiQHYP/T2p0f227bln0
         W/mRU1PhgMXI2TiAPiDpQAg8c7hNQdqKqEnSR3spV1B2fxpBR+cI0HAhzaeh1l3MggVU
         dIwlDhEOB/DHDgK07QO4g35QSJ5L4ljCbN/C8GaxB1K+K94+dFQ661EnnoHgIwFD2q+X
         hMZNe/ib+6wB2P4JLdAV+G0LsJPKg5xlXv3td7Q9CXES6aibBaSCDr/One7Dro3/Nl3/
         X1uA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LSD9NsMQsvR2IM0Bi0BiXrsI190jrUHpiodPIhf6uCw=;
        b=E263+GT8zmiu1S8CsD9G8eC9KGcpUmdO/nifO0c79qYo0e9L6kLq1bTUf3JEX22UH3
         hUS1lE2aQOjP5a1EHpZQDZQmkERDkeinkvckV6zcIfGJnCGKR2m0fAK/T1pL9J0tgJK/
         xKqHk0jk01eNCp/9r3gb3ZmYNgFaxvxwA6PBm27+2TEmeWXJNYKDLASPorD3R0PUrEc2
         bxWO+9sqncMJ0VG7nj+u9D8UPcHe8VX2P914BEI/C5z08nvhloZtG4FwgptTnwX7RKOH
         3HJHD/tbXxx+qF/o1KM3maD8kOl5QLK72kwWMbPl7WGuQX27FYS9uArjMpOe36WPxUkj
         +JcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=LSD9NsMQsvR2IM0Bi0BiXrsI190jrUHpiodPIhf6uCw=;
        b=uAvWq2foN8moqpGN70F9fiiH4h1ld/fwPdej5UqnvqcuIUEALVnrHrrJUV8xK9LMeK
         eFe9WHB2xQ5ZMO5S/OnbZcdbVvcYg3/LR7NQKf3vTKNOZAEGJWFE2Htkhq8LW+GH98Nl
         6DeVyErzGmdZMY3ZxcLVsppPxO4lySAaRtO30VkuJ68OXHSKga44aZQEdf4fRrJtHVQP
         BTDXiHqNSWguNKT6r37r6Ty8LTW7pnZYrospManEaFF3bj8rTzqEM3MSiIae0PaXcgPg
         z8LpsKgfYBLxgJhZVYmmXeSwIt/hXqSk73yVm2XYkp/CoFwxtv2lB6EhhbP/3YoHZbPm
         iB+A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5338/WvZKhUh2uhn+bYcNT0oUopMH6OFYp98zPgnjiSZPhvuFhn1
	NORjg64HVmcsLmekHMouyeM=
X-Google-Smtp-Source: ABdhPJzPl5MGTklDOxhBAI4CgtLPQVubtXX9qJRQua+NDWX6HGBOmD5HNyGInSWjeLc/wMU1efEjLg==
X-Received: by 2002:a2e:7812:: with SMTP id t18mr3448374ljc.108.1624369768583;
        Tue, 22 Jun 2021 06:49:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8155:: with SMTP id t21ls5051515ljg.1.gmail; Tue, 22 Jun
 2021 06:49:27 -0700 (PDT)
X-Received: by 2002:a2e:9945:: with SMTP id r5mr3364640ljj.324.1624369767407;
        Tue, 22 Jun 2021 06:49:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624369767; cv=none;
        d=google.com; s=arc-20160816;
        b=BORwtvYpI0+TrfGeUbBLUbfax7UUCx+U7QfkTUELpzYL7iw/n7Z0vRNNknANTJmWBV
         EnSiun7GrWCXiPxM+vDujq6BqPyFRURMXBho5UHH4uEfdebxgxhXU7e6F6dFT29Asstt
         X+XyXLAeMmZetdPL9SfuGqYrz7GG6Z0THJgawxX2CqELkll9zFeEvpQot7EtN7DnAh0B
         W/5Ja54GIZA6IHpqtZsT7D0QE+ucgux3fTEn9djjYmMZQLwhiuRdAqB2vIrS1Kp4qTnm
         keA3BXPtJxBB0tFBV0QBmo8oHWL4dQ0tYSKuRBs7uIolY6xuIQGMhKuS9/A4xMFNCoQJ
         D0Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=mScei5fNaCfF6dkTrwSz3j7RdOlEPr/Ilf9agw6XqfI=;
        b=D0Euu1YUhD04zuktKg6uzNGbRt2wKFrN+NdF5N/UeRla1TqLKxfoNGQG6rUZeo44UO
         IZw3VYJOmb+zjR4tp3wCcoh7mdcelWXhFfRZwPIVdkBXsOlE5pb/h92ntOq1WgUVx1er
         IhW6QQhYwsX6Nr/i7hqMSPTHvj3uMweHIp8/QnzdIQphFMJRznluN626tJ0Qn26rsgsM
         LQfLnU8pXonrZ0GZdOIKc6xk+CW60L0/h/gX8GpQS2KDlBtPYEveDDeqmbNNx3usU0/t
         LUZihHRz6zTYJoo+Uy2qAQB1ofy4iEKY1Q9d7S25+635W3rnGxcuIpI6jES2/XMnaBPl
         raaQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j7si141705ljc.1.2021.06.22.06.49.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Jun 2021 06:49:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 15MDnQGZ021259
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Jun 2021 15:49:26 +0200
Received: from [167.87.93.200] ([167.87.93.200])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 15MDnPAv031049;
	Tue, 22 Jun 2021 15:49:26 +0200
Subject: Re: [EXT] AW: AW: Inquiry
To: Moustafa Noufale <moustafa.noufale@uni-rostock.de>,
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
 <345af092-2503-9ce8-0c09-cdd6e3e679dc@siemens.com>
 <ab513562e1ba43c298c97a4e08d975c5@uni-rostock.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <46885237-2f3e-8d77-11fc-b178dc827202@siemens.com>
Date: Tue, 22 Jun 2021 15:49:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ab513562e1ba43c298c97a4e08d975c5@uni-rostock.de>
Content-Type: text/plain; charset="UTF-8"
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

On 22.06.21 11:33, Moustafa Noufale wrote:
> Hi Mr Kiszka,=20
> I reinstalled Linux headers through these commands:
> sudo apt-get install linux-headers-`uname -r`
> sudo aptitude install build-essential linux-headers-`uname -r`
> And not dt-bindings is in the expected directory in lib/modules:[1]
> And ran:
> sudo make $KDIR=3D/lib/modules/4.14.98-imx/build/include/
> And got:
> make: *** empty variable name.  Stop.
>=20
> Then I tried to cross compile jailhouse on my host machine. I followed th=
is procedure:
> 	git clone --branch 4.14.98 https://coral.googlesource.com/linux-imx
> Then I got "config.gz" from the coral board extracted it to "data" and pa=
ssed it to the host machine:
> 	cp data .config
> I made the kernel and it was successful:
> 	make ARCH=3Darm64 CROSS_COMPILE=3D/bin/aarch64-linux-gnu-
> Then I retried to cross compile jailhouse and passed:
> make KDIR=3D/home/mnoufale/Documents/Masterprojekt/linux-imx/include

"Wrong path, KDIR must point the kernel build dir (which might be the
kernel source dir as well)."

Jan

> And I got this error:
> make[1]: *** No rule to make target 'modules'.  Stop.
> make: *** [Makefile:41: modules] Error 2
>=20
> Any guidance would be appreciated.
> Thanks in Advance
> Moustafa
> -----Urspr=C3=BCngliche Nachricht-----
> Von: Jan Kiszka <jan.kiszka@siemens.com>=20
> Gesendet: Montag, 14. Juni 2021 12:27
> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.k=
iszka@web.de>; Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; jailhouse-d=
ev@googlegroups.com
> Betreff: Re: [EXT] AW: AW: Inquiry
>=20
> On 14.06.21 10:18, Moustafa Noufale wrote:
>> Hi Mr. Kiszka,
>> I spent the last two weeks trying to compile Jailhouse on Coral-Board=20
>> [Linux 4.14.98-imx aarch 64]. I have been
>=20
> Historic 4.14... NXP ships much fresher downstream kernels by now...
>=20
> facing this error:
>> home/mendel/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54:=20
>> error: no include path in which to search for=20
>> dt-bindings/interrupt-controller/arm-gic.h
>=20
> But that file was added in 3.10 to the kernel. It is part of their kernel=
 as well (https://coral.googlesource.com/linux-imx/+/refs/heads/master/incl=
ude/dt-bindings/interrupt-controller/arm-gic.h).
>=20
>> I followed a thread about OrangePi [1] and tried to provide absolute pat=
hs:
>> sudo make=20
>> $KDIR=3D/usr/src/linux-headers-4.14.98-imx/include/linux/irqchip/
>=20
> Wrong path, KDIR must point the kernel build dir (which might be the kern=
el source dir as well).
>=20
> Jan
>=20
>> I get no rule to make target 'modules' stop error.
>>
>> What I understand is that he kernel source tree binaries are not=20
>> appropriately built. (.dtb) Then a comment from Mr. Ramsauer mentioned t=
hat the kernel must be patched in the same thread[1]. So, I would like to a=
sk, if you can give me any recommendations?
>> Thanks in advance.
>> [1]=20
>> https://groups.google.com/g/jailhouse-dev/c/pwYGLSX_2Rc/m/AhzdSz90AwAJ
>>
>>
>> -----Urspr=C3=BCngliche Nachricht-----
>> Von: Jan Kiszka <jan.kiszka@siemens.com>
>> Gesendet: Montag, 31. Mai 2021 18:47
>> An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka=20
>> <jan.kiszka@web.de>; Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>;=20
>> jailhouse-dev@googlegroups.com
>> Betreff: Re: [EXT] AW: AW: Inquiry
>>
>> On 30.05.21 13:30, Moustafa Noufale wrote:
>>> Hi Mr. Kiszka,
>>>> To enable Jailhouse on the Coral board as well, you likely have=20
>>>> three
>>>> options:
>>>> - ad-hoc compilation on the board, using their "Mendel Linux" (also
>>>>  Debian)
>>>> - integrating Jailhouse into Mendel Linux
>>>> - defining a new target "Coral dev board" in jailhouse-images,=20
>>>> porting  the integration from Mendel Linux over
>>> I have just got the Coral board and I think I would go with the first o=
ption. The planed workflow is:
>>> 1- duplicate imx8mm.c /imx8mm-inmate-demo.c/ imx8mm-linux-demo.c and ed=
it it with the memory addresses in Coral Board, which is also using an imx8=
m.
>>> 2- compile jailhouse on the board.
>>> 3- insemod jailhouse and run.
>>> I am only asking, whether I am going in the right path.
>>
>> Sounds reasonable. Problems can lie in the details, but those you will o=
nly find when trying things out.
>>
>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
>>
>=20
> --
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/46885237-2f3e-8d77-11fc-b178dc827202%40siemens.com.
