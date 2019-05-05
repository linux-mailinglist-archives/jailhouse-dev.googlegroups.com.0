Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBU5DXPTAKGQETHABMVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 8137F13F4E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 14:06:44 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id n23sf9241280edv.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 05:06:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557058004; cv=pass;
        d=google.com; s=arc-20160816;
        b=tmdLtnO2i5qZ85wOmu2171j8nu/pkDRpYKM/2V0u7tvEmnnPkZow4pVtPe0L8naDpH
         gloFbh8ijzSSz52CAn1uRYUdDI9WXSBuo+7d4wqQPgEe2jmqs0AjzR0Fmx9yZDAlG67X
         DPFMJICscfOpSKOvCbQxM3wVJaK7z2E+jNEw8yGRMmY6pMtZIYY/J8CwGW7I5PT1wBLq
         ptX/R+jz032SRHnoFFnv5EwuB1Y4qjFIyQRvh/+zJUIvUyWU6hPEvLHCPRWgIA0Xe6fp
         m1c77L1gbIJqkjJodnwGtySEDjUiK+PboEtqXQAup5F7Bwffaf7PQvt3vn4ddXjo/JlF
         XXFA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=aNZ7MR/UI6VuZavL/nqgVpO42vO4AVQfo6ssYtZz4j4=;
        b=zixUAUg6IYqyIQverXSqpQ3fDfK/huDqBmSYy61yalJfYvrsNIGCRMqEUqZENWXefE
         G4aMHp7ycpoj0tPq4YaJhOIg7yYq58qV0dNprbitMP2wpjiJ82pxSDG3YGoxP9Oe1ps0
         7ZmVf7uuAdWvrIwpIgE18NwvMJ7kaRrZlOFTVmyJjjyTiSx6OANQ6OOPO2xlSk679edz
         OECtdbtstI9Z5ZCBHqnIPuVK0uvwgx6U6w55fcoq/QlcV6QwQ+N2QGOYx4kNLKGkyVQy
         Gxbvj+TfWvljyrHwsFbCSfI8iUWsunQEaVnUgSWx28bGwiWogCZeol1JZV5DiYs1b7U/
         +i4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CynsoqNI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aNZ7MR/UI6VuZavL/nqgVpO42vO4AVQfo6ssYtZz4j4=;
        b=UYLjAaeS0wLrfuqjDJZVgenkA/tGEMNcT5HpD15b1/o12r1RGOn8YOzD5GXPirdoa4
         QR1fsauJUYRwICO5C5i+IuwpkKP8Mz1pQb4bEyc+CB0hob3JReRAgF2pPeypYkJuZ12I
         4z2Ayjsuoe3T7OWnhtoB5mHvgp0qnlXfS49CnjOcLW0KD53drsgnKBlQrjgXBM+hFyci
         pkWzuub85CPo9wMhLmpaWThqt/C/5ZSnyYVexjRn5xFW/k2nLuwCF2o84zMaXfkUDUqv
         rWaUu/mUu3FGjn1SIASFfADGqUfoxMjf2gtJsQEKHhWtd8asOGrN/ce3MmSH8ro1uOkD
         k8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :autocrypt:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aNZ7MR/UI6VuZavL/nqgVpO42vO4AVQfo6ssYtZz4j4=;
        b=H88paCjiKO9IAXRh20pjnidmknsXDOc3g6n+5+qsJctVjvtLiz+970GmwbwaeIDJOl
         /kxiDQ4lskm6+brmSvnFm2gzrgPzy3LOLxtRU9IvWLmb7p5dEqeVUgbSgCyEs309TUMH
         NcQgTKm9frzTF9MQ7TofJZI4l54klS7IjvQp4VMc7qAYk339ccdrAh2hK/9AxazNzUZm
         0nR/DVRH45LL3UZWqsis0vETODj5oeRPg5Eq7DL33IFaSN669VMQyuwrSVPVZcOchn5L
         /FQ2+91/dBo37wSWl8ys5Zpfo04P3BR6Rk9BveOOYkuRHgKd32/AsiiVcaUUc6GnNuBN
         1++Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXh+zM4+Nfb2Ih4MSh2UPP0hOurMfqk7xw170gBeVc0T1VXScVM
	FT0uRt32roo+v0kbo700jM4=
X-Google-Smtp-Source: APXvYqy6XyMyTHEjsX9UO5UcGm4n6T1/p7hAUX4oT3hpnStI7SnsXMo/C7caoFu7RZILkuJK0W8DQQ==
X-Received: by 2002:a50:8163:: with SMTP id 90mr20395504edc.208.1557058004267;
        Sun, 05 May 2019 05:06:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7855:: with SMTP id p21ls1953873ejm.12.gmail; Sun,
 05 May 2019 05:06:43 -0700 (PDT)
