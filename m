Return-Path: <jailhouse-dev+bncBCWKP54GYYIRBJNGW2FAMGQEKAFXF4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id A818A416E54
	for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 10:58:13 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923sf9581591edn.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 24 Sep 2021 01:58:13 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1632473893; cv=pass;
        d=google.com; s=arc-20160816;
        b=fk5Br74jh8X20WSudd3Oo1CuxigS17E+RGgvHZdEVVU8fPdBViQwhbcj6Gr9GSffRS
         wLOsa3S16jG08FzblXxKIy2EtFTNrVx3b7YqGPkXhsWfkieoohSTroNd+61YAFcvculH
         rFSjptjNdKx/JRQvmo1lZUH25+NtW+cEhX1w7afuoYESxsFoZgSgKMpRFtJ79L/gUBBU
         WRX1fX9Dq7QgCv69vzangySyLDgmb4fZho8tyi24Zaxbc4a1ltpOcsKFtRV3M3qO7m9a
         J3ss10icU8OnPaAOixHouq/b06v9jGXcLTFneT6NLs2iMkgVVAWeDR3e8ohu3nVprJuU
         xz3w==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:sender:dkim-signature;
        bh=lZp6GOe7ym6T614dQ6aC83zaCkwuuPcLGzMjnzZNpzw=;
        b=OKTAsYFZjFNMU8lePI0c+LVEZT/KwLi2rXMQzdULNWPg35khN52sKYNoHywjaq7ehd
         XJgaVLWjZGlus8U1/W7wcTjlS1i7ded/X0ezRKsWFPS3iYYy5EKINgMoiUawu60DiyLe
         Hi2H8Jdc8itjaZIajUA2b6heAsq3je7bpoP2gv7YgvWv2eMr1kwcV5k2+ZgkBfWsXAq4
         xvK+noQpWYbm9FPgjZBBgfFJnUmAxOmoOacuc5yMn+2lEabsiczJVJrpBLqaqfCEzp0z
         wpmQeTTua2dqYSxkPHRdDHNkDw/Kja+fl3XU95AKHearJcS4Jq5hkFmCAxlyINz+phDq
         KeRg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LJAOTldC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lZp6GOe7ym6T614dQ6aC83zaCkwuuPcLGzMjnzZNpzw=;
        b=SBnfWQL9AND+EWWxBhubiUhJcBRptvpS/9Jm5C7FgBq8a0L04yv82ObGvk/Ud76ATx
         tZ261cSJUUGKtMaCieiGan66yrkkhMlup4UO7QzoWHIACwBWaDl/deyQo5Zjq1MqPTcZ
         y+yW5KKvw7GpEbTG5G8paaLaRxRH3rAlJk4Y/hKIolQJ9ZC7O85A+yvk0BynR788flJB
         MBApOLODBv8lA8KzcM2kw472CZ444omjiA7yLSsUmSyEsXm/m8gzw/SHmC3zmmezD41G
         +wqz1eOzjYwmw5xP8IdVvoIRNKC5/flbUBx0NhfXU3H9k12gcjWHi7g3RQTGzbEVbqh5
         DbAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lZp6GOe7ym6T614dQ6aC83zaCkwuuPcLGzMjnzZNpzw=;
        b=hdTxxFK486y4gntuiIsAD+xZy4tS05aPbYloEVbIJC4BY1u+kEOZKZG/zZl87zNVvU
         Mjg+ZkACT9OPgktXTftZC68ouRVgEFkqyKnzNVauIGFegC8Bv7CAKV8gS3KDOhb2OP0h
         VClK7lAzuROFMdNcutjb8p4eZj2Yszt0b7sZUsZ2JRYyOSTjcyt+x1XVoHocT2r5NAMS
         T9aduwrv5djbEtooLkwrFNnQiJYbkINFqiEXP+jUpb82Cku488dWkNQxhY4ypZ8y0TDm
         qAxS0G71/vBg79ypOHsuw7Ucj9I/gWSBj2OUYVRbzbsVW2IwtpmfDxJDceiClBHfMna2
         Hk7w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Jpt2rccbPxF6gDrNGATHhUWzrIY2vh5Zj8HUXFnjAEpo4gnle
	GdZlW0pHXvfCMbxkxzQbU+k=
