Return-Path: <jailhouse-dev+bncBAABB5U4ZCQAMGQEHAGWEQY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id D58F66BBC0D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Mar 2023 19:29:11 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id i16-20020a2e9410000000b00298a5717749sf1693290ljh.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Mar 2023 11:29:11 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1678904951; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vg7vLpzmgq2Iw2jtbAp03tI1kDnj5u9w98V0mWJdouCJBiWm5sOke0l/rxnLWWDvH0
         n3tuzQnb0OpZ+N8E89b/jxO5I7JPFrkpr2Lmeh7vDwJ3U+xUbRRNTB97J5hFKplFMmft
         FHnSZqE1uPmg80aqADlECqKdjKqfzC+shUsqD2aUNhwwBCHfVKVxisHROcYg0i2AVOI0
         VKT2b86YEN6IDPVT/7GvSZ21yiN6HEO96qC7TNmyk0GJVtXKu06bTmjH/TUoyZelNEwl
         eCSOOLJs0cvCbrPiim5fVc2oqwQ0M00cUjBHOCnGZrjl2Nx/PmwkKGeMFPsp7sIOg4m1
         DOIg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:msip_labels
         :content-language:accept-language:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=pDBLv3XsCUfEsNNkCimMrjKw8Dn3Rb1GLHrdOngIG8o=;
        b=glS54cR0IIS3a6vxWQjI3CVrKvAyLdSRpvNGVqZel8K9kq2z3h0YmtJJs356Xqd7X6
         iqNHNRgJPxLtn8LbU8OzkcXcuJsEVJaZTwjtdFUA8gn80/sAIspSySk2IWZHYYahMvr1
         3NADxQ/IZuDzpU/FdKLnzf1CblKkcNSEESWXOqfIWhO27VOJ9K4q7fUzQX8iwDi5bX3I
         7U+IBHDMVx9xXkg3r9jNowTG43XPFQdoUyAKqFHMLXVoWf+zZr7R/ugsOQTO1c439eZH
         0hU5K4Ft9IORrlWb6puOENdqRUi+P4egr1dve31IP3X/dh1hESf2faVnh74v0nzmpBtR
         IjxQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=juk3h9Pt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of laurentiu.mihalcea@nxp.com designates 2a01:111:f400:fe0d::605 as permitted sender) smtp.mailfrom=laurentiu.mihalcea@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1678904951;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:msip_labels:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=pDBLv3XsCUfEsNNkCimMrjKw8Dn3Rb1GLHrdOngIG8o=;
        b=q9ESQTsEvhvpogujk6miEpN4M6pNNADFoKH7gO45eL1/IEK13S/6XxIWHlFmAFM+Ql
         flq8w7OBqYkb/zVXoB/dfqlWmiiH3Mb5P37PlM3UBnftDNLGaSqmfZ8XB49KWQKNS1JL
         bm66U3aUJQSDIkYrmwErFnb0+fxekbSEHQyQilFGiAwlHa/3scCenwIYU5J/MwHsBpjI
         ZgtW6Wdi5d6yzXm2FwnA7mJtbem3VGKhPL2+wtaS9yf8YfHs4kCkcw0Hdu9uGVBWTPTc
         S0ysdzyxKmJde1vUYZC+J/iZ7/tVLRkD90W85+S3jwCPkACHqUroePDH4fNFel2xgD1X
         d8Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678904951;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :msip_labels:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:x-gm-message-state:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pDBLv3XsCUfEsNNkCimMrjKw8Dn3Rb1GLHrdOngIG8o=;
        b=HDVb236iGeMoQK8dVfve+Eaw0vohPK1MjaTprl4neA/su787u8c1M7veb4dBeWAPwm
         HWTQ2EevDeVqnzrQ9/He3TIktxm/9qkWzU8kCGBPVtTcGzZ7PUtTtFUdWHgoVx0dFOeu
         Qxm1KRCz8ve2F28QvGNyTtX6CerG4IMlz8M2ay+AQWZHeJnMi4M+OkCwScnmwVf7bD6f
         zl1UAaIddHSNiWFu4+CCGmnFH9x16nwFJpXWFDiPuKX/Gt1PgF8+OHLwXn4KvC+TERax
         Avx21mVSbEb4I/UzK0LONDga1/xCJvJKqCGHjTQRhlG3df/kIrn3soKGrBficC8peo5Z
         Thzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKWwBXykE5gdYURRQf2KJsj8kh48yVEgR69+MLxKOR+RTCumqj2n
	FhIKhGSLqmuVu+caS2eLDS0=
