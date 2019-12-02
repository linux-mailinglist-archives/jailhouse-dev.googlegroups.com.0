Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBVXYSHXQKGQE6EHH3KQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa37.google.com (mail-vk1-xa37.google.com [IPv6:2607:f8b0:4864:20::a37])
	by mail.lfdr.de (Postfix) with ESMTPS id 803D610E4B6
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Dec 2019 03:52:07 +0100 (CET)
Received: by mail-vk1-xa37.google.com with SMTP id x65sf17349606vkd.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 01 Dec 2019 18:52:07 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575255126; cv=pass;
        d=google.com; s=arc-20160816;
        b=meFKYBGcp1j22y9sbG5hY9LNRkfnXKdH32o7hvoFVvohMDyuG+PMLpPYp92uBD7rf/
         WQn7I+OLHlYwxgt8rpzrYesuXYlyGU0hhVs2x+zgLlGnPjkZwVczxY5hu3l9Xf805a/+
         upeZYhd64yxXMLtmO3JSbqiRm52cNWc65QKNdED5tn14IYPqGV9b5p56PrQi5eMzezFD
         zUkDNVFe05c6i5QxxLdwIT38U9K+4OV+TACK7c6sKCuFXvX+AiEqv4gN/mFtYfGzkONd
         HcUaSSSomm07cL3eoj7kN/F8I41GDMjS1XF5PGlQkbilaGKllUtxOYNClpM2combtNI3
         hd/g==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=TZxPUKIohQrOUn1dbbf5Yo1RnroNMkP4YXpcgD0xCWM=;
        b=rHIRJANoELUj9hLEkteBjUSj8kp7SeBsTtXx+cKZGXMhAcc0xemvWxfYTeqyKg5fcV
         kC3qiABPWW5tQJ0IXoTb/a+xL0G8k6MX04jQBIo3hyExsYmdJrTra9E/BWhts+w96pT1
         R+1dqIZa0GfcPq9S9ccTbmHSJ1fS0r/utOm9yVRCnGMY+3i25aWUVVTLY5e1NMvRgHaj
         YsMHIsyLFxpQ/wRwYCzeWsaYAmGVYj/5PBuDKPvhuvBq0v77blg5uraZmSeKuhspoIn9
         ILRPOm3jMDJsVRaxpwF4TJYTm6MSAjQIrKSEMzle2kRmdvQUL5sUXR/U4PKaU34BBfVi
         9ZRg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GEQ7ePur;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TZxPUKIohQrOUn1dbbf5Yo1RnroNMkP4YXpcgD0xCWM=;
        b=WBiafOyAVMiohmc9a95m0rG7Zr7F1hCz2FPi08OopbuNSUrVMI6rktyeb/XDWRvbxe
         h9/fognnd6D/XZQaQIB6oAAtMlyK7lJgx9vbgzlAaOIMw+C1yYrgH7yfEUt7Z/w3p8+m
         N+4nPdEQ9Zpy6syOaavpIt9GX62c19r8UxG/TjhUce5gDoedQw8hP4HyVlshQpC+V6Kc
         1Cuj8iIYIJhkMNrmRi2pQ7BfQ8jUOcg/iNL2rMIXPrmkFglyRf7+kQHn8+UeGUKw/ljX
         lS/mESOXf28c1V9496r3QjKPowkDRFCWbWn6oiuPq/pPpvxfyJG90ppIgd3l8+kb6VrS
         9FvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TZxPUKIohQrOUn1dbbf5Yo1RnroNMkP4YXpcgD0xCWM=;
        b=nyKK1EVJmh2L9kAWjDx5bOdPyhPF/lHSI7KYGF7QvBqw8iANMmDM3WuGOePQxLnMmq
         mcwDern2xhgBdrZPSM4KOX6VbM7PHLc3FJ81lAzWgvqlTuZCKmIIzDon3GWsH4ZsyOi3
         Ui8RYbWNU2yDLaCtvKk8by38dr6sWll1i2xgw2Pv0v1eDX7YEpg00JWrpoKTMLJlYh+b
         nL7tmtf0M2Lr2hExkueKTNE8MiujWsSd0ENmreFSlbq69mbAXvG8Ae1YduYYDXyMh0EN
         NEiCU9OhYlNSZNSl/MzpOOc+FeDaSMaQu85zQzj6u3+SlPjfQon8dIpEnhzt3rsdKwQj
         x0Pw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXsR2efNKkRBPTEYoHyssttCzo54Gbed9X6110Ze6R5jYsuEw80
	BXk9RVr+6WoB3S2dAt7QJu0=