X-Google-Smtp-Source: ABdhPJzwUegihWtj1ia+1D/9bm/DEQqxhnNvKIopVDkO4Bg6klP3JXmWUE71iOTIFUGj01UgHNyqTw==
X-Received: by 2002:a50:e08c:: with SMTP id f12mr3777388edl.178.1632473893472;
        Fri, 24 Sep 2021 01:58:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c944:: with SMTP id h4ls8233796edt.1.gmail; Fri, 24 Sep
 2021 01:58:12 -0700 (PDT)
X-Received: by 2002:a50:9d44:: with SMTP id j4mr3722468edk.173.1632473892273;
        Fri, 24 Sep 2021 01:58:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1632473892; cv=pass;
        d=google.com; s=arc-20160816;
        b=TTwVZkSVzq8/i3WkzkgdlJ9La/QV6EbAZADAFgOzO/ZfQZvoz7XQceKJxMu6iG7IaM
         nfVVkCPRD8OEhRE5chuPjC+Aubl8mja8nM6cq9hnesTosIEIwNKD0zVxGXYkD1QQgVkF
         CtnwUD+sHAZiVXKDDR7kIxUr7LH3Gq/LhwdLdN+JgIGIDh+AXfGU7SAwZHu14f4G5/rL
         3JJg3oCNFwLAuDAAYCLIPRd6yg8IUObRK2gsmpvCdXetKqPUZG9CkoAsbZx+2E5FRh2x
         JCu8vzTU6F4PSQK+4JDSzjSTmr3wXERmXt3LRSACfoE66/igL0nlowtSZpMl6PjO9jj0
         +Xcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from:dkim-signature;
        bh=+h8nuWrJAcek3YVKDiMW46xQZk0xR5Cq1Q9igEL/T1w=;
        b=tw+a7Se7NgES032qAkekWfXRDYfMADiyTgZRGK62G4ekTDezRueOJTCeuJrHF1Wefr
         JCW2M8RcG8M/Ss4o7KXbf19UgQqVzsiVvAtd3LHg6mSnaX2Pxd4/HPoazlWL0hC0i9ef
         SV3JTP5sPWV8q/XUvQh3x8fFNuwpxQJSZabSk2XZSdp4g+M2segfKfdzvshNYrJcsk/P
         ojmMsitK7nE/mCYTD8p/HXbR9KkglOrtA4g4YNT1G2IiXzxUpFxABzhNo+dSrtoLyzwU
         i+XpaxNXXUrJFWdFyY+sy/qkv/a8HyCk1UwR0tBB/clP5sag2E8mAuasHJjWpol99o6w
         41dA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=LJAOTldC;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40045.outbound.protection.outlook.com. [40.107.4.45])
        by gmr-mx.google.com with ESMTPS id j19si491560edp.2.2021.09.24.01.58.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Sep 2021 01:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.4.45 as permitted sender) client-ip=40.107.4.45;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EQILfZZkucttsVSXNGGA9/74qkCizB1NuZO5Ix6Y6ELO565CMAif4obBfiwlCWngvmG5yXbIngk0sOKsbxsJtThFDaPMFyjrNUr2XJzKfFcbUaMpcbcyoWbPJ2PrB0iVgVgMtPN+QdfTRZVXCdxhyz8Cc2+f8g8t4a5fv9TUYatmElPaXoRLkJzinPpGi2HOx4udRRi49nH3GVokhPiq6NuIOH+GVeyaD6G3OvTRD/84cFDd6BvR5wcANJ6Ds1HR07j2mxGaOyzYtBcI0i4wIUn+LWkO2M2EHxe2RQ36TDWKJaGhhCjA2JQZE5Vt30Gs9xljKDfhR/Jr8J0NTRLKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=+h8nuWrJAcek3YVKDiMW46xQZk0xR5Cq1Q9igEL/T1w=;
 b=CODYamusqxXSgfjpZ7WjSxfDIT3TJnTmLCPMifCofw8/g4Ti7YdTFbo5GbRzGPycBpaFevJ+zOlUnToiI9bYeajIW5RRQXL+v1WpwR8SPlXlsSA6nSh322aiVGS/Q9P6VZ05n4+G36ETmXvgmLo/5Bt0DQBSlIV+lDEt9UCdAyqkJNF7hLjS8KXc7mW4gObF0fvKbqU+0+sVVwmZ+eIVhbubhJq4qt8rz4VOP8jdrEp/f39AHsOAQjl41DotaoBs5t9yeQiuaym5JA5Lwr/5T2jfgi1fS9DpYBoeVUfoLbonzqerFIDPv/TFVFJeIEQWQ6N4w163WGtp5CaLe4QHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB7PR04MB4762.eurprd04.prod.outlook.com (2603:10a6:10:16::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 08:58:10 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::4868:6843:a39f:aa53%4]) with mapi id 15.20.4523.023; Fri, 24 Sep 2021
 08:58:10 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: ioremap_page_range force nx in linux 5.15