X-Google-Smtp-Source: AK7set/FjZkZnygA1RqyeQis4BG3hNQwOyxwVOL8l3jmDELz9dxdEED0l0dtjYy2u1oPgnXGTAmxxw==
X-Received: by 2002:ac2:51a3:0:b0:4d5:ca42:aee1 with SMTP id f3-20020ac251a3000000b004d5ca42aee1mr2348428lfk.1.1678904951162;
        Wed, 15 Mar 2023 11:29:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e53:0:b0:295:b860:7804 with SMTP id g19-20020a2e9e53000000b00295b8607804ls3530184ljk.5.-pod-prod-gmail;
 Wed, 15 Mar 2023 11:29:09 -0700 (PDT)
X-Received: by 2002:a2e:86d0:0:b0:298:ef5e:3d94 with SMTP id n16-20020a2e86d0000000b00298ef5e3d94mr233867ljj.36.1678904949280;
        Wed, 15 Mar 2023 11:29:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1678904949; cv=pass;
        d=google.com; s=arc-20160816;
        b=HocjgA4c9gEW27BLtFkCovagcGT90XBqWuPKgSXNToTN/tI0AxPk+2ZWcBHy/eeDw9
         /yKd05qD49wKiwO28iB8VN8k8Ki2QJNwUbP5bFQ3cTM7XANMN0MIVWK+rFaeShWpz9LX
         eIX/ZUjnPJ3B4deBkSxqt1w/veHIax7HtIxDLrU+fMwMZnSXyA5b7ans1o6skq/kk7Xf
         PI6OXJ2N8zBw0ZGTE1zI1o/H1tfaETI27tb6lU6eZrf3FHPnuYoPOTLmilrMOtIBgyni
         SVGXxWvHYwu0CwreNGU4Zk8lL8hR0Lfr7vd1vWuGxxcoBMl+7RDhQJETm22PoLajqkiY
         N45Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:msip_labels:content-language:accept-language
         :message-id:date:thread-index:thread-topic:subject:to:from
         :dkim-signature;
        bh=IMfm/ybGYQ5M40RJcSlBmg67qo/R401B9Shb6UIKmEw=;
        b=Z23p4bQZyEQzPkGnFygMHRXQ3Lg/LHcXipN0EloyWaVb0yd5Kqjke853wmOnTU3/pd
         fdpk6cxOmQCTQT/9G5LZmG8+A8yT/rHgSCqdJHgwnD6Xekj92XgA02DltnKOCi8f9r0N
         QAEQM1SJI6/cs57tqZE2mRn68WM6yvYxrKPWtplPTE/OhgHElIV5BIwTIkJ8ewdp7UP2
         xupqRz8C5BzUIQFg6iEvuAff6YpUZ5ArYQOO6G5gY+V+RL8HDdut3ClUcNLI1ofKklz0
         7jwyaQD7ogDzCPw3xdDkxfyyHfE/xiMPrC89juC+QBKwa/EejwxDY2m4Coxet4KIHQJI
         0JBA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=juk3h9Pt;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of laurentiu.mihalcea@nxp.com designates 2a01:111:f400:fe0d::605 as permitted sender) smtp.mailfrom=laurentiu.mihalcea@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0605.outbound.protection.outlook.com. [2a01:111:f400:fe0d::605])
        by gmr-mx.google.com with ESMTPS id z33-20020a2ebe21000000b00295a08c1798si301576ljq.1.2023.03.15.11.29.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Mar 2023 11:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of laurentiu.mihalcea@nxp.com designates 2a01:111:f400:fe0d::605 as permitted sender) client-ip=2a01:111:f400:fe0d::605;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ic1ICJ5r2EjLQqB2QVsx2m97KosJZRiK9dt3a9Q4rjgnCU8SeEW344OBzF7JTAVatwaO8tccXsE5HRpg1PEVy1b9NAs0tBpNHJVbUcgK/77WIIcG2Kb+5a6abSruj/yfj326HJqjTz4sWK06fz1iWAwoiVtGhvpLT6N4vR9J6iEgjMBkxS/9bIEEwJmto7Th3MS+CpEzf1Fm4CexgIqwZYheidlybTy0iyyZm2BZrBzieTm+KeOaACIldkKgmOW6RvqE4oyxg5Rp3NZ2uchDL20GFEYZYOvvLhvXDN4vc7A8x2C1nAxUWeJpAgf0RLoyNYuCe7Y7qYK9cPywiRZyKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMfm/ybGYQ5M40RJcSlBmg67qo/R401B9Shb6UIKmEw=;
 b=HpSEoVNVDS/LubPCM/y6CX4BzfUH+M/mr1IratToDYCbgSqmd1YOokmZx4Jdo5TPCNQTADhPxtoE/gDkmbwrJwhixq1HOw35otv/QkvZiWU/yJlRGG7//51Gweb6nOsmBsaaai1HikHHladl60oGZO47wt1h6OhUci3cU4r1+bFj+lzz8xihyJ8VITNEMrDHRQHRGwPMY7zryIDSPRX2ufBCVl25Dj+42RmGzPrt/ZQpCBTqA0W8G3dDKuSwQXCQcN9jn8YG5nRaFzGvFsHOjLA4/uvFB0eEE1FQjYSb7xmDI4dTEifpWh/jscsQ76LVbwddQWvm5JYj5EeZ3l1scA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com (2603:10a6:803:121::19)
 by AM8PR04MB7938.eurprd04.prod.outlook.com (2603:10a6:20b:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 18:29:05 +0000
Received: from VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::af1d:22cd:cec:516b]) by VE1PR04MB6607.eurprd04.prod.outlook.com
 ([fe80::af1d:22cd:cec:516b%7]) with mapi id 15.20.6178.026; Wed, 15 Mar 2023
 18:29:05 +0000
