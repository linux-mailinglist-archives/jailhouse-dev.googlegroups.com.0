Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB2GZU3XQKGQELQ7GAWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F39D114A6F
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Dec 2019 02:20:41 +0100 (CET)
Received: by mail-wr1-x43f.google.com with SMTP id 90sf2383140wrq.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Dec 2019 17:20:41 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1575595241; cv=pass;
        d=google.com; s=arc-20160816;
        b=W64M8ZIywcdZz+V+ZQdBTQjklJFh2DProoZGJWbghiDPEooOfPkF8cL+NalWL3jnUM
         /zrq7oHIaDFXU+V45h6cHRs+mdSYtrMgG8m33j9bjtmgdbG0XQ/u/EbfhpgtfP+VRZ0q
         CvgDBMC2pIYXTJfSm8z8gSJ4p87EpZlbq1l8zffdr6KzjXh5M+TGIbpquq6pwsytqXWA
         cviOVq7GeHD9ykprXt5WPy9exSfbJQG4OKeTInpPqS/yCbmqql8e8opMkwTxWY1kWuHO
         0Ocy8EuArx1jMKvBaMXb1ZzijkDKlOWEfMuvaWQM63SgV7em0MabVzH+MJgHPeCCgv6o
         RSIQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=2lpZD/LVKd0FMDp1iJHIwF2l+EcQuUd+aIztrNq8ls8=;
        b=tJ3GEmtDsHebOGXACRTAoU/A31z/PgPpxNJKNx7zF1JMgzikWJcS+vSDqcpJC0PbI+
         AO++WNrbCYy/n1BjycSbjMECdRlASAOgn839CkKTbzaw8UJJDQonmzfJsvELcxcAQbdF
         Lg6kSqx6sMmOGoMZcVC7M/0Dzt5Lsbj4tLdOBsI4cKsEhIZNRFlv30+ZQSwcE2FA6dDz
         HhZL1hNu2971fQ9+gAi2a6H34iGntuzreeYZn1RCjw0pxO5HgQCZicl4YRmkBp6+/vIE
         ZO6wmoiAeW5OGe+ggOHl731/hnhtcz6jn8CNXyOynCO6Ny2hXxXITpOVz37OBGQZkX+X
         Yk9g==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dIUxM5wi;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=2lpZD/LVKd0FMDp1iJHIwF2l+EcQuUd+aIztrNq8ls8=;
        b=jjASVuoAg1dQXnM8L1WNmM5DqyxR0L8eM7vi0eirFQEj3asUq5+POQlIv5FTxTH0y5
         j5Zszzxh8nJ746E58GSpoEdNq09/MFdNO8fMX58HfVHB0KtBZH7UQhPNSTrTbe/2d8UO
         TqbNtQM+ZnHrFQd+0mUYplMpQ+6bwQFMoE5uROBNC4IoTPVN/Q+fCeMdoN+IMcWB7/+U
         Oz2SI/b3rOxpwJQZuvR7Oba7MmSNUuVFRObQ3xdP6eYKaUjC3A05FZAXFGqygJoPnaSV
         eIpw0DN9dBgb2vrOQp0q9jPgy5kOhSOJRZmWVAJraNMPJ5kkMx0CO14ORaxEJ3rqrGtY
         rPkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=2lpZD/LVKd0FMDp1iJHIwF2l+EcQuUd+aIztrNq8ls8=;
        b=osB3rn8hATFH/JZIkU9cfN62MBqc+QGcdf+4o6XU19Skchn19At+wcIyo+bW9FKjaG
         DEYuzI/E6KrAq783nLQxRMJlpkDmTXOKFcstS7DidYmc0PgQzWGv8M6Z0OzlHvYxWPKQ
         UznTSQT8MjanI6xI55tCqgFqp4yEy+ErimcT4P8EXQir3321c0LbmrcuwfarR0r7kC+P
         SY6hruCv2J3Oc1YofRhjJ/6AP0YvySBcH7k0/DK4lhHvL8aF9liZ4tJ7hYJ9R1J73/Mz
         Hh7upFVwjSkWy3vxTiB5bz4jXZSACdOshyOLrWKW49qxcl4YUrMWXf/Eq3AO6Jr6S4pb
         QyBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW9d4BHyYMrN48OjyuSNAVsqH1YYOzMqZuD8m1Rg7+ef5Jycqjs
	vv1dXXGruie3Z/TL2zdAoRo=
