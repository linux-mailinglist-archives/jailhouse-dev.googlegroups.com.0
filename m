Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUVS6GTQMGQEAEVWU7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id A45FB7997B1
	for <lists+jailhouse-dev@lfdr.de>; Sat,  9 Sep 2023 13:39:00 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 38308e7fff4ca-2bd24fcd68csf33698811fa.0
        for <lists+jailhouse-dev@lfdr.de>; Sat, 09 Sep 2023 04:39:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1694259540; cv=pass;
        d=google.com; s=arc-20160816;
        b=zM1P1iM1lc8TY72AdlRwenrMaXddAGaI8xgSDUp6DoaXzv5j1Nop2pMIW5I4pz+zdM
         QXrw5gXd0IFvHplYFFugoLpyfxW9dndYckaux8M9YuCFjBPsCNS/UsaDcHQLQMce03ZJ
         YxIOVc959+oWTQ7xOF9U8ECC0zqJGEbTuNax/0T+LTWVEA9VoP7kQuDTgqennr6xpRE0
         iCEl1kgghx1JMt5/R9R85VrPOkVUL8D8/c/dwXa/b1fe1aeQYNS+fGxHvm/66M135mP1
         PvTM0Q9McG+PmM20TLuKe1uQ9Gqvgnvo4eX+Nnh3pBvuERendutJZFe1+SLQrV3VR5xt
         ZBmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:sender:dkim-signature;
        bh=z1qif+gDXyo+i7uuZr6luLhrr9+44LeGaAhY3zFSvOM=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=oj35Rx1rTipu6mQ8FgymlB7RYb9OxELujiiZ+B9w9cmITSKxp0yps5+3chgTYyW5ZB
         44jEpP2TsK+luAFPserniz0D3DsU8f33z6imEBPKiOeKZdCJ9JYX3eVgg0MJ5fWsRn4d
         rSTJVvYysvWAQLo2LJZJixSa5kg5JO6NFK6Y8/qaSg+6dZIG6BJqDjG9rpEpq9iIUk2C
         2nKlhOgWc+Re8htbNCmrAKrQxHZIce3MqVK7IcdLb29JSR+5vJ1gAF4uIWUSYR4S8K64
         Bb7CR5jxjrB65RAT3mfq5hv0MSO12d3F+0HPx2ceH40q8r+Y+lfrW1mYC+Dh2H0QUEBZ
         B+Kw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=zz8HvhI+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1694259540; x=1694864340; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:from
         :references:to:content-language:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=z1qif+gDXyo+i7uuZr6luLhrr9+44LeGaAhY3zFSvOM=;
        b=OOiNTyODtwKCfd81IlcuPfNDv1U57YAenEaPp+tUcwUvbv8bVZHDjiEVKQkIs5vYBb
         HPksU6N7mSvE3bVNNiSPWApFzvMKt3aA4FNALs2KYrMO2Kq9q3KPRUK14gA5bczMwrz/
         d83zvS6NGNyt2Eu83Wpoza3pl6akbviiot4bJlh9my++6eNpc0U1lwrEL1pB1KI42Znz
         zqN3axDz9ZhD1CvNJTamheKUY4YWjPlM5WYNlHXqwc38K+ABEgqSw+6APsHvNXPGP8MN
         /kVKhknvL2qdUeL3pLYZFVhoKrv4U6bOfnP/KfupVdNbemtc9tTfT8eLT+FZy3JZzA7A
         N6+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694259540; x=1694864340;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1qif+gDXyo+i7uuZr6luLhrr9+44LeGaAhY3zFSvOM=;
        b=Bo7pNsEIjNqDNAfl8g6c0UJYp1PXJNJS6nLUznDU/n5ZPFeZZ0SAUnrLqlWPfFLFt8
         xDfzTM9hf1Xq3k56iYRjfPLfSvNtqRBBlFd1w9t7cPIIr5xGmV/b7fjLA6HPJNgGdkPt
         b2LdzoaVXacIP6BAeGgp4wtZ031oczCr0W+Nkqmx5YCDDHtzPKSOy03kYUxY9jzw5t29
         FZG4syn+DpPuxRmfE3JzAisF9b8/SEydrBJ6YVj2W8s+P0LXI/EKC/L5KAB943PL3jDE
         ZUPdp904jM1nrsZwEEmHCaGHUM6QJnXC8Di9rEiidJec+VSEvS0XzVQAUSAVL3nB6fZc
         rijg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxY93llgt+JjE8PxcU2u1coy5H7qwXWyRA8mCd7gyMD0geCl5JY
	ognBtu7CECeeZ4jevXdG2WU=
