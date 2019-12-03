Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBK57TDXQKGQEICVG6BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A0410FA0C
	for <lists+jailhouse-dev@lfdr.de>; Tue,  3 Dec 2019 09:41:16 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id 7sf683874wmf.9
        for <lists+jailhouse-dev@lfdr.de>; Tue, 03 Dec 2019 00:41:16 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575362476; cv=pass;
        d=google.com; s=arc-20160816;
        b=b1l9MsokOFCwPWqEG2A2ud6/zub0JLLBSGEC4YJR1gKAaLSb6XmawWwP7p59SsLbzZ
         UfuBCJ4/ibzH+DrLhV1FQewYsHwfXDKotwGBmakO8pUl8UgRYn56J+LZWRhbBZ+nX5b8
         e/N1050Oj8Wu6yTBNSdFxFzVxxMS2I+UHDAqCQmvlTJpdaf2u9HEFw0XlvlA+dx1yZsL
         NWkjYEdkX2KLxlGxL6Rmf+9QXFXK4NYc1tyk0v7ui/OkOveyvNt0rrJfql0pcvKXtsRz
         BG45jyusBKCT5wuePNfkVAYZsB7rt8YC+rhIR7H51mosPS3B5wpRYDgSy1LAi3iRKjUg
         pEvQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=MYq74HWa3xNRtVSar6x/gZzeMjlOWV74U4aODp50oRY=;
        b=BcF9BiPIkhl3E4VOe3jBqrmG0C8q0RT+MjcEHDH3RNXxztNVzCTVoit2kigYeOGnwu
         ju+ZdRDZGpIq+hJTdTrYKgKHLBpLryaOlBeG4totQmE26H2BonofalHuJWN7XVItvlnr
         izwLo4Piqy/ejEvznmgUTNp66AVHlslQNInTBOfARCwSqFwBUvU/WbkYL88H/7NpyNeO
         DOhZECRpAMXEsqD32pUjoNPGKpYs0vfhmiG7gmuWhee5jvWnPBrGXRegkpeH45yMgkP/
         +cw1I0Rimd2NH6FDXWh1tu40DrQACI5gqGuDyT43CVg/TbNltTGa51J5MHr5JTRr/kOD
         ydmA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nQ8l1QEi;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MYq74HWa3xNRtVSar6x/gZzeMjlOWV74U4aODp50oRY=;
        b=BIUnkiHVWP7JQbljwfheSKPXG+z6iq3d53UNETTE7cBZmo/M2wkIv3Wz+1OKwAyPDO
         r7JLXZOy1m/Xit9wWTCu2qRL3MHYovG5YYMTISpitHaXfIw7LNGhKkeQ4cTt4Q8C317U
         FaGGEEdUpmYCMaBD5TrealCz7hqd7yt+GRw08h0f3phHsYjUCIZe7Qsd0Ud4mdm6pH8G
         TF2NqXnQzpLA/6WuME7WyKLH4p6XM8XdA0dIDA39oi50+vLLlFLzxV6upRtiRWEj+UZd
         vehYtX0Jcg3VahsQWpZHqWIQdtNi8XvW4tqXjoDHxWLHlVha2SLAeY+EzFi3CKHcQdTB
         z15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=MYq74HWa3xNRtVSar6x/gZzeMjlOWV74U4aODp50oRY=;
        b=nqpG2wHgtkVA+aiQxDSNOYXJ9mwiQVoxWrxYkB/ljuVRAs1tGUJ1N8lu4jGXtlH3Zj
         m34MqNFIsiSp/3fy7W4ooXDkmk6dvUNUigbU/XDiDIsh8AasF0bgXB9J1c10e+mcuMCE
         +565Nn2tcjL0EftckfoP6I+GSEm6yyUFTr6NdLPkzvXS3Me3UODkuDJCd7DqTo2h3j6S
         roBBcViJpI0CYuQtYrU/HZG2xnMowjrurmseo7nfHfwu0mT7/tQIj2wBreAmVpI20mp5
         v2+k3guvntlj0OEgWjoQAApt9zlPC2O87cEqMs2NqclctVMSM6KB3N8MHhIYBjV9AuCO
         d5oQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXN8A6wueO3KBRrUOFP4eot6/GpmEyRxvc1n5blOYfck+yFsm2b
	1xGrszaBp0yDvTKeLMi/mEA=
X-Google-Smtp-Source: APXvYqyKvMTmCTX7CIxJ4GTSJ46t53PzARPgBH00eqznMKB80T+yMzPRL0x7GTItooELuJ0axgFr/w==
X-Received: by 2002:a1c:30b:: with SMTP id 11mr31246202wmd.171.1575362475846;
        Tue, 03 Dec 2019 00:41:15 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:ecc5:: with SMTP id s5ls831124wro.12.gmail; Tue, 03 Dec
 2019 00:41:15 -0800 (PST)
