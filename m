Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBXF6SDTQKGQE6WAGS4Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C191254A6
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 17:55:09 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id b29sf3254529lfo.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 May 2019 08:55:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1558454109; cv=pass;
        d=google.com; s=arc-20160816;
        b=gaMWkAzIQNaD+erqqK51K0AdcdQKguRRUcDbBV3cg/ASmWXCo33urZxxdv43TCGGI4
         ASCwhoftQhhldWCqBh7zb4tFQy8cf4v0YwKNYDcaVTojxqne/RNrxBpEYA/gzEvAkmNo
         cfQUHyHwqAB3IVgpFEXQS5KUuh+TYljJTAV1LV67lfPgamOSHc1Ru7c8zVaEX0himB0h
         6AYcGdlmxIYespEFuFTC8Kvnx2B58YvlBQ73C5+ZXhrJsD4hIUxxsjAUZXhtId1CnCwI
         OL7IUpV3S/bE2fYxNFiAoWghN7WwQi0JWzKlNo89bgFF0r7Wr8SFz3NLu/M5DBOmb+Zv
         7Fbg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=JFJG/u6Vctja10ioRZdnbUpiFM7ifZIluHW0BexzZx4=;
        b=Y0EGBJj2pclQLhimlMsPUP6YyPIBfn738E0ugTRpL+H9274cdeKwDMoJYk+BbhD94S
         z5LouWpmUShhfX9vLV8ifTpXm2bD3dNscfexnE+2z/fP647kXwdJM1fwC2TxL4+4ll9m
         QtguHdkLh+WQf9EGeczIWWvFWkRQjrSAtyl3LA8kacSA1tFWL3aLd374Gb/6+qz89THB
         GCevUxQ5IK6pYLJjhn0kUDYGsR/s1f5paqXp1Fn0WrzrOM+6U2Ic/5e0d47a8fS+tObp
         5oToGnqBJtTxx1sFyfDSuMZizSfIaBW7Tp2fL/ZwlLeXdSlmg60VCg85a3a3cX31l2j6
         a0aQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Pf1Q4qXi;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:openpgp:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JFJG/u6Vctja10ioRZdnbUpiFM7ifZIluHW0BexzZx4=;
        b=sAsWKM9gewiQrwo0Uu46Bi+wgLRo5236GH6TABI/FvFjLHvhOnU4p4ioQq+0ZYGxxp
         7iFVaoufDbFiuiKry4But3iq4Ws827f1Shcwwlj4we2O8c07AGP9qN1hYeWYMGZDBTOk
         GKVaQOVrahiWDtoHrIzdcylsSufPILAjix8fnpOMH1d/eUpTATOBJ/pZDWZqLEvdKwni
         Xz1l2vXkpB8vuF3048fYSqg1t60pF3sSeIWS+7pQZvPmvCo3HSFsR92/rbWu8Vlm+4Zs
         gGsKcs0k8No16YFUzwnClEKQ+yFEa5DdX1+L0RXu+yKE8YI331HFKVoIzn7dxUE9Vqql
         9T+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:openpgp
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JFJG/u6Vctja10ioRZdnbUpiFM7ifZIluHW0BexzZx4=;
        b=kK/4VOtf65tqPlSWHdJ3Yew3unN9ttg2tp+5+Vx54e9KomaB65dBiRthMYBGjfVkkp
         jK59MFyqcvGz+ue2qbOQxUokC6cBMQ8vK1holRiWyGffyQh5SxxiiXFZaWxmJsgowoOj
         04kQTWUuCrRseRQ1EkX/V+DNwD79ENEBbv7a2XsBKjee6BUUv6+Ss4lSn5HWNW8bR0oo
         hvPXqqR7ge0W5aiiFK4F1HGdo0W/ra06lDdm5lM2lvFXSfn2bxlVG/hC0XOD/RTlEhtI
         bbqSO/CKQ7FCXIRG/2PnneR+j9qm4GoHJcWb0L4SAwPLWycuRV6IxLBlrtFE6cdDNM8e
         DsAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8DBH2EvgfITpW8N7+krCWFT3oi8RZ5uEaCbZmZ5oYWfxCqTzW
	6B19x/MiSkGoXUxgdI6Lgzo=
X-Google-Smtp-Source: APXvYqywfnsuyKWqSk5yXOHEL4DC/gGYzOOAGsNrioLURKUIn59LfY8pVYcYR8ioNTDT5mvhbTgFqg==
X-Received: by 2002:a2e:655b:: with SMTP id z88mr37745255ljb.108.1558454109070;
        Tue, 21 May 2019 08:55:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:651a:: with SMTP id z26ls2309072ljb.1.gmail; Tue, 21 May
 2019 08:55:07 -0700 (PDT)
