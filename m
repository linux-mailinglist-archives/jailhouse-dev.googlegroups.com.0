Return-Path: <jailhouse-dev+bncBDGILGE54ELBBTPNYL7AKGQEDLXNXYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53e.google.com (mail-ed1-x53e.google.com [IPv6:2a00:1450:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 53DF82D4135
	for <lists+jailhouse-dev@lfdr.de>; Wed,  9 Dec 2020 12:36:46 +0100 (CET)
Received: by mail-ed1-x53e.google.com with SMTP id c24sf774286edx.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 09 Dec 2020 03:36:46 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1607513806; cv=pass;
        d=google.com; s=arc-20160816;
        b=dCAdUcwdYvEgDZ0lILqI/rFkAct+07/RzdbxGhRd9yC77CrLbGD7djSdrm7SMaSuca
         DqIHH1nqJ8VqDp50yLw5xLxPrOSkO5ddldw+CQh9eNZfqkpBa7YQw87voj0rPirbFwLj
         4kIg3xkAzlLSoPR8c7aWKf0TER+Jwo/idxcdlgpb19XJUf21MUAoYGI9sSPdl6N7gMtk
         4azEFOcyqyBILvkvXZp1kNVJKIX3BLNfP3Bw8zQ2xC6O1J2fYn8qyNE6VVA3uipwBkI1
         et4wXPyBGulB4VRUCWzKushMv1Ox/oglVTxi0uBvyxQgwov7w02CQm+AjnF/5t1PJpW+
         LdBw==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=4ULixBFixi2BNKE1TpAvN7oGK8/Q6FNzdprx2bzG5nA=;
        b=DOi5cuhFkrjVUFD/SRIxKdk5lBiBIdJdsFgMDKRbWC0360MzWyNG5ps0LJHDTHnPqT
         XO/xQxPHLcmyS1nYmgL+KrSb90/vt/JQU9zOujzmWs8S/yZ2repTLqd5l5aj0bSHE1W6
         R7Dq7HJEmaqFVvXcppc4At1ylJKbMHVuz2Dgm2YjGK0qZsyv/PXo+bbJ+cT8ZTwmxQYc
         9/7IIQ1A7J1Ul1ntIpabRYV2KuVWFfjJIRXRzmwxwgI7ygbQjZdwCABrc6bxH9bRBsiF
         qclTSrSzQT3I+UfYG5ouzir4C8qQcyzW76198rFwvAcr01lSK1erqdy8cdx7k5F9/Ccr
         bPpA==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=ooViji2x;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.8.90 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=4ULixBFixi2BNKE1TpAvN7oGK8/Q6FNzdprx2bzG5nA=;
        b=gac/sFH6gHjuNDqfzYVTj5Q8nn48IERGKMpzVSo2d15aYFrYMha2pKOAxRqhNHKrZf
         AL2hJYQwU6QmQx3nmIXuU7tCct+0kJJroeAZjbV0gFOm0AZU/e2Vvk/QQg2jtBuJKCPu
         Xm6J0ysFUNi5WcsIuVNt+/b5fc1Ev5o+I4I1HTRkXoKOxi1Sm4ukyP1CUtN/sbCMnmEp
         /Uuphkl8vl7wn95uOx1v1wGw6iquITxkYAUkkMaJxR6Dg2rpkxL9MVxKaZPrBPFmwt73
         2IHf5aFhlJMFqiVjhH+SWvSoZqJSm0QLatSTUB25Bl9tAc+pnUJudxHT4XEwlV3vL0Yf
         PyRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=4ULixBFixi2BNKE1TpAvN7oGK8/Q6FNzdprx2bzG5nA=;
        b=NVfrO7VWiP+5fVdNP75nvgzQi3akW4XSxoXVbO/VVI42Cb6b3D0GImp3jthueyzKTD
         WhkJyCc01mkLY4ZXaeWEwraPURMywgybFoAqaf4rBJ6ADz9rbgl01dlqqCkdd61d92cD
         jy2vKJ+B+GIBiQHKE4dY2p750IbyYbDQ+Y5sUD3vOw6UjB+Eby9SCNFGc8S7rZWVw/qq
         FSdvKUN7mBISoqnteIRl8XB3AMuQtrIal5Vq23l0smUse4M3JegFKOYxV9aNFyNuwLsB
         J4NdJJ8Jon+AxFFWby1GxBnzPrDt9qTm0Y7kFt2u2Qr7rMacHu5qG62FA+opGc76JTyY
         l2YA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530FqRY43vBBIEl65iTRygTvlIylWFUhV1+mPmA3dFbb0rUCiw7E
	1LqBzJuvJdZqqvWCF5MyIFQ=
X-Google-Smtp-Source: ABdhPJx25uNI7HEMO61XfUeKSjXhTTe7Ay2Kghm9TN2Ee+2v+klx5kf5CYoB32evv/e4D+tC7Vt7rQ==
X-Received: by 2002:a05:6402:4cf:: with SMTP id n15mr1565217edw.241.1607513806023;
        Wed, 09 Dec 2020 03:36:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1432:: with SMTP id c18ls1406971edx.0.gmail; Wed,
 09 Dec 2020 03:36:45 -0800 (PST)
X-Received: by 2002:a05:6402:142f:: with SMTP id c15mr1573053edx.33.1607513805124;
        Wed, 09 Dec 2020 03:36:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607513805; cv=pass;
        d=google.com; s=arc-20160816;
        b=xVRsByY9qL/2srdGsN+dmMr+O9+r2ylUNbDzpjWcqpBdamhQYl7ecx5o3p7dQQnbDc
         WCAT28G3sMjPM9TaMd+dDRuN87+QT2hKchy1Pgwalq3vBhzaKJ5waTCFQE1/MRFZ8oqd
         GcREr+GFWS0svzsnP0/HlPyuMScfXjuXXPbUznxSxSX5VL/mj3QtavnTHKDehVXdRfEw
         YV1KTm9Hm2sO5sjjzRpF9F9HR7N+5DYXX9wBmQn4ABWfFd55AGF43Li5om6Wv/3sDAZs
         kTRulKigy7uOGJodFhxOe/lv0YueaU9KbtJveiqyDGZQ8Ftp0npqyGF2I0opIF9Uvzcq
         d+kA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=4ylAJITDiLrQ/ls2nYDXFwsv1bOVSMUmf9yfi8l2BEU=;
        b=wz74z8NVHQK/je/4YWDHB9z7PFWZnefGLHZvDcLim0esw5uupY/cdtFKQe1+PUW9Od
         C+zixaCIV2bR2o0+xotCXnjvxe/0EJ8TGbN2gyuAadsg+VPWmp9BARn6gZH240LJkkqy
         udJZHlFQJlRfencq3neswJUvx1fPSXGc7fmROwxHm33Zjuqqc42IBaUUfYghCj/b7rQt
         U+dJT0IuDt5S4MTbPVX1kX5HsJgK0tWHs31LZWHQpDiyQVBGSfQnijIcjN+3Kx/TNgCQ
         eeaySCH22VSRNd6rk1xvTWBxRxBF6qhIp7lov76CBhVNsRMriGNDz/tAh37H9+FElAuj
         8rGw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=ooViji2x;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.8.90 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80090.outbound.protection.outlook.com. [40.107.8.90])
        by gmr-mx.google.com with ESMTPS id cc25si43450edb.2.2020.12.09.03.36.44
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Dec 2020 03:36:45 -0800 (PST)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.8.90 as permitted sender) client-ip=40.107.8.90;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EnBRBslzB5PP0opPVrTs9qWITX2oLPanoJmtdyJWqVggJHrFqU95XfjJeO++CtNLDNqJZYYtgzn/XTv2lhwv24G8/CI1sWftSeYrh71tlysCA6NKzEwgnuZFH/3N8nELehJvE7xQ43/m68NaDOCBF6GK5c39yPP1PqN2ZWKbY93MJliAelQRAX0dxJOdw4ORREBgVk26u+j62zY03DoGE9ez+TdEtC4gWa9vLUJCxBtpseMgKdRITgmUzxlui2nuSa3nt4MCk3LORNhESDvCPuGY+uq8lhbgWyFR/c62EdfJXwVsWAm4S/MJdwYJFuJYGsvecNq1aNKEesXF8MLJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ylAJITDiLrQ/ls2nYDXFwsv1bOVSMUmf9yfi8l2BEU=;
 b=YCLhP6RtM06ZZn4SXPRhTybsxuFfA03P3zSFYIvNS9euS7s9yj1QAK5QneHWoW7ZlE8HRhQIu4QepR2kwIgQD+NDD8jlocJ20pNJ5yEtOVkMGaOnt+7ycltrgFNQhdmth2/vx6BPlpt+Glw3J87b1MzgOmhPpq0LwNtdclnmv3h128lxfykz/Coiab7AVQpgfv0+uHrKYXfdn5rDhaMAoRH+/FrjZ07B7cjRCLiSWd1Ai6mvymdhQJAB7x2nhwx03KKkffQeeosHJt7OlxtIk0gpc+XjBtC0VzfBm4L8cgpqnwwqoAFEc+kipQE7/jJu9NG8+tLry7pLxN8PV45fIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR0202MB3336.eurprd02.prod.outlook.com (2603:10a6:209:18::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.22; Wed, 9 Dec
 2020 11:36:43 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::8853:89c2:5d61:669a%7]) with mapi id 15.20.3632.025; Wed, 9 Dec 2020
 11:36:43 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Sainz Markel <Msainz@ikerlan.es>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: RE: jailhouse hardware check error
