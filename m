Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBFWWQTUAKGQE3T7LOEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF5B42C81
	for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 18:40:55 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id v2sf2710065lja.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 12 Jun 2019 09:40:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560357655; cv=pass;
        d=google.com; s=arc-20160816;
        b=XM5f19oum0FB9pwF4Mp8UgJ3Uy9SGH1g9B8EOQtczNdo4T+oK49VC+zWXSQPdL5uYG
         Fz9fGAFxBsbxkfxRoFIucPRpUwN8ed+Akjn75cY/54Hq5vNQO9IDHEZkDia/jkS5QNzO
         Cu15l80hE3b7YVW1sj6EWENL+RvS2AculCo4BpNLDbTln6qauHRFtFyMvSBlqJSh1+ep
         t2TaHsB6vDPwKHkv1g7J0kpF7hMWIzyQ9R8RO8F+7F13WZkX+MZxhnO8cU/yKQP/XYzI
         q6fMc8QfutEVhSfi+4eOWWgGtQvmXgTDjkAQMTzTRlKMYcSLH3zcbQvWdNM1TYCp0Po0
         vBBQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:to:subject:sender
         :dkim-signature;
        bh=+3KZpc2RVBtp1puxqPXcRBAG9ifVJee/YMK+wITYnkk=;
        b=dnP/EFtTvIs0egVjaD63pXkMiG4QUP2fBzLgJOMyFUSf1sPapd6FTSz/98T284XCQs
         Ptahbojk64oItqj6Ht8DSa27T769WeOGk5AWk05hr5oAN6fCuYAgJp+QGSFqafdS4sjc
         9c3U3cPf05olqzxVmFnbVSfQ3nfyn0zrthx7M5R7spDZmgzrh73ZpFJJ+SDXQZBi0crw
         8p9Mzqy4f5Oi76mxI95J+Na1FiHm+16XEM4oTbN2lmX3zJskIhqMDC85WY6u911wrXrP
         BhoAfTkW4hnXUTeUzt6Zv8KMb/0gO+btQ2F/M+LCIazcV0Hvipvl+Dsf6UZMyq1bC25F
         iR8w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FySBGlP2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+3KZpc2RVBtp1puxqPXcRBAG9ifVJee/YMK+wITYnkk=;
        b=j/DCK/CaLrg5pF6etNna8E6N5mFA8vZWXqO1vtGFaz1266ze9EW0xMzn1VQIC98OCQ
         3XHkUO+OGUKE2bPc6HHpI6hqJw9bqeXiHPk/fwYfYqqCxSee22KYk5DPgMXrMIWHY4As
         4S1kMQG6TFWm7lzYu4JJOW+y4/CL2OHJ0ciz12pRf2//v48FC3szSCvMou9FYOyPPrzQ
         3xa7uDuzpOGz9cPcPcSZMQ9J7685nONktPOkNqmpsWY9xO789JNq9hYPsTUoVS38QXv0
         o870jGE6kD2jE9itQkPW//JkLD0g95dwTJKsD17gseWSnQYQMEttdSmpdrjYHtzeJcU7
         eg0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+3KZpc2RVBtp1puxqPXcRBAG9ifVJee/YMK+wITYnkk=;
        b=DXoAlbtgx6jBfv+V9cFeD817LGkhREXYc3Kr50UAowdunAujjLJdy+PH7lYt8Ke0gA
         9AzPkKMFzlDTA+HYOxaE+alxQHhpqmeRsaHDtxkWxNtfCzwdJtl455DaSKRvL3rnbMye
         hiHed1yDrwwGz20WywLJLlzL6U7CECUig+T1OQGaoiP8DuMyEGc6V6hWzTOmN45w5JK9
         V2GHeZTWF0rSOoCaQi3jBb4FcQT5vQrWwXJ4hTAlV5L3C5O8+5W1B4z82ikkF/hkQ38N
         2hcB2XqGvdyzOzcdkcz61UuIERkAIVe+9oOHPIN4ZePVbqHW4+iNeGH1z1ReNXW/Lb9s
         XCHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVkULbtIg+jjP3To05CLQxhKrRyRWycmt6sm64Um3p55BIez+sc
	h5VuKR+5VPsbX74wub3gPw4=