X-Google-Smtp-Source: APXvYqybdLwwCKFzFkIga0dzSwHiHFoVagCGnpZ2g/jtfiBZjx15l7rYRo9I4ZdAvA+OBGy931gtCQ==
X-Received: by 2002:a5d:65cf:: with SMTP id e15mr13192289wrw.126.1575595240999;
        Thu, 05 Dec 2019 17:20:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6385:: with SMTP id x127ls2262490wmb.2.gmail; Thu, 05
 Dec 2019 17:20:40 -0800 (PST)
X-Received: by 2002:a1c:a906:: with SMTP id s6mr8213472wme.125.1575595240191;
        Thu, 05 Dec 2019 17:20:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575595240; cv=pass;
        d=google.com; s=arc-20160816;
        b=JOwLEysHiSeeOZNZLV6/8u4PZto5ZqxvFHv4pSbadHPBdvdgzUTN5gZOAMxImktnSM
         tNyi6LZuA1CuzR9EmOI59mtmdUMWDRICIGeBVHU/AWq1De3cJd01m29LfVKKv8p/RFU/
         ypFvUEk0wbBh9gZwUQfR+cFM1rxC2aZ97xILYK36IZ+rZKimI51d71yTOCBMiRzOFad+
         eMiDJhYUtK7c9UTQ4csCSo1IXWICto8muC6CLB+1CFnHMhgeeqCPTZyistgBSTTMY1L/
         fY5R2nNt88gjbKbwqA906/JB+tEQ5hEanWhQ91f8puB4MfqC4QnH2gaFoEaaY4NsBU6g
         q3rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=oIfZ1z9XdIjGLixfSstNdLq9pU5ME02oAMTRd9nkTA8=;
        b=BIMPzwdMcrVqOs0lw/8W4i9o1PysgMJ3C2rfRBUO9bs+l4PiSrXQLqi6ImXTURcX49
         qfDz+ztppvy1qeIeRSQ55LrchOuTH1waZZLfF13ny/ZBu7q2PvgYKIOAdbUBznT4aL0h
         d6DA/vvQ7HGy/jINjrjPm8469r0frRFufRzEf9Gt1IPw9J5l+ex0xcCRA7nISZJQB3hH
         JJ/Iptl8IBmYkFvZuOyF/fTrUCtxYAUmkH5ZlrcANcxZiQMjzXKcly6cOUgAomapPiJy
         yv6no+x57ooSF8cfP1spgjqXQBQXN9CRwz6fvcowyWwGwLlfSimn7Wx2Na1GDxhZVPyx
         gbqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dIUxM5wi;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40059.outbound.protection.outlook.com. [40.107.4.59])
        by gmr-mx.google.com with ESMTPS id n24si64216wmk.1.2019.12.05.17.20.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Dec 2019 17:20:40 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.59 as permitted sender) client-ip=40.107.4.59;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgxwrkcOgc2cuEsVQvbiMFBaXLOU2IXARCmX8ol/rXguMqoRbW5vkWiPQiS68FwQHmnzugrCDwou4SOVB5YfdD2HTxY2pCq7whKUf15TIKQYSFUsFozJagpqmRLpWhpcUi5kvX7TrclNuK5KjdfyJr2+Cxe/pc3d9d1Qwk/149OdN2wCKCSpt1YTyIWtd635XSruMHEDgPsqli1z9s7chIPmmZ2qz/P4ngVGkoCtT0lRwz5kHZQkeXJ39PBUwaDX1f56CeJGYGp7MNbFO1XYo2F520zU4yDqYjwQcqSiZVnPfINhdYEkdCqKT/Wnjxjz+n01OIZ4uyveXlMdF81RVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIfZ1z9XdIjGLixfSstNdLq9pU5ME02oAMTRd9nkTA8=;
 b=SJjjnvp4QjBFyUJwftPS/fNs9Cy4M2XK1uURsfRB/jgaePrii0HYluJu86IfikPEqOU3a8Oyc8ynZcnJy+vTJ/u/tQ9DGipucM5F3GD0RbHZXOXUGgrlYl3XbyU8z/sXN7Fz7s2M80nWGyxAxkareA2QEy8EcqH4INFxPg1OZ7UJuNlKx8fOcwVRhPnUyFdK8rakQLSxyfRx23Nvx5S8948lYvTfp0ADDJ99vZcLmpHpjMzZfTlceExi8Q4S/HqZnGCwNgSaCz3QAz2i9tWiSuWA7hMfFbj3i2xfiPkbAUg6Y696sslNhc4uHaQ4Mx0DgqDuPc6ND83oR4qubUO76g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com (52.135.147.15) by
 AM0PR04MB5604.eurprd04.prod.outlook.com (20.178.203.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2516.16; Fri, 6 Dec 2019 01:20:38 +0000
Received: from AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29]) by AM0PR04MB4481.eurprd04.prod.outlook.com
 ([fe80::505:87e7:6b49:3d29%7]) with mapi id 15.20.2516.014; Fri, 6 Dec 2019
 01:20:38 +0000
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
Thread-Index: AQHU5KMdy5hOXdbZ/EGjll5JmT7z0aenrFWQgAABNECAAW+IAIAAgtoggAOvBICAAI2l0A==
Date: Fri, 6 Dec 2019 01:20:38 +0000
Message-ID: <AM0PR04MB44810D3D673BC5218341A41A885F0@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <AM0PR04MB4481B3186519C11BBFEE8DBA88430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <AM0PR04MB44818E5F2BA11C16A6B9E70088430@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191203004700.cw7fgubui363mxee@carbon.xt3.it>
 <AM0PR04MB44815D033BBEC85ABBBEE5DB88420@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <20191205165031.gl2f4tbx3klq6rfy@carbon.xt3.it>
