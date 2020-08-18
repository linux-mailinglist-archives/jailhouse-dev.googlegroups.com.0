Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBF7H5X4QKGQEDV6P2HA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FC1247E61
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 08:22:16 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id c25sf1592133edx.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Aug 2020 23:22:16 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597731735; cv=pass;
        d=google.com; s=arc-20160816;
        b=vVsGmYruvc2gB1a6C4G3yPIlCimdK6vKUsmgFwn5krmgDhjPd/zpMl2qVxQWjO4D9Y
         CozW7pSDEIJqNNSrMjNgKYxWiVVjnRJfQdKH7lmUChq/GyEyUZtgI6kWfJK0reAokrcY
         LyonPFG4N0VYGFMinq+BWcmKSqMPG0aepcTkYGP93q2WEx9w9hYSBFgxVV0UyeJGUHhv
         liZ4cMlepwGaboWP1+xp5LXWcy2zegsbULUzzUM1MEjIjSyRwAnqgALg6WVhUzqd4vLA
         s7omj2QEGrv8P6to11t/sMKE7Up6zudOi9jcWoAeMNbAM32y7M7wVCeZUl2vJsKLDJAY
         jmTA==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:cc:to:from:sender:dkim-signature;
        bh=Rwg35ZqYok1LlqKTTs2X9RRzSClK/GPM4efOjeVltaU=;
        b=XlHM5+uBmTMq41JUbd7OQbuAOacx4/+3n9hvS1rsWQhuzoz/V5ZEnSDQOdyeu7kJmW
         0v0o3IsUUXVBCHF7yI1dbyAPBLSkb3iUo/C42zGrPS/MXw2ahLP/ND2DK4QvaUkfoaRN
         GojrsfXLc6nRtbZ+bxGrkkucvlA69DEg0u93yKdgFETiZ7rQOpksm+zJwCzjb77/AQCo
         hhScSkmQVCbI53LgwZ1HU954ntRhU3MvqAAec5IN7dDwkjGQ2kZq9nVqI4N/TGj4Ax2l
         vGS7HZN1VNXfg7zAAvQ+RcnEXY/hfdnoeZrFbBZ5ajF1rPnc9rpH9kv95FsoBtpRvalE
         PKaQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="bh/u/64c";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Rwg35ZqYok1LlqKTTs2X9RRzSClK/GPM4efOjeVltaU=;
        b=kF0zh5+2OgHY8HCz4KFxhmzY/xwPGP/GLsV6zKSnp182o7QJ038ZGy0+m8BQRFPDq2
         Jr7UgYE5+xipJHj0V41D8bf3wfe4F9F1mavLRreqw/XknMm+MuWzfPLqFr3ELUrdWebU
         PiMBEkzB3vNDnHcpbopM45YYyHpWDfwShZrPf2pmFkyBLukwd0vlD+G1a80o6JU9NGOA
         bVO46rZBwvUdMf86aPvnhmr2yttRz+xRxJkAdz2DOj1ZuYSn3cvEkyBQUY1fDQ7/Mby1
         iQs7zgbFSnVKy48H27L2vuH+IZ+HmgIikqUBFrtz5+Cn6oDBg9v0pB7ToOZkaR9e7aBt
         Vc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Rwg35ZqYok1LlqKTTs2X9RRzSClK/GPM4efOjeVltaU=;
        b=YZ6DFWbImBnYirGgtz1jGkjNqvT6xp/lpncE2+nNkZoMzwJMO+L81rYgKVRQ5H06PP
         LBhmcdg24F8zKp1CigumcgBxcXvyMQyJvU1U5tc2VDDFWpi72Q/WGCTspgQJuekFCSZS
         z/L5gYH7JELX/UrmWcmCBxzqyyKHtz+riHwQCNEMycj1EPKkke1ZLH5gKX9u4cKG+WG/
         0fTkPKfe0L0Yr98yznQxqDTFSpvc3kv1mzlyeQ/Brlja1EYn+UgQvp9kDWJisYurnVuY
         EBsSUjsWZyEKuHlCbd7RIdXOZ+J/YeLXO6I5zt8PMH+BkV15gwp3RCz7qBJe16VQuUOq
         JcWQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RpiezKmED++2UM5qs4xwXdSnjxk4jzTVUqzdwrziMYsKMWwBz
	znD/4brMxOI9ONpMbaWm3y4=
