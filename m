Return-Path: <jailhouse-dev+bncBCL6VUP7RYARB5PPTLTAKGQEGEDG6SQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F29DE14
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 10:38:15 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id j5sf3657232oif.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Apr 2019 01:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ECZbRAHMNcCrbdLoEhsCxouIiw3vHpMsoX38ESIayls=;
        b=RQKcMHjscRgl7l3iWFGsYIAa0eh+knVKvOOjJdrTtieaW/bOUakKJk+K2+qKeGxykL
         bSMKIvb0E7TRfYWCv7EzxezylhxpJnG1AY2QIS883WogPC2EbljvjdV/i4s0XK82+D6W
         iKNw42PDAH/HSOAHTOammrBq6bKMHX+4sstCbMIl5EqtpPoYfIt/+byZuBHglLDAQ+oh
         jHMTQ9M2AGHUyPs+f/POXkc7MlVfik5Qx0KqjQs5RZTpgcex64mx85yXPwv4r4eScuCU
         95oRRki6pb2WqSwkDlYfl99xZ4Ohf1bTLotiWRqXLIb85z6p6a+ol04ByX11/2SzK8mu
         oPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ECZbRAHMNcCrbdLoEhsCxouIiw3vHpMsoX38ESIayls=;
        b=WLIzk9M7ZGIYNWAO0kNpR+rH/D2NmQYZ2XIr6JgeIqfwXitp00yjNSNgB/eA7cfsBc
         aLIsd4gUihjEWMIQny3RTelfv39aBcenqY3wHCfX5rcACuo+FfZhmQWAEukyl1S5Xr3F
         +JkIcHkFatkCusmlpJN9TiPJaQlodFt4GN8K1iXeMTvwof4dwKubLIpdfPtxyR1Vf3zY
         woP4NYjX4+/2sDgrJOg5xV7h/fZNVPbWGIfQpP/R3hrVYqR73oqau4StIPOED3s69kAT
         hexYO0Q/LxSRXx7BhH06a8dtLwGjJ2XQiXT+rl025y1o7YHSgMWuCWYY1golCKdTf6FV
         H88A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW3UyS1hVhjGvEwTpigV8MwHlwHHcJi1JSdUzCiRIRa5UaHFiAC
	h1qer9Nmmzo3uhFhl7tHanA=
X-Google-Smtp-Source: APXvYqxQayaLUk55131hjswbkRpZZTaE+3MUsq0RTHi/DJEfSk2mwB/4Natd3EEWzNDn0yW0k8Fgug==
X-Received: by 2002:a9d:73cb:: with SMTP id m11mr6976662otk.223.1556527094144;
        Mon, 29 Apr 2019 01:38:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:b588:: with SMTP id e130ls1431572oif.4.gmail; Mon, 29
 Apr 2019 01:38:13 -0700 (PDT)
X-Received: by 2002:a05:6808:307:: with SMTP id i7mr15104561oie.60.1556527093227;
        Mon, 29 Apr 2019 01:38:13 -0700 (PDT)
Date: Mon, 29 Apr 2019 01:38:12 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <44a24f8f-8c38-4577-aca9-3b5911d9a96c@googlegroups.com>
In-Reply-To: <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
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
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_418_1122445103.1556527092607"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_418_1122445103.1556527092607
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


>  What is the parsing rules of /proc/iomem?=20
>=20
> I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR regio=
n does not seeen /proc/iomem. I have enabled it with kernel command so DMAR=
 region is seen under reserved region but parser ignore this line. I debug =
parse_iomem_file() python function, I seen that parse_iomem_tree() function=
 ignoring other than HPET.=20
>=20
>       if (s.lower() =3D=3D 'reserved'):
>          regions.extend(IOMemRegionTree.find_hpet_regions(tree))
>=20
>=20
> I have attached below code to find_hpet_regions()=20
>=20
>      if (s.find('dmar') >=3D 0):
>         regions.append(r)
>=20
> Is my approach correct?=20


I debug Dell R710 Server new errors. I tradce  vtd.c file line 1063

It is reading "Global Status Register".

Read value 0x84000000

31 bit : DMA remapping is enabled
26 bit : queued invalidation is enabled

"queued invalidation is enabled" root cause of the problem.

Do you have any suggestion? It is not supported by Jailhouse?


Also, I have an "HP Compaq Elite 8300 Microtower PC".=20


I have attached below code to find_hpet_regions()=20
=20
>      if (s.find('dmar') >=3D 0):
>         regions.append(r)

Also intel_iommu was disabled. Consequently Jailhouse Root Cell is running =
stable. Adding this line to next branch may be considered.


I will study on MMIO problems and I will try to bring up inmate cell for ex=
ample bearmetal or Erika RTOS. Timer read/write and printing something.

Thanks.

HAKKI


--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_418_1122445103.1556527092607--
