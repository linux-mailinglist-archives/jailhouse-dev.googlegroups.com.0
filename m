Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWWVW35QKGQEMFY772I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C182782C5
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:31:22 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id j7sf789467wro.14
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:31:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601022682; cv=pass;
        d=google.com; s=arc-20160816;
        b=IiciI2AiEpoyYcBNwEUzP9TQNohp3+z8gOrZ88dMOv1vSyObELAMCqqQ2qmjY2aAz7
         DU12qluy5Z6XJZpAigUl2brZ+tnv02EV/NrONnwyjhgK3zRnWWftz/kHFCWsXjyvcGjw
         WbZ5y4Y0dy1HPNT/FDkpuFKm1I5PCBEvSnd8jVzc0/YAWVjVqfFqUJ2gfhgYwpC7FGvo
         j3Yc1ZxBCv9HI9h7BJiAVDd+juhG94BpjrsFGYMjTTCzB7Gf8aOU5iSP6N4DA+Ee8qeT
         bE5qAkwAFSMK/4ZjZHKFx2KhRMGmulWR/cUMJjfbUIcA2F9OhJa89xEGBPEHmmAUa7fs
         h2FA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:sender:dkim-signature;
        bh=zuAN+tfZNtbSUgXKHncNpr7Y7KTXnyHYSRCxDQb7Pt0=;
        b=hP8FLtf5Ig0UpIz4xdmpNXHryqMEetWJNa9guKeFtTOAotGuYuK0HK3Tz0PMygt1Pp
         969J2Wb2DehCdGN7ePqCWlw7drOvDHO+R+QT4P7hYeTtJsN1TRS2IbKscZv1h4l/FU9a
         dq/7/7qYfpSI4sviZxw/zO4oemz2AboaQhKzO3+Y/QAf3DrCKQbnQnZU9rU+gY2t8b7p
         m5fDTTJlNmTcRlqbS19aTI9Y4uvxe8Ncv0A1L98RdvtTpiS8oKIkm8T0XvECYHFXbn+N
         9hRZGIF93883eQZQC1wrAFM6U3Sn0TSZ7KDpgrJj0y4QDc1aZYZYV/Vt2tZD2nhOC6ZR
         YWVQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zuAN+tfZNtbSUgXKHncNpr7Y7KTXnyHYSRCxDQb7Pt0=;
        b=eMuTknafLYveY5PIBKNXvCc8FL4Ru+Ts/4L7QvhtSCy8D/k27Lg1qNuj52KdVCKIHI
         PS9WR4X7zjgLqpkXGIpAq/+0crQCBjMGNw2D168dnv3uXvJLfV5apBiTtf9h275jl5Za
         qd9nvpg3cuSsPlq5lPFQTCrG9pES7o53abp4GPqbN/Al3vqPgWgYJ/dvZK0o/s1zQa7X
         6F2HByROpOXY6F8YaJc9MyigyC3FdeLF65nIdZo2us9ariqz+rov/n3dcxLK73KtIZa4
         8g0C69/U2ncpYfuTVvEioYb0LS0WC0BWuBl8T7tCBcv+XIrSkQ0VWuQ3Ijef2PKHV+S7
         SZ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zuAN+tfZNtbSUgXKHncNpr7Y7KTXnyHYSRCxDQb7Pt0=;
        b=FWQ6daX4mj85ZKxOC/lhqUTPQuY8o1duBaixJMmYJQeKVPpr3qDY+TTNOXBrZYYwOi
         IQ3pm+QeWFBLHY1AwLnloU4vnGkxnVPU3ZXuX9rbp/RwonI8zMgwRdWrPbLdaIRc6YT5
         zTU4z5bTTmZu0an6uq4OzAZF9nGdjf/MlmaqCO21XuywvZ5MGw1eZDga3nOe3ScZhhNm
         WjsFUwHu0GCG1oeNs2aBexh3K9N3wB4fXOVooo3JZJNRU6wkA73u26dyMHimNK97N7Ei
         J3FnP/vqc1VfI6W1n822XXsRm3rXrIE4KiFZrRxFBi+jIn2NTE3OaJ1wniC2MX9wBT3G
         LrPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qKpgFGNXqSFUwGhOAEECkWSLS4lPqA53Aqm53gbBZxnKV7w86
	02m3nM0etQC/JBBDY52WLhA=
X-Google-Smtp-Source: ABdhPJwzju4OeywlPstUGm9/esmbcCixdKOHkGrl4VTde6ZAi3hfPlpQMqbQtj8TvEJUdwKld2NIgg==
X-Received: by 2002:a5d:6283:: with SMTP id k3mr3300898wru.191.1601022682585;
        Fri, 25 Sep 2020 01:31:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls2425558wrx.3.gmail; Fri, 25
 Sep 2020 01:31:21 -0700 (PDT)