X-Received: by 2002:a5d:428c:: with SMTP id k12mr3745383wrq.57.1575362475273;
        Tue, 03 Dec 2019 00:41:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575362475; cv=pass;
        d=google.com; s=arc-20160816;
        b=F9GoovaqLcJPH06lNR1lfKGkekp3EREjzcU20pjEWp93fKgeemt8DwxMxrwmdj2z1L
         VxagkSkRDxm8xTFTp295oSEL3PBR0GJgAmk8WzqhBA/UpKlwZHEWsXcrsgiPD2FYgp2G
         W/N57uTd1c/SQipr9+XQ2rgFCml9jmRYGWRUZqMKruZ4CmZOQYP9FNuOmboOoFJBbhRT
         nRWVBAI64KkgV8ZbcDbJ3aI2icd7YHfRImj7IOsNBf4t1RCqM2oND9MGTx8uwAO7V/rO
         7MmPLdPALDTaFVwrD1AoudYhHw5nK2PnKq8cNuSWGuhSkfGh9qTBTjutgYiVv0SO2OQS
         oBYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=tDqWeafOTss9aPfoDaJhwbn9uol2TGPMazvCChguGwI=;
        b=CeuMZwssnwQ1QZq26TQbxZq1jef+YBHgI2y5kuCVDvn5kA4T/wLXvE5VZC4hfSidqQ
         OMHiT5Bfm9K1Qe52ee2E5ijK4nzJgHxHQOlLML3HPN/vg9ubsa7XcbXR6U0wVhn7rQLB
         3v+UHfnVXj00c6jwPueEALJTWr8GVySimvkSwXKpDK1tq8G7reZHmVvrUAc0snOfQg2n
         9dgc8uujmrjkYs1D3D5lKweWjyXoDa7tlOQmFLeiQzs2Ou/WyQJW+LHjsQvlxJDyz1kw
         lJFGX8pSLy65emtsamrmSOJ7dSFopVDqg2tUmnILuOetdN1v4XXE6IwK0LZQmD8Se/hH
         WUZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=nQ8l1QEi;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70083.outbound.protection.outlook.com. [40.107.7.83])
        by gmr-mx.google.com with ESMTPS id m12si146389wrq.1.2019.12.03.00.41.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Dec 2019 00:41:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.83 as permitted sender) client-ip=40.107.7.83;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YJ0jar2dum3TEDNa0/9+Ii7lrgYwAofTSFEgQfN0EoRma+qt6rsce4r68tWUQ1RFVhoD/hhYyuEa6GQrUi/I8cZKlaRt5A5H1kQIuJwluOHXQ9wjVrQ7V936zeD52Hl+7/88+8IUsxSc8z5QekrfL5BX1cZpS0Kml6ZxcYxqKRZNbIvDmtiUY5iwRYVvs+9AEFSCm3ueEQ0beVVccb3abWSYuAGoJKw2rJoboSvpHzHkGWkPleldqpx+e3Asv85uSZaHE+f0wX3yvF4+mX1NXAbTnVazrpO3Ct9T7HvDctypUKoHBtsP9aB1/KWFn1qneuE7J87f6XdjUAydsth25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tDqWeafOTss9aPfoDaJhwbn9uol2TGPMazvCChguGwI=;
 b=gA0D804PrhVkuwp3NV4xIHsOvxvFU2DaNbOz0+9nicJmOzVgunJ+OoPIsJDVfl1rJJeUPVdE3xJYN2ZafLeeLSsMV7dgi78Bt607S1gQuHwrqmk6d2q2tgqWU8MouD1ON5zECFPP/RVRcGTrkGbao0hnVvDkKRL0ynFS3Dod4klWO8B2Jjn/MOl03VomICIf49HCb5nrz6QH0NqQSP74K1O7/Pb1FJlMrYGcEJxco7+bOF6EvTQB2YuzVrpGZa7cKU8KNsVi9Ah4NuPXmT9hgh7V8L7LQEVU0Eh7CnaxTNddgRp1Z5z2l0P0J51YeBMPy8dRN8SfZUkxWV/LPihV1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB4034.eurprd04.prod.outlook.com (52.134.124.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.20; Tue, 3 Dec 2019 08:41:14 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::f16d:a26a:840:f97c%4]) with mapi id 15.20.2495.014; Tue, 3 Dec 2019
 08:41:14 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Marco Solieri <marco.solieri@unimore.it>
CC: Jan Kiszka <jan.kiszka@siemens.com>, Jailhouse
	<jailhouse-dev@googlegroups.com>, "marko.bertogna@unimore.it"
	<marko.bertogna@unimore.it>, "tomasz.kloda@unimore.it"
	<tomasz.kloda@unimore.it>, "giulioc@xilinx.com" <giulioc@xilinx.com>,
	"'claudio@evidence.eu.com'" <claudio@evidence.eu.com>,
	"fabio.federici@utrc.utc.com" <fabio.federici@utrc.utc.com>
