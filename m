Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBXGDZGAAMGQEF5QB6UQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6191D306E06
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 08:03:57 +0100 (CET)
Received: by mail-lj1-x23d.google.com with SMTP id r23sf2593412ljm.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 Jan 2021 23:03:57 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611817437; cv=pass;
        d=google.com; s=arc-20160816;
        b=tELQfdvRzGoYG4gQzDOC/jE/QzQt4bsbD7eR7Am4OskN+5yK7aqa+Vb2XhiQSykth5
         FHedfonk6Qa6YvCQzevh1IkJpZxKEU+k8GjUpn8sOB9cO6sf5fUabbBXmz/QiXqhQvie
         sREPuyvjiDQWqkMnYQq2Nj9fRbUmKvuirhdXdG68XjnZZCOF1F6c4PUGUZCkQbhGEG+5
         +/366SIpuEOZFQbj3ibjuNzdl0QabeFlqUTIYkLrp2ZkQ2OyHr4S7bfiJnA9NYuWK9d9
         IdcoHGnIvkiAZXBotkxtGR2qDNs32+RhULw+pQPs6tJvWz67k8mxV1schTQ+A6RKwQ2O
         baFQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=cwq/ZYA9f0QsTZIjWM2qsBbEY+fYMvGVJkQoDIgAuCM=;
        b=vOxh8t2GShC3feLMGq1TpYuTVqY/WuWRHCxVDLwBzbAUYmJ5bvape7FEIRgnVBCW4+
         XwI3mZrM3Ik6SrW4vTUVwpXrFaKs9apeG+s2g4oFnS1atr1hMyu8kkA9ScTUzZ0tgjh6
         QhphewUYggu+D7C2dQlEgCgoH8iXxnwmEzhFiJk4dVrxAl/oiZ1AzEO3W7exF6tGM7x/
         WnOfX2nbCO0eoevR0/WedIvv/ghR2ovi4ZXoWIyhqipzmqsn+A241hmfij86R1sSvGSC
         wxZrJD0IXr/AomBMGgr0NjSNETcFd9yT4RQBu49UlIvNI/7N4mJgBxFtYy+kKJGHpBJO
         mfAg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TSwAS4D8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cwq/ZYA9f0QsTZIjWM2qsBbEY+fYMvGVJkQoDIgAuCM=;
        b=FU1J++lBIdGB1HVxMUHxg96iP4JtDQ7cPcOJpQOiDl9f91y5vE42WZUhuAHCEjDx/z
         aGZltSZVumdpQrf9xoEFDNow7492i0WOMzddiq/3FpLiY7Pkof8Q2s7Ku9fBJ6C/88BZ
         WIvuZjd7yO+gPKeCmlGm/54qVZz9hts9+d52FNGCIWKcvhHKz1mCED1bEkX+Jla/ry2d
         ZQuGVoWw0NGCIG6RiF8b4fAaAgn2jY2w2SDH1vjBv+lbEcSHiWLAhMcgp8GHO9lOmO9E
         sE882gQtLb1ufnWfCNr6680GTtSQiAHViVmYcwCQDTSYgWHlt580A/9DwVeT2jjckpZp
         XsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cwq/ZYA9f0QsTZIjWM2qsBbEY+fYMvGVJkQoDIgAuCM=;
        b=FYp2wPLkRJRDVeC51EPXNI1acoUJ1Nd/X3AoWXeVsSfXngYe5V6u4j41e4KaI42jbd
         JTOazOUyuTQzixvxf/9I40iRtsr7AluVYPoFxqgHTJJAJ1tTHUIp+PJnc61NzXyRUbLa
         rhfgZsWDbTPRve5O9q1p4njftHzhnpHSHLbM3yBngpscSVImlkcNjiAhxmJohG9UKnn3
         +PHj39ngXSKKwzbZqWUhBztIthOA1lM1gM5fu4MW/pVQd2ugKo6SARBqVRtb8K2KFL/k
         gKm9yZxRGkK0FRIZNH0R8z+tEC2vx+E4LmTAeqouw97JAIu2wOoLK8tWR3bBPlU80OX3
         Ya/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532qhotMvSSop4t45OymH5FJ2hj6RxvadsEZTH3A/zWhb1EydeFM
	Ui8BOLaVEGGeMVusQkDOx/I=
