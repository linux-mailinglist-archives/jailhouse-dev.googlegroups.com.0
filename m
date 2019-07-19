Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWFAYXUQKGQEDIGDNSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A7486E073
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Jul 2019 07:08:41 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id r9sf7460996wme.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 18 Jul 2019 22:08:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1563512921; cv=pass;
        d=google.com; s=arc-20160816;
        b=RQ50dEjbSUIKhyrFl3qUf8Hg0j7I71ceJfsXBGFfbC5YXj/9lu0QzBMnV6nuO8bJZy
         Fwqkd3HNfd84d/Hqa+Kh5xJ0r8zlu/Tyly6xbelG1XDm7XKyhG9pi3qB6IzIZ4NHdZtB
         tv3TJP06u5T9AO0oxDBhkVqaAutpCVihuVhsLl/ycc5PULsFzvGBEsW7vZDaF5H55UGC
         xHuLJUizxedHFvByuFlibAHsn7rPAKMyWQ7udCclMivZISts7rDIMjuhagVtVsinJcbO
         cI76NRi3fHdBpolg1H5X25LDtHyWw2q6cwVmthWUGc7ZSUEH8xYXH9wGuv9sBaZUUvfm
         qGNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=GyHtoXGJL0kue4NpqvASEAsoovRaeLW7nHPYw/P9tmA=;
        b=F5cOW+ezvpHUubZh4EPy0jTdBpwOSIi3XJ4KtxaJTcPZOL9JCuMTUQtf3M1M4Ccx0Z
         ty734YrJ3xhSoJCFlZxpvkuxcTb4IUY91fAXv7A/1kNXzkHQREK5yQ3XzC0XJVePU00l
         EiwZLUAo4XY5OaGeI1p8kS7nBCt5KBEAp9NeBt7CfMRbVbgPnqBvD9Nr82wrbcw69lCF
         jYAkfO+VL/GaWsobPqdTGDA4P4fYn5iR+zvgWSnPGs3+1Wuxtx2hQRB39Yum4reUbh9h
         mn8z/A/LmH4hUKaENHEvCTSQx9gFONFUSNhEjTt8kdIkXGTV9Oywo9IxIxpaRo4+BbOw
         5deA==
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
        bh=GyHtoXGJL0kue4NpqvASEAsoovRaeLW7nHPYw/P9tmA=;
        b=eirrxZhkTACif/nMmmyVoNtDlJprhmfRYzb66GSoZYmnhmHwhKUV6NNG3ytalSJlME
         y9D7nhnkKcgwKzlgr/nyyxXUUtm+ll7nruATRWOBqdugRz8lLl3vd1Q5pRc90aOYNbyr
         /N4FtpbI1ORhL4G5TIi4iC0uROntKYtnUHD06BfzKz+ztMf06t0DDS7ypNKolDVrqwAZ
         JWHC+y8N+VQ72Lli2CgIQS4L1QdA83ROhGnWoOxyuguxL1IhEpCsFbODrEEQ1pFDz5J7
         mjBpVccImOtbNKtWvz6gPAJRF/ZFyT9ZNgHC8C2Ptu/GaXhUD2xO4TNGNWFTwvQsbCR4
         GT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GyHtoXGJL0kue4NpqvASEAsoovRaeLW7nHPYw/P9tmA=;
        b=gZZUkwhUTxtN0r1SOzRsf90EwKnn1F2nL9Ci8IEvgizualWLqJ2XCABejY3wyp+kpr
         W7BxC/og15z2uhk4mDxWZEln365/KEyjQotWLcr+OSnuuqCitcdy2/Xjd4X9kXYPg4BO
         izrd1H0E91XS+8cbbg1S24N/KQYJDHHYBm3mriuxpUoQrPeJD4Pb+5LDxQZCwMHbPFjb
         L/KLxax8ojaTV3y5Snd+TBh/vpHqu94N/YMH7kPUg66yX0D29mCaNMvgxyl/dtVcwjAX
         HacCsUnO1a8MP2Zj0Ar2oD8BawWZAA/4+Zqqu+vO8WCC2jJ7u05KcAdMYsTHNwWYD3K8
         H/aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVwySjelHJE2DXhh8lH4CreNFyw4V+RA8yYkKKqv8+9c8Tfce4t
	RLF5V0WCncTYQjxS/2OT3es=
X-Google-Smtp-Source: APXvYqzxN63e3Cz4ufHREs/1T18J56Eil+8slXOpMt3LHbux+XsoJvSMQpr8wpxfW+D9FgN96BqhVg==
X-Received: by 2002:a5d:5450:: with SMTP id w16mr3463227wrv.128.1563512921006;
        Thu, 18 Jul 2019 22:08:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a557:: with SMTP id o84ls11153333wme.3.gmail; Thu, 18
 Jul 2019 22:08:40 -0700 (PDT)
