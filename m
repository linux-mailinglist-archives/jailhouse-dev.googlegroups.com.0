Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBPXKS77AKGQEZ7FDOZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 078512C986E
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Dec 2020 08:48:15 +0100 (CET)
Received: by mail-lj1-x240.google.com with SMTP id o14sf594952ljc.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Nov 2020 23:48:15 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1606808894; cv=pass;
        d=google.com; s=arc-20160816;
        b=etGRDHSH7zqOgKyeOz8hxfKvvH8n4XFzqF3d7rsIgLF++5pgy0CcUwUUcjShkKEe2F
         ZPe2rY+YYIWJ0/OmCBHV02CEWTpQ9RdkkMayjuoeUjz4y2ncVwBBuAGi9ziCTIYt4/U6
         BTsL6+GBw/mPbIq9MJ8L+qxg++hAJPJrDtI8v0uMyb0/u+LRmv6XOGvI3S16XQYZsElF
         H6aUsYY4Jj56KpxDiwwUUJNSEwWHDjpNFwzzLn2KdXwPfjn77b4it060+U/2Ic8q+72T
         entCpEDtEq/bXiHq7U94rlMaWMe8rmPoUU7Tejh921yauEh9B7B+1JSTegVgMlIr+JPF
         atdg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=iXrT2LGM/40yby+nqEcdb9eQuBPpNjXNy5jejN0sLKU=;
        b=R7ugut0mvbn6NmKTEtHDTwwZOrYP0ABBXFhK6FAe+r6v3+xOuSuYPJ4+gAtXW0tEbi
         /dkAbhKTONX7ou5Q8zdf6a8XsHB8pGsjM9XaUwqyfhvJqqRlAsRw0N0nTskJO30KRZwd
         HsUgTjAhZXadjI+h63y5Vn8oyoi65jdX+QRJKWrhfS6Rg9xQk1DA7q5y9/987FrGwvJa
         r/sX8tl9//Ke71NZATDPKPRgMqh+HR52AJPoMxEMB8hxuHBQ9o+KA/YbcRgBXv0K0WBL
         GOrFuSXpBF4jC/zejKENzf/UuRdOVu8lTpHcQXoNVx+z9nIHltkC/aD/ym1ZTV4Dkzg0
         o59A==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=F4rVGPTJ;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.123 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iXrT2LGM/40yby+nqEcdb9eQuBPpNjXNy5jejN0sLKU=;
        b=EF9Eb5UmZ5vIwYS+/BE33Cxs+ZuuNLvoCdDHhEG+9gGt2r51Z9y+tF30+tE10V0I30
         Q+62ghj9F69C7H4ZCEyQyvaEq0a7OR0WtfBykwMFkGXiprzQj75uKUVFRhlv7p4Zd/no
         rAghMM7U5TLqe66N0kBaaGXfObyXQUyem9cmtm8JulEAgtavk29amdMv30Sl0tdGeiDz
         yx3HgO0UXSHvFgfZ0exy4koVGzdVLCRpUtecabZj7DLYCS988Ptj6eUFjqnnGeV5wqfL
         +YKYcm0wbRpzgHVfOoNjlv2YgKVSWKQxbbwtpSDOfsSHCVyHuFzixgrEnLr6yTbK+apx
         wivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=iXrT2LGM/40yby+nqEcdb9eQuBPpNjXNy5jejN0sLKU=;
        b=PA2VibfenX2ZtJH4Dsu1xOUiZTtY5isFckVBqJ3AW7sIxopi1JimLvxb06DHVrJgYG
         OqDZZjWX6yG6ok7awDzGbnlfnLouaQSsQSADuM/sXGuFxVh7+Srzq8uUW9B9Aj34ed/Y
         7hKAl1HCUmcEtsyTEY+qUMa/5YqAN0IcTwek0u85B5Vxg5U69nzys5IzgZIa/ogsjIXW
         /hLs0uqBX1deHv4OE0pDoAKiDfH8KsFZhPaHOl2BBO4MmkIVJnrDFy0RiagMGtqfup3v
         OTgqplkH5y7MSHDzwLQGSwQtsEWHFh9jMGy2RxCMpsset9ZJsY2xgktziNObeQA93xAt
         9ccQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531mg28NEi5lYnGmOlOnJyx+ftDEm7a7864wvPGIV2fGzV+WcSAo
	xw7Xavjq6QUhd2FHesisaFs=