From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Question: integrating Jailhouse in the Linux kernel tree
Thread-Topic: Question: integrating Jailhouse in the Linux kernel tree
Thread-Index: AQHZV2WaAgvO+JH8vky3kXWjQCBJKw==
Date: Wed, 15 Mar 2023 18:29:04 +0000
Message-ID: <VE1PR04MB6607BED3DA85B3BFC335000792BF9@VE1PR04MB6607.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VE1PR04MB6607:EE_|AM8PR04MB7938:EE_
x-ms-office365-filtering-correlation-id: ea87d081-dc91-404f-fe59-08db2583284e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OyXUNyoQzaeRCexGhdrz2ie5Z0vPuOW0mlgVgGLZ+QgrUcT3vYj+jxdFyhOXhbHaCtT8p8rogiMpI3xKkh+5/frohtLn1lBG3S1xTjuc5MrpnQEPChPGWanOAXW4KGmSpjZZaB2dFEtQV8sc5gNL90TmrRd3azAdOQocyM0BjRJQTkt9GLXM95vmDrhBTlxkTRGhPPe7U081X7RJ87GPPpdeIPRz88OP3W+/KaE/p1ktDGZl1DaCt0MsJuwM15bP/DthcQHZCIRmTtRlcbyFlU4YjAXcB2yEapJaLA5B21qMXu+2FrOTXauFXYtpBms9wWiXvZOq6fx3Y2D8cs21DN4vOnKVwg2GG4YngiGUAYVMgmrHQqEK5ZJsz9FdXB0Zc/3qkQp49igznlN18HvsuyOV7rOF/d+YDt2WcAoOkUFefZudenDdzhG1B6iqZDRVDHa9X+uz4nys6a30JGj+keVTQTZmAQ/kB0JxMOg8Tn+TORymZ+kYBKa/3VkdQq8MSAYXM+1sG+ZCB6Y+u+xDk3bNlF9+CjWzws2AfSrU5ENHxYl6HuD3ptHpU9B3wM4CrCJ9rAeCidYJe40SmTDh8AmWAQx5gxJUrV3upaErwhv6WDuqxrGGMFaQmZiWkxCI9oEmJI/f4cxTq3dpEe7oJKI5HMtgn2GtRRAoWt21cDuz6rhuncG0OV8vIuMKilS291965xDaNZlT00+03skIWA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6607.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199018)(86362001)(38070700005)(8936002)(66556008)(52536014)(44832011)(33656002)(6916009)(8676002)(4744005)(5660300002)(41300700001)(2906002)(316002)(64756008)(66476007)(66446008)(76116006)(66946007)(38100700002)(122000001)(7696005)(6506007)(55016003)(71200400001)(186003)(9686003)(19627405001)(478600001)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S1p6NjhJNm03VWJWZytHMXRLa1BuSFNETXcrOHdjU2JwblhBNll4UksvRlpq?=
 =?utf-8?B?eGtrL1lWa0dQY3RXMVUwNFYzMkJrSXR0TUdXdFNQQngyQmNabHZxVnlyVWxC?=
 =?utf-8?B?WE03TlRtRkozR0ZRR2wrb1ZwZmxqZW1EcnlQeVV6dXZrckVOVGlZTkI5NkVH?=
 =?utf-8?B?cE93czFRbTB5VkZDVEpXVmpnNGV6akZOY0U1OTZRc29nQmRsWkNFUzloTjhU?=
 =?utf-8?B?a2U5VW5TdkhxdXRzeS94UTN0NGdld3RLOHpiZ3I3ZkMwTFNnLzRVQkpXdFF2?=
 =?utf-8?B?WFQxMXBWUk5seTlpMjQwVmtkTERtM0t6V05XWXlkZTFyMlRxOUJNTnNZVllL?=
 =?utf-8?B?NGFQMFhDMDJLcStxNHhWS0kyYldweUFDdjVSYmI4Y0RkTnFwSDlVVjFhTExm?=
 =?utf-8?B?Y0oxekF1YU5sKzN5bXVLTDlHaURLVlkrT0w0NkFVUDA3aXZYNGFjeFlVeldX?=
 =?utf-8?B?RmRlWHFsQ0JBQkc0dTFRcHdrUjhEMTIxeU5wekNGRTduR04wYTM5bll2OXdE?=
 =?utf-8?B?OHRjSnZaanM1TVh1eWx6Ykk5MUEzTTdGRFhKci9vUWNxek9hVXpwaG04NkZP?=
 =?utf-8?B?b0twQ3Jqcno3MHVBRVhrVFlOTVoxWVR3TzQxWG1RZ2tNNTFkamRJU0tzc1NQ?=
 =?utf-8?B?b0xHbHM3WUY2M2pTc2lxa3UxenV0NFNtWldEU2NEQUsra21QNW1FallVYVJD?=
 =?utf-8?B?QVk5SVhJR2NvVG5KNExEc1BEMFlQSkd6QWNpTStyZVNoV0FiU3BkaEk1Qk1r?=
 =?utf-8?B?TGQ3UUpYTGxrQ3lha04vaXR0Q1R4eWpZSGJ2cEdIdkVmT1VBTmVjYWQ1d2NG?=
 =?utf-8?B?Q0NtTEExM0s5TlpZWkxoVnMrUy9SelVJZWdyb1NRNzhicE5JVU5CaExKUlRs?=
 =?utf-8?B?a1dxYmlVR2JzZVVYeHo4ZlkrN2pUT1VhUUJxY0NMck9iUWRHVUNOOEJnOGU1?=
 =?utf-8?B?YzVFY0lqb2FJWjlWSXpqaGp6bnJDbldyQWZzYTlNeVllazRTN2NPQi9NSTI2?=
 =?utf-8?B?aHVuNjE0OHZDZkNRVnl3UTFVQ0xWU1orVFR1c2oxTVBGQzA2N2grSGVCZmFK?=
 =?utf-8?B?bjRJNzZFNWJUR3lPTDRCT0g5MytYWFlHOWRNblYvNXV0UU45czNyU2Q3M2tN?=
 =?utf-8?B?aWpwbTVzcFJMNGphOElEdVNsZW1WQnNmc0VTM3pKYlcxSkV0RXhrRyszMmlk?=
 =?utf-8?B?c3FBY0xyaEhNcHdDelN4MGVmTUcvSkVhUGFmNzVCaXdkVUFLU3Y4MVBhRXVL?=
 =?utf-8?B?bXgvU0tPVG91bEN6SUQ2aTlGcmIrYnhjYi9RNEpnR1FNSVhZdVlURTVUUzZF?=
 =?utf-8?B?NkV4bjlJZWlpcFlaYmVMcGhGbHYwbUVZTS9hUTdCaWUwakhxNXN1U0JjYVI3?=
 =?utf-8?B?aE5XNER1b1hiT245S1ZZanh2Ym5kS1F0Q1I1TmtTaG5wcGFVQVlyaGRGaXhr?=
 =?utf-8?B?REVQRlBSYkJtMUpTeUg4ZUlaUE9GUEJuUnZwTFpVeElBTGwvZWRLL2RQNmZL?=
 =?utf-8?B?K01nczU5NllsZ2owcDNZYnRVdnBPN1UyaTBaRWROS1NqWHNDSlozUjZiYWo4?=
 =?utf-8?B?bXI0TTdzSzRaVGZDSGkzQW1MN1ZhczAyOERoLzJZaG9JL0JKMkdzWi9kRWVR?=
 =?utf-8?B?UGRaQjJPeU11OFFjb2crVUV2QUs2V2sxQWFnaDV5K2dTYlhhSmdMMU9JUndP?=
 =?utf-8?B?aWR0TmN2cTlDVGVJOGNmY0ZQU0c1VWtPSDc3VzAzVVVENGM2ZWpPTVpKR0I5?=
 =?utf-8?B?UWdaQ0VsQ2hKZ3ZlQ3ZPVCt1ZXFJWExrMThkNHJnKzI5QWVQRWZvSUFzemZE?=
 =?utf-8?B?djFMWmxIV1U2THlZVW1jQXdmaTVjT3RKaDJKZVdwQXZwS0w1MHRjZ29XSTJr?=
 =?utf-8?B?QjI1akRVbTl5alBzUjdBWnUxVFBjSUdBZndyazZaWjl5bitnUDIrMG40V3ZY?=
 =?utf-8?B?cXBmSnZBNVBoRFdJN1p0TVpRRHhzcWtZaDRsZHFwK0RweWR2VjFIZW1CRFUy?=
 =?utf-8?B?K2twNC82WCtyRSsxRlY0UGxJYytVc2FqeDh3NXRwNDNoS0xpbEUwb0NOOUc4?=
 =?utf-8?B?Um1xL1ExREJCL205TmJKUUZsdWdXclBZMFpWcjRSUWZlV1lWcFR2aW9iSlhi?=
 =?utf-8?Q?hUUMwM/Ecej+4WdZaDjn7MAiS?=