X-Google-Smtp-Source: ABdhPJwvcyyE2Zfc+9EKfHLzhPDxQtSkMAFDVph5RFv2DS/TV09LflGZbzPyafQm9ZGa+GIXbm7jiw==
X-Received: by 2002:a2e:b0ee:: with SMTP id h14mr7922506ljl.31.1611817436849;
        Wed, 27 Jan 2021 23:03:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3993:: with SMTP id j19ls2995852lfu.3.gmail; Wed,
 27 Jan 2021 23:03:55 -0800 (PST)
X-Received: by 2002:a05:6512:3772:: with SMTP id z18mr6617127lft.620.1611817435793;
        Wed, 27 Jan 2021 23:03:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611817435; cv=pass;
        d=google.com; s=arc-20160816;
        b=SRTnN4TWfBRx2ZYSrQzYyvm5IwtWgGTj6rY2oGqYFxBjD3d6U+rQrTWU9bC+4MlQXy
         lIbaj/mhC82UU4kDlORPcHCzOx4HmEEGn/6+CM4v2phKqnVQKcZFTzclZFBKjDB+3WNO
         Afzb7BMftNbK1FG9gCG4T9Tl77QCBTviKUPgkjlyvixASNUxSYD5xRVIsH5Ipp7dyi9a
         YLTtsLVvrCsmB0haLcsBU1IjGPLf55Va3erlEeBNmfI+FkjsXxtEFWy1CgUq0hMU8nQu
         SkHUVIHaNnEh+9nVr6vjYUbcKyGQzDO2z7N6wIhP3tIYT2mUyhvmrykQBbAT7jrPUtLE
         3v9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=VYrd1fL2R9p6JieQcQ5kYew4ONfRkpW7F5+yacmvZh4=;
        b=MJszMEOu+O++wDuiNBYW1RDI8HZWyqvf7HS+DlD/ZYJPP57pT0xACtJtGWhGd1vGoC
         0qPk3Y/VHj9khphhTefg52n7Au2PMoBwle72QMSXgb0UbB/mqEdOxIVUIo4FbB4z8UB0
         cB1xcIR7HdfTsQsYOiBTar2SDa/IJJM5oH8T4m0L2oNF80rElRUGNEcwfeKespqIXjZa
         qD46/afM1l027ckfjBfXbpcfv+HgcwxevcOWLzTdb63MdoaFwMPjqvIf1CqsSOfbJAcn
         pXxHUg8XGXDLzznfpc5k1t5TOU+j+Hlj4NpoTzPdF01BDTIFyfwmbkRP/Fuw2bpcbtOJ
         Pd6A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=TSwAS4D8;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-eopbgr70050.outbound.protection.outlook.com. [40.107.7.50])
        by gmr-mx.google.com with ESMTPS id y6si210265ljn.3.2021.01.27.23.03.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Jan 2021 23:03:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.7.50 as permitted sender) client-ip=40.107.7.50;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YSTeSRliHMyC/7UVKFS+pPFkLGBV+YF6BD/6P/ElEBxyOegmN/5x7y3I4wuNqb34IhXk3PRB1WgrSVmH5sJRSLxFJr6yaan8u+Rf+1D9MpnSM0M3z7CNnMwu+rLMcvINTlB206QKBkCGBmlnuWnkctatpe3tMqlva4s2JrSE2iip+Nmvc2Z9+ER/w8RxReDZvjaINZsXfNrnnIZ1NoNTwT30a3+2oSUO+jK6yFP6rWeq4Hsq8qu3ns+f7tUsWYrUyCG6am6K5vC5yjIuSL/eJi9l2XcAKofu6c0KnMqN26Phd5x2bIgvlGdpEkjIpYz2UnRot+5EAuZr70bAY1RVjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VYrd1fL2R9p6JieQcQ5kYew4ONfRkpW7F5+yacmvZh4=;
 b=TiNj98rurDd6x0sZQ6lIFlH9MWSF7OAWOAYf3k8QdCR3nmzPqX6f/ZJ0HjiB8kfsuV+1mvBDootBqq5cFK03NnfXT9ZQjXIFhxeY3LAmclyg9339oDH1NHp0KbIIkwGp66w1Z6993v0llgrpqqGyE7BajJEbFds/QQ6P82/OYLWCPci3PcC2MY3eum58AcbE+XTHGvNy8Ue8ImDGdusJl/ATn3Qp+/RHgo9CxLVKA0Zg2VFy3aoaP+eGgWHsa6No10PCbSBZnc+IWkhIdpmhsfV4YD7otc3GUueyoVgTj0rHNAOYCKeD7SQwDEEirc/j+3VnTemOr9FrRqYDmP0QIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0401MB2535.eurprd04.prod.outlook.com (2603:10a6:4:34::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 28 Jan
 2021 07:03:51 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::d58c:d479:d094:43d0%9]) with mapi id 15.20.3784.019; Thu, 28 Jan 2021
 07:03:51 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Henning Schild <henning.schild@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Jan
 Kiszka <jan.kiszka@siemens.com>, Alice Guo <alice.guo@nxp.com>