X-Google-Smtp-Source: AGHT+IGelLmBobAhaE9YkuZGiRlcFEezLU2MOMCpx7M5MNjBc+VWPkpELN1QdaNV1lg7clYBqvlNOg==
X-Received: by 2002:a2e:3a10:0:b0:2bd:291:803 with SMTP id h16-20020a2e3a10000000b002bd02910803mr3579340lja.44.1694259539309;
        Sat, 09 Sep 2023 04:38:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a68f:0:b0:2be:58d1:dc38 with SMTP id q15-20020a2ea68f000000b002be58d1dc38ls777470lje.1.-pod-prod-06-eu;
 Sat, 09 Sep 2023 04:38:56 -0700 (PDT)
X-Received: by 2002:a2e:9b50:0:b0:2bc:f4ee:ca57 with SMTP id o16-20020a2e9b50000000b002bcf4eeca57mr3578477ljj.48.1694259536496;
        Sat, 09 Sep 2023 04:38:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694259536; cv=none;
        d=google.com; s=arc-20160816;
        b=woXsK3uA9gd5JAeSa4OdQ40ZBcZYiPQTrRvwQ+P4RstU4TW+gImJWRGy/IZtzk7qTz
         EyGTq14kwurFfalz7sH98gjtP90ktsmkye/YaAFCVPhPPpdLBuIGGYJ8JQQPjT0GB5BK
         toqBRJf4iRqic+1ITqJVmfaP3irpPTFFGRWiHqL2HBO/D5U7txRmIJvCW/LfaXARsSg2
         c4xbu+hIFqOHDCEpdGqfmgUc58nxw2vSKt/8HZUr3rC1Q7+ZdaSxpfWLmbCgCejzFVyz
         DvKxe2bFprvClB6/e6p7YfEIJnZhM0dEROAUNi9yDIjOWwnXMLPIT5a7cBer+fuSj/ZQ
         seBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=IwO/4oIIbUOiOzajS5yroG6A4Xrk6oikXoV4DgOKNbU=;
        fh=WQq7Y4kjjcilG32otq12Pu+qxNQlVTfRT61GGCMDZsk=;
        b=BWtdwr+fDMHHcDKEoozv+bN0H1Q8XTAhIOiBwmAED4TQKHU7UQesN9hsbHSDBTu4W9
         zn08CwSKSEuX0KA4m7wUeIk21sTZnjEFjyKMxfAOh2LR6kdUDoX4+opjQzjBTea4ViQI
         jGX2I1+ubWJ95ZcorT6y9YU5x/qXn1oPpj/boJSmb51gCR5Svd42yLRtGm93zs7eYb5w
         eoXe3m/vhNjnkODwK5lFXkLRySzm/mCKx+UNAlp6dwxYAuL5DxmrxBcAkF1kqYtw+Wu2
         40etFjiX+OE4YPh2tsOw6ZJxxe0luH1fKpxXyuFIGQ5eUuPBDdNY/8o+QZ0u9eipZ6pz
         sONQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=zz8HvhI+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from a2752.mx.srv.dfn.de (a2752.mx.srv.dfn.de. [194.95.233.60])
        by gmr-mx.google.com with ESMTPS id bz27-20020a05651c0c9b00b002b6f8d5f93csi252520ljb.2.2023.09.09.04.38.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Sep 2023 04:38:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.233.60 as permitted sender) client-ip=194.95.233.60;
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de [IPv6:2001:638:a01:1096::12])
	by a2752.mx.srv.dfn.de (Postfix) with ESMTPS id BA8EF2E0111;
	Sat,  9 Sep 2023 13:38:54 +0200 (CEST)
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4RjWG6353yzxr6;
	Sat,  9 Sep 2023 13:38:54 +0200 (CEST)