X-Google-Smtp-Source: ABdhPJwz6O9jelhIerz2ZOUTSbdI0NhlIp/4pZn7Eg5bQiok1D4cZxE6lyOLofOOrD4eqZIif2P88A==
X-Received: by 2002:a19:fc0f:: with SMTP id a15mr639286lfi.248.1606808894490;
        Mon, 30 Nov 2020 23:48:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d0e:: with SMTP id 14ls753661lfn.0.gmail; Mon, 30 Nov
 2020 23:48:13 -0800 (PST)
X-Received: by 2002:a19:4a87:: with SMTP id x129mr723986lfa.104.1606808893355;
        Mon, 30 Nov 2020 23:48:13 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606808893; cv=pass;
        d=google.com; s=arc-20160816;
        b=bkwLRMiJLtkKaKOffrMFLu+g8BFX7T8RdFbyaqPnaW3XGUdQqBXjKCm0qk+JKV0AkI
         +yOm2E0M++LUlRluQjoH/gC4ZvzbHEKiCijw0oj4//SCPHWaI4qi86QrqivQEgVwghRV
         mPEWRS5QaNfynhZ+B3UpghqmvxP9N1hRD5CAm61Yav20/n7+4UrgV9kYohnbtKBTQMbe
         1bN9DAFZKpsgPumzDlN72ioWFtw8Crhig1XixECF+bCZVZuswRYebme4dCEK4whU9GhA
         DoFGsQQZbr01QhaCeotuMYAbjyNu/WJOGJdHpCQWkhauoQmyOPjzDyd6ys4HGe5GpKg/
         a/jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=yg5v8vo4T37Rh+4OQkkoMvkC/hF7Rvw9yOKy8ymB6VQ=;
        b=vEi7+D0SUdSIACvmkT/z6Urg28tOglkX9aoAKHoPZKnybtN33YJGMHMdlQUF70TryS
         qPjX6U2X6KGmYAB+CeOf/jWmQngHHrgdSMmGodRs0qMiFCcDiJTOcVKUlLrT7AMT7D5t
         Vt5OJQY3cgYbFudfVryv84jSZ+nOXwwgL2XpHGnXK4+NCykpwFYo7VkXKOA4vmnSlaJq
         UoZ3f4KWf6JcGzcUCPBX4rB9pF3+7oNZjDCXCiIno+H1j9ojlzbPya4uaeUhq/SB0Xab
         jnei98vElgS7TnuHIOWxXmklvsqOJNtf6yd+AZr+Ff3TTGO4f+aN13mABuXGiJ/a6gp3
         GkHA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=F4rVGPTJ;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.123 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (mail-eopbgr40123.outbound.protection.outlook.com. [40.107.4.123])
        by gmr-mx.google.com with ESMTPS id f9si31102lfl.3.2020.11.30.23.48.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 23:48:12 -0800 (PST)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.4.123 as permitted sender) client-ip=40.107.4.123;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jsfCMhvPR3wj8EcS5AKcT5kJ2xYzxAPV//fU2nmnitdHCWroo8JZdOxwEbLH5TxImi9ltqk2+KLmxSvA6nTG/j/Vxpz3KoaTqDP35hjrmxuDA6LwZU6o+QXygxxAoJMAKN2CILz0vfBbmgPdWYNrzQaYZUyeerUWIkJ2AAO1HX3ndd26F1qywI/BXiMRbS92E8D2AveKsxaKGaFOnexXaXHBu/adr/lro9GwPpf7/b3pjS9T/j/9mSg77o3F+eEdu3oIdT3MhtEdkmXf+59R18Vl7R+zqGnfYtc1zQcsR3knF1U44C3OGf6vlZcBS7IqPLa4/UQefmUlSJCS3jXbCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yg5v8vo4T37Rh+4OQkkoMvkC/hF7Rvw9yOKy8ymB6VQ=;
 b=SmYOUyrV6X64v93ERFYzw22kHKw+98JwqBRhVoHkbSObhWLriz4mZUhtZQk/A3I9v+xpALkUyLzIOElslVGBdLJUKFr2akplHrQLfAjmjYcffMHmFsD2e31C2OVQ+jbW1pXjKuP8Dte17rVSW9ycliVxotAaaTVxVDSSWSTLkm8GYhG7TWBT23t8oV0oiolRmxO1rDoZxPYZB0glVENF4vDcrCscUPwLV0glOWEghHyUSXJszbz3k2Ji6Zhj4g2lT3orKsJheyULyQAVDdJY8ByO5SAK28SvfuCKarlMJmR3CBNifQNilHp+Ww6+H4Nt4UMJPiggWaZM6lbDfergIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com (2603:10a6:102:106::13)
 by PA4PR03MB7341.eurprd03.prod.outlook.com (2603:10a6:102:108::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.24; Tue, 1 Dec
 2020 07:48:09 +0000
Received: from PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7]) by PA4PR03MB7184.eurprd03.prod.outlook.com
 ([fe80::e85e:1f1d:9e71:5cd7%6]) with mapi id 15.20.3611.025; Tue, 1 Dec 2020
 07:48:09 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: JAILHOUSE_ENABLE: Input/output error