X-Google-Smtp-Source: ABdhPJzT1P4+OYZ7ovfEGPBVBywDaU1pGWjtuuTnRueKsVBepptpXTdaHp51Sal3gKPfiRO7/Qa3hA==
X-Received: by 2002:a17:906:68b:: with SMTP id u11mr19679508ejb.143.1597731735672;
        Mon, 17 Aug 2020 23:22:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1a56:: with SMTP id j22ls9073238ejf.3.gmail; Mon, 17
 Aug 2020 23:22:14 -0700 (PDT)
X-Received: by 2002:a17:906:e218:: with SMTP id gf24mr19394332ejb.469.1597731734887;
        Mon, 17 Aug 2020 23:22:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597731734; cv=pass;
        d=google.com; s=arc-20160816;
        b=QkTyIHRZdvS0iogdT8Sd5VADRkMmm674bGUDF+ACgrWd4SWoczh3Ntqx8USssHM2tN
         xxRb2pW0VRD/BX0yDPQOWyf/ObClI+chWPuL2AjN6hNEplFxe3yZQwfcP6F7oO+hlUvW
         mpPuSHDSSGh9J/c5l4t9UZ4otYaIMGJ075kTekllYk3iWJwhQi04lCFLOeU/JXfoKScw
         1PWmIWiJh8Jh+qWi+lmotLC46lSJyqZVQuVHSK7FBRnPKTbVVyJCc000c8jZKgSJoAGl
         mRRsa7dmxGfRHu/r8LaKYNgrJtTFrPoH+2YBwG8pcR2neuzzn5C5QXFQRirqy3Tsg16B
         7aOw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=pbCrmB0GIm2IvFQGuaBeehsE5aiqJlvflYPuq9WoWEk=;
        b=tIrNnbDiQ/pFxS0cfn52HG+dKZg/JaEDu6gISmWC4d4/w9xphX4KiB8eLT0Vlo9elI
         o8XwCOIqe1hcpQnYyWHnwnzOWZyUgMB/AOv4UYOo2D6jSWhVBMY5DenAWH4+K930dELS
         pA0YBZhX7ahogJ/W/tDkzmEBrf2VzD/RusSSFkI/ed+c1Sp5JnKJw4aKVKuVre/TWY+a
         /qjpgLpvM+2o7NaOMa9qlT3L5pKFs/zT1g8jER4HXXm1KwQUvfoL99TmXLT3IcSduPoI
         hUSvENPJBnoCst2E5xa086CBy+i9cFaqtQxhel42dV01PWyE4ld1rcq6WHER/nuBjf4n
         cCaw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="bh/u/64c";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60041.outbound.protection.outlook.com. [40.107.6.41])
        by gmr-mx.google.com with ESMTPS id h10si943719edn.2.2020.08.17.23.22.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 23:22:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.41 as permitted sender) client-ip=40.107.6.41;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=duKiwti3hz7Sk/5krTkaPh7/H6L2gt2BXAvA/lJQ3Ei8/BvSSB4oQQubnY5/tIMmHuIa3SJbMdgNt3Gw9bNiHZnYEiv9uGBQMiajLq4YGQ+D+0QseAOv1AGnWpvIpI7qxbpLfJxyLEu2esCjnPCeFAhVR6E614xHVsrEl7hMbeUBRgjzxpWMc46hKfxeJXYZPDEyzO+E98zcJGTc0VQtbnZ9iWgSmMp/APQmp9A010Hjt4L03vLLipz0p2SZdM2r6Ns9dPbg70vHbwp07H7/Ai3cUEl3Mntzu4Mr7vTHC86C+SiAW+VGj6uKuL3xndgT3j3Zj6DbgiUL4ohIS5zGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pbCrmB0GIm2IvFQGuaBeehsE5aiqJlvflYPuq9WoWEk=;
 b=m/F664L3ryBdf0EZjpYgY9B0oBAFiuQozGfNGpyezJQB2Tf2PM7RelLmvmz9KqecsjQ69qtmsW46vInBsxHG9h/cLMLqzJxBKEjBrqZ5O/uzUaWX2MPuUNI51RkU/QIvJxuy6eNwUbXE2KfOYETjhktiAlYEEV4m/c0s39Qir8nVU2qYvL9mos0u5WC33Fu9TB+t/OfdszoecZH6jJnAyryqP1jd3nRkMaCehsetubzLBTSZK3jDOIwOkaidL3FwGXprqee9mxbXRid8skAetbp2+j3Y+0R0WSkVbH/itpT/KzCHdkotPC1rf/Avf4qK7nPUMKDnJPyp5gmDolGK/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DB6PR0402MB2934.eurprd04.prod.outlook.com (2603:10a6:4:9b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.16; Tue, 18 Aug
 2020 06:22:13 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::24d0:f783:3c7d:e232%12]) with mapi id 15.20.3283.027; Tue, 18 Aug
 2020 06:22:13 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>, Wolfgang Mauerer
	<wolfgang.mauerer@oth-regensburg.de>
