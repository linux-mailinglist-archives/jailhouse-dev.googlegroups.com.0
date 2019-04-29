Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKHUTLTAKGQEZFCYTXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C51FDE3F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:47:37 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id a21sf2028046ljh.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:47:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556527656; cv=pass;
        d=google.com; s=arc-20160816;
        b=wasUkw2fTER/sVTnQof1Wf0xMKgpZTKjp0CD922ArvbL4Um67rQbYzmXMBK4AWjF4i
         VJ3SBFHKX5bnCz9DXpcuYuhCtrmVFd1KITl0z0NS02BmCMB4mAtP9BG5580v5x5w4zGr
         ZfHuWNpiuB41mivsm90JSKAdgsr/OINdEqj8pnPXCiqHuCU1XVrOI9vZwAu9nodADIWP
         ar6RwK2tn48hI/boeXUZJ55cXipkHaK86IiH1Mh+a6TShVaZksWgD8cmbjghNhKXfQjk
         /b5t2rOnQgnO0AjQZSNGPuKZxIiXegZEZ45Rb+O7vUw4cA6ILES/rPY5GeGH4itQZ4Ws
         sgyQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=SEIgGCC1yIeM1Dr1OutxKPRkKio+cZQmy4xsDL3W9rg=;
        b=MhEpnZhywIyp+uFXXKn5mf0iypfdlNJcH2OIKtPhAMQMTTV6G8f8RdNfUa5nsmCAxF
         pVidiwcU+niH4R1jBcOQCqqvbzPGi8vlI5mY+sLDBb6zIsB7kwrZNND5cCnZVS5wLzey
         smlvNDSV4HUntCHyrdpV677wCNIUzWmOFMJkAZyPg94gkxxFlZekRZYdDG0Gmdtqm9Zj
         yT8bKoRnBqfzQtuBpvGb8+KqG4BszyM5Cpvh4D3ybr1HPR2xHzVbHm1Hlb7+L2ZxiXJQ
         uXwPm2p0KSUXDip+zj70HcpQmYBW6ATvnWRhK60xzwi2QEGdfg888jEjz5AgaEupP4T+
         82Ng==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SEIgGCC1yIeM1Dr1OutxKPRkKio+cZQmy4xsDL3W9rg=;
        b=okj4aKlvCm6iHG2HqQC9MVVmyQ4rfoKVVFa0VKXe2HxHPYuoRD4ou34snJybJ+t6AR
         AUSVYi3ZAvztdG/8gAphKqJUrY5Jy3Zwu2WC+rcXvs6StFRMMAiIBXEY6RGvkyGD8w89
         DRNALvIchu+cgICH240oa8U7fVZgeHOj/GwBTXyKjDHfP8KoPkzw/29uF9ZD1UtTvNVe
         PcYf78V/RADSaCkhbrdD/+0BOHhynK/O8U7XMhttWkxsYAjQuV7IMSioJShNbhrZKOjP
         mU385RzRUnscxing/HNKBm8MdCPtndILpGtXPR1T55uDjSe5PYpjIDLMuyN06JDIczwL
         4hvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SEIgGCC1yIeM1Dr1OutxKPRkKio+cZQmy4xsDL3W9rg=;
        b=Bx9CpJ6IfcGK+/MTMmLmZ4GXmegcX3fZ5r5pzU0mJJ27+dZ1F2Tn8lSZ6H5eWBZllp
         MvYxrv+50sW2xwvyVsB3syP/g6s/keZatqIwLaGgjy2bCFQYo7w211GL25kd6MiH8c/c
         xnqsDQUxgc4G0uiaEqgqlLfh4UFZiPEnoFTcfOdxDzgADFKT3pKBdB4izFN15k1JVylS
         CdR/YaF/PimDZIhDn2EfJBWud0r3/Y17/0OzDHjG2ktH2gHyAMfkqUOGdDayni7yPhrr
         StkzbyGgICvndjQY5ie7t+MFYz4V18f5Vh3X28qzGs6KEHZkofbDgzlz+5Syt8hZPdgC
         L3eQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUMc65Gggu/PJlmHUjmeZWuqHSpPQURhXrqdrZaVkVzIiGuEgvf
	Uc6Pj5wzBR3iEjsxYBklKas=
X-Google-Smtp-Source: APXvYqz2vjf/BOmIosyepfVoHzSBjDxMCXJcdX4cmr0vnGwI9WpE5w+mkNDoSd2iLFibsQZQZ6j7AA==
X-Received: by 2002:ac2:454d:: with SMTP id j13mr33092779lfm.139.1556527656702;
        Mon, 29 Apr 2019 01:47:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:48a7:: with SMTP id u7ls77220lfg.5.gmail; Mon, 29 Apr
 2019 01:47:36 -0700 (PDT)