In-Reply-To: <20191205165031.gl2f4tbx3klq6rfy@carbon.xt3.it>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: fc51bb7e-efb5-46c5-b341-08d779ea80cd
x-ms-traffictypediagnostic: AM0PR04MB5604:
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-microsoft-antispam-prvs: <AM0PR04MB56048A3CDEE431720D4500D4885F0@AM0PR04MB5604.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0243E5FD68
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(189003)(199004)(71190400001)(71200400001)(11346002)(44832011)(102836004)(186003)(26005)(66556008)(66476007)(9686003)(229853002)(6916009)(55016002)(25786009)(14454004)(99286004)(7696005)(478600001)(6506007)(316002)(54906003)(81166006)(5660300002)(76116006)(8676002)(81156014)(14444005)(64756008)(74316002)(66946007)(76176011)(2906002)(66446008)(52536014)(4326008)(8936002)(86362001)(305945005)(33656002);DIR:OUT;SFP:1101;SCL:1;SRVR:AM0PR04MB5604;H:AM0PR04MB4481.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ph6ldVX8M6N5RZTkS11r7VLX+XlKFe0eOlI51bdXgYG5Aqi/dJT4LpuAdSgBY5Fs6kcf1hF74tH3e0A6VR+g8+UYfOZgfrUmflDSTjFD+jVY2Z35tLoTgrLD7b+VsC9HjNi3n16OEd0LjUtYGpcc8x1RuvzpsqXIyvIIJ/PAmSWe/X533R/IvsxRxc84OwRtJDN9iILgQIIwXWoRFSfK1T0KPirAKyOF3B6ji7u8TNf3+2k+NOLXCDyvEFWRmu4dp64UO57ArxPhSGycVI49v8/fIFUXuI/apyeXVUxZgbBTqKxOpSDmUWij7sdPrH4qiFrVQpKCwAQplrOXzNe4Qux6ofqsaS7cuFug8OKcJGOyZe1pQY5o8uMDJGsyTHFLKR5V9OB3aHmx3wYaAqYo5XN8hvG6JLmga7lPHIU83A6f3/Sl9NSGeqxNF+81gY4M
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc51bb7e-efb5-46c5-b341-08d779ea80cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Dec 2019 01:20:38.5817
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uwna3/WODfx10Fx5EHn+WgLzOWMUBj8oTG3KcREK7gxcCwd+8dpLY/LtP7V7qusJFmUOpDVl8CHbLsB5cS9pzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5604
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dIUxM5wi;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.59 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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
> On Tue, Dec 03, 2019 at 08:41:13AM +0000, Peng Fan wrote:
> > > On Mon, Dec 02, 2019 at 02:52:04AM +0000, Peng Fan wrote:
> > > > > I am reading the patchset, but this patchset could not resolve
> > > > > the cache contention between root cell Linux and inmate cell,
> > > > > right? It only address the cache contention inside the inmate
> > > > > cell, if I understand
> > > correctly.
> > >
> > > This is correct.  The documentation reads:
> > >
> > > | Since Jailhouse is currently lacking SMMU support, and since the
> > > | colored memory mapping must be provided to DMA devices to allow
> > > | them a coherent memory view, coloring for this kind of devices is
> > > | not available. This also explains why also coloring support for
> > > | the Linux root cell is not provided, although possible and tested
> > > | with a simple hot remapping procedure.
> > >
> > > > > Is there any v2 plan to address the upper issue?
> > >
> > > Forward porting to master and integration with SMMU support are the
> > > two most important task on my team TODO list. Once these steps are
> > > done, it will be very easy to also have root-cell colouring. I have
> > > planned the firsts for 20Q1.
> >
>=20
> > NXP i.MX jailhouse has smmu-v2 support, but it currently conflicts
> > with
> > smmu-v3 code in upstream. I have not find time to restructure v2 code.
> > You could refer if you need v2.
>=20
> I know. Do you have plans to merge SMMU-v2 support in upstream? It is ver=
y
> important for colouring Linux, such as the root-cell. But I am sure that =
many
> others than me are waiting for it.

