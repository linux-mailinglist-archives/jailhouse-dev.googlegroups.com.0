Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBAWX474QKGQEAJKIZZQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD1F245AC1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 04:29:23 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id w1sf6295360wro.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 16 Aug 2020 19:29:23 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597631362; cv=pass;
        d=google.com; s=arc-20160816;
        b=yZYLBA5BnIOIa1FEnyBSKIvHcF0r6/ZqDNImrE0AaD5vqeoqA6aXet6ydLzn3QMDAs
         iYzcsVVrctSdW5n15nYDVn2hYgnFkBHsEeL7+8ld5FvUjTccNqi90OTlh99v4INSo5gD
         agFiPBriimjFV09fskitCBj3D2DhKGcT+CYsuwsulpGP7rLShFUt6BybpUF/xdkGMw1v
         yolxh3UEZ/ccC1TXOBdVBzMnBHFYv6H2NLe1LNwP/M85yIyTae7rxHSDCcFuBW9VQtQ3
         ACdxIoO0E61a9J5qnvm8yjLCiC+6wEEDwiK+ACn7EV8VQ3Jvb7V+rQrWwU1gZrT7QK3p
         fh7A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=HY+flGO3dK0xjmmo6jO2hkhppTxHnZ0DI5hryuwWn38=;
        b=cJw9jxv1jRE/JOmFXaMc5uyiXCwW48LxLfJBoc4zfiW2VKWomR0NG1kwBnXyUfEhmN
         McSbcIxiAlEFxAF+utdXd8tzb6/nFNXLmEa1wI83etY7K9TUeWXdycYa6Qfl+isWaad/
         uRdRUyTGq/YJYtNXGGZcifCeYX/MpbypK3xKPgu7HQSEzSXXCCsqD8t8Z3ke0dLhwg/4
         yiB7OAbK67C52nFGkEItTFo8RwsR/o0euACz2Q1l6qk+eQrLM0eGqYEPBUr62yBYlGMj
         TwXxZjMCRfCnfbe76nyLhXB3peCjYAcJVBj3XKEjBQsW0BlTNOB0Nuuw1HC27/EnddG1
         sI0Q==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=p0ISbdsv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=HY+flGO3dK0xjmmo6jO2hkhppTxHnZ0DI5hryuwWn38=;
        b=YzhNrcajNXF6KU9RF5lhqq4/0jhaQJGc0FQ/0ngTnUybsuGRtqrFGrLS7gxEOKMUnp
         auKmkF12YJm2Pgeas/rv/l0C3t1obqPWacs1wuM+wqLVIi3EcT5Rutl5DBsMfhxflXNs
         aMszjKe4UGpB8iPlsjYsBlorvP2lYfGK8DNAwv7dXxap7+CeRlna1z0yJ5mOPkpDjUXX
         ZybfSlVPKtRMtL+hicMMgN9IqwzqQN+t4dErIWzmAMYMNarVTsLsw+UUVjsAGblu8a7b
         WzxxJUqkLTv4VkSH6awwB5+WCcxIyIt6h936s7ivInvTxqoMIqHT5M4wR8HAvyegw+6R
         FptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=HY+flGO3dK0xjmmo6jO2hkhppTxHnZ0DI5hryuwWn38=;
        b=lXhIeg0WozGNiWGKD+6K+gSHwUrR0qtS1tCEJoRQ3t8NR75aT0Lo21b7fc2Aum2+H2
         dGu6L9SW1Q6YvLjMIrTNPtUuuRxaJyoIvoFMxTLOa59q35JBpOvVH2RSQGLf33W6e9m1
         XZCbszjTuO52jSkLH5tplXLx11uE5UcXK4pzbT+geot7amGSoEwfNHJlgDUfxlNf5nPf
         GH/V+XSNJR43P5Dc3NmGuM7dGHTk70teUMB4J8UL+tdooMwNNyXjYhilNXnng6XBvl1U
         wJ425M3+p0WpPaKBdwTqfgmzZw96oqIgiOlMeCZbwLdLdkw1nV/sLd46/sF3/8PtPwmv
         7Iyw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532LDTM/6CZmc+OISpTtb+GKPk+ZD/TVvGCNf27wbp3NsG3k01jx
	CL5EsBGvhkm+3ImDkZQYj0g=