X-Received: by 2002:a1c:9e90:: with SMTP id h138mr47388015wme.67.1563512920270;
        Thu, 18 Jul 2019 22:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563512920; cv=none;
        d=google.com; s=arc-20160816;
        b=0BpawW4n4xzix9IusZqjID0oVdQE9No0zq7WHmOX70pnIFi05yVJGlF2GY4d1QZYHN
         RUzGdpKJqopa5AIBNJJKi+AowiY1fqf4swEr9ySgYLO6DbUDtK6+cskodw0iU6UFW5rd
         94f5/tKUq3hlEKvSCpJJheXO78BhqTSqtwhwiJvUT3P9nE6PJU+8gLWoZe9DSaSrJnna
         17sHZ20+JmlI+fynha7fZtuCPan6FQTVwjYzrrPxxsiAhgAng3Mvte4qDcbyl0tvDn/k
         Iok55KfLBU2dJelBZHz6TSPnuRAcjQrimEg2O3J2vg7K7TDV11FAOuD25esGkO0NBN7n
         w4aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ia+iVSR4y995TwC/yYEq+j9TDXn+n+EIDH6L3xlfeIY=;
        b=F5PCICZ9cGV0OjpAKuIkVo1J5s/NFyf1q1cxuR4HM66szc6GJCEygUCYahsEFC3/g7
         O12G8gdxuSOKOuEJbFMz/IIhcQghHb8kAqJlhkf8OXjQ9fwRme8cXOksWTR/w/Ca4X5x
         wdTfRUuoavreoFodcbrxo/LehHmnNQ+9WT/l5j2Oea+MHxR6AJ7XvYFeQFBR+hN75Mxg
         0R1gBUjRdXjh28p8BGefz+JhYEmNWV0krcXD/lIaq7aGky3jqgVIn4W4RELJYNNVE/35
         5U0qsxmBsjjYbKHovBpO9y3aYK3gc+g/oCCe7TukJ36kQSUbw8/8dRLBA2wUfg2aLw93
         Njng==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id b15si892278wmg.1.2019.07.18.22.08.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jul 2019 22:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x6J58dQ0012251
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jul 2019 07:08:39 +0200
Received: from [167.87.233.149] ([167.87.233.149])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x6J58b8R011088;
	Fri, 19 Jul 2019 07:08:37 +0200
Subject: Re: PL interrupt in UltraZed
To: Alejandro Largacha <alexlargacha@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <CANdaEOi5f13kg0OF+6iYrzmoJUTOhtgu4=r+0Vt+ZQ4oTtf1DQ@mail.gmail.com>
 <a1ea8f98-2709-d789-8564-6c719b58526c@siemens.com>
 <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <47b00372-adcd-da18-8553-d7085bc6e049@siemens.com>
Date: Fri, 19 Jul 2019 14:08:37 +0900
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <e10f5a45-4913-4b28-b896-0ac6b381e183@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
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

On 19.07.19 01:32, Alejandro Largacha wrote:
> Hello,
>=20
> Thank you very much for the reply. I tried adding the irqchip entry to th=
e cell config but no success. I have a doubt about the pin_bitmap entry. Is=
 it divided in 4 groups of 32 bits? Then, how should be the entry like for =
the irq num 136. Like this?=20
>=20
> .irqchips =3D {
>            /* GIC */ {
>                .address =3D 0xf9010000,
>                .pin_base =3D 32,

This means bit 0 in the first word of pin_bitmap encodes GIC interrupt 32. =
Then,
when that bit is set, permission is granted.

>                .pin_bitmap =3D {
>                    1 << (54 - 32),

So this one grants access to GIC int 54 - not sure if you need that.

>                    0,
>                    0,
>                    1 << (136 - 128)

And this permits access to int 136 because this 4th word controls interrupt=
s
128-159.

Did you already try out the config?

Jan

>                },
>            },
>        }
>=20
>=20
> I attach my new cell config file.
>=20
> El mi=C3=A9rcoles, 10 de julio de 2019, 7:20:56 (UTC+2), Jan Kiszka  escr=
ibi=C3=B3:
>> On 10.07.19 06:57, Alejandro Largacha wrote:
>>> Hello,
>>>
>>> I have been paying with jailhouse in a UltraZed SoM with AES-ZU-IOCC-G =
carrier
>>> card from avnet.
>>> So far, I have been able to enable the root cell, create a aremetal cel=
l where I
>>> was able to load the baremetal
>>> examples like gic-demo and a custom one where I was able to turn on som=
e leds
>>> via axi gpio in PL side.
>>>
>>> Now I'm trying to run an example where I can catch the interrupt from a=
n axi
>>> gpio in PL and I am not able to do that.
>>> I'm using PL to PS interrupts in my design and the signal is being gene=
rated. I
>>> also tested with Xilinx SDK.
>>> I tried with PS to PL group 0 and group 1. Irq numbers 121 and 136 and =
no
>>> success. I don't know what I'm missing.
>>> I attach the cells and the demo source.
>>>
>>
>> Your baremetal cell config is not permitting the cell access to the GIC
>> interrupt 136 you are using. Replicate the irqchip entry and create bitm=
ask
>> where only bit 136 - 32 (32 is the base) is set. See also other examples
>> in-tree, including those for the zcu102 or the ultra96. Both grant their
>> non-root linux cells access to certain interrupts.
>>
>> Jan
>>
>> --=20
>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE
>> Corporate Competence Center Embedded Linux
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
jailhouse-dev/47b00372-adcd-da18-8553-d7085bc6e049%40siemens.com.