Subject: RE: [PATCH 06/10] Add libbaremetal
Thread-Topic: [PATCH 06/10] Add libbaremetal
Thread-Index: AQHWbGRD5zCxHBIdykSEGCFUwoysfqkyir8AgATRQiCAAAoEgIAAWiYAgAALm4CAABXnAIAAA9WAgAAHtICABC77kIAAV24AgAEB4vA=
Date: Tue, 18 Aug 2020 06:22:13 +0000
Message-ID: <DB6PR0402MB276074B8DEA27776C106C72D885C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <20200807030632.28259-7-peng.fan@nxp.com>
 <4bfbd74f-843e-c3b9-47c7-31100d085052@siemens.com>
 <DB6PR0402MB2760040A34FE70576005395E88400@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <deb41f1a-1b87-ebd1-50d2-d7d299d35d8e@siemens.com>
 <9e8f00b4-2a2d-8bb8-e92c-8e23e5910af0@oth-regensburg.de>
 <5cd1415a-f4d0-b307-e81a-769b7be8eebb@siemens.com>
 <f81327a9-db37-be4d-4aa3-862b7d0416f3@oth-regensburg.de>
 <47babf84-565b-db76-7e42-47b0a2d5ed00@siemens.com>
 <9d551e5e-25fb-4c8f-66a4-934187b9650f@oth-regensburg.de>
 <DB6PR0402MB2760128F2AF78973F466B6B3885F0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <4bfa6a8a-e4a8-9b4b-eb10-820242fab80a@siemens.com>
In-Reply-To: <4bfa6a8a-e4a8-9b4b-eb10-820242fab80a@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: dd902a9e-57e1-4540-2126-08d8433f0bda
x-ms-traffictypediagnostic: DB6PR0402MB2934:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR0402MB2934338BFDE51E3281D794C0885C0@DB6PR0402MB2934.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ozu6XZyRpKbSbzmGOEjl+vc3SJRepfF90y1lU4X8jmqhwBb+AkqQeTOj12AC52PpPoX/ghLGY28jarXqrgIyTCLiQlLmsW6/vUmAETLlSZTy4mC5fUn8mcu8U4miX1eeT0SdryW3AFOiE5//QWO/iCdde1rfLBX08FOXEf6M6Vut4mUtL07gmJ4xW2hJmm8NjtGYSFB2BcNtXaWBwF8LjgIsLpCrH9rBtqp0GQ8uTpeIpB3ZdxpCXUn99GUtC9W19mFgalmLbfquXLXKZFxPu2ofmOaT2dsB7Rx8ZUnq3sS1viV/v7U2wZ9OxQ7Cn/bUM0MdiD7qPgnQ+Sj4b3VcXA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(396003)(366004)(376002)(136003)(346002)(53546011)(30864003)(26005)(4326008)(8676002)(33656002)(6506007)(66946007)(66476007)(7696005)(8936002)(66556008)(76116006)(66446008)(316002)(64756008)(44832011)(2906002)(9686003)(55016002)(54906003)(110136005)(71200400001)(478600001)(5660300002)(186003)(86362001)(83380400001)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: +BfMHgKm7Tst66kHC4aawlylnKaun7O+ElVYIz5t1iKwj+nHRnG0aA4OBARsa8tgAWg2f9KwC/asw8KhYfRCL132mw9oVMxIUYn/DQFH0ksmfPVxVvn3kyoBWuAvhneQmy9ZHHrCAYKtLef6Rd95mCzkqiVj1JLqICLKC/5IIKuF+LxrXEdzTsuqyOmooMmZCYlOhINb4JbNPwRlPoC2D/FXQvRhyWi4gDN6PCjdahevUFxb9DBw74E1qZnFD0gmnKbjYt/Rwud9WsSv7F6zw/6iHSOvphMbeAXfRoeo7dy4cTUFZoOXBfRJs87sxkzHjZU03gsnRe4JNbrMZn8Jp4Pis9qQqA/SX4YFAZf4wDyEtngx70rMUc5fYvleX+a5tAfg1aT7wB/aLag+enF90huDXcLrKlvE3TszMMr3AbmD5bdW1+uUm4G2SRfSis/fxFOi6fMfqrKyVxwXywG4lvu4jQNFxZ+3CV/UHjg7fDvMdB8i96eDTFI+xKvzkTdsxfgX7IbRVCva+c5wqbjzamTczty9V30dDoQq5kUJJOsOZRGZkfDNIqRPsn8EW1kbpTyeMMjSSt8kBidlIbmj6K8wS+7u98zff2UUQOpl+CxRMb9inhVA1WqNZzioOFRx3KJJ0MNTI+OuxN7OOf409g==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd902a9e-57e1-4540-2126-08d8433f0bda
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Aug 2020 06:22:13.2371
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ho2PLLBhagR114nn2SSopYfov/zWx7U91HZiLb3q8Md2c0fBidC7ysBZRRW+AAL4+gsYATT/vIV4QzznP6leg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0402MB2934
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="bh/u/64c";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.41 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 06/10] Add libbaremetal
>=20
> On 17.08.20 11:41, Peng Fan wrote:
> >> Subject: Re: [PATCH 06/10] Add libbaremetal
> >
> > Since we come to discuss in a bigger picture, how do you suggest to
> > proceed about the bootloader part?
> >
>=20
> The key is to understand to use cases. What are your primary drivers to p=
ush
> the loader out of Linux?=20