X-Google-Smtp-Source: APXvYqznXaJsXwIXxqVRZshxk8LH0tfaW0fqteNC4toIA5ekztQeRK4YX4NNgYYHA73icGNDZL23Gw==
X-Received: by 2002:a2e:9692:: with SMTP id q18mr46055357lji.89.1560357654890;
        Wed, 12 Jun 2019 09:40:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:868a:: with SMTP id l10ls308751lji.3.gmail; Wed, 12 Jun
 2019 09:40:54 -0700 (PDT)
X-Received: by 2002:a2e:5548:: with SMTP id j69mr21204421ljb.48.1560357654143;
        Wed, 12 Jun 2019 09:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560357654; cv=none;
        d=google.com; s=arc-20160816;
        b=j3ExtdEoEMYZPeLUWN+HaDdrLEFffyFFTtzyRZ7+bGg8dFUCDjM7xSKwj2grG9FEW3
         w0fiTm4posFBnmYvU3V6SVqrU7iOwN4hZOy6MqwIXhmbTIZWmyGx2dOU6S0PUNQ38169
         nIUL035hitAnuvY3RTclCVceoGJHcUerjJM4CdXccKjDaAVmWpvaVvU2cVldWLT+sk+J
         XXhz96ldA6NvP6nlOh/Gl5Bxe+xHWGXvRvgvWBRlTvz5sl9Yk63327YFRnNovuSvwlPw
         PZEnacxBI+os7jjddMCOuO0miquLJgfbhBqyof1wJ+6NoLIix3iYp3SdCvrBBVDbBHQD
         uCjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :subject:dkim-signature;
        bh=rsXBKYWZpc7ZmIKJPQbttspOdrDYKZLs2Ke8IwFIfcM=;
        b=C3+3FHuoJFk8sUyVnFI+4BaS/rur50KxaTqV5YOcUEKFYfEuQ4joUjICcBJ0rFioh0
         co9K1R6n/BGT8SiPRM1cH/j1Nr6gttiDRKBvWZicttpgPiEVCt4DVgA3hv7HaK0ylKhl
         24R8pLrfuBT3/k8gT7eYDNaRNlbsWwV0UqyKfEZHXKfq/mQBzARKMjPNB4DAXIX4Hzh5
         iU7BI4muwIhqhFFJvCOIslQlqB0/GWNnxndMWtMDMr6uuSXAKw74xDsvVwu0gsCvmTMO
         iGZCXJF34v/xg2YwKlfjO5He3254NFfzBnSZA/A52IUVT/RxIl8nTiFmUbsc80Vj/EVP
         b8Dw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FySBGlP2;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id y25si19590lfh.3.2019.06.12.09.40.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 12 Jun 2019 09:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 45PCKx0M1Xzxvr;
	Wed, 12 Jun 2019 18:40:53 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Wed, 12 Jun
 2019 18:40:52 +0200
Subject: Re: [EXTERNAL] Re: [PATCH 4/5] inmates: uart-8250: Add MDR quirk for
 enabling UART
To: Nikhil Devshatwar <a0132237@ti.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, Nikhil Devshatwar <nikhil.nd@ti.com>,
	<jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
	<lokeshvutla@ti.com>
References: <20190523211623.9718-1-nikhil.nd@ti.com>
 <20190523211623.9718-5-nikhil.nd@ti.com>
 <ec13c47e-9ff0-8fe2-f895-27213a5b7b6a@oth-regensburg.de>
 <8cb3e54a-a0f6-38c3-626d-0dbece8b2025@ti.com>
 <6b51d8be-2267-32df-3ee0-1bfb07c81851@oth-regensburg.de>
 <e6cd860e-f4c8-47d3-ea32-08d6520bcaf0@ti.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <4a3f2a5d-1916-3a0f-763e-dfd865229397@oth-regensburg.de>