Content-Type: multipart/alternative;
	boundary="_000_VE1PR04MB6607BED3DA85B3BFC335000792BF9VE1PR04MB6607eurp_"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6607.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea87d081-dc91-404f-fe59-08db2583284e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2023 18:29:04.9641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7VTYL/KTSC+78ZSBrzuKXWg+62Vigtt1MJ6XViorZPGbCVYXTKFzQR0rledlUiLWtQKHnNYGFZHJ/MmW5z44T+pfj1HZTBzllDGxDpSEjjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7938
X-Original-Sender: laurentiu.mihalcea@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=juk3h9Pt;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 laurentiu.mihalcea@nxp.com designates 2a01:111:f400:fe0d::605 as permitted
 sender) smtp.mailfrom=laurentiu.mihalcea@nxp.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=nxp.com
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

--_000_VE1PR04MB6607BED3DA85B3BFC335000792BF9VE1PR04MB6607eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm not sure if this topic has been discussed before but would it be possib=
le to integrate the Jailhouse driver in the Linux kernel tree? This would a=
llow other kernel modules to utilise Jailhouse and would be useful in cases=
 where user space is not yet available (e.g: during a device's probe()) to =
do all the setup.


Use case:
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=821) Linux boots
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=822) device_x's probe()=
 is called