Thread-Topic: ioremap_page_range force nx in linux 5.15
Thread-Index: AdexIhvcCuYcA7L+Td6mnj9tkqcxow==
Date: Fri, 24 Sep 2021 08:58:10 +0000
Message-ID: <DB6PR0402MB276022E2F0E48908180F2DA188A49@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1e744ed2-8c48-4486-25e3-08d97f396f62
x-ms-traffictypediagnostic: DB7PR04MB4762:
x-microsoft-antispam-prvs: <DB7PR04MB47620DC45A4FAD0D3C1726D888A49@DB7PR04MB4762.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:208;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PUS4UikkPvr5rVt9RUDO/Nl6bY2Gl9xRSYA39t3ZqnUhczHYvtCKP2Q/2G3uueN1wO6vQIhuxXmfGg3mt/fmn3sArAtJ1UaDzfHrHRr0BOFPZmV7Om20kJZS7g8c/NgNdLeQAQCq/GF50nJat0AvjQXNoLtQ9qdZ5mnNYavOX3t0Ays7EZp8agIWNi7HwQFi0u7ybZ3/uxB1eOa27vGX6Cfum/Q+oMmB68lpIiaiWi2RShLLtOI56gpTETTsA4+ODMjXWWqIxsTGojnldVTqpKPmVbEVqVTtw58opXOQXT/VipApyPZFKFx5oEdWkSEkUee8pPK1u3f2vDSoCTBslv/6ImKd5oRvyi5y7L76Gvbs4/MwZR5whMehsTKxbK+Lx5beCdtCBBwKEMFfefy+e3Ppe7SCKEU3NDBM9VmGgAqrNtaVuWm4DBg7PQ5CBKRMO8SZS8TsbisiyAU4ByIhk9FFObLCtI49+4eVWycV4NprIH61YE3zE2rGFJVGXNbPIIqmsTEMs8VEFxoDO9FVTPh2L9FEFA9cJMeOC0SyAxuoMOMVecGuLhdCVjvYdam9022DkXSmc/vwQN7zjhRAZ1QuGKW052WtNGOIsb3bMCKCOg5H0LzJFYia7t7B0vWbRmDCPZmQTo40CQKnpAPJfhJJgOptKQEmVCNKo6YW9KjKp46DTx7b7ODCILs8zyimE7DJQCUyZvrOsWmJUVothMxb4JBCg+fo9QQrRWWQmHd+pqxRBMkLSlWuNwJSh8jLL/r/bqGRsK+pEC5Pc/BizI1lEqD0bhrP2eErl+uk8x0=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(7696005)(55016002)(26005)(8676002)(76116006)(33656002)(44832011)(8936002)(508600001)(186003)(71200400001)(9686003)(38070700005)(86362001)(966005)(6506007)(2906002)(52536014)(316002)(6916009)(38100700002)(5660300002)(66946007)(66556008)(122000001)(4326008)(66446008)(66476007)(64756008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2sj/cou0WDgbnPFYCZFrgeNIA0Eza2lsZfbDuBuR+9d/Vq2nSy0nNwGW/vp9?=
 =?us-ascii?Q?oLaSqUFYwc/DgEsS6c+GFMphqVZYKazXbteeBzg+PPL72E8IE/QLTQGUGof4?=
 =?us-ascii?Q?17C2OxU3nzANIwNrsHhyOZ1NYe7XDAFerDqlJ7mC5sJWaxoLrCYmYk8bM/E8?=
 =?us-ascii?Q?IMf1WXneCepxsbk6vDg4lJr6pXsiiIWpHohkYGFlqUB7QBV5t4veFMnw8xsq?=
 =?us-ascii?Q?F6bkToFpRCloiuHHMm614JUwtYqI2WmwguoEqSCgzf52eeKfO+0bTPf5tJMK?=
 =?us-ascii?Q?YklvuBIs2pkOOxJfEJHfNHc8mp1RuxCDXatgb2D2a/lVW5udvj63s2u3pDGk?=
 =?us-ascii?Q?Y/XPZc0DjqbShJEeG3Y/0b6HWWyemGcP7ZSH47SwtfI4CqdA50hI10hIxN25?=
 =?us-ascii?Q?pILK1IPN2rR7nWf+SBbwIlNWm2NL4awacPOT0GB9DejoySBomt5ZNXv5FsQT?=
 =?us-ascii?Q?JO7obIjGIlhlCSzGI3fPfeaRPQG0LOHRN552CRCPL+LdnmG0+5ziulQhcA6J?=
 =?us-ascii?Q?pdNIZOeFxfOQyk1crnxe4CYalE4sSdxOiMtvIHMDn5qPPFon6eQfwIwbiacQ?=
 =?us-ascii?Q?J/8AvNFO+6IbH3EvU8SpFx0oZ8ac3pfcohQSL9wzmwm+jKhgZKHDARRLEQZ+?=
 =?us-ascii?Q?VN7Y/tgblB5/6I1UEVew/vgpquEhvdmiJ9BduEAG4VtWmAKsQJv+WeoZhDIm?=
 =?us-ascii?Q?K3sX+c7mXu9vlZRiLunbaXQtZlPb6/dF7CH4wmM/8TeocWd//h2YaZR0ZMIV?=
 =?us-ascii?Q?V6yMqAPVXjjCKflAva/Z5HMARik8YHT2oP3RvCIJGzOuK1StvsfNdVCn4ewp?=
 =?us-ascii?Q?g6IoHXM755c0FccVnmXQLbquHrx0TCsKulPPqIdzClRBOC4wv6lQ0cIEzRU5?=
 =?us-ascii?Q?riWpszD+aWa/kX5ycduVaqYmE5aF0qDS4YSthCTVeJgFbOCShQs3ZO4vrAY8?=
 =?us-ascii?Q?KWf7/09PdO0ho9zjsBgfsGa6WV/wHEFmdzqAWGHa87UAKKsNAaqc+OCMpbrB?=
 =?us-ascii?Q?kxY8c6Mq5rdJdUWY9OLSLBt5YS5dCAiDbytSxparpF/xBI7xUtZAZXeiHoUR?=
 =?us-ascii?Q?c0MI9Kns+YZuXCE+tq146ZB1ANzx/K722qCUS65BLA8OjeLoQAuvxcC1T3LJ?=
 =?us-ascii?Q?wtzV+mZ0Nly1pVH9b4fxZoZ2yGSYapVA62gdWoyM+5WrJC+Io31ag7pT/G8B?=
 =?us-ascii?Q?2npntS3uEZ0qTWWLAf23IZcf2jhMcFUYthfTuik2N1Ji2E3vd0NB0F1NEpsE?=
 =?us-ascii?Q?ip4qAZQoI4xqJNGzoi0FIaUAKM8Ui31mSmkgLpWSC35CIl4qfQTUwdn23g07?=
 =?us-ascii?Q?aOoB8FIFd7nX+djeiHhQUKzI?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e744ed2-8c48-4486-25e3-08d97f396f62
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2021 08:58:10.6913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AXSjHFHf/gN3wul7YGnvYUKpDObfA5Y0aOwS7Vkpi5CmiITjI4xHd2MwFUmTF9M1NSRMfM76ED9VoxZEKrRJJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB4762
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=LJAOTldC;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.4.45 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

Jan,

With the commit, enter_hypervisor->entry will not work anymore, because it is not
executable now! Any suggestion?

commit 8491502f787c4a902bd4f223b578ef47d3490264
Author: Christoph Hellwig <hch@lst.de>
Date:   Tue Sep 7 19:56:04 2021 -0700

    mm: don't allow executable ioremap mappings

    There is no need to execute from iomem (and most platforms it is
    impossible anyway), so add the pgprot_nx() call similar to vmap.

    Link: https://lkml.kernel.org/r/20210824091259.1324527-3-hch@lst.de
    Signed-off-by: Christoph Hellwig <hch@lst.de>
    Cc: Nicholas Piggin <npiggin@gmail.com>
    Cc: Peter Zijlstra <peterz@infradead.org>
    Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
    Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e44983fb2d156..3055f04b486bb 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -316,7 +316,7 @@ int ioremap_page_range(unsigned long addr, unsigned long end,
 {
        int err;

-       err = vmap_range_noflush(addr, end, phys_addr, prot,
+       err = vmap_range_noflush(addr, end, phys_addr, pgprot_nx(prot),
                                 ioremap_max_page_shift);
        flush_cache_vmap(addr, end);
        return err;

Thanks,
Peng

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB276022E2F0E48908180F2DA188A49%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
