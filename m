Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBBTU5ZH4QKGQERLD453I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E282417A2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 09:54:55 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id x190sf3832860lff.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 00:54:55 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1597132495; cv=pass;
        d=google.com; s=arc-20160816;
        b=VK7DynyRrGEF0XEEQrKltCjR//JZmy/C4bzVKDbM3+xiV49ICnsPIkkwByr/vRJJgi
         XVSba1qDzUqZeLA7NlJmtKGtvm8NpmCv0Aq5Xaw3hyGzU4fEWK0w/kBWjvIvqbeBblgb
         ftdFDDc2BRmnyxG+6GZOF7wqh7238bTWn7dKPDDruHt6F3vJ3i0+G+gCknhT78oqvNfQ
         Pj4urtBKUKn71FqW/fE8xVS30tcrzLStswJbjeG/mhSOdXdcbyGQmqzKeLhhE0FGVi2g
         lqVWtuBwsVGjJilUPhIzzGT6leBdgibYJEaMbdg8dHLt8IAt2SfO8Jl8NUZuihv+pq6p
         6Hrg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=ty3BDIXSnwuTDA9/HoeOowIdtpP8PRuVefnJyr1ky9w=;
        b=GGH+8ghXIx3fhW9FBYwdvnp/xpYHVGrDcsKRs9gVv7nFHXWLto3vFl9n0D6vnISlB1
         8iuaJncgbNkMq/XzkfDCv7/vi5960UPGmffzizMM/fiSqtFfVLeSNyTErxBf1PPZM3T3
         uL0LyVV+evMgPEl1r/5vljMvU6ancN2C/WUmjqavtWXV90pdr7PxKvhc+wSBbg0juPji
         lvR/GTdmdD8D7u5m7F9CSZrlhkvsx1qpmOUyaBdFhhBB6Ob/VxSeuIUxKb7Vo0F7xsbz
         gWnzryUHb3eik3/FPd9tJ1DNyLzZJIintkIEwW61XthjNJeZLtriqUItahDS7TF5pI0K
         FMUw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=VJfknnbc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ty3BDIXSnwuTDA9/HoeOowIdtpP8PRuVefnJyr1ky9w=;
        b=ngFuwLjY3/SuH2gxD3nWelGBeA59qlTyW5IJ1WwrMM3y102FE+uvvzoPBqqAdeu10I
         th4RDdyqnfjYms2X6PkV7t4IHG738RoVddP8A/QgRrjk/IEXp98NefmIBu2GyLvQANbi
         5zqrrwZAbMt00RBIJUuC6hBoFecQc+Fd5KEVLIMlJF2y6PYh4kroPMKBdWXMHwz0yx4m
         JyA8syuQhRdj2kU6u+HMyC0SadYUNqfEUbd8HBFeKt0+rUUUKOMh8t2SQjLg8C/pnN1v
         5Hr3gN2+zD4ukGtbwaBmi7kAQqylALSYo9EZjiXjil4GZgyo0EC+PCmWGz8exPrsTziw
         10Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ty3BDIXSnwuTDA9/HoeOowIdtpP8PRuVefnJyr1ky9w=;
        b=nYHC6mMJSowjP0Ky2RHgKh5O/pex/LYxl2fBzWEMsLhH04oF/YmyHWrDUwVfhsb+J/
         /hBuKFn7J9oIHNfUOOXKILT7I/FqrOwcsbZ4ExQjX63JgnpLZUsO9xJuZGZPBQcVdKeP
         1kQQ4FrKdu7o6xsb7kxITklBSiMMrAwkXMRt98ZZ6wgiVh/2q04N5wGUn2Sc4lYJe8zi
         W5q5y10TEvvYd/FfZzTnr2A3QGtkTGPpnx8YfrIk6R0LOcswQC36qIBJcUkAScajS73W
         lYH7z0ADkmyh5uPnJ5BDRe1M8/c7/5BRWwKJYwvhZLrWsALIeL9z8utqZmwREeU0m8ir
         rmDQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NkZgBQA+bQaKOPOrfkvIL4n8p4SowuZ3F6jbEz5lGJciy9m73
	K0tOhsIGD5o+uXr5EIo0chw=
X-Google-Smtp-Source: ABdhPJxIGz9t0hZCo9wPteRXGFx+kVuFxhz7Rs+qMwRVgEfvSrwwG8PjbpuMkymkW9Z+dC+DvpekUg==
X-Received: by 2002:a2e:a179:: with SMTP id u25mr2593062ljl.101.1597132495029;
        Tue, 11 Aug 2020 00:54:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4f43:: with SMTP id a3ls901080lfk.3.gmail; Tue, 11 Aug
 2020 00:54:54 -0700 (PDT)
