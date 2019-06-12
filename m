Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBS6OQTUAKGQE6AJK5ZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B9C42C20
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 18:24:44 +0200 (CEST)
Received: by mail-io1-xd3a.google.com with SMTP id b197sf12682250iof.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 09:24:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560356683; cv=pass;
        d=google.com; s=arc-20160816;
        b=czrMlEmaAxvON3CFtFrA2YycXT491LZAvAQULqSS/cAo/VgmFq6qqai5YiSymNS3dZ
         D2lF4EDEaK3oYXv332PbJu9IoJSNJyuOGgR6pQx/DD45jinnoZTDJZAp8c8SYBOGsusK
         URu0pEvv4YU4+sA4UEz+6mWvD1ZTbDeU/QbwH6/ViPT/fiMOZWJh8RzXl/jKA7sZU/mm
         2+RBQrGDT58vUAhgdZoEqAaODeTQ2H1+yudOM6PgC0lfowYGwhH+i28dQSQYQQkbou1u
         bdlotkh5rAorfJcWIjGdDIrcGKPNQMgG7wcYwjcTyLE6y9pr1V68TslP9O0HLVL/Ushk
         UzLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2OFAKA6QS9jLhwpBLOLP24X0Dodb9UbNX4c5Ooc0tls=;
        b=1Jnr5YJ9gVNTgSl6XIwKlNFWNgYlBXfdtLPxv5+Y0ocd6PexRxi80n1O3aDhXZtI43
         IBtyQGLb8IaXFfnHSJFxJctSxNlK/o0M/zYrbwLf3wyWHgr0PtH0YpumKkrN/H8C+QW/
         pzcxXoN1vj+ERTHQhfv//sRxN7lL4EimQwqj5yJoSqDjN6JNl1ck2DINL6wOi+nO1iRo
         1lPsu5Sy9i1cMmfsfxrX0EKv6y2V850IUTwyJF7dYruKH9pOjQncwj0O9XIqLFTRX6Vf
         sjXQ2tl4w53weY5MrUTF4Ws8EeQ2nFJOppZ6MWHSGa4pl795EyzB+X/TeQoP9yuI9+In
         QQWg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CdZcNIYV;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2OFAKA6QS9jLhwpBLOLP24X0Dodb9UbNX4c5Ooc0tls=;
        b=ThHl3Pozjcb3bUk8JANA4HS2AFUbHGTMOjsI42tPfI30qRAJM+ae0dmEhBMA+JeN1E
         9E9ywjOkwqn447aX1mpdtcIPCYP5OIi0vMvIbAMcPVnVprbBNwRm/VdG80A6z6E5g018
         KMi9p9kZ9vaBgHr7Y6V9cjdgLxosnMjd19K27FLCom+l+U/YniYeYnSz73sYsFRLF7Bt
         q2uN4zDZq7vbl/aK38mx6DfCANPVUplX6NT++sgOu4p8vj0rDbhtHKfmMEmmS206OuO7
         aeecrQD+elQ7I1OjDqS/wrKT7nKCg9x8itpbehzmczIBcP16JzjMvOnO4SZ1eIZmFD5f
         0gBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2OFAKA6QS9jLhwpBLOLP24X0Dodb9UbNX4c5Ooc0tls=;
        b=n5zzyF0cd5SvXTqPL4LwLisZ+isiHzZDuffqvsw2epekSXlZjbMNnoXB+tdrAFS7Zz
         fBc8MgkfpUZEcKbvl9avDxcepLugYvehuhLO1W5RUyzmZYMUA31EtSznBUaWmbExOrY2
         Odm3eIS8OJlXpJ44/oThYeNj7kWvmcyi69BpvjAg894nJ5F4TvWVfZwYFFsknC4NZhwZ
         Jw4CyZZpTgQtsPWsGLqtYdvDO15zqr/4XVXLhOl6btmGDV+mTRSrNH/TIrvLOSajrlbj
         /VBqTkjvDETv7AP8yWf47j/CsF+0tVVHfpAdvyQjMzqSBrsk9vFP8mpmbO8+Yd5TOaRU
         deCA==
X-Gm-Message-State: APjAAAUvktRFA4eQQ0JwONb7IKZT5LMng/IJg55fQ71K90aeMLx5zwMS
	yL6yL8XWzd653iSHcLsLFsg=
X-Google-Smtp-Source: APXvYqyxoVwx3s18uQDfVz6h/waq0IYVXHya5Ta8G6FGFRyeNK3h0pfdyhC72ty0K9guRdmdvra/zQ==
X-Received: by 2002:a24:9144:: with SMTP id i65mr2595704ite.170.1560356683539;
        Wed, 12 Jun 2019 09:24:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a02:1c88:: with SMTP id c130ls242953jac.8.gmail; Wed, 12 Jun
 2019 09:24:43 -0700 (PDT)
