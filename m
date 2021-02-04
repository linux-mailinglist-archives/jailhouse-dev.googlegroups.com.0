Return-Path: <jailhouse-dev+bncBAABB45Z5WAAMGQEGZBF5WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63b.google.com (mail-ej1-x63b.google.com [IPv6:2a00:1450:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9F530EA39
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Feb 2021 03:33:23 +0100 (CET)
Received: by mail-ej1-x63b.google.com with SMTP id hx26sf1155281ejc.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Feb 2021 18:33:23 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612406003; cv=pass;
        d=google.com; s=arc-20160816;
        b=vslWKr3/PT/ZVVg2hpHnunibwhScO0x0gKbiGJJ67FHC6A77TioqeKtSohfRVrtVV1
         xDegkoQ339PVXq7rwj0UEgNA9MS0tSdptvfIh+Ze76pvyEsbAiQtriuzgN4Bv2+8Dz40
         +sCbW38MOojNsr5F56LvtH7tm4O632GsWb19Bb1H6Igd8gG0i98xUijzay40dHb6IYDr
         5beliA8LGKc0OrYnOM6NAAuDd3T3uYDeVND/skJjbuMI4T+oJBbPnoXz9VfkE1A/9XdT
         Fu6LzVreavIhFD3QyyqxjWC2Y7JdC7GYw3JwX3EwMbyOgR2MI810T30WXz3nhQZ4hy1m
         fUBg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=7TbAeawF5i++4kIv3kGwC3OYjgf9VuBi1Mfs0ootKqI=;
        b=UxpzA9IFVPq7G3ibDICPmlyJWUviwUipFrxbaG3m+lKbF7VxGDwBehSn0Ul6iK+nZd
         XwNaf5x1H78xSTo4yYxxAjkp2H/Xmhl4pJ7q7LPY5VTzWyp1kZeCOwcYJxjras/r0tk3
         G5UrhA2trnHc4Psk9ZFtLKAIdLL4fvanX3byBjohyMxMhhXel/Xquj5tch6FVAEKAg6K
         MUPm9xFu7ArbftQeCZxv7+eEIpMaKZzdtGPO88xvxl1Va6BR2sGOUUErw/cNYADJwIHn
         80l/WxB6cyX0RdOodNPOmVMnVrmCVdxUuL/y/FIu4EYmBKuwemMoQcpmwTYResRKyf0x
         pMPw==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dK2slVt3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.5.85 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7TbAeawF5i++4kIv3kGwC3OYjgf9VuBi1Mfs0ootKqI=;
        b=XUdsNi0D/XOcxt9QBPpsIH/6zHgQdSQqZAoeHGgEFE/q+t+Qyq1uUgukI6PUnHRSxK
         QpHW1jf5ud+lRxjH0cN838R4UBXLaVP2mCNSllbIhzNcqx/Y1f4eck11Shp8hqXzsHfm
         lsY+etzX82ciYQ8fKv526EW4nDkoTm0Prjg8Ne6XspfiV+yrOPGeqnXcIO7LHhj5iATr
         QWe9h3U/G5su0cud/0KGJmImG+NPh6xXukEbUKGSfzYKh3egK01mmE4NfrKH7qvPO6+j
         U3RxsU2UeffKUMwJoheYEBkNH8zW/iW33OQe20KUZGD4WchGXBt5pQxCOoU2uHYf9AoT
         y7PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=7TbAeawF5i++4kIv3kGwC3OYjgf9VuBi1Mfs0ootKqI=;
        b=RxbBMLwFDDySDI704kIgGWSPIf7yzeCopEu6q2kOCqU7h/y4hc0TLFIRRrwwmclVKQ
         xwE0Mq6gaBuXP43nTfjpAFA2HItqwITXHqzgEMsOX7CFYkUXQnRES+0fO9xkR0a70zsE
         KnHUYzrnbTGohzx1MGcRgN336J8DmrNhSZlaZufDPmISYdsrhmjxA08aNDCeOWfawV0N
         emtgTFDq+EanGt5gy0+0ziXfARqvdGzhmw36/HStIWsrMCEbbMmh0bmf/EOyLwyWO4I/
         MP2BfTLVtlYcKfcC3n4yIbQF9NHQnNgIR4Dhnb3CdQkydPesYaeFpb3zufqnyAKtM3iO
         DaQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5318ZUfLmAXEPCqlt6Y4nCGTdZcUEFi1172PGCz9KzPH3a+WhG02
	jLc2jrA+2MDgojjAZGq7IUk=
X-Google-Smtp-Source: ABdhPJxdFVKIM7AG0tGbCjvVyFABxvhdkhA2XutvuG9jT86rTyg2Z+Gc4VinU+3aqeE1IglW7z2mDA==
X-Received: by 2002:a05:6402:4310:: with SMTP id m16mr6075326edc.207.1612406003595;
        Wed, 03 Feb 2021 18:33:23 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:d0da:: with SMTP id bq26ls2224000ejb.8.gmail; Wed,
 03 Feb 2021 18:33:22 -0800 (PST)
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr3860108ejd.4.1612406002806;
        Wed, 03 Feb 2021 18:33:22 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612406002; cv=pass;
        d=google.com; s=arc-20160816;
        b=T17rgccyBts4slvB2DDzUsvtk69YDID18k9icsWpNx15yvSlhGWoFQm45boZO+4VEF
         Vd0LhOb8UsmbpfmRcLjK1TLA3PLWODLLoT91inwJg05dJl2sfxNEqYI5Py8HPlBizXBJ
         284JxuZAWVbUT+oRwIHjXSx0tm+jzHGFYIeVZ7r2LduHU7LYib0N+qL9bzMAQnQtOAxF
         5txUoyHVYKm2PKFiMCAkDinzklu/3ftH08h6wuRYxeu3pqUGiDfUV3Quo13PfWSNHGeE
         CK9lNzalSZIxv/26uXYvdKFszZmsf1Z2g/xavjcgWeyQ2vPX1dT2z1ftKpUKjUAmz0sg
         3RHA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=cypNzbmRqIEMHximsbLuqVbKx8Q5kKDpPI8Thj+OSJ8=;
        b=T1BrUaIz8Rb62L5/e7jEek0c2b6krCE1LWOr+3rATXEfLKutiwfNoBTYCQ+bkhQZmg
         HlilRsNMyRDgWm0EqzKKkqzQjUcUQ/BJG3zjleUM/xkjG6sswQopfbw5w8ZleoybBe7H
         P60+4bqMGCA0CqA/7z78L+hcqNXaEjdpwqZKjF0c3DfBnPB+dD2l3AvmQqH6tCPaTZqc
         bl9DFBOz0RAuwl7DUxdPj29GttVNc/RG4MPY3VINuDG5JMNMmmWX+YP6cJEqkdULikFh
         8Vmy0eWRjYV1IWC3+BWx8BnoSINxbv0EI+U7iAoUYJuSLKkxD/oCqGY1b1C9zRCWhNpK
         jPvA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=dK2slVt3;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.5.85 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50085.outbound.protection.outlook.com. [40.107.5.85])
        by gmr-mx.google.com with ESMTPS id jz19si281380ejb.0.2021.02.03.18.33.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 18:33:22 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.5.85 as permitted sender) client-ip=40.107.5.85;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bFdl9Grgsidu0I2KRZx4OyBU824VCenWCgdRuEm7D/ZKDnaARugo0s30OSaoJ1sigctsl/zlAEUEiOgcq9sT53vL/SZwM0JM8SNRmIzvQ4VCcQet2Oq2mb14jMC5YYlRAS9Van4ZJumZLCywkdKRJEIvQ68Ru/mDSUulNLv17Vqy9C/eeIBZZIA6yodY+hVzuAdahjXAWQVpqsEZ0X7DJkPv85y0iHw6GMX+MKYqh87zcEHPSM0bGUxu0WLkKfODxcXunePaHdj2RwTktkRII7azyGol+14Xzg3WqfmJh0gIFdcaJjxgDfWBk5iOd6G7GYV+clFWJSqf8baTyg/BJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cypNzbmRqIEMHximsbLuqVbKx8Q5kKDpPI8Thj+OSJ8=;
 b=MGPqr3QdLJ4e06UZ4cZWMOvrkxkWilPIv2SY2lJFlCuzwGtyFqh3j8DhHwOp33ohK3NOJcFkZuzrAr3cwwBQuW9KXO+n6nYKQS9apV3f5gQaAgq8t3Ny0IXX1MC4tjFKk8+Pu0iZeBb+qLFwvSl//ow8u0eARUSx7Gc5ViKg0lijQp85E0KuuXh0F5aerBgmJPZb3HLz/q5dJGnPHL4H1S5fsjfE5BR+r/nvlzJTW34E6qJl8kMVL28PB8RR6E7+yKezILObJQxUhX2moa982nBgkNAFTwnrSshnV4QNU6EtmqAvyD9uvNAtXzOytBNk1y26u7AB2j/7x1Y3iAIFUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR0402MB3453.eurprd04.prod.outlook.com (2603:10a6:803:6::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.24; Thu, 4 Feb
 2021 02:33:20 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 02:33:20 +0000