X-Received: by 2002:a19:f001:: with SMTP id p1mr33697469lfc.27.1556527656054;
        Mon, 29 Apr 2019 01:47:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556527656; cv=none;
        d=google.com; s=arc-20160816;
        b=SoxLI1hkEC8P42ZyffLgL5wfVbkkO0Xo8J/zbXHwH3PeoRquZaHIflNiMK5UKNlqUq
         KWDMNA+97lWLAb4KF+f2VMIiffiYeNUN3kuXoKyFOWBHU7MK0Ag7zSN9O6nrtH2EvsEy
         KMfUGvnLy7wRr2zox1quHSFAWlS146/iBYA0LFG0eDItHk9p/HF+YsI0mpEYmu9qVxo8
         HN8Pfqd/5rYXOpc7sTNOiBn0ikHgJIU1f+HnXGqAUhP3Pfgi0DwSWOsRHidqgzh89b5M
         nXIk6COhChYahb0CVCNMuf6k+Ypl1mhXmzc42fYqCtcuIBN5N7ZOajbfA7vPPimkaHkU
         STPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=9pgkd8m8ayoO3m4NvyKnv2TBobNoyRljtSFPMvrKqhU=;
        b=tVwIF7AhjNhNeEfW9vcGG8t8mZGAsZShbfxS5yxkkUFjfGQCv2q9LWGdIQToy972hY
         Qe9Xf4AiY5JrL8PTIo8+yqhqBy7LwFsR7Ls4qvztBPBGZh1BcHOLuNG6ozFDX9mxnPYy
         45n5vL2Q7xOFEPFib9mrWJveFRmCJa7gm2znjFhExw0QslYCtt3YfGHPFiNRxOWhxNsq
         zcd1uJz4L+0U/Ks6LAs4Pbtw0UkyW35MlIHP0DOgTOlId+LRw+RNpQKfXoxlbJ7QzIf5
         HtrNN5BQUPh15xGUYbqqy8DXoruIRU9AWKjiNhs8OjJtdDoColCpFz9sPVZhjCkBMiIS
         slJA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id m25si1202450lfl.1.2019.04.29.01.47.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 01:47:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x3T8lZNE014761
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Apr 2019 10:47:35 +0200
Received: from [139.22.43.249] ([139.22.43.249])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x3T8lY3G028414;
	Mon, 29 Apr 2019 10:47:34 +0200
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
To: =?UTF-8?Q?Hakk=c4=b1_Kurumahmut?= <hkurumahmut84@hotmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
 <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
 <44a24f8f-8c38-4577-aca9-3b5911d9a96c@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <32b8469f-e646-b508-03ab-3c2a6a9f7bcb@siemens.com>
Date: Mon, 29 Apr 2019 10:47:34 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <44a24f8f-8c38-4577-aca9-3b5911d9a96c@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 29.04.19 10:38, Hakk=C4=B1 Kurumahmut wrote:
>=20
>>   What is the parsing rules of /proc/iomem?
>>
>> I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR regi=
on does not seeen /proc/iomem. I have enabled it with kernel command so DMA=
R region is seen under reserved region but parser ignore this line. I debug=
 parse_iomem_file() python function, I seen that parse_iomem_tree() functio=
n ignoring other than HPET.
>>
>>        if (s.lower() =3D=3D 'reserved'):
>>           regions.extend(IOMemRegionTree.find_hpet_regions(tree))
>>
>>
>> I have attached below code to find_hpet_regions()
>>
>>       if (s.find('dmar') >=3D 0):
>>          regions.append(r)
>>
>> Is my approach correct?
>=20
>=20
> I debug Dell R710 Server new errors. I tradce  vtd.c file line 1063
>=20
> It is reading "Global Status Register".
>=20
> Read value 0x84000000
>=20
> 31 bit : DMA remapping is enabled
> 26 bit : queued invalidation is enabled
>=20
> "queued invalidation is enabled" root cause of the problem.
>=20
> Do you have any suggestion? It is not supported by Jailhouse?
>=20

As noted in the other reply: Turn DMA remapping off (intel_iommu=3Doff), bu=
t you=20
may leave interrupt remapping on because that enables faster x2APIC mode.

>=20
> Also, I have an "HP Compaq Elite 8300 Microtower PC".
>=20
>=20
> I have attached below code to find_hpet_regions()
>  =20
>>       if (s.find('dmar') >=3D 0):
>>          regions.append(r)
>=20
> Also intel_iommu was disabled. Consequently Jailhouse Root Cell is runnin=
g stable. Adding this line to next branch may be considered.
>=20

Please send a patch and a description/reasoning so that the full problem ca=
n be=20
reviewed.

>=20
> I will study on MMIO problems and I will try to bring up inmate cell for =
example bearmetal or Erika RTOS. Timer read/write and printing something.
>=20
> Thanks.
>=20
> HAKKI
>=20
>=20

Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
