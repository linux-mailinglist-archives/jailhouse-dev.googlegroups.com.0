Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXGST3UAKGQE2POXATI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C954861B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 16:53:17 +0200 (CEST)
Received: by mail-ed1-x538.google.com with SMTP id n49sf16731902edd.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 07:53:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560783197; cv=pass;
        d=google.com; s=arc-20160816;
        b=nHm+MCYyVUCbBjdY7qWzmm8SIm6AwG5t8j/EA/6ooivQAia4kwtGawgyeBisKGVoCJ
         Z+vGh8x7gwWxjt4KXJHBHYuU8WmJZanPUKe/SvHgp7xSUWpfQjg6Hdz39dy7hqlQI7Lh
         itJmECYmlOhNXmWxyE8T2qId/KDa+SohoFHzHsq3kb8w5XC3fb+C/sU/wIDjHf8E/DV7
         zZitpNlZGUT4Z+ddMbkXJF967S2WeqfREzGCVYlOpLid4KI704DU9grq/0sx4tWttZ2a
         HDcRv189yvh6Iodif5vx5096LVA4be6eE3IaQ3br4mgwiE8sV5Lmw9DlvtrOPXl0XCTa
         ArNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:sender:dkim-signature;
        bh=xOaNABDI/DI7m2qp1zty83mknq0/wB6SMPTAEYzAc3g=;
        b=yz+fQPV21l1UnJxSK0MUgFm5Xk7muQ4OU3N1Nug7DutvIJ271afV7TWL0knusrAGdD
         664MsxB6zen2x7yPqZjIK91hp1CSMjm+kbSdOuFAVFWf/7UUC+RMlKJzZJBqeHEIxlSQ
         UPE0hlybWpUhHPjyUr4RvxIxAwtTIaf/OYfjhI9X/fW4kYtcesXi3Z7Md11l8Sczy+La
         CTa64b5w1MDiOcw6O5h0wcdeAlDulHiMVEKR4418r8PBIDRJr50v0j7J6VgyZIxSfyik
         UceIxwpz/GJesuHBR0+h2iyShqKVjfhzqq7n9UTO4sNCi6hqNLZVoCCMHE0RoixQYdiA
         Rbjg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HtedsCXw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xOaNABDI/DI7m2qp1zty83mknq0/wB6SMPTAEYzAc3g=;
        b=BOVSl1a3xIZob+Zc+Y7FEJTDi1cHN7rZ1FW2Zbe4dWFENfuH+UeBKcWycZPOcnd0mm
         uAAI7BgpvUEnb+fn1bWCkTfmBW4QXoITL6i6cunlyQFtQ3rb4RRIuxtIgJGvAVVBiZbn
         QcJWIr0JY/fzLofvEOCtVgrXE1cc/h83rvsO8yR+TNgSrJF/5locyKfGGQFLj/kFo+Jy
         J/yU+IhSMFmKoPzJ5WmbxTBz68d9cajF9JbdO4K54i7uqAS9zoQw3jdX2hq54SKSc7xd
         MW3RsZ8hscd1cRk+p49DzIMJecXqqmvGv/yAK/MGXivbuqrXdtJhft3OJyT4TAl8BEST
         IqgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=xOaNABDI/DI7m2qp1zty83mknq0/wB6SMPTAEYzAc3g=;
        b=tsXNUdQDoqyBLn/MyNUfPvaCThmiYZ1uzo/jXRbguBuXlGf4vVpiRAfm1XnZt4LGMX
         BZKBPNneKN15G/+xh0/D0Wnc+8OUuNl0w1ejvmR93fPi5bnsW46Z+sCWAvhdru88DnLx
         mX8bdeR7VWe4jgb9yaFF/ANIJUuyD/grCPBK4LBtqMLiefNqrWkQ9J7ghBxrYiE5XHBi
         lZk/Gw+xNk1l1ycDmcqe6dG+Wl5MaR5tiALwhS99mjvA4HH0z8bFAeqtLY6Qce4GnIA6
         O9dbweBj+Bc3syLOCib3ceK4dUFQfudPur7fJAUulh9X5CoeKDJVd8/rUYlS7qnFySaM
         UWmQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWd3SfSAqNW5eeCRHtyfyX2Dohziv3oLNUNYiz6VLmj1tdkIS9h
	yMN/0/MQ/ZWb47JD54FABsQ=
X-Google-Smtp-Source: APXvYqwuMbvwh2EHrwOt9t1eJxdKZQ2vwmz4PzfQDo1/WM2e4I97gGmihTgAWZAbpXWrs0RdGkO1DA==
X-Received: by 2002:a17:906:4e8f:: with SMTP id v15mr63934658eju.47.1560783197187;
        Mon, 17 Jun 2019 07:53:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:8efb:: with SMTP id x56ls4924674edx.9.gmail; Mon, 17 Jun
 2019 07:53:16 -0700 (PDT)