We have product using aarch64 jailhouse with aarch32 root cell Linux.
With Linux as the loader, we have to add lots of hacks.

Alought we are trying to upstream aarch64 jailhouse with aarch32 inmate cel=
l,
we consider to make root cell in aarch32 mode finally.

Is it "just" boot speed, ie. do you need a full-featured
> Jailhouse later on?=20

Need a full-featured jailhouse.

Or how close would a static boot-time partitioning come to
> your use cases?

Not evaluated this. But if it could support communication
between cells, it should be fine to use it.

Thanks,
Peng.
>=20
> Jan
>=20
> > Thanks,
> > Peng.
> >
> >>
> >> On 8/14/20 7:20 PM, Jan Kiszka wrote:
> >>> On 14.08.20 19:06, Ralf Ramsauer wrote:
> >>>>
> >>>>
> >>>> On 8/14/20 5:47 PM, Jan Kiszka wrote:
> >>>>> On 14.08.20 17:06, Ralf Ramsauer wrote:
> >>>>>> (+Cc Wolfgang, we recently had discussion on the boot process of
> >>>>>> Jailhouse)
> >>>>>>
> >>>>>> On 8/14/20 11:43 AM, Jan Kiszka wrote:
> >>>>>>> On 14.08.20 11:08, Peng Fan wrote:
> >>>>>>>>> Subject: Re: [PATCH 06/10] Add libbaremetal
> >>>>>>>>>
> >>>>>>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> >>>>>>>>>> From: Peng Fan <peng.fan@nxp.com>
> >>>>>>>>>>
> >>>>>>>>>> Add libbaremetal for sharing code between inmates and
> >>>>>>>>>> jailhouse baremetal loader.
> >>>>>>>>>>
> >>>>>>>>>> The Makefile code is copied from inmates, currently only
> >>>>>>>>>> string.c is moved from inmates to libbaremetal. In future, we
> >>>>>>>>>> might need to share uart/mmu and etc.
> >>>>>>>>>
> >>>>>>>>> Might quickly become confusing to have two libs. What prevents
> >>>>>>>>> renaming inmates/lib completely into libbaremetal? Sure, there
> >>>>>>>>> are some jailhouse specifics in inmates/lib, but those could
> >>>>>>>>> likely be put in some corner.
> >>>>>>>>
> >>>>>>>> How about rename inmates to baremetal?
> >>>>>>>> And add bootloader stuff under baremetal?
> >>>>>>>
> >>>>>>> We could do
> >>>>>>>
> >>>>>>> baremetal
> >>>>>>
> >>>>>> What we provide is a minimalist runtime environment, which is not
> >>>>>> just limited to baremetal applications (depends on the definition
> >>>>>> of baremetal, though). But=E2=80=A6
> >>>>>>
> >>>>>>> =E2=94=9C=E2=94=80=E2=94=80 demo-inmates
> >>>>>>> =E2=94=9C=E2=94=80=E2=94=80 lib
> >>>>>>> =E2=94=9C=E2=94=80=E2=94=80 tests
> >>>>>>> =E2=94=94=E2=94=80=E2=94=80 tools
> >>>>>>>
> >>>>>>> and put the jailhouse loader under tools. Inmates is a "brand"
> >>>>>>> in Jailhouse context, so it should remain in some form. But it's
> >>>>>>> true, some
> >>>>>>
> >>>>>> =E2=80=A6 yep, the branding is the point why we should keep callin=
g them
> >>>>>> 'inmates'.
> >>>>>>
> >>>>>>> of the existing demo inmates can already run without jailhouse.
> >>>>>>
> >>>>>> And that's the second point - we already have some kind of
> >>>>>> support for this kind of use case. However, I agree that I
> >>>>>> wouldn't expect the preloader inside inmates/.
> >>>>>>
> >>>>>>>
> >>>>>>> Ralf, what do you think?
> >>>>>>
> >>>>>> Peng, I just read the code of the loader and I try to understand
> >>>>>> what how it's exactly working. Nice work! Do I see that correctly:
> >>>>>> You basically "imitate" Linux in a way that you manually do the
> >>>>>> early setup (some register setup, GIC init, kick off all CPUs, hv
> stubs, ...).
> >>>>>>
> >>>>>> IOW, you bring the system to the same state, where the Linux
> >>>>>> driver would hand over Jailhouse. You activate Jailhouse, we then
> >>>>>> return to the loader which got lifted to the first cell, the root =
cell.
> >>>>>> Now you use the loader to partition the system, i.e., to create
> >>>>>> cells. Therefore, you use the hypercall interface, just like
> >>>>>> Linux would typically do it for us. Finally, there's the hand
> >>>>>> over to Linux.
> >>>>>>
> >>>>>> But do we really need a separate loader? Can't we just place the
> >>>>>> loader-related stuff at, say, the end of jailhouse.bin?
> >>>>>>
> >>>>>> To be more concrete, i think it should be possible to have the
> >>>>>> full preloader-thing located under hypervisor/arch/arm64/. It
> >>>>>> should also be possible to link everything that is required into
> >>>>>> jailhouse.bin - so we would get one universal binary instead of a
> >>>>>> chain of dependent binaries. [1]
> >>>>>
> >>>>> Interesting idea.
> >>>>>
> >>>>>>
> >>>>>> Pro: You can make early use of the UART in your preloader without
> >>>>>> having the need to, for example, duplicate drivers. That's quite
> >>>>>> useful for debugging if something goes wrong very early.
> >>>>>> Secondly, you can also piggyback on existing gic routines, no
> >>>>>> need to reimplement phys_processor_id, =E2=80=A6
> >>>>>>
> >>>>>> The next thing after early boot would be the handover to jailhouse=
.
> >>>>>> Before the handover, we set a flag that indicates that we do an
> >>>>>> early boot of Jailhouse. We can use this flag to do the full
> >>>>>> partitioning of the system before we return to the guests in one
> >>>>>> single step. IOW, we never return to the preloader once the
> >>>>>> handover happened. We can do that, as u-boot already placed our
> >>>>>> guests and we just need to start them (as we would start regular
> >>>>>> cells).
> >>>>>>
> >>>>>> The amount of additional logic in the actual hypervisor core
> >>>>>> should be reasonably low.
> >>>>>>
> >>>>>> Did you already consider that strategy? Jan, what do you think?
> >>>>>
> >>>>> As we are already in visionary phase... There is another use case
> >>>>> to
> >>>>> consider:
> >>>>>
> >>>>> I'd like to have a Jailhouse variant that comes without a root cell=
.
> >>>>> That means, we will need a booting procedure that creates all
> >>>>> cells, loads and starts them - and then drops all the logic that
> >>>>> could configure or destroy them (or never includes it in the first
> >>>>> place - build-time setting). This should reduce the Jailhouse
> >>>>> runtime code to much less than 10K LoC.
> >>>>
> >>>> Ok, that's indeed an awesome idea.
> >>>>
> >>>>>
> >>>>> Peng's approach is useful in case you do want to keep the
> >>>>> flexibility to reconfigure the system from a root cell, just like
> >>>>> you can do when
> >>>>
> >>>> To be honest, I consider the "dynamic" reconfigurability of
> >>>> Jailhouse as a development and testing utility rather than
> >>>> something that would ever be useful for operative usage. This
> >>>> includes, of course, jailhouse disabling.
> >>>
> >>> Reconfiguration, yes, but reloading can be a topic in certain scenari=
os.
> >>> The current config locking mechanisms allows to keep this door for
> >>> the root cell open, even while there is a critical cell running.
> >>>
> >>>>
> >>>> What would be great would be a single-shot 'jailhouse freeze' (or,
> >>>> ha, 'jailhouse detention') call, that throws away the whole
> >>>> hypercall interface. Having such a thing, we an drop everything
> >>>> that is somehow related to cell management: create, start, stop,
> >>>> destroy, stats, disable, enable, ...
> >>>>
> >>>> And that would in fact be no big deal: Annotate all affected
> >>>> routines, replace hyp vectors with stubs, drop the section, done.
> >>>> Every code that has no other users than from a hypercall can be
> >>>> dropped. Or do I miss something?
> >>>
> >>> I haven't thought this through in details yet, but I would be
> >>> surprised if there weren't at least some smaller challenges in
> >>> implementing that cleanly. Still, it's mostly about disabling code.
> >>>
> >>>>
> >>>>> booting via Linux. The idea of adding a preloader is minimal
> >>>>> invasive to the existing setup. My root-less mode will be maximal
> >>>>> invasive,
> >> though.
> >>>>
> >>>> Why do you think that it would be maximal invasive?
> >>>
> >>> As it changes the current hypervisor code for sure. Just loading
> >>> Jailhouse via a different thing than Linux does not bring many
> >>> changes, at least to the core. See this series.
> >>>
> >>>>
> >>>> Oh btw: who would receive the freed memory? Would it remain in the
> >>>> hypervisor or be assigned back to a cell? Though that should
> >>>> probably only be a few pages.
> >>>
> >>> What freed memory? When things are only created, nothing will be
> >>> freed anymore. There will also be no jailhouse disable.
> >>
> >> There will, e.g., be a cell_create routine, that will be called once
> >> per cell. After the creation of those cells, drop it, we won't need it=
 again.