Thread-Topic: jailhouse hardware check error
Thread-Index: AdbOEISuarlPAbS2SqyLZ0yti5cZUwADoIHA
Date: Wed, 9 Dec 2020 11:36:43 +0000
Message-ID: <AS8PR02MB6663FA4A6DB7D661F5AB68A2B6CC0@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
In-Reply-To: <PA4PR03MB718419E2B512BC70CB7A56C1B6CC0@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 23e4d622-8777-4d13-9ddd-08d89c36b3c9
x-ms-traffictypediagnostic: AM6PR0202MB3336:
x-microsoft-antispam-prvs: <AM6PR0202MB333673E617679AB7D68B8790B6CC0@AM6PR0202MB3336.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pt9P37cv3lAgZjBo8Uh+IDwbF3IcuA4TUe5Xf5Og0j+WhNkf7b+juQ6Wd300DrGkos5g78ZQiwAJxnPAcNs7Ziio5szFMYwSLel/khGVe1JF/fi6DK8PeiNpfR5f9Xm45ucUQKez6l2HMTHrekfClrsbUz09iI4LNYACZr+hF7hb0/1PdGwZLs8j8oxRizofFgSvrgIhZJDDz+BJowDoFXwZiyp//y9oD44vvoSoADIBBKhO+pkmekM8TOMBFzxmN5RIOXeslnZWk4RrOS0WBmBQ5ht+ZhYXC9dknFoJncM9r739+gLM/RPnAt4+V7QTxtt8fDUNOS/e2oTRZWNNGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(66446008)(86362001)(66946007)(66476007)(9686003)(64756008)(66556008)(76116006)(33656002)(8676002)(5660300002)(26005)(52536014)(2906002)(478600001)(6506007)(71200400001)(44832011)(316002)(7696005)(3480700007)(8936002)(55016002)(186003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?SEZ0djQzbjFmTnhhL3NRMVM3Y08vc0ZLUEd0dzIyQ3lvanRyTFMyR1JZZTBE?=
 =?utf-8?B?L2dpRWlSQ0JxL2dzQVpUZXQ4UW9XdGFWRVovL0NQRGhMV2RjSTVydHYwY3M3?=
 =?utf-8?B?SFlZbHhjaEtUQzBCbHlhRm5PNnN2K2lrcGN6Vkh1MzZEbEtnemNXcUVuYjNK?=
 =?utf-8?B?QmtZMkFiTTlsQnVPSGFJUzRVS3JNdWN3ZTR1MG80ZFhPTU1tU1pkcVVZNHdJ?=
 =?utf-8?B?QkZGR0xEbTFQa2ZjeGZWS3RyUTRhSEd6TThrZzFrTmpFdEJ5N00zWm9lTnEw?=
 =?utf-8?B?Mk1KSWZqdDJ3OG90ZEs1QjY3cURHc2Y3S1lzZ0M0Y2F4MjhNOTY2SGs0U2M4?=
 =?utf-8?B?TGR5WnhMbXdjb0kxQ1lJOXh5S3VvUi93bjNZOVU1OWNQd0FpdDlQdXprbTlZ?=
 =?utf-8?B?WHFlSndvWGw0NC9DbmZZUU9FQXJEWG1mcVYwODg4N3dpd2FQQ3k0Y2NDUTMr?=
 =?utf-8?B?RE1vMHhxb05LOWtpWEN3dHhTcGVYbklGaFErN2paM2thbkdpOEdGcGdweDBG?=
 =?utf-8?B?SEZSYkFuTmU0SElJeHJwbThqMzk2UlJkZ2RZd1VMdnE0ZVBrNDdEZmh4YWp5?=
 =?utf-8?B?QzV1aHMyT3dTNzVnb3d4dkxuSjRSOFR6Yy9MUjhLbjZ2QTZDM2NkNVZmM2F5?=
 =?utf-8?B?dkdjb1Ixc3FacG9DcitvQlRSMm9qWHVaeWYrWno4MDQ3NzZSbVNyemlLR0My?=
 =?utf-8?B?UEJ6bFF4WWIvN2NaZFB3TE1kUlloTms4QjBYTWhzUkhpMXBNN00ybi9JY3py?=
 =?utf-8?B?ZlBBck9nVVRHNkViWkdsRjFBaVY1YU92dENSRzB3MFByNGxROVNtbGY3OFZZ?=
 =?utf-8?B?UFd4c1p6Vk00RDhLYk1UTk9CU0pTamZYRkJwMWZSTll0ZnZJdXVGQ3RsMVd4?=
 =?utf-8?B?eXhaRkdBdHkwOWg1VWdRSWZMYll1WnhaRjhrdEZuK3ZHTW1aMFVDUFJvUm1y?=
 =?utf-8?B?d3ZRTGhNRG84K1ovcmJDNVIwcEFIME5IYkE5Y1NkMkZkaHZ4QkMrSFVxRmlY?=
 =?utf-8?B?dkZxTWY3K1d0MGR3Z2JhWVFPQVN6czdybzFJcVRyMTdKS1ZBcUZsQSt1MlBn?=
 =?utf-8?B?cVMxTjdxUlJQRWdnUCttRjJzUUtJR3J5S3ZhMDRRc1lSbFFkNkswZmtIVVBS?=
 =?utf-8?B?SmlrYlo2aS84U1g4QmxOV2JYSzBROHhvVWY0SXk0VitrNTA1ZVN0YVlvSzh6?=
 =?utf-8?B?Vk1sMGQwc01tUVhGaVhETUJSUkVSWlBpZDdsSnI0YjhjK3hUV0JrNkxvY0gw?=
 =?utf-8?B?K1I5NkJDNEV4TlZBR0dCYXB6WVNzUGNrZlFYYmJUR0lwd1VjY3RXaVpuSmk0?=
 =?utf-8?Q?Xf/EVreix/Ldc=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23e4d622-8777-4d13-9ddd-08d89c36b3c9
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2020 11:36:43.0461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E/u9fg6jZ6bf/nigWQaSACnoGjc6eODxvkTWTS/M4gwJwEGryCNSuACsrCwJ1R4MWnOv/Nv8AfAUGAgOjQdkTN9dud3yKX+fg304sTB62IQjWgc5+i8oCGearsAcdccxAf+i9WGRIAedY7Oor4wW8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3336
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=ooViji2x;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.8.90 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