Subject: RE: ivshmem-net issue
Thread-Topic: ivshmem-net issue
Thread-Index: Adb0i/jBtp5nKiTfRr2PQZyagum/CgAUncSAAA2R3dAAC5rjgAAAG9xw
Date: Thu, 28 Jan 2021 07:03:51 +0000
Message-ID: <DB6PR0402MB276057E778B7AE525825373F88BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <DB6PR0402MB2760C0BAFC4117D229FDD5E888BB0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
	<20210127195845.348673a3@md1za8fc.ad001.siemens.net>
	<DB6PR0402MB2760E2A8D41ACC217410A85388BA9@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <20210128075935.648f6522@md1za8fc.ad001.siemens.net>
In-Reply-To: <20210128075935.648f6522@md1za8fc.ad001.siemens.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: b0b8305b-1fca-4f2d-9302-08d8c35ade18
x-ms-traffictypediagnostic: DB6PR0401MB2535:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0401MB2535D70EBA7EA2E526E2A15A88BA9@DB6PR0401MB2535.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OZ1pH7YO3LM6sZ8+Rz34oMYLAl2kFEYoBVAHjueGFzKJdOau+zUMuShaHc9t+dU4tFqjwNTTAAVZJ0wBNi7rmJOeUPLy6Dcoo+vMg/CA2Pm+d1iG+jFZ+7mBWlm8q4NcTKSj5uMeaqVM4BDnTcikVQRJsSczQdQFTCal0F1Ocjlh76B3m+499oVCuMPEcEmeBg5mv3LgWr6Pi8MCNoqF4cK7PAnbYWIj2YF+du1d2td8Q0gHYMfTmhQ8wmsfoWOX7S25tXM1GgPrXqXhS0VU045qynX19txpYhh7hZPJ1uaycH1aQYxvXy5eFz7NmVirXacQ/AFy/HNJ6U3pGtZFM7HPucJ2aTN6bCJ6Uj5u+zreXnwMTdDw5uVXWblAzUozHT+mAGnffg6jjZUXr0fElUzj8A7vCT2SrP1Jg6OorFJqbrvyR1D+GSBmbKvqZ6wJg1+wqyVj/jYA2dnL9XCFr9p6fl+w4M8rBDZPSR2WEKo6/Q/Ag/vqTvW4kwoY6AP+ettXV3PSFW3ZZSwgRisULw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(39860400002)(366004)(396003)(86362001)(9686003)(7696005)(2906002)(66446008)(6506007)(83380400001)(52536014)(3480700007)(76116006)(8936002)(66946007)(8676002)(26005)(33656002)(54906003)(64756008)(6916009)(5660300002)(186003)(478600001)(44832011)(66476007)(316002)(71200400001)(66556008)(4326008)(55016002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?0AKnHx2ikPf3PaP4hTf0pB16seE5Xdq7lOkVSqm/L7ae4TrDfL/it3pm3F6u?=
 =?us-ascii?Q?VlzMBj+sBrhGPnVHxFPT5oaZGgo4FhhfD1dUPorqhK+xchU6A5SdxyzdCzio?=
 =?us-ascii?Q?dtuLqTeSMn+5Z/85pzVB4piuScg9zJpl1TmCZYwo+sLbxZ1IrWhCcVXbXZVe?=
 =?us-ascii?Q?uZpp3rfMTPTWVbQWE2G966uOoHt/xu0gd7EpOQY6TaLXC+2z7WgVg6WIohl/?=
 =?us-ascii?Q?9c2mNCeKfgF/ui6TBoC+Gp1O5e52kOmJna7wOH3LCThYGQtreF8m/IcTu8a7?=
 =?us-ascii?Q?7mwDSIWA6cVBfBFJbjLToIG66k8E4uT/GfIMri3C58Fo1FtGu3SKZ0NZLnrS?=
 =?us-ascii?Q?RJ/IqSDet30Rk5mH2r7foAcFPq1LbuH5NgiJazinU1V8qDcBrt6geXyAmKhw?=
 =?us-ascii?Q?gVJH5AibFkry9govgP9nWTkYvEOLaUU9q1s06cGOEjDe3BasqLKqC0TDsSCC?=
 =?us-ascii?Q?amOwwaGJCIRiZwW1s99v6A07j3A7ChJ+PVd+k4UZ+JQPH1E+I4U4HUTv/31q?=
 =?us-ascii?Q?1dI3UTBHOTknmF/nCm28JPuk84Zu+zXb7xVCPj20fhbJzZtRkQwmuU1uGX9n?=
 =?us-ascii?Q?qdLGilKnxvTCOWTZu2JYz/sYlTfaCpzcCsKrD3E5ioof7BwZ4j+v5B4PiHb7?=
 =?us-ascii?Q?O1eU1qyq3WvsbKK8LtX/rqiQuImWPGVu6hNGLrVpL2pf1eZZArDUHSoEwFff?=
 =?us-ascii?Q?seFNb2pTbg2SAfrL4HDHdm+VC6uXLcQsY7Dg4wkNg1MkTGieI2ZVNlnAQwJM?=
 =?us-ascii?Q?mVTvcKHabiNTBAXh82+Tgzh2QmhhhOV5OwiT5lh1dye0N1qK0JFVkyDCzTOF?=
 =?us-ascii?Q?R4BSQXczjyMMNGvOBxh256KIEaPbpvKojOvo7iNG9HHpGVGH2Szn+KN8BJkl?=
 =?us-ascii?Q?8MQ6NOHGY3R/4FdJd7WfOi4oFRuqD8nycZfrFiUgsg1cRzgYUgEEwNkNsjrb?=
 =?us-ascii?Q?k3nhUoyiQZSp7EidV4Tpr9XXlzRd12qZeWgMCTfwqoCU08j0J8B5PmD3KfT8?=
 =?us-ascii?Q?haXQ0mUmuNATY7XfbqbCUUrGLuxxGrPWxiEx4ZucS8sMybpBvzFsu1RzjLsV?=
 =?us-ascii?Q?sHd6X17N?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b8305b-1fca-4f2d-9302-08d8c35ade18
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2021 07:03:51.2101
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b3U44jWZUwO7cu26qMfC7GFlSeecZBXlY10mKiAZI48V3VMHo1a13xl/pfVvIPH6ahYhRWbhzcf1WlGxV++2sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2535
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=TSwAS4D8;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.7.50 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: ivshmem-net issue
> 
> On Thu, 28 Jan 2021 01:28:32 +0000
> Peng Fan <peng.fan@nxp.com> wrote:
> 
> > > Subject: Re: ivshmem-net issue
> > >
> > > On Wed, 27 Jan 2021 09:08:28 +0000
> > > Peng Fan <peng.fan@nxp.com> wrote:
> > >
> > > > Hi Jan,
> > > >
> > > > When booting inmate Linux, I have ivshmem-net configured. In root
> > > > cell it shows as eth2.
> > > >
> > > > I monitor system network, and see eth2 is assigned a random
> > > > address.
> > >
> > > This is not "random", this is where some dhcp-clients end up when
> > > they do not receive an answer to their requests. It is a fallback
> > > when there is no proper DHCP server and machines still want to gain
> > > an address to potentially communicate. (zeroconf APIPA)
> > >
> > > So it is worth checking the DHCP server to see why it did not hand
> > > out an IP. Maybe because of the random MAC that Jan talked about.
> >
> > What do you mean DHCP server here? The eth2 is created by ivshmem-net,
> > it has no physical connection.
> 
> Well if you do not have a DHCP server in the other cell, you probably should
> not be running a DHCP client. And looking at the address you are running one.
> You probably do the whole setup on the kernel cmdline and that works until
> userspace goes and configures that interface as well ... again. You have to tell
> userspace that this one interface is off limits and already configured.
> How to do that depends an what is doing that, probably nm or systemd.

But seems we are not able to differentiate the ivshmem-net created eth2 and
the physical interface eth1?

Thanks,
Peng.

> 
> Henning
> 
> > Thanks,
> > Peng.
> >
> > Or maybe that
> > > MAC was taken and the client did not have a valid lease for it.
> > >
> > > Henning
> > >
> > > > [ADDR]4: eth2    inet 169.254.232.89/16 brd 169.254.255.255 scope
> > > > global eth2 valid_lft forever preferred_lft forever [ROUTE]local
> > > > 169.254.232.89 dev eth2 table local proto kernel scope host src
> > > > 169.254.232.89 [ROUTE]broadcast 169.254.255.255 dev eth2 table
> > > > local proto kernel scope link src 169.254.232.89
> > > > [ROUTE]169.254.0.0/16 dev eth2 proto kernel scope link src
> > > > 169.254.232.89 [ROUTE]broadcast 169.254.0.0 dev eth2 table local
> > > > proto kernel scope link src 169.254.232.89 [ROUTE]default dev
> > > > eth2 scope link
> > > >
> > > >
> > > > And also in route table, it added two entries going through eth2,
> > > > I not understand why it will add one entry that default use eth2
> > > > with gateway 0.0.0.0 #route Kernel IP routing table
> > > > Destination     Gateway         Genmask         Flags Metric
> Ref
> > > > Use Iface default         0.0.0.0         0.0.0.0         U
> 0
> > > >  0        0 eth2 default         _gateway        0.0.0.0
> > > UG
> > > >  0      0        0 eth1 10.193.102.0    0.0.0.0
> > > 255.255.255.0
> > > >   U     0      0        0 eth1 169.254.0.0     0.0.0.0
> > > > 255.255.0.0     U     0      0        0 eth2
> > > >
> > > > It added the eth2 route table and will break nfsroot if we using
> > > > 10.193.108.x for nfsroot server, because it will match the 1st
> > > > entry.
> > > >
> > > > This is not jailhouse hypervisor issue, I just not sure the eth2
> > > > behavior, it is systemd does that route change or we need look
> > > > into ivshmem-net to avoid update route table when creating eth2?
> > > >
> > > > Thanks,
> > > > Peng.
> > > >
> > > >
> >

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276057E778B7AE525825373F88BA9%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