X-Received: by 2002:a05:6512:330c:: with SMTP id k12mr2587896lfe.151.1597132494161;
        Tue, 11 Aug 2020 00:54:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597132494; cv=pass;
        d=google.com; s=arc-20160816;
        b=yTHsdQRUltD7WYaBwrPqn2YaGK63x2bCKqYNoAreRaE4f+bMzVbbiUVhljYUKOOO7G
         dmH8iyhhRPIczAZsSkz4rOxzPcGqsgJQltf3oJhb1OOIi3Wyo5T93HTQS9NztW5hkOBw
         HAf8Eo5rPtz90opR4h57GGYZBKropPPJme3tPOOsDFLe4bhP8eKrLexeDIF6hhN3LRXo
         Cf3WoRKtmUxeGNt6JVqPvzVJhXg8oC4F7fsVFejtXMcyIs+EVIYTOKc9XO6CTlaE6dmV
         Su+SAfJjiR2SO2D8xVFo1/NjvttYedWsefVvh0mTWoo7Vca3uxD0FdMI5tWAPp0KLzYd
         QWYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=6D67kB6aFpVyEVcQosx4CIe2ufG7PbTXUTwJEUFm7E8=;
        b=YgTWyBiGZzH4b3jXFFQInGst1ZkttJDi/A+uLd0waVd05RMNAaNkdwpvwddBte/Hee
         6ZlF8JXCjo38xlmcCfnt77AS0G1BzHW8MQhNgcAETjpX5V5YGzFySMg+B3m4aaVXjW1o
         FUJt4SQ0cpo0IT1S88GXDUGPzfd7ohbRmA7S/m4tQVGJJr/2wYs353BPy+UBV/tYiK3v
         3ApM2ec7IxvxEBdOPc02cRIwKBjH9NHFJ/G0bTipfctR02agYj43Yy1NdTQlRpHAWMDk
         9P+lELCYG14KbtO2an4a+Nt+k4NLJanGUsth4lNhRGofS/qk3Vy4vD+0LZrttyBxoUgZ
         skRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=VJfknnbc;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00089.outbound.protection.outlook.com. [40.107.0.89])
        by gmr-mx.google.com with ESMTPS id v3si753311lji.6.2020.08.11.00.54.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 00:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.0.89 as permitted sender) client-ip=40.107.0.89;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9Ag491dZsjbWh7g2MFHAzThn4uOS1QDJ8uRRsUep+RDOijP60ei/GQ6RVk3cvvS9s31bjrH4C8BOL+ROha1WaAw2JR4g4uViUPU4si4UReyskUP9YeQ9AQX89QaNnMJbZ6gsmTtgt9G8g614Cz0++aVfIy60Mmilq1uLKAoeS1ihK1OcAurnY07VRqHDj7Tr2Um7YyHhZ6tOHa3vbPX3BDcRKtpfRXNY3iPKZb49O3sufhOYRKdNvpPfer2af0VWlYc+KNhFo1YA3RMVAApuQ8n8J/ITaI2lGa87UiQwf7+n5B4LUYD1n0cwZ3Y//DvgHqSp8WFg0UbDO4qRrBGJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6D67kB6aFpVyEVcQosx4CIe2ufG7PbTXUTwJEUFm7E8=;
 b=J8fum9Biq6SbDiJ7Fb6yEP4TPdCKwOXmnCEoiLR1KxrogX8D/yCG8UQgwnpkmT9kBS+tk+zOiO7ofczMocrT+zP+ZxdcQgJrXxAWJrjQjrYb0RXhQEWiaQu/l4fCKBcSA4y8zWnPgwOqkKK+6vgxE3DahJcVgKgNzXiB/X6R/sUQzADL0tg2B/edG/3m7el1drwQvlFbnAMHs6rzfgwTfno5HdOExb8c2YvT2I7UA4fkukeSQP/+M1sIpoXsRq6BRTd9hib+Gylx1XvVc55oYcs1nBmJyP1kkCrMqSgHmkBVDk2Vkc0mDKiZqB56tv923PDeMglzECQl8ET6cWP8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 (2603:10a6:203:99::22) by AM6PR04MB5029.eurprd04.prod.outlook.com
 (2603:10a6:20b:9::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.20; Tue, 11 Aug
 2020 07:54:52 +0000
Received: from AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599]) by AM5PR0402MB2756.eurprd04.prod.outlook.com
 ([fe80::485:d415:5f2f:e599%10]) with mapi id 15.20.3261.025; Tue, 11 Aug 2020
 07:54:52 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Topic: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Index: AQHWbGQ7sCfqYTCIg0iVKNihnvHAXakyjcmAgAABblA=