X-Google-Smtp-Source: APXvYqyXYmY2wNwizsFefBFxBuCzyx8DYNSbPkKvnzxCtzX4+XSvccm+3wpHEiMR+HByJT/TL7odPQ==
X-Received: by 2002:ab0:727:: with SMTP id h36mr1222332uah.42.1575255126202;
        Sun, 01 Dec 2019 18:52:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ab0:30d8:: with SMTP id c24ls845171uam.1.gmail; Sun, 01 Dec
 2019 18:52:05 -0800 (PST)
X-Received: by 2002:a5d:4b45:: with SMTP id w5mr7539334wrs.224.1575255125310;
        Sun, 01 Dec 2019 18:52:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575255125; cv=pass;
        d=google.com; s=arc-20160816;
        b=kjSKVrAwc3PAqHM28YqNbnLTz7oz9zxuxb+siaXicYh6kqJnrJkZJkH7dD0k3DduYg
         uceYlu2AE87wOtP89NyfI9CvBY8XO4vvm3xNNVvszdVboPwbNpq3vJURkXcB6cJfM7zj
         KUJTNNgjxfskfM94y/eonAsLKMipRZU/eAMfE/Xp3xyp2SyH/Qo1e5/43GO6xQHCycpW
         ZYEahLyuH4a2+N4Dz6ht0CmDG6+BsVYPoLXF9PwenF7XXT4XNFHkTPqu2ahONTkqiPXj
         pXf7+Sg05jdeWwzbVXLdWnuGUT74S9D1jSo7uADv3tVFQfNhY1wkdcI+xYLKdvUK3EWr
         RZhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=3wHJIS30rb9o97odsTRRTbD89CnD3RvDlM00J6av4TM=;
        b=tAOiGmveZ7VcyloqC5/B366MNtEjfk3CJH2/Kp0GG0huSNEkIBG4dCQeoShZW2S3fv
         w7dolnI57zXwoFEI4yYGvGUfgib1auzztAvb9EzNJ5Oak868XSX3ZNU/IGcAhSpv6HeA
         jbSz3O7+CC35q/S/w4o9GOakD7yC0V8pvpk7mZIYucrDkEI6sGs/SuLhq+Gi8is+8Wk6
         W87A7UP58c9zc8zW9B1nJ0oK11xe8iIAoe3keqYlFn5J6SUHqHgnk+c4wDeQ4yxxm4qU
         zRrgz8uZGptBw/RfkXN2ZbG4jiZYfKDdWMvhSrvJHlygLNirZI6PTljDrbu1eohXN70g
         x//g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=GEQ7ePur;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130058.outbound.protection.outlook.com. [40.107.13.58])
        by gmr-mx.google.com with ESMTPS id i11si215727wml.0.2019.12.01.18.52.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 01 Dec 2019 18:52:05 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.13.58 as permitted sender) client-ip=40.107.13.58;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UTZ7iY1/LuTel2lmpzh7ZXC6XdGcCg8FMjeOqXUM2rhy4yG19HLgt/3oy5qBth8Pg0b7lJd8iD2ySxSlJP4eli25L0mOeFCNYwbsBUo0+a+jnBYNYQicjsCu+mwHsh2SKUc09gaAI1JEDp5kuLs9p7CXl/roSDmesWd6q8RUcMcPFMj+jYNDrXjboIO4vFA89X2fjE5wun6QcSW//cFsyRh8vqOE7paIeMu/qFNaz6zCj3RthtNnAUx7EwbzBPzx91IE12iPXrt/xTkS346aU42Xe9oORwJhlYHtkDT+uBooD1r2sO0CB+n3jsw0UfDMNoulz17TTbCVOs6UFrfMKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3wHJIS30rb9o97odsTRRTbD89CnD3RvDlM00J6av4TM=;
 b=LCxNVzDwhLtrcyXIupfM6ZLZOLob52m5YvigW7js2g6aULC7S1ZvEpVo7qFG8w31lqbFzhAPxxIrwujm+9dsXxzW2MVynjbmbkJrsi+8kV62NSt1L8v1ohXbb4LtNgVa8zNLLO80SDR2NqeYKLdrjHkmpvZ3f5uPhcUNSBcJJcjxPI5kbkwTkkRk1JGrzAy8tEzzGGDIPDo2E50qYucIOLuMWHdm27cN9DqtlkONfrQtFIyYmMYXJ0c3FL7MKmlpwa6u5gZeRxa3tPAaOrelY8+nq+crzrl6pYPwE+1XRo2KszBk453FOvEJM+kMeBBKTzEt2s6cZXumc/hsDuCbQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5428.eurprd04.prod.outlook.com (20.178.113.12) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.22; Mon, 2 Dec 2019 02:52:04 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 02:52:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Solieri <ms@xt3.it>, Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: "marko.bertogna@unimore.it" <marko.bertogna@unimore.it>,
	"tomasz.kloda@unimore.it" <tomasz.kloda@unimore.it>, "giulioc@xilinx.com"
	<giulioc@xilinx.com>, "'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