> After realizing the inconsistency on VT-x emulation in VMware and switchi=
ng to VBox, I get the following error in hardware check command:
>
> mjonian@mjonian-VirtualBox:~/Projects/jailhouse/tools$ sudo jailhouse har=
dware check
> Feature=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 Availability
> ------------------------------=C2=A0 ------------------
> Number of CPUs > 1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ok
> Long mode=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ok
> Traceback (most recent call last):
>=C2=A0 File "./jailhouse-hardware-check", line 147, in <module>
>=C2=A0=C2=A0=C2=A0 iommu, _ =3D sysfs_parser.parse_dmar(pci_devices, ioapi=
cs, dmar_regions)
>=C2=A0 File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_p=
arser.py", line 338, in parse_dmar
>=C2=A0=C2=A0=C2=A0 f =3D input_open('/sys/firmware/acpi/tables/DMAR', 'rb'=
)
>=C2=A0 File "/home/mjonian/Projects/jailhouse/tools/../pyjailhouse/sysfs_p=
arser.py", line 90, in input_open
>=C2=A0=C2=A0=C2=A0 raise e
> IOError: [Errno 2] No such file or directory: '//sys/firmware/acpi/tables=
/DMAR'
>
> I=E2=80=99ve checked that VT-x is enabled in bios and I=E2=80=99ve run th=
e VM with the intel_iommu=3Doff kernel parameter. To get you out of doubt, =
I=E2=80=99ve installed Ubuntu v20.04 with kernel 5.4.77 natively in a machi=
ne and checked all the previous. The same result when trying to check the h=
ardware=E2=80=A6 Any ideas?
>
> Markel.

Does your CPU support VT-d?

Bram

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AS8PR02MB6663FA4A6DB7D661F5AB68A2B6CC0%40AS8PR02MB6663.eurprd=
02.prod.outlook.com.