X-Received: by 2002:a2e:89cb:: with SMTP id c11mr9051202ljk.16.1558454107902;
        Tue, 21 May 2019 08:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558454107; cv=none;
        d=google.com; s=arc-20160816;
        b=C8Tf7Ohbh6rd0ngQwbaj54k2Ig1z4U2lOz0X5460r9VJM8SlCedwdLnITWWNJZ94kN
         sgYdVj0EKF91w6zI1rHzp5zFJPV8d3mJvJkH+6lPhkdwxwxPQg7W3zENdAB14aZoGj1d
         w19RtvLgOdGN2SD3ERySnrybPfzPSS6m/Ij+MCxMIBbkdPMG4NWZ3cvDSt8dfLJfAXCu
         qePv5v8RyDQnhHk2vJV9Tt9T3d1rq2z+H+8KHY/TBrrsgPTeX+UP56g/32aK2pqlBYT1
         dm5Ez60W7V3qC5SaUifVquUVltptp2ONqShc+B4Pq5LlL7NoQIqfzOKrXeYOc2Cnn717
         1GBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=ukw5KInkDnYWavE34rZgsf1CSHrHayLcMD2deYQW/l0=;
        b=ZWwxdiJd0DX5lBYROubJIpmTmc/qsetEACWD4X4fZnxWbNQ+V+mveHA4eN/B6zeQlE
         o5HWkBuqFxmjA0UeGxO4SLAH5UtRClVMWJto1bHQ+2J/3AlTRSYQ5hMTu0z403u0ro3Q
         inBdtqaqwegvbVSVhZNDm85yVNklYUjwsw2tfXsDSGzF8QHOAlUmB578aJCMI7/Fcmjj
         Q1i7SmvT+SDvkd3O7QEoIuQhfxSd9gzJdElxvhenIOoHEZ/xdQzv5DXiYvaFhTdhw0Pj
         qVtJJoq32juaIle06lGR2qIEZv4nJ1X9oWRfNCrNB0ahJM6nNHxA3xIGi7CDCIcp3y79
         ydkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Pf1Q4qXi;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id o20si1817283lji.2.2019.05.21.08.55.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 08:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S02.hs-regensburg.de (e16s02.hs-regensburg.de [IPv6:2001:638:a01:8013::92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S02", Issuer "E16S02" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 457gMG5f4KzyJ0;
	Tue, 21 May 2019 17:55:06 +0200 (CEST)
Received: from [192.168.178.10] (194.95.106.138) by E16S02.hs-regensburg.de
 (2001:638:a01:8013::92) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Tue, 21 May
 2019 17:55:06 +0200
Subject: Re: VT-d: IOMMU exception with unknown fault reason
To: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <4eb2d565-fa3a-4742-435b-d4fa1469c60f@oth-regensburg.de>
 <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Openpgp: preference=signencrypt
Message-ID: <db894a08-8c3a-cb64-2c84-ac595f02b6e0@oth-regensburg.de>
Date: Tue, 21 May 2019 17:55:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <fd82641f-4f35-3674-af69-68fb41624fd8@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: de-DE
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S02.hs-regensburg.de (2001:638:a01:8013::92)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=Pf1Q4qXi;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 5/21/19 5:09 PM, Jan Kiszka wrote:
> On 21.05.19 15:45, Ralf Ramsauer wrote:
>> Hi,
>>
>> we have some issues enabling Jailhouse on a Intel with a pretty new CPU
>> (Xeon Gold 5118).
>>
>> First, the CPU supports PKE and Linux will enable it (CR4, Bit 22).
>> Jailhouse won't start, as this bit is marked in X86_CR4_RESERVED. Didn't
>> have a deeper look into this on how it affects the hypervisor or
>> allowing it needs some special treatment, so adding nopku to the
>> commandline will keep the feature disabled and suffices for the moment.
>>
>=20
> Known issue, see https://github.com/siemens/jailhouse/pull/23

Aah, I remember that discussion a month ago...

So I guess it is okay to allow this feature.

What would you say, is it better to use a configuration parameter that
indicates the existence of PKE (as noted in the github discussion, we
should only respect that bit if available), or online cpuid discovery?

I guess the latter one is a bit against the philosophy, but much simpler
to implement.

>=20
>>
>> Anyway, after enabling Jailhouse, our system freezes and we have some
>> IOMMU faults on a Broadcom ethernet card (04:00.0). Find the error
>> message below.
>>
>> We have fault reason 0x22. But according to Intel documentation (latest
>> version from 2018)=E2=80=A6 There is no 0x22. :-) I already checked if d=
ecoding
>> of the fault register is correct -- nothing suspicious.
>=20
> Table 13, 22h: "The Present (P) field in the IRTE entry corresponding to
> the interrupt_index of the interrupt request is Clear."

Ah okay, the manual is a bit confusing. If you look at the description
of the fault register, it won't point you to the table of interrupt
related fault codes.

>=20
> Wrong IOMMU unit set for that device?

Let me check. We just used the config generator.

Thanks
  Ralf

>=20
> Jan
>=20
>>
>> Any ideas?
>>
>> Thanks
>> =C2=A0=C2=A0 Ralf
>>
>> Page pool usage after late setup: mem 704/975, remap 65560/131072
>> Activating hypervisor
>> VT-d fault event reported by IOMMU 3:
>> =C2=A0 Source Identifier (bus:dev.func): 04:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 19000000000 Type 0
>> VT-d fault event reported by IOMMU 3:
>> =C2=A0 Source Identifier (bus:dev.func): 04:00.0
>> =C2=A0 Fault Reason: 0x22 Fault Info: 18000000000 Type 0
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/db894a08-8c3a-cb64-2c84-ac595f02b6e0%40oth-regensburg.de.
For more options, visit https://groups.google.com/d/optout.