From: Hongbo Wang <hongbo.wang@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo Xie
	<xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Henning Schild
	<henning.schild@siemens.com>
Subject: RE: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Topic: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Index: AQHW+fhwiGCPlADjr0ijwf7ZcFksWapGN2yAgAEMz8A=
Date: Thu, 4 Feb 2021 02:33:20 +0000
Message-ID: <VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
 <c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
In-Reply-To: <c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 9ca46e72-5939-4672-69b3-08d8c8b53cbb
x-ms-traffictypediagnostic: VI1PR0402MB3453:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR0402MB3453F8B26189BFA73D5D57C2E1B39@VI1PR0402MB3453.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eavUV91oS5b6kacrhfnzQUe66ZT/Oi74QW3lcVB0vIDUZkgJaQq94/Nk2Rn6cAMI39E3qFOe1//JkQU7FdtI6MXJHkAC+V6OvhhkXoie5sz8sdAm+D4XRnGjNmM4RRRzUbASBoc3y70v2+IUFOlmU6oiHHjRHZ+kpd+jqRv3LsxeECuqGPif7koUXowavhgCdZQxX4PjJIvRTUJu093cg2QwHoYlUrheCNc8tS92x6v0YjnXNDm7zbbLfidWBA7R29VOMRd/LC7P/cF54GKc6wfJMXhCAbZZfhk+9k4g+N+WUFFY9C+ZkKSY9mUx/4Mk4NUQ0QKwmgtWyryodjKYxzKQDPC8Dyzqq7OPwj0XADPB0I2xVGhJ2Z0LzRIPvwWH4ua6nWOMNHqF/POG6JFEV62guiwUSTTkQjdM3K90rrcoRtkDCGNQ4r79fwgscBPicxrHln4PgHB27vKQRcnmrbvdMoBJpSlAMVnbCUlTB8sn/J72olztqG/I4DZ1EEVP8tiv/Lstk5eKb7gR+oPG+Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(52536014)(66446008)(4744005)(33656002)(316002)(66476007)(9686003)(71200400001)(66946007)(7696005)(64756008)(55016002)(66556008)(110136005)(26005)(186003)(86362001)(478600001)(6506007)(76116006)(8676002)(2906002)(83380400001)(44832011)(5660300002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bDFoREJqYUJML0MvWHRmOE1DUVhwOVJ2UU1nVHhmWFZiVmNrUFJMVUxHSlpv?=
 =?utf-8?B?VEs2L25xZ0N3bzBSbndUNTFxVEZrNTJPbUx2b21SdVJpa3VWOU9FT1ZjWGZT?=
 =?utf-8?B?QWxNZS80cXBIYjNuTWNHS3RoRlVua2NpVHdRTTFpMlhIcDVwakFIdVJvemo1?=
 =?utf-8?B?YVp2RG5RZkd2NEFUVmVLVnBXVUpuR0haOHlYTlhhTFcrckVZbHVEYS91MS9a?=
 =?utf-8?B?SXlJdnpQQzVaVnFYVlRVRDdyNjFISVd4RFZFOEYyZmhOZ205b1JaNHNYZXN2?=
 =?utf-8?B?ekpiRmg5RWRMdHVGcURhNnJxcDVPNERWa3B5SmhkMEs3NVZ5L3cvM1hkdERk?=
 =?utf-8?B?RXZITUhzQ1hTTDdDdmZqL2x3RmZQVmZMbDA5bXhPdmg2LzRFZ3o3Ny9BOFh5?=
 =?utf-8?B?a3F0alU5Vmt3VVpzQTNLUVRETzNXK1FhQTBSeXY5cWEwRWFtK0l5ckJnem5x?=
 =?utf-8?B?Uk1LR2Z3MzJrbVk2cUErOW15a1hLTnZ0aVBKamtPcHFZdWFTd2VYV1RvTjMw?=
 =?utf-8?B?eVdwenM1SXMwODZBajA2RzVRemprc1hvaEhKOTlHWFdZTHczZ1g0UFM4Vk4w?=
 =?utf-8?B?TGdzeU1ST0V4YTJ5Vm1tVVlLKzZxVkZHU2lDemgzeEx5a0lTb3lPd2VYRUJS?=
 =?utf-8?B?ak9WR3MreHIrWG5qQy9CVFBTWm53SzRSanM2THNBcUVvL2Z5Z2tTUkxRUzFV?=
 =?utf-8?B?Um55SUhtVHM2OGlUUFlESkZhcEtVVFh6Y2ZYYWoxM25ScHdudmY1eUF6Z2pi?=
 =?utf-8?B?Z2E0M0lEZ014dGljMkRUVllpSW9icDl0ZDZjenN6Q2o5RFY5OW9zbS9lbmFT?=
 =?utf-8?B?NVBaSURJWk5rWVVoZmtodXVCcFJibWlqZ0k0TE1nT1lGbzhZWk10NUs1SXRp?=
 =?utf-8?B?Z3JkL01rTGVpM3h4aW04MEFLSGl1WWV3a1lVRkhDU2tUT3ByUUZuMTg5QjlK?=
 =?utf-8?B?bHBEd1pmanRjOGZnTUV2Mk5pb2dJbXZFZTBuTmZqUmJUd1dGZUVlRll3dXU1?=
 =?utf-8?B?YW43SjVTdk8vdThDMlR4Uk55YnNpQmc4L054Q2dJM2NGYklSU21haG1PcDZY?=
 =?utf-8?B?a2pZem5Vd3RGZDdEWlB2QTNmY0VPcm5BOUFsUWZ4TDM4QXhQMGJ4ZjQ0SVFE?=
 =?utf-8?B?anFnRVBpenM4WFlMSWd3MTJTQ2JGeGlvOTlsbEhrUElPblVwTjJtalpRTXFL?=
 =?utf-8?B?N1U2Z3FYZDI5WW5RLzJJSVJGRkNRVFNVUEFYdjNucVJDV3FkdTVwSEpzN05G?=
 =?utf-8?B?K2ZBSEdML0FxOFJwMFhlNW5VUzg5SmYrTzNXbHdibnkwaVNiYXp0OHR3NTQ1?=
 =?utf-8?B?bzNiSmh6UFRmSkl6aFV4VzlJejJMb0EvQjZrbkI0RFpsQ3ozeGV2Q3A2d3Q5?=
 =?utf-8?B?RDUwU25ibVRndWpYaUxubVc3U09NU2VvRTFJT2RwL3NSaDNoM0lnTHlxMkxl?=
 =?utf-8?B?cmdlY1A1Y3d5dVN6U0tHdkNiMmxYdEN2c1gvd09GQU5qQkZ6bXJlMExYcHdE?=
 =?utf-8?B?ejd5TE1uZmhSa0pYcVc4WXNEQldqcERkUXNQdzE0aDUvazY1VlM3OU9ySDFr?=
 =?utf-8?B?OGhDckVEYmkxMlBVTTBwV1dOa1dtZitrcWpSRnZER1JGR0NXWVoxekVTVUxQ?=
 =?utf-8?B?K0hJRml4Z3dwbkJjNW5aTXNLZHpjY05uUXdGbDZOeHlNaG5rSXFPUkJlbWpl?=
 =?utf-8?B?dm5FeXd1Tk1EOFRXN3duSDdXbXIrUkxUTi8rUmxqYkUxWjZrbWtVb0tVMktK?=
 =?utf-8?Q?DKM+xhzr9WFLzObujc1mXhj2Q4xMUDZu6R1+Sz+?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ca46e72-5939-4672-69b3-08d8c8b53cbb
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 02:33:20.5206
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EUaRsFVZ3dzaucP4Y7OxET+EJ2Q3WtAOVU39FKjBcjkVz0Z2J6Cus3gQKQ7TEPd3YTap2rFu/hiUGJ+IVw337Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3453
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=dK2slVt3;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.5.85 as permitted sender)
 smtp.mailfrom=hongbo.wang@nxp.com;       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
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

> >  .../dts/inmate-ls1043a-rdb-fman-ucode.dtsi    | 1030
> +++++++++++++++++
> >  configs/arm64/dts/inmate-ls1043a-rdb.dts      |  767 +++++++++++-
> >  configs/arm64/ls1043a-rdb-linux-demo.c        |   57 +-
> >  3 files changed, 1843 insertions(+), 11 deletions(-)  create mode
> > 100644 configs/arm64/dts/inmate-ls1043a-rdb-fman-ucode.dtsi
> >
> 
> What exactly will that allow the non-root cell to do? Own the DPAA
> completely (taking it from the root cell)? Or does this enable sharing (and then
> only in a cooperative way, due to architectural limitations of the DPAAv1)?
> 

there are some case that user want to non-root cell can connect ethernet and cloud via DPAA1 port,
and test their performance, so we plan to add DPAAv1 support in jailhouse.

in this patch set, all DPAA ports are owned by non-root cell, root cell don't connect ethernet directly via DPAA.

thanks,
hongbo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB56778B493C1FAF9D87782F81E1B39%40VI1PR04MB5677.eurprd04.prod.outlook.com.