Thread-Topic: [PATCH 0/8] Add cache coloring support for Arm
Thread-Index: AQHU5KMdy5hOXdbZ/EGjll5JmT7z0aenrFWQgAABNEA=
Date: Mon, 2 Dec 2019 02:52:04 +0000
Message-ID: <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [114.220.170.63]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 19d6da24-d508-430b-e66a-08d776d29ccc
x-ms-traffictypediagnostic: AM0PR04MB5428:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB5428C9DF7635B0C3F4DACFA488430@AM0PR04MB5428.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(396003)(376002)(136003)(346002)(39860400002)(366004)(199004)(189003)(13464003)(478600001)(6306002)(66446008)(76116006)(66946007)(64756008)(66476007)(66556008)(6246003)(71190400001)(55016002)(71200400001)(110136005)(14444005)(9686003)(99286004)(54906003)(5660300002)(52536014)(6436002)(4326008)(33656002)(66066001)(7736002)(74316002)(81166006)(81156014)(8936002)(25786009)(45080400002)(102836004)(316002)(6116002)(3846002)(256004)(305945005)(6506007)(53546011)(76176011)(26005)(186003)(2940100002)(7696005)(2906002)(86362001)(14454004)(966005)(44832011)(446003)(11346002)(8676002)(229853002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5428;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ishcb87rhCsIuZEZB3mLKwm8Z2a98Mcrk+dWSSD6WFYlIZjEGFATf8rpEnjQ4WCXRxHi7x12UKm89zbi/3pkdKKc1wmyaIf7q1C3prfa+5Nq4pV9T0cNJp1kxXNXes1XDKs2WWPxN5ycsGdyptaRiO1j+kQAT1iIs81ctJFRcT3Bee3LeGx5KkBSrlhQnrM6u6omL+gn6oWXD/fwzX6lVWVyQ+Wg070Cu8PZvo654Hs1+0G7cn33jPBFSHaD+UcbolqWn+A/QOIV3XnGAGFmqGJyN17Fh0rPlQ1IBvHyFuSWaLozRYKTFsh9Qv4zHwoVnO666PLTlwp/PAThDgftE84SsjD15XY8RIdOG3sEXJT0fgVpy0kp3uQR3k4mmGCn9euBPCPxdtwmPqchekH0xV7w5c+Wv20LuG5sWVbVuELPDeilHBbNkJf2EVSDOAe5
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19d6da24-d508-430b-e66a-08d776d29ccc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 02:52:04.0968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Car05LYZeRsPMtTAq2r3ulQkQLrQxXdlsIYkJa71R9ZBy370pz5pGFrwGfFYGeDy2900Xit4vs/ZwKwDOPe9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5428
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=GEQ7ePur;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.13.58 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

+ jailhouse mailist.

> -----Original Message-----
> From: Peng Fan
> Sent: 2019=E5=B9=B412=E6=9C=882=E6=97=A5 10:51
> To: Marco Solieri <ms@xt3.it>
> Cc: marko.bertogna@unimore.it; tomasz.kloda@unimore.it;
> giulioc@xilinx.com; claudio@evidence.eu.com; fabio.federici@utrc.utc.com
> Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
>=20
> > Subject: [PATCH 0/8] Add cache coloring support for Arm
> >
>=20
> I am reading the patchset, but this patchset could not resolve the cache
> contention between root cell Linux and inmate cell, right? It only addres=
s the
> cache contention inside the inmate cell, if I understand correctly.
>=20
> Is there any v2 plan to address the upper issue?
>=20
> To address root cell color issue, 1:1 mapping in root cell might not work=
,
> because IPA/PA needs a remap, but this will waste PA space, if inmate onl=
y
> need a small area PA space. Seems root/inmate cache contention is hard to
> avoid.
>=20
> Thanks,
> Peng.
>=20
> > Predictability of memory access latency is severely menaced by the
> > multi-core architectures where the last level of cache (LLC) is
> > shared, jeopardizing applicability of many Arm platform in real-time
> > critical and mixed-criticality scenarios. Support for cache coloring
> > is introduced, a transparent software technique allowing partitioning
> > the LLC to avoid mutual interference between inmates.
> >
> > By creating a cache stress environment with a memcpy bare-metal
> > application or with the Linux "stress" tool, it is easy to measure
> > performance degradations caused by inter-cell interference, e.g.
> > running the LMBench micro-benchmarks, or just with the GIC demo within
> > a L1 Instruction stress scenario. Once coloring is enabled, instead,
> > predictable performances are restored. Reports of extensive benchmarks
> > and evaluations on real application are referred in the documentation.
> >
> > We thanks Tomasz Kloda and Marko Bertogna for the prototype logic and
> > Renato Mancuso for suggesting low-level design improvements. The EU
> > Horizon 2020 IA project HERCULES (grant no. 688860) supported the
> > initial implementation and evaluation on NVIDIA Tegra X1 and X2; Xilinx=
 Inc.
> > supported the implementation and evaluation on ZCU102; UTRC supported
> > the testing on ZCU104.
> >
> > A bird-eye view of the implementation and of the commit structure is gi=
ven.
> > Some coloring-logic fundamentals are situated in the 'common' part
> > between the driver and the hypervisor [1], but only the latter
> > implements the whole coloring support [2]. The hypervisor also exposes
> > a convenient interface to ease the load operation by the driver [3],
> > who implements a simplified memory allocation support (only colors
> > have to be chosen) [4] and extends the configuration file support [5].
> > Examples root cell and demo configurations are provided for Xilinx
> > ZCU102 [6] and NVIDIA TX2 [7]. An extensive documentation details the
> > technique and gently explains how to use it [8].
> >
> > Luca Miccio (8):
> >   Common: introduce cache coloring primitives
> >   Hypervisor: implement cache-colored paging for Arm
> >   Hypervisor: add hypercall to ease loading of cache-colored images
> >   Driver: add support for cache-colored memory configurations
> >   Support cache-colored memory configurations when loading Linux inmate
> >   Configs: zynqmp-zcu102: add cache-coloring examples
> >   Configs: jetson-tx2: add cache-coloring examples
> >   Documentation: add description and usage of cache coloring support
> >
> >  Documentation/cache-coloring.md              | 330 ++++++++++++
> >  configs/arm64/jetson-tx2-col.c               | 529
> > +++++++++++++++++++
> >  configs/arm64/jetson-tx2-demo-col.c          |  76 +++
> >  configs/arm64/zynqmp-zcu102-col.c            | 153 ++++++
> >  configs/arm64/zynqmp-zcu102-demo-col.c       |  79 +++
> >  configs/arm64/zynqmp-zcu102-linux-demo-col.c | 137 +++++
> >  driver/Makefile                              |   1 +
> >  driver/cell.c                                |  56 +-
> >  driver/coloring.c                            | 239 +++++++++
> >  driver/coloring.h                            |  52 ++
> >  driver/main.c                                |   3 +
> >  hypervisor/arch/arm-common/mmu_cell.c        |  27 +-
> >  hypervisor/control.c                         |  77 +++
> >  hypervisor/include/jailhouse/paging.h        |  11 +
> >  hypervisor/paging.c                          | 168 ++++++
> >  include/jailhouse/cell-config.h              |   9 +
> >  include/jailhouse/coloring.h                 | 151 ++++++
> >  include/jailhouse/hypercall.h                |   1 +
> >  tools/jailhouse-cell-linux                   |   5 +-
> >  19 files changed, 2096 insertions(+), 8 deletions(-)  create mode
> > 100644 Documentation/cache-coloring.md  create mode 100644
> > configs/arm64/jetson-tx2-col.c  create mode 100644
> > configs/arm64/jetson-tx2-demo-col.c
> >  create mode 100644 configs/arm64/zynqmp-zcu102-col.c  create mode
> > 100644 configs/arm64/zynqmp-zcu102-demo-col.c
> >  create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
> >  create mode 100644 driver/coloring.c
> >  create mode 100644 driver/coloring.h
> >  create mode 100644 include/jailhouse/coloring.h
> >
> > --
> > 2.20.1
> >
> > --
> > You received this message because you are subscribed to the Google
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send
> > an email to jailhouse-dev+unsubscribe@googlegroups.com.
> > For more options, visit
> > https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgro=
u
> >
> ps .google.com%2Fd%2Foptout&amp;data=3D02%7C01%7Cpeng.fan%40nxp.co
> m%
> >
> 7C9a8ae20626fa48d42da808d6b2ba3eb2%7C686ea1d3bc2b4c6fa92cd99c5c
> >
> 301635%7C0%7C0%7C636892910321416684&amp;sdata=3D4VNztT05f9leIPUh
> > a1TUx97q8sEzTgtk%2FfIzkwV3%2FJw%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR04MB44818E5F2BA11C16A6B9E70088430%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.