=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=823) User space becomes=
 available.

I would be interested in enabling the hypervisor, creating an inmate and lo=
ading some image during step 2) of the above flow.


Thanks,
Laurentiu Mihalcea

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/VE1PR04MB6607BED3DA85B3BFC335000792BF9%40VE1PR04MB6607.eurprd=
04.prod.outlook.com.

--_000_VE1PR04MB6607BED3DA85B3BFC335000792BF9VE1PR04MB6607eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Hi,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
I'm not sure if this topic has been discussed before but would it be possib=
le to integrate the Jailhouse driver in the Linux kernel tree? This would a=
llow other kernel modules to utilise Jailhouse and would be useful in cases=
 where user space is not yet available
 (e.g: during a device's probe()) to do all the setup.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Use case:</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span>=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=821) Linux boots<=
/span><br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span>=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=822) device=
_x's probe() is called</span><br>
</span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span>=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=82=E2=80=823) =
User space becomes available.</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span><br>
</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span>I would be interested in enabling the hypervisor, creatin=
g an inmate and loading some image during step 2) of the above flow.</span>=
</span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span><br>
</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span><br>
</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span>Thanks,</span></span></span></div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<span><span><span>Laurentiu Mihalcea</span></span></span></div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/VE1PR04MB6607BED3DA85B3BFC335000792BF9%40VE1PR04MB=
6607.eurprd04.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/VE1PR04MB6607BED3DA85B3BFC33500=
0792BF9%40VE1PR04MB6607.eurprd04.prod.outlook.com</a>.<br />

--_000_VE1PR04MB6607BED3DA85B3BFC335000792BF9VE1PR04MB6607eurp_--