X-Received: by 2002:a50:9730:: with SMTP id c45mr29776167edb.196.1560783196656;
        Mon, 17 Jun 2019 07:53:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560783196; cv=none;
        d=google.com; s=arc-20160816;
        b=Pl+hE39wpqT6ZhqSbBGuizlznq7z6nx4bVvaZWsnW1I8WZvEjQ1qM9U2Ya3n8tHNXd
         V1GrNNaMMlLvXMyqa7IdqmQc2WFGeqZtIzB/Ib/FTpICtEUyjlGEaXKLGiL0RBrr0RhS
         c+zdCfsV9KBDHAyqs9PRd+o8AxmbWv42G65N2WiznzeOtK5FnqxrDNssK70nt1DM35be
         SCrZGf9V9Fx7FiMrqQNWX5PAS4lrMHHlDhhQWoQGA40HxnJbu0fawbVKDfBPc3SLH78T
         dQic6gK7xp+tzOytLMM/l/akMPEXNNCDUnw2AobZIy0wE5KDc/t7M3UEoKf62bybixwj
         zpeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to:subject
         :dkim-signature;
        bh=B8qGHCouE/x7yKsw1YNvBwaiwRDKbRhPYkiJrb5g3PM=;
        b=iEyarSPXMe4+wFJ/mlJtJW7ZBVvUDI8K3CTLFR6sZuBKJ/AT5ZUHgizBl1XY91UeHO
         n7J1LwLSIe6ooSw2GyandS0I1r8UcUK68DODnB8umUYC0ru4h6Ah20SQGm+l/ZpZuRUT
         Q06LuXAZe5eOvM6NrilA1LH/CuFAhlRkl/0Xwbwws8LHsKseyxfFzElUtxqbLjj8g73I
         NjuA5apPADkC6qI5Q+33EA1LUViMB3Ve1+QLg3QzxCPma7lyoju3kbuIYm03QbZMgK0W
         GDrMGEU7u6MKcQ4wL+XGzds0WCGy59fz+k+/ts2Nq+mGgtrFlK/nEQxN2yIF3URJAvsV
         WKCw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HtedsCXw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id z20si676420edc.1.2019.06.17.07.53.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 07:53:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 45SDjS0xjVzyFF;
	Mon, 17 Jun 2019 16:53:16 +0200 (CEST)
Received: from [IPv6:2001:638:a01:8061:aefd:ceff:fef3:ba65]
 (2001:638:a01:8013::138) by E16S02.hs-regensburg.de (2001:638:a01:8013::92)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 17 Jun
 2019 16:53:15 +0200
Subject: Re: [PATCH 1/2] x86: vtd: Print BDF instead of hexadecimal device
 address
To: Jan Kiszka <jan.kiszka@siemens.com>, Mario Mintel
	<mario.mintel@st.oth-regensburg.de>, <jailhouse-dev@googlegroups.com>
References: <20190617131321.8585-1-mario.mintel@st.oth-regensburg.de>
 <38a7ba28-df47-2ac1-1dce-a381d6dc4571@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <53528d36-2c0d-abcc-95ad-f59fe4e4238a@oth-regensburg.de>
Date: Mon, 17 Jun 2019 16:53:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <38a7ba28-df47-2ac1-1dce-a381d6dc4571@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S03.hs-regensburg.de (2001:638:a01:8013::93) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=HtedsCXw;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 6/17/19 4:49 PM, Jan Kiszka wrote:
> On 17.06.19 15:13, Mario Mintel wrote:
>> As it improves readability of hypervisor messages for debugging purposes=
.
>>
>> Signed-off-by: Mario Mintel <mario.mintel@st.oth-regensburg.de>
>> ---
>> =C2=A0 hypervisor/arch/x86/vtd.c | 9 +++++----
>> =C2=A0 1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>> index 1cae0dcb..8e076b4b 100644
>> --- a/hypervisor/arch/x86/vtd.c
>> +++ b/hypervisor/arch/x86/vtd.c
>> @@ -621,8 +621,9 @@ static int vtd_reserve_int_remap_region(u16
>> device_id, unsigned int length)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (start < 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 start =3D n;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (n + 1 =3D=3D =
start + length) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prin=
tk("Reserving %u interrupt(s) for device %04x "
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "at index %d\n", length, device_id,=
 start);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prin=
tk("Reserving %u interrupt(s) for device "
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "%02x:%02x.%x at index %d\n", lengt=
h,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PCI_BDF_PARAMS(device_id), start);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 for (n =3D start; n < start + length; n++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int_remap_table[n].field.assigned =3D 1;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int_remap_table[n].field.sid =3D device_id;
>> @@ -639,8 +640,8 @@ static void vtd_free_int_remap_region(u16
>> device_id, unsigned int length)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int pos =3D vtd_find_int_remap_region(dev=
ice_id);
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (pos >=3D 0) {
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Freeing %u interrupt=
(s) for device %04x at index %d\n",
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 length, device_id, pos);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk("Freeing %u interrupt=
(s) for device %02x:%02x.%x at "
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 "index %d\n", length, PCI_BDF_PARAMS(device_id), pos);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while (length-- >=
 0)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 vtd_update_irte(pos++, free_irte);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>
>=20
> Not all devices listed here are PCI devices (actually only the IOAPIC,
> we do not support the HPET yet). I guess the original idea was to avoid
> confusion when a device shows up that is not visible as PCI. But
> avoiding to parse the value for all the other devices remains a value of
> its own.

Ah. This explains why we see, e.g., the 'non-existing' device f0:1f.0
for the root APIC. All other apics are 'real' PCI devices that can also
be seen in lspci.

  Ralf

>=20
> Applied to next, thanks.
>=20
> Jan
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/53528d36-2c0d-abcc-95ad-f59fe4e4238a%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