Thread-Topic: JAILHOUSE_ENABLE: Input/output error
Thread-Index: AdbHtiGRUAQsxEsASE+5aK3baCkPlA==
Date: Tue, 1 Dec 2020 07:48:09 +0000
Message-ID: <PA4PR03MB71848B9D591CE51C322E5F9DB6F40@PA4PR03MB7184.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc025dc7-700f-4442-bc8e-08d895cd7271
x-ms-traffictypediagnostic: PA4PR03MB7341:
x-microsoft-antispam-prvs: <PA4PR03MB7341C2EC9F549CE0AFFD2629B6F40@PA4PR03MB7341.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nZIjWLpesoidl6/Z9NNYxDbRwWsgOsW1+e3idkqgtKEKwWeloTT3yTS40kLvHnDHo1Usx3TR6bxS/g8YE71WvctzUPwuJSLPGc1cftSDKWCknB/4HbZ2zNaeXVuQrPGj3/VAYmfObnAPEgoctjv3TQ8d/LBozuJ3TbBpulZ9l3H8nNLqvYAnBqAbwXnRaO4nYTdCWN/oTRjAHdTyOk6DR6kCO1EJPwtkCDHRvW7i31ywUwTCb2deFQ3mHsu1POdsCaym+4OMM5RHHDF2UW80gKy9butTX0csYtvmPgEdBmB+ZOiqkye4dIEPYx/RVW/8WYlrP1rgc4uvnDUA3LHkIyOIf90ur4ba8lrW6MlaaIdLO0spGkegGNOgufdslKAch16J2+7lJntPvHB1gQBxBGXF/KcgOQIN4/tZ8pKTpB3rLTWlZzDBRJ51ixgbWutDf+agurBJk6nkvS62CVhDJg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR03MB7184.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39840400004)(346002)(376002)(396003)(366004)(76116006)(55016002)(19627405001)(8936002)(66574015)(6506007)(66556008)(64756008)(66446008)(66946007)(83380400001)(52536014)(9686003)(66476007)(478600001)(5660300002)(19627235002)(7696005)(83080400002)(86362001)(8676002)(71200400001)(2906002)(33656002)(316002)(166002)(26005)(186003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?ZRCZcvlipTe2iVP8CKhw3aeni9yz6rMDNk7tsS6YHdB9D9y99yXt6vjw1i?=
 =?iso-8859-1?Q?rI2WVF7rDjvYe3hWynHa343Cml2t44Z/fcX5l+rT07MyRQ6zmTcVTP5tvC?=
 =?iso-8859-1?Q?MOc+JPL4DYoZUP258KLdB/M1x7hjpq+PFyrgnWwU++MsrB26Ptf9iwVSct?=
 =?iso-8859-1?Q?k3cG1+ulGX5dZm9PalHW2ISW0sH7GLMsFZrBXTkt99jKuhwAe2dgKCea3c?=
 =?iso-8859-1?Q?zg7/QbWtxYhpBQTQX4lOc1xvuEee7RgksEQS/j8gKqCzLrBVc7DUewn/xT?=
 =?iso-8859-1?Q?NKhv51X06/9xwMYeHxUbz6sdfXsLVk6DaGNQiibLwDKT6cd659Wk5RuE5a?=
 =?iso-8859-1?Q?ixZQQKd0uHqLb6f7hBDGAs4Vl1t/5iBIBlbrnu/4ZmKw/a1Wp64PYrMuxX?=
 =?iso-8859-1?Q?ccLGiz2+7sFDIEGRx8Zt/xXIE8ufLOh1s1h2n8YDZb4rAUNvfunfOKPpEr?=
 =?iso-8859-1?Q?8FF6jRuwAXWOuCI5JbywwJ/fz671X2oBqfLb0cg83wvX3i4rIzHoPXHtDv?=
 =?iso-8859-1?Q?zYjKFpaFnTLETf5hj+3CknbFZeaE7al1u/bEl/7QBRkRtlTRbkgFjg4L41?=
 =?iso-8859-1?Q?R3i6rFBko1koQVdxzXoH1fiisoeAwfBS8nak0in3ZX1Mc122PD4P0UaRcy?=
 =?iso-8859-1?Q?nxTxgUQM4ahsXcFC5PlQIUbVIpLyoXh+UiggWm+K8z/m9lh6Q3otmGx0ko?=
 =?iso-8859-1?Q?76TET335b7rVt/Q0TdutZZNKt0qVkIBTu+6KyXobDhjACVfVCM+l5A2Fr6?=
 =?iso-8859-1?Q?r8S0RfMDJhstTOjJriMkJ0ItjiF60dq3L95sejM3r64Gq2kYVr6hWedtlO?=
 =?iso-8859-1?Q?nd2nta0v4TXUyu+8GWhDivs1BBFeGzC3TlFmTQccYd94rm+KyZfCuaNe16?=
 =?iso-8859-1?Q?5oF2eGLFIcV5rI7v+xanZl/ZlLpwiXqxKVa5X0B2kmZsclsYaHvKaYyHig?=
 =?iso-8859-1?Q?UHJIr4vNIxtPasPfsUfYMcxL4iSLg5ft1uvHMCKDpAzJh+VmYOq6t9qil3?=
 =?iso-8859-1?Q?3U7lGpWtzL4B+XNBk=3D?=
x-ms-exchange-transport-forked: True
Content-Type: multipart/alternative;
	boundary="_000_PA4PR03MB71848B9D591CE51C322E5F9DB6F40PA4PR03MB7184eurp_"
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PA4PR03MB7184.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc025dc7-700f-4442-bc8e-08d895cd7271
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2020 07:48:09.3109
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mg9oJ4K+ZZC45kigWUZOTtIo6fHY77bOfz8OC6K4djsGAFsZFQOKfabaz2UTB77G1SK36/RmzbaTdYJ7c0ohPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7341
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=F4rVGPTJ;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.4.123 as permitted sender)
 smtp.mailfrom=Msainz@ikerlan.es;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
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