Subject: RE: [PATCH 0/8] Add cache coloring support for Arm
Thread-Topic: [PATCH 0/8] Add cache coloring support for Arm
Thread-Index: AQHU5KMdy5hOXdbZ/EGjll5JmT7z0aenrFWQgAABNECAAW+IAIAAgtog
Date: Tue, 3 Dec 2019 08:41:13 +0000
Message-ID: <AM0PR04MB44815D033BBEC85ABBBEE5DB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
In-Reply-To: <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ca00f147-e242-45c0-846b-08d777cc8e45
x-ms-traffictypediagnostic: AM0PR04MB4034:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB4034A7004A39F59B1679EBD788420@AM0PR04MB4034.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-forefront-prvs: 02408926C4
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(366004)(376002)(396003)(39860400002)(346002)(136003)(189003)(199004)(14444005)(256004)(25786009)(229853002)(26005)(7736002)(81166006)(14454004)(8676002)(8936002)(66476007)(66946007)(99286004)(74316002)(316002)(478600001)(305945005)(71190400001)(71200400001)(64756008)(413944005)(81156014)(2906002)(66446008)(76116006)(66556008)(33656002)(6916009)(4326008)(54906003)(7696005)(6246003)(76176011)(6506007)(102836004)(86362001)(186003)(6116002)(11346002)(446003)(55016002)(3846002)(6436002)(52536014)(9686003)(5660300002)(44832011);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB4034;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IsZMOsxvCdQA31cpqxeWtzpUjILVcWTXd+3SKQYcBqyMwQhbv89cZJoc4I0eXDFXv0f+5TIXmEQomEhFehy7UsEH2hsHVAttf62km2JzkWcCoYDOyHnKm5hZw7VlZScZ54cMTT0nk48ZrZ57+IfktHoPm/CmnvUnNmHuR+XBjjXRKlUP04Uk5NYYAtz0L+mBAGLOgbXhsYcBJyzt3bSmI9SD8d60+JHkeNbehbs0V5+w5D+XL+7OC0YAV4M1+O0xnPGcEs3teFv5Jdpyvb3/lDhqCvvpWuucYFWCr12w5/9DQJl5vxXknJekd4whkHzMXG258cxldhl22Eot+Y78pNsYbexT282NKXklrd7X91UqPR6PcT9XCNZaJStZu8KBQJ7D5+bp8JrsXOt29AoCF8m/kICHBT/PgENrH7wba3RRWKQwGyYGfnt2ZjCSDEfl
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca00f147-e242-45c0-846b-08d777cc8e45
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2019 08:41:13.8359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C/xm3JNQzotwhQZ+gR6dyCUSEL92QO+qxUunIY+fETHafBO6uG8nxAYUD8yTXyQs9lUEUYCeVjQgVmxKEotDXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4034
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=nQ8l1QEi;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.83 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
>=20
> Dear Peng,
>=20
> On Mon, Dec 02, 2019 at 02:52:04AM +0000, Peng Fan wrote:
> > > I am reading the patchset, but this patchset could not resolve the
> > > cache contention between root cell Linux and inmate cell, right? It
> > > only address the cache contention inside the inmate cell, if I unders=
tand
> correctly.
>=20
> This is correct.  The documentation reads:
>=20
> | Since Jailhouse is currently lacking SMMU support, and since the
> | colored memory mapping must be provided to DMA devices to allow them a
> | coherent memory view, coloring for this kind of devices is not
> | available. This also explains why also coloring support for the Linux
> | root cell is not provided, although possible and tested with a simple h=
ot
> remapping procedure.
>=20
> > > Is there any v2 plan to address the upper issue?
>=20
> Forward porting to master and integration with SMMU support are the two
> most important task on my team TODO list. Once these steps are done, it w=
ill
> be very easy to also have root-cell colouring. I have planned the firsts =
for
> 20Q1.

NXP i.MX jailhouse has smmu-v2 support, but it currently conflicts with smm=
u-v3
code in upstream. I have not find time to restructure v2 code. You could
refer if you need v2.

>=20
>=20
> > > To address root cell color issue, 1:1 mapping in root cell might not
> > > work, because IPA/PA needs a remap, but this will waste PA space, if
> > > inmate only need a small area PA space. Seems root/inmate cache
> > > contention is hard to avoid.
>=20
> Beside root cell colouring, PA waste is a potential issue of colouring it=
self,
> whenever you have heterogeneous memory needs across cells. Still, on most
> high-end systems the size of the shared cache easily allows for 8 or 16 c=
olours,
> which means that the smallest PA granularity to assign to a given cell is=
 1/8 or
> 1/16, which is an acceptable limitation.

Without SMMU, if enabling color for root-cell, it means needs to cut off at=
 least
1/8 or 1/16 memory of the whole dram space from root cell. CMA is not easy
to fix here...

Regards,
Peng.

>=20
> Cheers.
>=20
> --
> Marco Solieri, Ph.D.
> Research Fellow
>=20
> High-Performance Real-Time Lab
> Universit=C3=A0 degli Studi di Modena e Reggio Emilia Ufficio 1.37 - Edif=
icio
> Matematica - 213/b, via Campi - 41125 Modena
> Tel: +39-059-205-55-10  -- OpenPGP: Ox75822E7E

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR04MB44815D033BBEC85ABBBEE5DB88420%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.