Date: Tue, 11 Aug 2020 07:54:52 +0000
Message-ID: <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
In-Reply-To: <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: bc5d6e09-b058-4615-a942-08d83dcbd4a6
x-ms-traffictypediagnostic: AM6PR04MB5029:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB50296264D917C8FE5168373988450@AM6PR04MB5029.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LFlPYnYx/OAad3/i2M6WhfqrrIG6sQ1R07LTwSKMURPQ/FQRbTymfpqt6yJ9eJMVGeBMi49b2qZR1tLoa0KahXLsaQIzwfvQoIcVdq78IRlEbBwSBmDxtK8B+DBmwCDoteAWM5SKFbgL8fEvBJN6aXEEx5j9NKdwSaNly6yMrjwXqT5H6H5J2J0WtGJeCjCONrnNSCmMA3FZsDXyTmDgsFJa2mba4UNPFP+f3CrZw5KCxYubGAXQlfLCzEW+Onbc1cZ3rk+wywcunKFOYYClbi2rI0/Az5y057ctIzRK8vWMYoLR+A7ErPH+Dlop18LvNbdr6ICPs8DzKXKE2ni2PXllgYUG2ixdGBsgwym1aW3IeZWlWZTIxCeoNXQ7PCEm2AKLvG48kfUZPQjesApaFg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM5PR0402MB2756.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(186003)(8676002)(7696005)(478600001)(86362001)(44832011)(2906002)(33656002)(966005)(8936002)(26005)(71200400001)(53546011)(76116006)(316002)(66946007)(5660300002)(6506007)(9686003)(64756008)(66556008)(55016002)(52536014)(4326008)(54906003)(6916009)(45080400002)(83080400001)(66476007)(66446008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: e1by6aRkTq3TqMnKa0YqLbDsN2SpX/LYv7OROOqv838pDH8zVnxdqUQqB8J9J0bDLPZWp/E5BD2oq831VfbYVLn5dfVOCBpKzXtufCwSTueVahGaX0DKg+J5IoVADKeE1+QGHSCFWpksdyNpS8adqYKvBCaj7qXbvXJ4Kq0kfHHpNCouGKzmgVcRASh1Baq9K5XG4UmksUDBy5Duwc5iDqzANMUueuBkVvFq12l0rnZPvl86iCVCtObcqPWEnKYlkHVHiPx8Ai4mtr+BRbUMzbkEguNwJjrEX2ufTzQ02lYoPZAZIl1kYx/4a7M90vU0qtF1tKDtA1bkJFKx0LH5LlSzo/7lnUxQ6CVQ/pUhqbfQD2Tmo6p03xyl8Mv1Fhf3zMwd5FJjt6Fc5L+X3Q7s1zcJzXLqffLlciMjKMowshsw2dpmySAuM4BL3Hhj+00bMj+j+TrjNguI48CXZ4LBf11/GmHP4uiJGKEZbSF/I1FM3ZX9cZOMZTZRepAMggbDbyPzfTyRABR1T2K1dc2dRV7Yp1eN4zH8xJt+eRRKKVS+0le0RkFrZ3EzPhZXm58MrdaHJYNFRUPkNBToCDdLT6CC93TEVniru6NbhLvMQP9ickMhYhK5zNTrlufgLU2Sqr1VmUsaXasBZUg2bT693w==
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM5PR0402MB2756.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc5d6e09-b058-4615-a942-08d83dcbd4a6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2020 07:54:52.7213
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zMv7P8SW6x4p4LaDTva8FNfR3MShQlXrcr8v8n95Ay0DpRncbKgnx2oKAlbAPt2TSGqWtR1SBZv0R1lNbfyMrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB5029
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=VJfknnbc;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.0.89 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
> 
> On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > This patchset is to support boot jailhouse before Linux.
> > The previous RFC patchset:
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgrou
> >
> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
> pIQAJ
> >
> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
> 8d83dca6
> >
> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
> 022610&am
> >
> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
> ed=
> > 0
> >
> > Patch 1~6 is to create an new folder libbaremetal to hold files that
> > could shared between inmates and new bootloader.
> >
> > Patch 9 is the central part to boot jailhouse with a baremetal
> > bootloader, which only support ARM64 + GIC_V3 now. It will use psci to
> > power up secondary cores, do GIC_V3 dist initialization, Then kick
> > inmate cell.
> >
> > Images/cells loading is done by U-Boot bootm command to boot a fit image.
> >
> > Patch 10 is to support using jailhouse userspace tool even boot
> > jailhouse before linux, just do as "insmod jailhouse.ko
> > early_loader=1", then it will bypass fw loading and etc, but setup
> information for linux usage.
> >
> 
> I'm missing the big picture description here:
>  - how is the memory structure that the boot loader needs to set up?

Nothing special, just put the cells/inmates to the fit file, as 8mm.its.

>  - how is the handover between loader and root linux?

Nothing special, the boot args are reserved when U-Boot kick the loader,
the loader will pass the args to Linux after jailhouse initialization done.

>  - how are things configured?
> 
> From a first glance at the code, it seems a lot of things are still hard-coded,
> likely imx8-specific. That may mean we need to work on the user story
> further.

I use bootloader/include/config.h to define some addresses. Since I using
Fit image, do you think it is good to parse fit image to get out the info?
This will need porting code from U-Boot or write from scratch.

> 
> Also, a qemu-arm64 target would be good.

Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
I need to let U-Boot boot Linux, then could add the feature.

Regards,
Peng.

> 
> Jan
> 
> --
> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AM5PR0402MB275606FED01836E49F644C2E88450%40AM5PR0402MB2756.eurprd04.prod.outlook.com.