Received: from [172.16.2.23] (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Sat, 9 Sep
 2023 13:38:54 +0200
Message-ID: <e1577ac3-ab02-4fe4-9641-b56a923d6fb2@oth-regensburg.de>
Date: Sat, 9 Sep 2023 13:38:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: How to set the value of pci_mmconfig_base in rootcell
Content-Language: en-US
To: bot crack <unintialized@gmail.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
References: <3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n@googlegroups.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
In-Reply-To: <3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=zz8HvhI+;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.233.60 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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



On 09/09/2023 08:04, bot crack wrote:
> Hi, everybody
>=20
> I encountered some problems when using ivshmem-demo. How should I set=20
> the value of pci_mmconfig_base?

Set it to a region where it does physically not collide with any other=20
IO/Memory.

>=20
> my rootcell:
> /.platform_info =3D {
> .pci_mmconfig_base =3D 0x7BC00000,
> .pci_mmconfig_end_bus =3D 0,
> .pci_is_virtual =3D 1,
> .pci_domain =3D 1,
> .arm =3D {
> .gic_version =3D 3,/
>=20
> .......
>=20
>=20
> my linux dts:
> /&reserved_memory {
>=20
> jailhouse: jailhouse@0x70000000{
> reg =3D <0x0 0x70000000 0x0 0xBC00000>;
> alignment =3D <0x1000>;
> no-map;
> status =3D "okay";
> };
>=20
> pci_reserved: pci@0x7BC00000{
> reg =3D <0x0 0x7BC00000 0x0 0x00200000>;
> alignment =3D <0x1000>;
> no-map;
> status =3D "okay";
> };

There's no need to reserve it via device tree, because it isn't backed=20
with anything in any case.

>=20
> };
> /
> Kernel output after inserting jailhouse.ko
> /[ =C2=A0264.612191] jailhouse: loading out-of-tree module taints kernel.
> [ =C2=A0264.624958] pci-host-generic 7bc00000.pci: host bridge /pci@0 ran=
ges:
> [ =C2=A0264.625007] pci-host-generic 7bc00000.pci: =C2=A0 =C2=A0 =C2=A0ME=
M=20
> 0x007bd00000..0x007bd01fff -> 0x007bd00000
> [ =C2=A0264.625028] pci-host-generic 7bc00000.pci: *resource collision: [=
mem=20
> 0x7bd00000-0x7bd01fff] conflicts with reserved [mem 0x70000000-0x7bdfffff=
]*

This happens due to your device tree reservation. If there's nothing=20
behind 0x7bc..., then simply go without reservation.

> [ =C2=A0264.625051] pci-host-generic: probe of 7bc00000.pci failed with e=
rror -12
> [ =C2=A0264.625475] The Jailhouse is opening.
> [ =C2=A0264.792429] psci: CPU3 killed (polled 0 ms)
> [ =C2=A0264.794210] Created Jailhouse cell "inmate-demo"
> /
> The operating environment is arm64, linux5.10.160
>=20
> *How should I set the value of pci_mmconfig_base?*

See above, a free (ideally aligned) memory region in your physical=20
address space.

   Ralf

>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-dev+unsubscribe@googlegroups.com=20
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit=20
> https://groups.google.com/d/msgid/jailhouse-dev/3ffc8cc2-0592-463f-ab65-b=
d51c2d0ed83n%40googlegroups.com <https://groups.google.com/d/msgid/jailhous=
e-dev/3ffc8cc2-0592-463f-ab65-bd51c2d0ed83n%40googlegroups.com?utm_medium=
=3Demail&utm_source=3Dfooter>.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e1577ac3-ab02-4fe4-9641-b56a923d6fb2%40oth-regensburg.de.