X-Google-Smtp-Source: ABdhPJyn8dAXWryJ0PAtSj9ymY3S6El2O4SrV1um32CXK5vQGcQF4bk6PMlqv5WqJqjuNnWclCzD3Q==
X-Received: by 2002:a7b:cf0c:: with SMTP id l12mr12939919wmg.77.1597631362695;
        Sun, 16 Aug 2020 19:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls6816400wmf.3.canary-gmail;
 Sun, 16 Aug 2020 19:29:22 -0700 (PDT)
X-Received: by 2002:a7b:cb47:: with SMTP id v7mr13498203wmj.129.1597631361933;
        Sun, 16 Aug 2020 19:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597631361; cv=pass;
        d=google.com; s=arc-20160816;
        b=PKxgTjMpotDj1+wukFiFKlD1Yiub4kHFtvMkQSl/nPp4q120kSc6ibK492DEc6KnLu
         xQYI62yC54gkGn2khivfZrHzeoN3EZ0yNFd/zsDkvuXBfqdymjuLbtJy/APRjrLFgb7O
         zOTpjVv5DDN+MHPKBZQZqGWFpSnwdmC14kvu4zv4FLUUL1/qNQpwmIc/0IJXDgnFwCbZ
         X8Lzq8oeDhrIWo1kVw3/UFiO95Hus2Y2t+ZwUQTbQ6oGW1TRZgS7jQaa2r72/xled/Dn
         6wMuf7piueq1UaHFaLO/6GTlEY792LQ4Vg/aN3zCvTWV+Nuo5Vv4KUtYgFT4FTG/TDqt
         +TvA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=wlbElthM11PUt0b33912PGOJOxxW1ZDLJWudEg7vQOU=;
        b=rVtRIpLmC6jzPDELkdOF2+F5ngMfiN4eOk3djiVjLqDs2DzKKaQV/vVDtLfLPi2536
         oQ6ns4Aj+ppGSW3++FwHKZJMHw095EuTm7EUHuIIq02ZQ7ijZwkSf8azgIVxPQb2RYQy
         QasurDyWR+o+j9ljS0cuVqAyAlm5z+vSX1+6cjPz1Qb51EJcat1HAFqIbBq/HFHls4Wn
         rpjdDgWZib/wdP6VLlm+Rvpg1GmuBJPxcCIJ0Prf+5AP3XrgrZEQztJKmy5F3K2cqF0k
         tXXzgCjhjFf7n7k4VBmdZWgRzxuvd2+nFIKK9Ku/3tLb5qX2pWIFAgCHLiijueYb2OwP
         B4mA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=p0ISbdsv;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2064.outbound.protection.outlook.com. [40.107.20.64])
        by gmr-mx.google.com with ESMTPS id 92si450884wre.0.2020.08.16.19.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 16 Aug 2020 19:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.20.64 as permitted sender) client-ip=40.107.20.64;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCdif7H5E9KdCjqlrRhuwJ8U7KPIgILVb8CNTXTiRcaztq8QsC56y55lbgBfTkyOUrMKRRUvVHXHQh272Pc5UqTd/o4g+U8H93tV+lkNUXjaTokn3rlW9BsnFFBHZg9ll9ZaRKq2YAM+G4fv79XgbTm0hcXnvyDkHGYbnwZlxWBCJtxb1Ht9OFKiRJuSbpbFaGW3EfooZIU9VNbGmJ32sdV8mCg0AB+88BzrX0w41tvsfZ8JwaGye/3wivhhtJzOHUN8wArG0chdeokqaYxsg5zKjSt/KK6JNRQyKEaIIX2D/zeTN9LwX1QbYk5lxlE0U/RRNDYdIoJKOi0BD5yLAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wlbElthM11PUt0b33912PGOJOxxW1ZDLJWudEg7vQOU=;
 b=Ce8bBVVyDFChGCAseiIF5rYp4qpUzsXHYiK3hrcoOX2IKPrP7/p21NOS4LOIORD+wM1k5xHPNnxZr1PIyhlRTxKeKrylcMypJLrFqcm7cvda2hJS2JN5wdtwSKAkWAwvApwwk2GlFG3WO7+5KQ0q6YjFWbI1l9oXwgBNcNjSM4sEatkezvlpUGOlCQgSnPy4+dO7RpXrcvLZbt9OhpsIktIDc1M3YnaKqJdxvZiAp7heGvoZBFCMAc30kSIxRXuRxJtcX4BKyhVuF6rP5zq17Ip+lIaurcvADF1PsNd0Tb1X8penKC+fSzN9c/vVnhRYJjW4vxdYaCoVQp/m4RT5Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB3PR0402MB3914.eurprd04.prod.outlook.com (2603:10a6:8:f::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.20; Mon, 17 Aug
 2020 02:29:20 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Mon, 17 Aug
 2020 02:29:20 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@web.de>, Alice Guo <alice.guo@nxp.com>,
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: RE: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
Thread-Topic: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
Thread-Index: AQHWcjPaBIOGqw/ob0eqmQ3/EgsdRKk3lhwAgAEgvwCAAuB1YA==
Date: Mon, 17 Aug 2020 02:29:20 +0000
Message-ID: <DB6PR0402MB2760A09B1BCEA12BB66B88A8885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200815190949.6837-1-alice.guo@nxp.com>
 <1b65d312-fc95-72a3-541f-aae43be7a126@siemens.com>
 <fccdea7b-8c96-8387-373e-bc00b163e4f4@web.de>
In-Reply-To: <fccdea7b-8c96-8387-373e-bc00b163e4f4@web.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 8e93fd14-bfea-4b96-893c-08d8425558f6
x-ms-traffictypediagnostic: DB3PR0402MB3914:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB3PR0402MB3914E88AF6AB36E1FC2150E7885F0@DB3PR0402MB3914.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: gLfALg5fvPP/v1NxFXMacquIsWWICtIwGt9c03BFY3PV9TqoBMFWiBLlFIzjR+BY0QGPPgVRdptJi1IXP+Bh6BcpS7Xp+Zel5/zcluaJAXhqjZkNIDjHiyoQvgc1Hs3fqSu2posf5wWxQAqitqymvt9OZzGEARe7xNbvQMbj/QlugxsHWR/M7FxbXQqb7aV1Bl6W3pJ7FHuLM9SWZSh81WuY9nRUyFIvfIsBQoF70zrFtySG4XYFOE4zRxnE7Uqiwzi6AdmeqUz3W3HdWFiRD8wsShtu2MZBvrRu8qs5h75pGgny0kxru/i9ieTFeUp3Xjc7LgKlIOoCOB4BCqwEdp9DDb49CU7oNzP6FP31WKmcD4mX8gS5pH/6cNUZTArgXgX7ExnOS0X4aF8mrG2FGw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(376002)(346002)(136003)(366004)(966005)(66946007)(71200400001)(2906002)(6506007)(55016002)(83380400001)(9686003)(5660300002)(478600001)(76116006)(7696005)(53546011)(33656002)(52536014)(110136005)(66446008)(64756008)(66556008)(66476007)(83080400001)(44832011)(186003)(8676002)(45080400002)(86362001)(8936002)(316002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: tH8BuKB7dC9uRPjy/oii8NC/MHsRwuE5jgx2GzfVDnvaUHnv03fNCnK7Cw4doQDxWjxVocGh6ousyF1wnHOE7UI+c0g8m5kZMSOSOScE7OAduK3ocWk0W/jiDJDipPBzFlygFVdiL+LxvrNpUz+VgBO6jUM5tj45U6JU24a3VdGRNz5X+flwnQUEHiXcGKQATvCc9ZUuS7C028w9eItKvhYxrZcFPnoo8cH2Rt5GLUHjTzKQbvX6k/BPr/oKOVs18YuJSCB6GlB8ZsjmjtiHPY/4jyqWBmJ08yIn4tkWf36VizA3tORHuY3aTSukDLG4aUFjUwRHnrmLJJkWmhBfBnHlYAx149DSdQwOrIx+AVtwZNEGAtvQ1ahKzP71AIkN1ay9KKFAMg1OKFsRXFTVmC2HMwHGm57lept6iJoK4tMg6dpbpnDQ9GDZcY4wy3gnW55y6PlArDBLSJebpDrt+iU2q5u4jCXY3Q2VtCMFpiQSSg3gJIOuvNsxdhQCY1gHGNKi90/Wz10KNb1QdGR/x2/5iPIXC89Zafzv58PP7CkBNoo/JPlzeyBHQoq3PH2u+/LF8hZDh78Pi7nabpPfa1Uj0zGOkLVMlZUSHoMxEaHbkibsfAuFmIHficfBUi4k4Wi2skVWWgmg3NllMlJ9PA==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e93fd14-bfea-4b96-893c-08d8425558f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 02:29:20.3681
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g68E1KTxDKy9lRyUxnpEREuIcg0ayPziptkCpiK6wcENRBMloHvjl+/8hYaCGsJqyZTYBueSPZneMhz7g5VPVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3914
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=p0ISbdsv;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.20.64 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH V2 1/4] arm64: support inmate cell in AArch32 mode
>=20
> On 14.08.20 15:17, Jan Kiszka wrote:
> > On 15.08.20 21:09, Alice Guo wrote:
> >> An AArch64 hypervisor can host both AArch32 and AArch64 virtual
> >> machines at the same time. If the inmate cell wants to run in AArch32
> >> mode, the assigned cpu must change to AArch32. Because AArch64
> >> hypervisor and
> >> AArch64 root cell are used, when the AArch32 inmate cell is
> >> destroyed, cpu owned by inmate cell will be reassigned to AArch64
> >> root cell, switch the cpu back to AArch64.
> >>
> >> The following is a summary of some of the points when supporting
> >> inmate cell in AArch32 mode:
> >> Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32
> execution
> >> state. Add this macro to flags of struct jailhouse_cell_desc, and you
> >> can use it to indicate whether a cell is AArch32.
> >>
> >> AArch32 and AArch64 virtual machines use different
> ARM_PARKING_CODE.
> >> 0xd503207f and 0x17ffffff are used in AArch64 and 0xe320f003 and
> >> 0xeafffffd are used in AArch32. Add ARM_PARKING_CODE which is used by
> >> AArch32 in arm64/include/asm/processor.h, and then select which one
> >> to use by arm_cpu_reset().
> >>
> >> When an exception occurs, the processor must execute handler code
> >> which corresponds to the exception. When the exception is being taken
> >> at a lower Exception level, the execution state of the next lower
> >> level
> >> (AArch64 or AArch32) will be used. Fill exception handling functions
> >> for Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.
> >>
> >> Changing to AArch32 happens after the command "jailhouse cell start 1"
> >> is executed. Changing to AArch64 happens after the command "jailhouse
> >> cell destroy 1". If a cell is AArch32, SPSR_EL2.M[4] will be set to
> >> 0b1 which means AArch32 execution state, SPSR_EL2.M[3:0] will be set
> >> to 0b0011 which means Supervisor, and HCR_EL2.RW will be set to 0b0
> >> which means lower levels are all AArch32. If a cell is AArch64, make
> >> sure HCR_EL2.RW is 0 and the other registers are configured according
> >> to the previous code.
> >>
> >> After Linux operating system boots up, execute the following commands
> >> to use AArch32 virtual machine on the i.MX8DXL:
> >> ./jailhouse enable imx8dxl.cell
> >> ./jailhouse cell create imx8dxl-gic-demo-aarch32.cell ./jailhouse
> >> cell load 1 gic-demo.bin (32-bit) ./jailhouse cell start 1
> >>
> >> Signed-off-by: Alice Guo <alice.guo@nxp.com>
> >> ---
> >> =C2=A0 hypervisor/arch/arm-common/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 ++++-
> >> =C2=A0 hypervisor/arch/arm64/control.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10
> ++++++++++
> >> =C2=A0 hypervisor/arch/arm64/entry.S=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 8 +=
+++----
> >> =C2=A0 hypervisor/arch/arm64/include/asm/processor.h |=C2=A0 4 +++-
> >> =C2=A0 hypervisor/arch/arm64/include/asm/sysregs.h=C2=A0=C2=A0 |=C2=A0=
 4 ++++
> >> =C2=A0 include/jailhouse/cell-config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 ++++
> >> =C2=A0 6 files changed, 29 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/hypervisor/arch/arm-common/control.c
> >> b/hypervisor/arch/arm-common/control.c
> >> index 70793432..bfd9e710 100644
> >> --- a/hypervisor/arch/arm-common/control.c
> >> +++ b/hypervisor/arch/arm-common/control.c
> >> @@ -32,7 +32,10 @@ void arm_cpu_park(void)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 enter_cpu_off(cpu_public);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin_unlock(&cpu_public->control_lock);
> >> -=C2=A0=C2=A0=C2=A0 arm_cpu_reset(0);
> >> +=C2=A0=C2=A0=C2=A0 if (this_cell()->config->flags & JAILHOUSE_CELL_AA=
RCH32)
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTR=
Y_ADDR_AARCH32);
> >> +=C2=A0=C2=A0=C2=A0 else
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_cpu_reset(PARKING_ENTR=
Y_ADDR_AARCH64);
> >
> > Let's do
> >
> > arm_cpu_reset(this_cell()->config->flags & JAILHOUSE_CELL_AARCH32 ?
> >  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 PARKING_ENTRY_A=
DDR_AARCH32 :
> PARKING_ENTRY_ADDR_AARCH64);
> >
>=20
> Just thought about again, and I think there is an even better way: Pass t=
he
> mode as second parameter to arm_cpu_reset