X-Received: by 2002:a17:906:29d3:: with SMTP id y19mr14657135eje.122.1557058003484;
        Sun, 05 May 2019 05:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557058003; cv=none;
        d=google.com; s=arc-20160816;
        b=F1kZ2gz+0UEDNkED7G8TFfm080cXxttBYhmV4eO8FN9OGfv43wRj94t7E4wT3F2u63
         AJBhODb1fcISijUg2IgCUs4rimC6sxZ19z7+YQr+HmdtGbBrGzVfCt/kOnIWKwUfP0TF
         xpq2ETS+O6ueDLGhy2VFRVQ34TGzv5p+Q4JKGcAp4bM7t4c8MqOem1r5eA6CroDb1BWh
         PndUtIXGVGq4qIZNRbxkcfYERFS9AhuoTbunBZqBIyYzctF8kd13/3q2dDHBvKrDEDOR
         tgcKerqOX6FDznj9egMmUATl/VWZEzpDjTF1Zhxdu3+iSgOrKHvxnEX5z9Qm/oIWghvu
         awbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:cc:to
         :subject:dkim-signature;
        bh=/Ev2GxFDqeadVlD+zNTNrnbABVbN38NpOLzczx9TT2Y=;
        b=tEXSUhY8O/2nAfO2rW6s3Cq1ne186uihvKk3naOD22WXvoeDwaKLdQNGfmLT9eXMiS
         T8Lp1W32/ByTmJdfOJpgQq0BASoX90mFDYQ90kbaevWoEfeLzwqEhg54iK5deM7oAztu
         jRigKWbnAXAvlaS2YjR1Im0TsDFqr0XU8WYF3jZIcp/Df018bCHporbgtBsFrrjQM1Pe
         pCIQHbXJ9nhcSj3GhSwsj7Zt+VjAMwnaEGRCo5ulJafJioVy7mtJnTBxjnyov4W745p8
         s7lxDkWUsU89R/iERaiVgKNrpZ7+/aSKUXWyZHIW6bOzh1uymt76w4F29RFhtefKmC0i
         WRLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CynsoqNI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id z45si378304edc.3.2019.05.05.05.06.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 05:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 44xl366ffwzxsq;
	Sun,  5 May 2019 14:06:42 +0200 (CEST)
Received: from [172.16.2.24] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Sun, 5 May 2019
 14:06:42 +0200
Subject: Re: [PATCH 16/16] x86: Remove misleading brackets from mmio
 instruction dump
To: Jan Kiszka <jan.kiszka@web.de>, <jailhouse-dev@googlegroups.com>
CC: Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <cover.1524500320.git.jan.kiszka@siemens.com>
 <8288aefc87cb03b3f3bb8ab832c41fd0370a080a.1524500320.git.jan.kiszka@siemens.com>
 <924c6d0b-bed6-ee2c-95bc-c615bd053efa@oth-regensburg.de>
 <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Autocrypt: addr=ralf.ramsauer@oth-regensburg.de; keydata=
 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
 RncIIYr0LjXAAzY=
Message-ID: <e0eb4015-8ab2-115c-416c-ecfa787c440f@oth-regensburg.de>
Date: Sun, 5 May 2019 14:06:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <5214460f-f841-cc0a-2f1a-7608ffc365b3@web.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-PH
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=CynsoqNI;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

On 5/5/19 10:25 AM, Jan Kiszka wrote:
> On 03.05.19 16:29, Ralf Ramsauer wrote:
>> Hi,
>>
>> On 4/23/18 6:18 PM, Jan Kiszka wrote:
>>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>>
>>> The parser my bail out on opcode byte 0-2.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>> =C2=A0 hypervisor/arch/x86/mmio.c | 2 +-
>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hypervisor/arch/x86/mmio.c b/hypervisor/arch/x86/mmio.c
>>> index c1b9f10e8..775ec4b7b 100644
>>> --- a/hypervisor/arch/x86/mmio.c
>>> +++ b/hypervisor/arch/x86/mmio.c
>>> @@ -219,7 +219,7 @@ error_noinst:
>>>
>>> =C2=A0 error_unsupported:
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 panic_printk("FATAL: unsupported instruc=
tion "
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x [0x%02x] 0x%02x 0x%02x)\n",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 "(0x%02x 0x%02x 0x%02x 0x%02x)\n",
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 op[0].raw, op[1].raw, op[2].raw, op[3].raw);
>>
>> sorry for digging out this old patch, but I think we have a logical bug
>> here:
>>
>> There are cases, where we jump to error_unsupported before all opcodes
>> are set. In this case, the Hypervisor reports the wrong instruction,
>> which really confused us for a while (Andrej found this).
>>
>=20
> Yes, this is a known limitation, and the patch here just tried to reduce
> the
> level of confusion a bit. Before that patch, the output suggested that
> we are
> always at opcode byte 2. But we can fail at any byte.
>=20
> This is an expert debug tool. You are expected to parse the opcode bytes
> yourself from left to right. And as soon as you hit an opcode that is no
> longer
> supported by us, you know that the succeeding zeros are invalid. If you
> want to
> full instruction, use RIP and disassemble the guest. Adding that logic
> to the
> hypervisor is not planned.

Okay -- maybe we could strike out (0xXX) unknown bytes and simply count
successfully parsed ops. This would at least give a hint that sth. went
wrong.

>=20
>> We have such a case, if decoding of op[0] fails. Jailhouse will then
>> report sth. like:
>>
>> FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
>>
>> Which is wrong, the code behind is:
>> ffffffff819705d6:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83 78 08 03=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cmpl=C2=
=A0=C2=A0 $0x3,0x8(%rax)
>>
>> Which brought us to the next issue: CMPL might be intercepted, when
>> accessing, e.g., PCI MMConfig space. In Linux' pcibios_add_device, we
>> have the upper code fragment that accesses MMConfig with CMPL.
>>
>=20
> Hmpf. Would be complicated to emulate as we would then also have to
> handle the
> actual comparison with its impact on flags.
>=20
> But looking at the function is 5.1-rc7, I don't see MMConfig accesses
> yet. Are
> you sure about the access address? I would rather guess we are touching
> reserved
> and, thus, not permitted BIOS or bootloader RAM here (struct setup_data).

Let me doublecheck the address...

Thanks
  Ralf

>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