> >>
> >> If we have a universal binary, there will be a jailhouse disable will
> >> be present in the beginning. Once we decide freeze the configuration,
> >> drop it. If we make those things compile-time configurable, then it
> >> has potential to become a variant hell.
> >>
> >>>
> >>>>
> >>>>> If root-less would be sufficient for cases you do not want
> >>>>> Linux-based boot, we can skip this approach and head for root-less
> >>>>> full
> >> steam.
> >>>>
> >>>> root-less means that the detention call (I like that) comes after
> >>>> cell creation, but before cell start. .oO(we can even drop the
> >>>> cell_start code, if we find a smart strategy to drop code right
> >>>> before vmreturn)
> >>>>
> >>>
> >>> I would rather envision some alternative configuration that contains
> >>> all cell configs, not just the root cell (which would become a
> >>> non-root cell as well). Loading would have to happen into the target
> >>> memory regions before jailhouse enable, and the enabling would also
> >>> imply starting all cells.
> >>>
> >>>>>
> >>>>> If there are use cases for all three variant, we can try to look
> >>>>> for common pieces in the two Linux-free options. My root-less mode
> >>>>> would also need a single-step "create and start all cells", e.g.
> >>>>> And your idea to include the bootstrap logic into an init section
> >>>>> of jailhouse.bin is also attractive for both.
> >>>>
> >>>> Yes, I see the overlaps. By the way... Why don't we actually do:
> >>>>
> >>>> $ cat jh.bin sys.cell c1.cell c2.cell > jh.image
> >>
> >> Even better:
> >>
> >> cat preloader.bin jh.bin sys.cell c1.cell c2.cell > jh.image
> >>
> >> Again, the preloader.bin is still a binary image that only contains
> >> the preloader section, but u-boot can directly jump into it. It is
> >> still developed under hypervisor/arch/foo and hence has full
> >> visibility of all symbols that are available in regular jailhouse
> >> code and can potentially use them. We just exploit the linker to expor=
t that
> section to a separate binary.
> >>
> >> If someone wants bare-metal boot mode, we just glue things together.
> >>
> >>>>
> >>>> for the bare metal case?
> >>>
> >>> That comes close to what I have in mind, config-wise. sys.cell would
> >>> still need a counter of cells that follow (simple to add to struct
> >>> jailhouse_system).
> >>
> >> Not necessarily. We can also define a zero-termination. Once the
> >> first byte of the JHCELL magic isn't present, we're done. But that's d=
etails.
> >>
> >>   Ralf
> >>
> >>>
> >>> Jan
> >>>
>=20
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/DB6PR0402MB276074B8DEA27776C106C72D885C0%40DB6PR0402MB2760.eu=
rprd04.prod.outlook.com.