X-Received: by 2002:a02:3c07:: with SMTP id m7mr20893656jaa.64.1560356683161;
        Wed, 12 Jun 2019 09:24:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560356683; cv=none;
        d=google.com; s=arc-20160816;
        b=l3aUZ67/2LbeqEqQqcCoD8MbdLi/bPM2TAtf018M+bxXggsh8Qu4N0vSOYBUWd3xWB
         wqIXDKP0geZx3VMK3vhyAsGaljJcwcM787sgXEu7LJFcDPpkMqg1jyGYGAU0nGOk2Bhr
         Y9PPQXsgo6HRzbSlirVn6fkUy6YZp/VSnMeY73sym+Y6xvd3KE4sW4L/XZdjXtAvK9Eh
         izH0regRu1bST2KimN6txjZVFZz6P6Y7DKI6WHD0gyvA436Oi+SSwNQYBsz5zB1SnG5l
         Ui6xh7rzva6BEelNc4gLpaSSoOoTeJeQv6bIdScG1ii3Mg+IJYRaElcmZh3rga/mMGib
         cpUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=GNxsVw0XEL6NmqPpGNNiLEnNxnlf0y5g0gHU3eJ/xAo=;
        b=deTtHhbeG7ryOj8CqHrkgTWkoY819uApuRv5STS7AUtD/CU9gElAx0qRz20ZmHtKWJ
         L/1qCTniA9ExUVNqG6kQdFIrwLE6vK/YLwo9YphD0Tz+nSudGkmiyKpwGDEFGrYyZkzP
         AAROFjkXnnoh4e1c36n27AgKxmyIgiKTe0oSNa1Tp4DlNhsYDSE5m4oY4RN32Y1+cIzY
         8Nnq7GWAHJ2LlQwTboTY5zOr7oRQq+jTA6j8zpzhEZquvQM7xiZOvHp8Hk9whZMuZALB
         mMpu0zLDpKxmSLngg9VjD2h7zABCUtmJ9OJVMWkrMa1IVxqMFj1PpVQ0yv0r4T63h4ud
         uwLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=CdZcNIYV;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id h132si63618ith.1.2019.06.12.09.24.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 09:24:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CGOgIU002706;
	Wed, 12 Jun 2019 11:24:42 -0500
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CGOg63065156
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 12 Jun 2019 11:24:42 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 12
 Jun 2019 11:24:42 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 12 Jun 2019 11:24:42 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CGOdtq113012;
	Wed, 12 Jun 2019 11:24:40 -0500
Subject: Re: [EXTERNAL] Re: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for
 enabling UART
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>,
        <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-5-nikhil.nd@ti.com>
 <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
 <8cb3e54a-a0f6-38c3-626d-0dbece8b2025@ti.com>
 <6b51d8be-2267-32df-3ee0-1bfb07c81851@oth-regensburg.de>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <e6cd860e-f4c8-47d3-ea32-08d6520bcaf0@ti.com>
Date: Wed, 12 Jun 2019 21:54:39 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6b51d8be-2267-32df-3ee0-1bfb07c81851@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=CdZcNIYV;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <a0132237@ti.com>
Reply-To: Nikhil Devshatwar <a0132237@ti.com>
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

On 12/06/19 9:30 PM, Ralf Ramsauer wrote:
>=20
>=20
> On 6/12/19 5:48 PM, Nikhil Devshatwar wrote:
>> On 24/05/19 4:15 AM, Ralf Ramsauer wrote:
>>> Hi Lokesh,
>>>
>>> On 5/23/19 11:16 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>> UART is disabled by default on TI platforms and must be enabled
>>>> on some platforms via the MDR register.
>>>> Do this as part of uart_init for 8250 driver
>>>>
>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>> ---
>>>>  =C2=A0 inmates/lib/uart-8250.c | 4 ++++
>>>>  =C2=A0 1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
>>>> index fb7940d2..42b0979c 100644
>>>> --- a/inmates/lib/uart-8250.c
>>>> +++ b/inmates/lib/uart-8250.c
>>>> @@ -49,6 +49,7 @@
>>>>  =C2=A0 #define=C2=A0 UART_LCR_DLAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x80
>>>>  =C2=A0 #define UART_LSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x5
>>>>  =C2=A0 #define=C2=A0 UART_LSR_THRE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 0x20
>>>> +#define=C2=A0 UART_MDR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x8
>>>>  =C2=A0 =C2=A0 static void reg_out_mmio32(struct uart_chip *chip, unsi=
gned int
>>>> reg, u32 value)
>>>>  =C2=A0 {
>>>> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(=
chip, UART_DLL, chip->divider);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(=
chip, UART_DLM, 0);
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(=
chip, UART_LCR, UART_LCR_8N1);
>>>> +#ifdef CONFIG_TI_16550_MDR_QUIRK
>=20
> if (comm_region->console.flags & JAILHOUSE_CON_MDS_QUIRK)
>=20
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(chip, UART_M=
DR1, 0);
>>>> +#endif
>>>
>>> I think it's better to encode this in struct uart's flags. We still hav=
e
>>> some bits free there.
>=20
> s/struct uart/struct jailhouse_console/

Oh okay.
Using console flag for setting up uart didn't sound right to me.
Here the inmate has a dedicated uart instance, not shared with the root cel=
l.

If that's the preferred option, I'll do that.
Of course both uarts have the same behavior.

Nikhil D

>=20
>>
>> I looked up in the source.
>> The flags are only for the console.
>> Here we need this to be written from the inmate, which doesn't know
>> about the console flags.
>=20
> We do pass the flags to the inmate via the communication region. See
> hypervisor/control.c:657. Just pick a reserved bit.
>=20
>    Ralf
>=20
>> Which struct uart are you referring to?
>>
>> Nikhil D
>>
>>>
>>> It's better to not reintroduce compile time switches, it took a while t=
o
>>> get rid of (most of) them.
>>>
>>>  =C2=A0=C2=A0 Ralf
>>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>  =C2=A0 }
>>>>  =20
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e6cd860e-f4c8-47d3-ea32-08d6520bcaf0%40ti.com.
For more options, visit https://groups.google.com/d/optout.