Date: Wed, 12 Jun 2019 18:40:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e6cd860e-f4c8-47d3-ea32-08d6520bcaf0@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=FySBGlP2;
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

On 6/12/19 6:24 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 12/06/19 9:30 PM, Ralf Ramsauer wrote:
>>
>>
>> On 6/12/19 5:48 PM, Nikhil Devshatwar wrote:
>>> On 24/05/19 4:15 AM, Ralf Ramsauer wrote:
>>>> Hi Lokesh,
>>>>
>>>> On 5/23/19 11:16 PM, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>>> UART is disabled by default on TI platforms and must be enabled
>>>>> on some platforms via the MDR register.
>>>>> Do this as part of uart_init for 8250 driver
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>>> ---
>>>>> =C2=A0=C2=A0 inmates/lib/uart-8250.c | 4 ++++
>>>>> =C2=A0=C2=A0 1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
>>>>> index fb7940d2..42b0979c 100644
>>>>> --- a/inmates/lib/uart-8250.c
>>>>> +++ b/inmates/lib/uart-8250.c
>>>>> @@ -49,6 +49,7 @@
>>>>> =C2=A0=C2=A0 #define=C2=A0 UART_LCR_DLAB=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x80
>>>>> =C2=A0=C2=A0 #define UART_LSR=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x5
>>>>> =C2=A0=C2=A0 #define=C2=A0 UART_LSR_THRE=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 0x20
>>>>> +#define=C2=A0 UART_MDR1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0x=
8
>>>>> =C2=A0=C2=A0 =C2=A0 static void reg_out_mmio32(struct uart_chip *chip=
, unsigned int
>>>>> reg, u32 value)
>>>>> =C2=A0=C2=A0 {
>>>>> @@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->re=
g_out(chip, UART_DLL, chip->divider);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->re=
g_out(chip, UART_DLM, 0);
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->re=
g_out(chip, UART_LCR, UART_LCR_8N1);
>>>>> +#ifdef CONFIG_TI_16550_MDR_QUIRK
>>
>> if (comm_region->console.flags & JAILHOUSE_CON_MDS_QUIRK)
>>
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 chip->reg_out(chip, UART_=
MDR1, 0);
>>>>> +#endif
>>>>
>>>> I think it's better to encode this in struct uart's flags. We still
>>>> have
>>>> some bits free there.
>>
>> s/struct uart/struct jailhouse_console/
>=20
> Oh okay.
> Using console flag for setting up uart didn't sound right to me.
> Here the inmate has a dedicated uart instance, not shared with the root
> cell.

But that's okay. The inmate also has a dedicated struct
jailhouse_console that is not shared with the root cell config. Am I
missing something?

  Ralf

>=20
> If that's the preferred option, I'll do that.
> Of course both uarts have the same behavior.
>=20
> Nikhil D
>=20
>>
>>>
>>> I looked up in the source.
>>> The flags are only for the console.
>>> Here we need this to be written from the inmate, which doesn't know
>>> about the console flags.
>>
>> We do pass the flags to the inmate via the communication region. See
>> hypervisor/control.c:657. Just pick a reserved bit.
>>
>> =C2=A0=C2=A0 Ralf
>>
>>> Which struct uart are you referring to?
>>>
>>> Nikhil D
>>>
>>>>
>>>> It's better to not reintroduce compile time switches, it took a
>>>> while to
>>>> get rid of (most of) them.
>>>>
>>>> =C2=A0=C2=A0=C2=A0 Ralf
>>>>
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>>> =C2=A0=C2=A0 }
>>>>> =C2=A0=20
>>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/4a3f2a5d-1916-3a0f-763e-dfd865229397%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