"the mode" you mean "boot aarch64_mode"? or "bool parking"?

I think "bool parking" is reasonable. Because for parking, we could
park in aarch64 mode. For return to aarch32 inmate vm, we need
to configure to run in aarch32 mode.

Thanks,
Peng.

and park in AARCH64 mode
> unconditionally. Obviously, that parameter will be ignored on 32-bit ARM.
>=20
> Jan
>=20
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_paging_vcpu_init(&parking_pt);
> >> =C2=A0 }
> >> diff --git a/hypervisor/arch/arm64/control.c
> >> b/hypervisor/arch/arm64/control.c index 6e1ffebf..71615c04 100644
> >> --- a/hypervisor/arch/arm64/control.c
> >> +++ b/hypervisor/arch/arm64/control.c
> >> @@ -20,6 +20,8 @@
> >> =C2=A0 void arm_cpu_reset(unsigned long pc)
> >> =C2=A0 {
> >> +=C2=A0=C2=A0=C2=A0 u64 hcr_el2;
> >> +
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* put the cpu in a reset state */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle big endian supp=
ort */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(SPSR_EL2, RESET_PSR);
> >
> > Please pull this into this AARCH64 branch below to avoid needless
> > duplicate writing.
> >
> >> @@ -67,6 +69,14 @@ void arm_cpu_reset(unsigned long pc)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle PMU registers *=
/
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle debug registers=
 */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* AARCH64_TODO: handle system register=
s for AArch32 state */
> >> +=C2=A0=C2=A0=C2=A0 arm_read_sysreg(HCR_EL2, hcr_el2);
> >> +=C2=A0=C2=A0=C2=A0 if (this_cell()->config->flags & JAILHOUSE_CELL_AA=
RCH32) {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(SPSR_EL2,=
 RESET_PSR_AARCH32);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hcr_el2 &=3D ~HCR_RW_BIT;
> >> +=C2=A0=C2=A0=C2=A0 } else {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hcr_el2 |=3D HCR_RW_BIT;
> >> +=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0 arm_write_sysreg(HCR_EL2, hcr_el2);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 arm_write_sysreg(ELR_EL2, pc);
> >> diff --git a/hypervisor/arch/arm64/entry.S
> >> b/hypervisor/arch/arm64/entry.S index 27e148c6..4789e933 100644
> >> --- a/hypervisor/arch/arm64/entry.S
> >> +++ b/hypervisor/arch/arm64/entry.S
> >> @@ -401,8 +401,8 @@ hyp_vectors:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> +=C2=A0=C2=A0=C2=A0 handle_vmexit arch_handle_trap
> >> +=C2=A0=C2=A0=C2=A0 handle_vmexit irqchip_handle_irq
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> @@ -425,8 +425,8 @@ hyp_vectors_hardened:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> -=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> +=C2=A0=C2=A0=C2=A0 handle_abort_fastpath
> >> +=C2=A0=C2=A0=C2=A0 handle_vmexit irqchip_handle_irq
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ventry=C2=A0=C2=A0=C2=A0 .
> >> diff --git a/hypervisor/arch/arm64/include/asm/processor.h
> >> b/hypervisor/arch/arm64/include/asm/processor.h
> >> index b52782b7..e7b048e0 100644
> >> --- a/hypervisor/arch/arm64/include/asm/processor.h
> >> +++ b/hypervisor/arch/arm64/include/asm/processor.h
> >> @@ -34,7 +34,9 @@ union registers {
> >> =C2=A0 #define ARM_PARKING_CODE=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0xd503207f, /* 1: wfi=C2=A0 */=C2=A0=C2=
=A0=C2=A0 \
> >> -=C2=A0=C2=A0=C2=A0 0x17ffffff, /*=C2=A0=C2=A0=C2=A0 b 1b */
> >> +=C2=A0=C2=A0=C2=A0 0x17ffffff, /*=C2=A0=C2=A0=C2=A0 b 1b */=C2=A0=C2=
=A0=C2=A0 \
> >> +=C2=A0=C2=A0=C2=A0 0xe320f003, /* 2: wfi=C2=A0 */=C2=A0=C2=A0=C2=A0 \
> >> +=C2=A0=C2=A0=C2=A0 0xeafffffd, /*=C2=A0=C2=A0=C2=A0 b 2b */
> >> =C2=A0 #define dmb(domain)=C2=A0=C2=A0=C2=A0 asm volatile("dmb " #doma=
in "\n" : : :
> >> "memory")
> >> =C2=A0 #define dsb(domain)=C2=A0=C2=A0=C2=A0 asm volatile("dsb " #doma=
in "\n" : : :
> >> "memory") diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h
> >> b/hypervisor/arch/arm64/include/asm/sysregs.h
> >> index 0105b109..62a56743 100644
> >> --- a/hypervisor/arch/arm64/include/asm/sysregs.h
> >> +++ b/hypervisor/arch/arm64/include/asm/sysregs.h
> >> @@ -15,11 +15,13 @@
> >> =C2=A0 #define PSR_MODE_MASK=C2=A0=C2=A0=C2=A0 0xf
> >> =C2=A0 #define PSR_MODE_EL0t=C2=A0=C2=A0=C2=A0 0x0
> >> +#define PSR_MODE_SVC=C2=A0=C2=A0=C2=A0 0x3
> >> =C2=A0 #define PSR_MODE_EL1t=C2=A0=C2=A0=C2=A0 0x4
> >> =C2=A0 #define PSR_MODE_EL1h=C2=A0=C2=A0=C2=A0 0x5
> >> =C2=A0 #define PSR_MODE_EL2t=C2=A0=C2=A0=C2=A0 0x8
> >> =C2=A0 #define PSR_MODE_EL2h=C2=A0=C2=A0=C2=A0 0x9
> >> +#define PSR_32_BIT=C2=A0=C2=A0=C2=A0 (1 << 4)
> >> =C2=A0 #define PSR_F_BIT=C2=A0=C2=A0=C2=A0 (1 << 6)
> >> =C2=A0 #define PSR_I_BIT=C2=A0=C2=A0=C2=A0 (1 << 7)
> >> =C2=A0 #define PSR_A_BIT=C2=A0=C2=A0=C2=A0 (1 << 8)
> >> @@ -28,6 +30,8 @@
> >> =C2=A0 #define PSR_SS_BIT=C2=A0=C2=A0=C2=A0 (1 << 21)
> >> =C2=A0 #define RESET_PSR=C2=A0=C2=A0=C2=A0 (PSR_D_BIT | PSR_A_BIT | PS=
R_I_BIT |
> PSR_F_BIT
> >> \
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | PSR_MODE_EL1h)
> >> +#define RESET_PSR_AARCH32=C2=A0=C2=A0=C2=A0 (PSR_A_BIT | PSR_I_BIT | =
PSR_F_BIT
> \
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | =
PSR_32_BIT | PSR_MODE_SVC)
> >
> > Indention is ugly now, and naming is inconsistent. So let's align
> > everything after RESET_PSR_AARCH32, at least in this block, and rename
> > RESET_PSR to RESET_PSR_AARCH64.
> >
> >> =C2=A0 #define MPIDR_CPUID_MASK=C2=A0=C2=A0=C2=A0 0xff00ffffffUL
> >> =C2=A0 #define MPIDR_CLUSTERID_MASK=C2=A0=C2=A0=C2=A0 0xff00ffff00UL d=
iff --git
> >> a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> >> index 6df4a745..6fda32b9 100644
> >> --- a/include/jailhouse/cell-config.h
> >> +++ b/include/jailhouse/cell-config.h
> >> @@ -56,6 +56,10 @@
> >> =C2=A0 #define JAILHOUSE_CELL_PASSIVE_COMMREG=C2=A0=C2=A0=C2=A0 0x0000=
0001
> >> =C2=A0 #define JAILHOUSE_CELL_TEST_DEVICE=C2=A0=C2=A0=C2=A0 0x00000002
> >> +#define JAILHOUSE_CELL_AARCH32=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0x00000004
> >> +
> >> +#define PARKING_ENTRY_ADDR_AARCH64=C2=A0=C2=A0=C2=A0 0x0 #define
> >> +PARKING_ENTRY_ADDR_AARCH32=C2=A0=C2=A0=C2=A0 0x8
> >
> > The last two do not belong here. They are internal to the hypervisor.
> > Move them to asm/processor.h where the code block is also defined.
> >
> > Jan
> >
> >> =C2=A0 /*
> >> =C2=A0=C2=A0 * The flag JAILHOUSE_CELL_VIRTUAL_CONSOLE_PERMITTED allow=
s
> inmates
> >> to invoke
> >>
> >
>=20
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgroup=
s
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2Ffccdea7b-8c96-8387-373e-b
> c00b163e4f4%2540web.de&amp;data=3D02%7C01%7Cpeng.fan%40nxp.com%
> 7C2a9a8a8b6857465ec84808d840e4c636%7C686ea1d3bc2b4c6fa92cd99c5
> c301635%7C0%7C0%7C637330698609625736&amp;sdata=3DLpYU7aQMQgLB
> a7Y8OGZAPEvuKO7c2o%2FeUK9gpp7wP8k%3D&amp;reserved=3D0.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB2760A09B1BCEA12BB66B88A8885F0%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