My design only added smmu-v2 for inmate Linux, not take root cell into
consideration. I am moving to 0.11 release, so will take some time
to move the code to 0.11, then post upstream, mostly in Jan 2020.

>=20
> Also, since v3 support is only preliminary and the SMMU is not really usa=
ble,
> as far as I understand, and since v3 devices are quite less common, perha=
ps
> the v2 support can be integrated easier and earlier than you think.
>=20
> > > > > To address root cell color issue, 1:1 mapping in root cell might
> > > > > not work, because IPA/PA needs a remap, but this will waste PA
> > > > > space, if inmate only need a small area PA space. Seems
> > > > > root/inmate cache contention is hard to avoid.
> > >
> > > Beside root cell colouring, PA waste is a potential issue of
> > > colouring itself, whenever you have heterogeneous memory needs
> > > across cells. Still, on most high-end systems the size of the shared
> > > cache easily allows for 8 or 16 colours, which means that the
> > > smallest PA granularity to assign to a given cell is 1/8 or 1/16, whi=
ch is an
> acceptable limitation.
> >
> > Without SMMU, if enabling color for root-cell, it means needs to cut
> > off at least 1/8 or 1/16 memory of the whole dram space from root cell.
>=20
> For example, 1/16 of 2GiB DRAM looks expendable.
>=20
> > CMA is not easy to fix here...
>=20
> I have not ever used CMA. Does it operate without SMMU mediation (i.e.
> translation)?

CMA requires large chunk of physical continues memory, with SMMU it is not
a problem. Without SMMU, it is not possible to find large chunk physical
memory with color enabled.

Regards,
Peng.

>=20
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
jailhouse-dev/AM0PR04MB44810D3D673BC5218341A41A885F0%40AM0PR04MB4481.eurprd=
04.prod.outlook.com.