--_000_PA4PR03MB71848B9D591CE51C322E5F9DB6F40PA4PR03MB7184eurp_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi there,

After being able to resolve the cmdline issue, the following error comes up=
 when trying to enable the cell:

~/jailhouse/configs/x86 # jailhouse enable sysconfig.cell

Initializing Jailhouse hypervisor v0.12 (197-g2f52a11d) on CPU 5
Code location: 0xfffffffff0000050
Using x2APIC
JAILHOUSE_ENABLE: Input/output error

What does this mean?

Thx in advance,

Markel Sainz Oruna
HW eta Komunikazio Sistemak
Sistemas HW y de Comunicaci=C3=B3n
HW and communication systems


msainz@ikerlan.es <mailto:msainz@ikerlan.es>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_twitter.gif]<https://=
twitter.com/IKERLANofficial>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_linkedin.gif]<https:/=
/es.linkedin.com/company/ikerlan>
[https://www.ikerlan.es/resize/branding/ikerlan_icono_youtube.gif]<https://=
www.youtube.com/c/IKERLANofficial>
Tel.: +34 943 71 24 00
P=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa=
)
www.ikerlan.es<http://www.ikerlan.es>
[https://www.ikerlan.es/upload/actualidad_noticias/ikerlan_separador.gif]
[https://www.ikerlan.es/resize/branding/Ikerlan_BRTA.jpg]
[https://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIA=
K.jpg]
* Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen legedi=
ak babesten du. Hutsegite baten ondorioz jaso baduzu, bidal iezaiozu berrir=
o bidaltzaileari eta ezaba ezazu. Milesker zure laguntzagatik. Behar beharr=
ezkoa baino ez inprimatu, gogoratu zure INGURUMENarekiko konpromisoa.
* La informaci=C3=B3n de este correo puede ser confidencial y est=C3=A1 pro=
tegida por la legislaci=C3=B3n vigente. Si ha recibido este correo por erro=
r, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda. Impri=
me s=C3=B3lo lo imprescindible, recuerda tu compromiso con el MEDIO AMBIENT=
E.
* This e-mail may contain confidential information that is protected by our=
 laws. If you have received this e-mail by mistake, please, notify the send=
er and delete it. Thank you for your help. Before printing think about the =
ENVIRONMENT.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/PA4PR03MB71848B9D591CE51C322E5F9DB6F40%40PA4PR03MB7184.eurprd=
03.prod.outlook.com.

--_000_PA4PR03MB71848B9D591CE51C322E5F9DB6F40PA4PR03MB7184eurp_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EstiloCorreo17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 3.0cm 70.85pt 3.0cm;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi there,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">After being able to resolve the cmdline issue, the f=
ollowing error comes up when trying to enable the cell:<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">~/jailhouse/configs/x86 # jailhouse enable sysconfig=
.cell <o:p>
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Initializing Jailhouse hypervisor v0.12 (197-g2f52a1=
1d) on CPU 5<o:p></o:p></p>
<p class=3D"MsoNormal">Code location: 0xfffffffff0000050<o:p></o:p></p>
<p class=3D"MsoNormal">Using x2APIC<o:p></o:p></p>
<p class=3D"MsoNormal">JAILHOUSE_ENABLE: Input/output error<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What does this mean?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thx in advance,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"370" style=3D"width:277.5pt">
<tbody>
<tr style=3D"height:37.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:37.5pt">
<p class=3D"MsoNormal"><b><span style=3D"font-size:10.5pt;font-family:&quot=
;Arial&quot;,sans-serif;color:black;text-transform:uppercase;mso-fareast-la=
nguage:EN-GB">Markel Sainz Oruna</span></b><span style=3D"mso-fareast-langu=
age:EN-GB">
<o:p></o:p></span></p>
</td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td width=3D"200" style=3D"width:150.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW eta Kom=
unikazio Sistemak</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">S=
istemas HW y de Comunicaci=C3=B3n</span><span lang=3D"ES" style=3D"mso-fare=
ast-language:EN-GB"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">HW and com=
munication systems</span></b><span style=3D"mso-fareast-language:EN-GB"><o:=
p></o:p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB">&nbsp;<o:=
p></o:p></span></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><span style=3D"display:none;mso-fareast-language:EN-=
GB"><o:p>&nbsp;</o:p></span></p>
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"800" style=3D"width:600.0pt">
<tbody>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><a href=
=3D"mailto:msainz@ikerlan.es"><b><span style=3D"font-size:9.0pt;font-family=
:&quot;Arial&quot;,sans-serif;color:#333333;text-decoration:none">msainz@ik=
erlan.es
</span></b></a><o:p></o:p></span></p>
</td>
<td width=3D"100" rowspan=3D"2" valign=3D"top" style=3D"width:75.0pt;paddin=
g:0cm 0cm 0cm 0cm">
<div align=3D"right">
<table class=3D"MsoNormalTable" border=3D"0" cellspacing=3D"0" cellpadding=
=3D"0" width=3D"75" style=3D"width:56.25pt">
<tbody>
<tr>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://twitter.com/IKERLANofficial" target=3D"_blank"><span style=3D"c=
olor:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=3D"0=
" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=3D"_=
x0000_i1030" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_icono_tw=
itter.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p=
></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://es.linkedin.com/company/ikerlan" target=3D"_blank"><span style=
=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img border=
=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" id=
=3D"_x0000_i1029" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ico=
no_linkedin.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
<td width=3D"25" style=3D"width:18.75pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><a href=
=3D"https://www.youtube.com/c/IKERLANofficial" target=3D"_blank"><span styl=
e=3D"color:blue;mso-fareast-language:EN-GB;text-decoration:none"><img borde=
r=3D"0" width=3D"20" height=3D"20" style=3D"width:.2083in;height:.2083in" i=
d=3D"_x0000_i1028" src=3D"https://www.ikerlan.es/resize/branding/ikerlan_ic=
ono_youtube.gif"></span></a><span style=3D"mso-fareast-language:EN-GB"><o:p=
></o:p></span></p>
</td>
</tr>
</tbody>
</table>
</div>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><b><span style=3D"font-size:9.0pt;font-family:&quot;=
Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">Tel.: +34 =
943 71 24 00</span></b><span style=3D"mso-fareast-language:EN-GB"><o:p></o:=
p></span></p>
</td>
</tr>
<tr>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:9.0pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">P=
=C2=BA J. M. Arizmendiarrieta, 2 - 20500 Arrasate-Mondrag=C3=B3n (Gipuzkoa)=
</span><span lang=3D"ES" style=3D"mso-fareast-language:EN-GB"><o:p></o:p></=
span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><a href=3D"http://www.ikerlan.es"><b><spa=
n style=3D"font-size:9.0pt;font-family:&quot;Arial&quot;,sans-serif;color:#=
24ED31;text-decoration:none">www.ikerlan.es</span></b></a><o:p></o:p></span=
></p>
</td>
</tr>
</tbody>
</table>
</td>
</tr>
<tr style=3D"height:13.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:13.5pt">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"800" height=3D"44" style=3D"width:8.3333in;height:.4583in=
" id=3D"_x0000_i1027" src=3D"https://www.ikerlan.es/upload/actualidad_notic=
ias/ikerlan_separador.gif"></span><span style=3D"mso-fareast-language:EN-GB=
"><o:p></o:p></span></p>
</td>
</tr>
<tr>
<td width=3D"366" style=3D"width:274.5pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-GB"><img bord=
er=3D"0" width=3D"200" height=3D"96" style=3D"width:2.0833in;height:1.0in" =
id=3D"_x0000_i1026" src=3D"https://www.ikerlan.es/resize/branding/Ikerlan_B=
RTA.jpg"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></spa=
n></p>
</td>
<td width=3D"400" style=3D"width:300.0pt;padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal" align=3D"right" style=3D"text-align:right"><span sty=
le=3D"mso-fareast-language:EN-GB"><img border=3D"0" width=3D"357" height=3D=
"75" style=3D"width:3.7187in;height:.7812in" id=3D"_x0000_i1025" src=3D"htt=
ps://www.ikerlan.es/upload/actualidad_noticias/SINADURA_EKINTZA_BEREZIAK.jp=
g"></span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></span></p>
</td>
<td style=3D"padding:0cm 0cm 0cm 0cm"></td>
</tr>
<tr style=3D"height:10.5pt">
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm;height:10.5pt"></td>
</tr>
<tr>
<td colspan=3D"3" style=3D"padding:0cm 0cm 0cm 0cm">
<p class=3D"MsoNormal"><span lang=3D"ES" style=3D"font-size:7.5pt;font-fami=
ly:&quot;Arial&quot;,sans-serif;color:#333333;mso-fareast-language:EN-GB">&=
#8226; Mezu honen informazioa isilpekoa izan daiteke eta indarrean dagoen l=
egediak babesten du. Hutsegite baten ondorioz jaso baduzu,
 bidal iezaiozu berriro bidaltzaileari eta ezaba ezazu. Milesker zure lagun=
tzagatik. Behar beharrezkoa baino ez inprimatu, gogoratu zure INGURUMENarek=
iko konpromisoa.
<br>
&#8226; La informaci=C3=B3n de este correo puede ser confidencial y est=C3=
=A1 protegida por la legislaci=C3=B3n vigente. Si ha recibido este correo p=
or error, reenv=C3=ADelo a su emisor y elim=C3=ADnelo. Gracias por su ayuda=
. Imprime s=C3=B3lo lo imprescindible, recuerda tu compromiso con el
 MEDIO AMBIENTE.<br>
</span><span style=3D"font-size:7.5pt;font-family:&quot;Arial&quot;,sans-se=
rif;color:#333333;mso-fareast-language:EN-GB">&#8226; This e-mail may conta=
in confidential information that is protected by our laws. If you have rece=
ived this e-mail by mistake, please, notify the sender
 and delete it. Thank you for your help. Before printing think about the EN=
VIRONMENT.</span><span style=3D"mso-fareast-language:EN-GB"><o:p></o:p></sp=
an></p>
</td>
</tr>
</tbody>
</table>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
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
om/d/msgid/jailhouse-dev/PA4PR03MB71848B9D591CE51C322E5F9DB6F40%40PA4PR03MB=
7184.eurprd03.prod.outlook.com?utm_medium=3Demail&utm_source=3Dfooter">http=
s://groups.google.com/d/msgid/jailhouse-dev/PA4PR03MB71848B9D591CE51C322E5F=
9DB6F40%40PA4PR03MB7184.eurprd03.prod.outlook.com</a>.<br />

--_000_PA4PR03MB71848B9D591CE51C322E5F9DB6F40PA4PR03MB7184eurp_--