X-Received: by 2002:a5d:5486:: with SMTP id h6mr3257164wrv.415.1601022681348;
        Fri, 25 Sep 2020 01:31:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601022681; cv=none;
        d=google.com; s=arc-20160816;
        b=AagiJ8lL/NihLSyHLFA4V2qWajk+UHU2dKEf5A/i3fo2aBifeYtR4/SVhQHxq50GmW
         SLqtcsPsIucwG/ZiBXsi7+WSEhhT2lr/YWXqBDFRgN0yXH/64pW0wc6nfDRasDQZn9ag
         4cWb/Xq+e7fv774625vtgXQP5LZx6E7D9LhaqMaRZlusbI11+7R0vDMu9sAG8NcEm8qI
         pemSEGclloteF773z9H4LZmzxJqOnKN3S44GL5cN1Hn9v1RAiQm8gj+uFZipliQgKcwj
         i8XQ0Vi4i1THOP8bSqfZTXg6GhdPAEU2lz7yYRZCAOCm30Iay4aA1aEBdx8ah4UunxfS
         6mUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=Ko8xRohiA+cz2mfXGK/7CM3WsMhGPy8/8Y0bSpYBN4Y=;
        b=OG7tPB2xwmWQ+4E7FTmEFwKaMXjOqx5gj3wFZd4XvdxHBADtwlVitBZvRAp7OEjC8C
         yjwrcfChkx8Jvm3GXfCvNqhgu16ePjzoFaGyxhVyy7I/gENJKglBpW2uEwZX1tV6PZ3r
         znxcey+gjEf4oGxKMpT1apoIM+68PKsyJ6lYiRvXWximSPL6vzwpBgjHcP5u+hPUm0YR
         ZJybzeRMTgJFTxzvQ6KxJxMJxV4ZPCZzGVya+o3PbqveoqlPlxMscW5lO4J9PDRzRW9s
         ww9odvRAUNE5fhDkjrnp5HW3kmX6Hq/2AbPY/oSF7W5CeXP/nHddpii0D4bEDS9XMK86
         ntFQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id z11si71889wrp.4.2020.09.25.01.31.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:31:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8VLZB014030
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:31:21 +0200
Received: from [139.22.133.254] ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8VJHZ008730;
	Fri, 25 Sep 2020 10:31:20 +0200
Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Peng Fan <peng.fan@nxp.com>, Alice Guo <alice.guo@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <20200922064542.26274-1-alice.guo@nxp.com>
 <20200922064542.26274-5-alice.guo@nxp.com>
 <2f0d667f-68ea-eacf-7b8b-61652bc0d2ce@siemens.com>
 <DB6PR0402MB2760ADEA2D5A37133E5A1D9388360@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
Message-ID: <88609d72-f571-ad84-78ed-28fcec0198e0@siemens.com>
Date: Fri, 25 Sep 2020 10:31:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <27f73d85-f64c-fa29-0524-1fa360c6385a@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 25.09.20 09:55, Jan Kiszka wrote:
> On 25.09.20 09:30, Peng Fan wrote:
>>> Subject: Re: [PATCH V5 5/5] configs: imx8qm: add configuration files
>>>
>>> On 22.09.20 08:45, Alice Guo wrote:
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .platform_info =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * .pci_mmconfig_base is fixed; if you change it,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * update the value in mach.h
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 * (PCI_CFG_BASE) and regenerate the inmate library
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 */
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_mmconfig_base =3D 0xfd700000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_mmconfig_end_bus =3D 0x0,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_is_virtual =3D 1,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .p=
ci_domain =3D 0,
>>>> +
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .i=
ommu_units =3D {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .type =3D JAILHOUSE_IOMMU_ARM=
_MMU500,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .base =3D 0x51400000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .size =3D 0x40000,
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .arm_mmu500.sid_mask =3D 0x7f=
80,
>>>
>>> How is the sid_mask of a platform retrieved? Can this be derived from
>>> information in a normal device tree?
>>
>> This could be get from device tree, to i.MX8QM,
>> iommus =3D <&smmu 0x12 0x7f80>;
>> 0x12 is sid, 0x7f80 is sid mask.
>>
>> Sid mask is use to get the extract the exact sid from SOC internal BUS,
>> You could think as below:
>> Bus signal & 0x7f80 =3D 0x12
>>
>=20
> Understood - but there seems to be nothing like this on zynqmp, so I=20
> tried both 0 and ~0, so far without any sids assigned to the cell. I=20
> would have expected that something breaks then, MMC e.g. There is no=20
> error reporting in the SMMU code so, thus I will simply see stuck DMA=20
> requests?
>=20
> I guess I need to study that SoC to understand what can be expected=20
> there, i.e. which devices are under SMMU regime. Unfortunately, I do not=
=20
> have the MX8QM running here yet to check your setup.
>=20

I do understand now how the 14-bit IDs on the zynqmp look like and that=20
they cover all units, including the SD interfaces that I'm currently=20
using for mmc and wifi. But leaving those stream IDs out generates no=20
apparent error.

The SMMU seems to initialize fine (I've already cleaned up the output):

[...]
Initializing unit: ARM SMMU
ARM MMU500 at 0xfd800000 with:
  stream matching with 48 SMR groups
  16 context banks (0 stage 2 only)
  supported page sizes: 0x61311000
  stage-2: 40-bit IPA -> 48-bit PA
Initializing unit: PVU IOMMU
Initializing unit: PCI
Adding virtual PCI device 00:00.0 to cell "Ultra96"
Adding virtual PCI device 00:01.0 to cell "Ultra96"
Page pool usage after late setup: mem 63/991, remap 37/131072
Activating hypervisor

But that's it. DMA is still happily flowing. What could that mean? What=20
do you get on the imx8qm when dropping the sids from the root cell?

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
jailhouse-dev/88609d72-f571-ad84-78ed-28fcec0198e0%40siemens.com.
