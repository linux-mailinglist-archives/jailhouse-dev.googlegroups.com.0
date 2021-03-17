Return-Path: <jailhouse-dev+bncBDGILGE54ELBBW7ZY2BAMGQEWU6E4XI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id C955833EB5C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 09:24:59 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id bm8sf5833527edb.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 01:24:59 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1615969499; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOvzeFqlxYMDWb6bcZWddUTE83hMaOJN4g7VgN188VvoesKatmaRXCQfqieIJc0/nm
         ERm6spcskTGkgD91HvOgIff3liJLbYfGZ8Ao/GexSdqTlws19nWXz2kmIGNsLu/teVo5
         VEbTycoOq53b+Fdda75TPAosELplnR4Mje+UgacJ2F4kVKt8bH3k8Pxz7lfYF3G9q6gB
         a/3urOsRD52TONE+DldYhSeKk4jCUVg635MdemxQCYA00cXOKxOa+kp0hp//1DjFtVF/
         QLVB75vwVlp2ql3SONUc+KYpUlQeBR5a/6bNReFi3eLzKbnLH50eQJSfQBR04MO0STkR
         UuCg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=RtuQaONmZf27kxCh9h5qNYwklLz3QM1RJbRNNUmzp1s=;
        b=eOxwnzCGBD51+uhCpPIUyRHi1On6jFXNAmClG5tK4spu+JPyArQ4+/5631uSHR/39w
         ZAaWtzxEcwaA7B2LRK19vBCqLE3NtsiJSpeV2j++KOJW8OgzjAQA+nMLgDIqOiTKMdd+
         bMDYxMtiQBOGN7DAvxirrdFlv1b2JK/9vs7nf/js24SWIVjktjro4gKzhLamVzVQjgXY
         YQpP4bsjCzh+AViPgN6JjWdPLd1qS6QvY+/DHmenuP4A2VOJfWYyxU1CDo1aFCxCyTWZ
         aRrm0y4Q8CCokpjPAQpmdHuIOkx8zNSL6J5jBDN/4vUudcm4rLFtmdOO6t3fzN/1WMBg
         PYLg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=H4rJKjTv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe0d::729 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RtuQaONmZf27kxCh9h5qNYwklLz3QM1RJbRNNUmzp1s=;
        b=IZ7bZdesXk8xiPLeWMTPpqDE6BZO/rFdiMpJAvH5xMPFG8IVP/dnYMfjmQfV51m3Za
         3++TzCCICaSRsSMBStQvvrTn3ZlK4YcVp6nal/oi25bj0YC+MN2vbWjs11hmY9Ja6B4d
         RgCsddLHVWTEiCz7dbPykigwEpB0Pk3BDC4igwpxOy6cSqNLmkEMV7np+n9717Ff86u4
         DydluQtIv31CN8yqG8yZqbwmmhfKCRn7Gb9dhophL9NZT0eFiU0euXe2rDMjNpO1U+kb
         RKAIJNEfDNQa3veHL5Chj7Mc5B/Scjzkj1cwKWeYijXnRQZ7tppSZuQGjj6NBTW8qMVj
         tORw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=RtuQaONmZf27kxCh9h5qNYwklLz3QM1RJbRNNUmzp1s=;
        b=M/qSfcihNaI5aidQxB9nx9IhNByFLZOTTT8ZUsyeyg25jYygGmpcEW0ggLtmn7XDhn
         iYvZghrhSU5LQEtKddyrSBIWNvEZQMmcLFjiZo3tj+8KY2k85tC1/zpQ9sMkCAJdp0mo
         aWNmPIYTsBWawtZQvfVnIRPT/oLDgPRIuoyyBYJAbx8KIUULroQiKopoL2eB8R7wakKi
         PCqWMICdKlu2YSKXisDMbewjwjxHj1J6reVZhnxRnuahsxQvauapHlJxJIzQe7Zu4U26
         XT2FHDj9G3cRQZxFBS5spRMv7MgE4UZ5U9rEEVWHlH9uD3Wpr9iE9nlxjZiEF5NScI8o
         VnYA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532mvP21nH2xUVLD1thWvreyhne1eLeFehlkgmIQoLNl190octWB
	HOyjEOfiLfgTpkrsc/egX9Q=
X-Google-Smtp-Source: ABdhPJwVIglpIGz/HW1DWdiJU5MBtOjcsSmZ+MdTz69g7Lk6cPCk82kSbJZjBkuDjJ8cnIWnh1VZ6A==
X-Received: by 2002:a17:906:cc89:: with SMTP id oq9mr33806892ejb.258.1615969499546;
        Wed, 17 Mar 2021 01:24:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:3f15:: with SMTP id hq21ls9918349ejc.9.gmail; Wed,
 17 Mar 2021 01:24:58 -0700 (PDT)
X-Received: by 2002:a17:906:4150:: with SMTP id l16mr34432568ejk.90.1615969498607;
        Wed, 17 Mar 2021 01:24:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1615969498; cv=pass;
        d=google.com; s=arc-20160816;
        b=m86qZMq5rnfuc0+WTh1pWBjMsFKpb5f0XrVq8WLKY6azSh5VRNb8RAlqVqwBL2MMJY
         fdMv5NhRmFWYgtkRoBlTb7UTgarGp/KqYacprZBQ6GV/lYlVSVbCmPl8/MXCCjPtQJGd
         k2joaMoVg93OXVG9WeMcHJpda+STRXMDo/mt/LPsDke7xs9T8PK1CUx0RbPbneMmhbIg
         ll2Y8oQ21KtkgzixM8oRqdxFwavk6tXWtr6RPdUOHUpWBOMMkji4mljbL9zklWUuOxkr
         bNnraM3MU/1p87zy9Wmwxfsfzqg8H4LmSnyx/j4Wlza9ZhVOA/R0/JtdUOBCPNuoeDIz
         yQ0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=ll/oiBru+QWIZ25ReJUTAmvKsc2g3tQae2A/ZF5Tt/8=;
        b=O/BsDhfSszInYWH5tdAOEcejhNy5M0XObv/3Kkm/9djW5U03/YquyQcxIBIUyB3CxE
         VxVRztMzIe7ALqnKYxsCAZW/3ZyCYzoJt8IT/qwrhz+pGanqvi1yyitt27PZfldioWEv
         SGA+gJaFq5TM00wu5NkGmSkeVrNJvA2zbNRgNXLZsRsRpLVryCio77sdEAQCt8EzDkNL
         nx/YlE7T4lFuy2Y2mRh7YgFMtuL6PgsrzCMUBt/YIbLdhvKc2HoR3NYoJcd2jAZ5YBy9
         Fochz0xwWIjB9hxs4L+HsIJroYagqRoXYqXq2y0kwNh2IolDczruaw+fFO36LZY422T9
         +vMw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=H4rJKjTv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe0d::729 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on0729.outbound.protection.outlook.com. [2a01:111:f400:fe0d::729])
        by gmr-mx.google.com with ESMTPS id f25si733154edx.4.2021.03.17.01.24.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 01:24:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 2a01:111:f400:fe0d::729 as permitted sender) client-ip=2a01:111:f400:fe0d::729;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBZ4gA8ke26HXENiHp2V3dglH6+Y3yMlnh8PUbDB87iVpT6rEMk75Tddb45GPtPiaXrLitxIKamRWwQ9J6Gk4ZqNA8F868NZimPfPZHDQf01xQ+DZJ002Dmt7tRCKlEB0dF27KXubcm8xEsyMqdDbuatbpg9VvZBpkQIdJBQFNG0HrwwLtoSZEjyNM6BC/zrimH9Xg88u/4fBHryobPtGrCURwDKkKC8nrBF7kXJRI4x9C8Eo1JsRf7ebkVWTAJ/rNsl75Gh0Ok5uBvxvhnHHzeFMIOqFpq2mk7WCsfVXMWp6dxzI0psrbua8fbR4i/WsnZwPCmOQFcJ1/33P93STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ll/oiBru+QWIZ25ReJUTAmvKsc2g3tQae2A/ZF5Tt/8=;
 b=KXsfLAMODVb4al1NA78M9HbJV2vnwTkmWybvnmrMFrJirtxKExtSc2sjBv66xBdNlU0QtMyTMhgmcJxVC6KrIqPMokeP8QFauWEiP59ylaGEA3ySkoTPULm0sD0pJVE0XnPEIGe0H/oFZEEjw5lHnCpnT3yxu/SwFK6KOWgw5k1mGmUCpOKCFSgI18rlfMu+PeyVYT4tEkBR2+WcjnHnk8S+35Gd0xYaf6cqF3AwKMPADoAqVKgVuox9V9BEsUwtuI0g/PZNDDlswJVP+AtUUsCV2i2EVopiiRv101whgj8bjFYT4KRVvlJKr5sVo15s7wyqNcz7SfIHAeI2Zqc7vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AM6PR0202MB3336.eurprd02.prod.outlook.com (2603:10a6:209:18::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 17 Mar
 2021 08:24:44 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::448b:147f:5ab4:b402%4]) with mapi id 15.20.3955.018; Wed, 17 Mar 2021
 08:24:44 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Sainz Markel <Msainz@ikerlan.es>, Jan Kiszka <jan.kiszka@siemens.com>,
	Smith li <v6543210@gmail.com>, Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: where can I get configuration document ?
Thread-Topic: where can I get configuration document ?
Thread-Index: AQHXGWcYGJH+zhV4pUuJZTy1DG1+D6qH0QiAgAADW4CAAAYwkA==
Date: Wed, 17 Mar 2021 08:24:43 +0000
Message-ID: <AS8PR02MB6663D7B254E27AAD507D3C34B66A9@AS8PR02MB6663.eurprd02.prod.outlook.com>
References: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
 <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
 <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
In-Reply-To: <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [212.61.153.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8f5e7018-0a2a-4daa-2a35-08d8e91e1e5f
x-ms-traffictypediagnostic: AM6PR0202MB3336:
x-microsoft-antispam-prvs: <AM6PR0202MB333678A1E86EFA2DEFE6B131B66A9@AM6PR0202MB3336.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1pTJbWXwKKQhg5MpNp2AduIUcXF2fArGgDfF4fqLAWIa9w+PcsyTvGfaSEN61EI/jmlPzwuhOxR/vCclC6C6pyg+HZgq6FBfnm+wuEUQh6Z0/gmyPyaoqm4qf0a1xsPgNuJVpGuUUrPtrIpw8/+qDOtxvVzSOhob4ieUSHkp9INQI6ysE18LG4Tm9KKwjyCEYICXR/umYckw8DO2fjtjWJTMcsTJX6Ew83Wa7AaXdnelRA0W61VxLzg3tQKoTHfwfR9IId6egNCWmJD1U1GtTrcXFSVN2B7NmPswPeJ0Il6kG3TpwXJeWNIGeXuQsxce5x+UwWQxR0sSpYUSQ0tB9WNJ1jIxlb/tu2pA2hv5omU5MtuYVLGzomTf4NXYo40nGrVDXKtBJhvDW2K4pu68J2J17fY1DZ308DzFiIvfq7nD2TVyLAoC0iP7z6aRQo77DnGcaLEW3/d7UJE9+FVFtuZ5kKGgyt4KRjWKouQTUnf1pfwRqwU9ywNdcbFLFVbeDwikhzqkLWDsnjewXPRbdqff2sgRQvuGUaZYvcowWFo9IOFHUoFtf7SkBztk416jZKPbROaSWTJQXj8cTGXwFia7O5jdJf9AmgE3SMhteSnEmnoTfhEF7wDQg6Vuj896CF1ZDMaGsrVBZtAUMkaDMw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(966005)(44832011)(9686003)(45080400002)(110136005)(2906002)(33656002)(478600001)(316002)(5660300002)(55016002)(8676002)(52536014)(66946007)(76116006)(66556008)(26005)(66446008)(64756008)(66476007)(86362001)(71200400001)(6506007)(7696005)(8936002)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?tTiyOHMyW7Bfe/nyL6yCXHz7J8KV5EUDA3JcASbollqPVq0UmxLhPlC3RooQ?=
 =?us-ascii?Q?ID4/qoFkiobqRE4gVXvILslCgjrR/+6Pl4ylja06+JEqovDigrd9cpuqSGtg?=
 =?us-ascii?Q?+YwJ2px4dyjc3Jf3JokyAUFvA9h8JcNIspZkOG+JIe7XcBtBdWqm+kpzUSAU?=
 =?us-ascii?Q?XyKhZHd9UwFJQ5SMUgrLzrzaOSsdoFYgImm5/5OZNZxLf00QIAwD4tPozb9c?=
 =?us-ascii?Q?uwsEvgd0dN+P+Z3KthUpMEut8yfcRdyjdFAU+dkIgpRWzRpdTvgW47Yq2xcD?=
 =?us-ascii?Q?uTT48CotGCgXymRaQOOdaqqJLsxI9gviLnsaymxAmBW5GYfpGZ7+GmA4vC0+?=
 =?us-ascii?Q?xvF4veYuw/1+6lwmfM47XhlIl7BdVFHKNv4mJ/yKO+OnhXWAKXTBqFm/Q2eb?=
 =?us-ascii?Q?l3c2ZkVjz9Ho9QS/QSgsEXUa/EUunbMiw+6bgrDNP9Kz6S60VqklG2B67naD?=
 =?us-ascii?Q?SwWNPYfv6vX4Zn/il3zoyXjNOwNuRVv59rU0JUweHtfBnrO3Bb7tALJg5lQB?=
 =?us-ascii?Q?CIxnJxBvxQ9gp621gyFYvS2ZPPEibDxXSfMVnEWmOVAWBG1cZrGcc1H9HHgE?=
 =?us-ascii?Q?jnZvu7UszH3ihfCoHfnHh5zR8Rg0sVHTLVIn6S16TS34CbGwqrssDsPmanRu?=
 =?us-ascii?Q?P+cYegCYqmYD3RhfCvqeI3exAM+ZSxDYR7XF8kKAK/2bRDufJNxRGRYuP1hw?=
 =?us-ascii?Q?QBU6oAmlkxvyUM6Nr5sVyNKah0PR6u/ncb1cjhdKpT5onE3cvDwAX611taO9?=
 =?us-ascii?Q?5apQhUr3N2Eau31K9hqJhNmWCmQsMGgLZqJBoK2LI+oq/s/uNY8ozxKn5XfY?=
 =?us-ascii?Q?uZvU61BeuvZIaFdoJFyOJanR3Wj25sXbXytjjjo8Uo04eyK7eRKcO4hUI4IV?=
 =?us-ascii?Q?iFdp8ItkQ4Vsv4c9JgtGFec59KKPdJgl9cEisEn90w/ngWoulyRSap0UJQsh?=
 =?us-ascii?Q?orH+NZBfW2BVxYN8eJRhxUfaxX36IpZABO6tLfptSrthPIRHuepQDQ/X8DnI?=
 =?us-ascii?Q?TwZnEwoLEsJle/DpPjsbelQCNo5txTVArw9n0DPg078DmXLel85PU2vBo3hR?=
 =?us-ascii?Q?NNN+/vLzZxd6GEbpKrHwrXmu2BFG2RHLpeUqeaSWZIOaiW8TQcPMRynIJkgl?=
 =?us-ascii?Q?Wr4c9IEUGYtKI3ldJ01dJfH3/Bt4NVKuuTd6h2SqkPy5NkyMUXIuGvK7ppZn?=
 =?us-ascii?Q?FIsoruDtBu45eQOOqeDrkZrKAdI7En1vLbtqYGiAWesr/W+tsVAlt+5KJB3Q?=
 =?us-ascii?Q?5f6eLJCWEllILwxIJbUmqcEsnp+C/2cPQR4+KidjFX1i1eFkxd4fXKDjgzPt?=
 =?us-ascii?Q?JeQUhzwztiWyn80ShhRGf4WD?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5e7018-0a2a-4daa-2a35-08d8e91e1e5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 08:24:43.9942
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VNFEfWkEjz+G54ReQ86js+V3xgWYzov/XCO8g2EBP+KJjMnIf3/8rlSUWJvSEOw51P0daL9b5AEqH8sxo8fZfm6mRCJANZJYxjLkdu2+1oIAIp0fWqcxZBEstM4Uzjy1qjLlAN2hq2iNl5e1YZq3PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3336
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=H4rJKjTv;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 2a01:111:f400:fe0d::729 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

> >On 15.03.21 07:47, Smith li wrote:
> >> In
> >> https://eur02.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit
> >> h
> >>
> ub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2F
> config
> >> u
> >> ration-
> format.md&amp;data=04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3
> >> 4
> >>
> 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7
> C637
> >> 5
> >>
> 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiL
> CJQIjoiV2
> >> l
> >>
> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=wldQEArIJ%2
> FcFxG
> >> w
> >> 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;reserved=0
> >> It only shows "To be written..." .
> >>
> >> I found how to write  right .c configuration is very important .
> >> For example , I want  add a new inmate,   a new inmate to run linux,  I
> >> don't know how to set the value in the document.
> >>
> >> The result is I can't   easily run a new  inmate.
> >> I think it's not good.
> >>
> >> Will  the document be written ?
> >> or
> >> Where  can  I found some  good tips  about  how to write a  right  .c
> >> configuration?
> >> Thanks very much!
> 
> >Eventually, this document needs to be written, at least to describe the
> binary format (which is expected to stay). The way we generate it >right now
> via C may change, though.
> 
> >For the time being, have a look at existing configurations, in the main tree
> as well as in jailhouse-images (depending on your target) and >also study the
> tutorial I gave a long time ago [1][2]. Some aspects have changed since then
> but not essential concepts.
> 
> >When details are unclear, ask questions here.
> 
> >Jan.
> 
> >[1]
> https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Feven
> ts.linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-
> Jailhouse-
> Tutorial.pdf&amp;%7Cf659d6914e00464a59b708d8e91ac167%7C612607c95af7
> 4e7f8976faf1ae77be60%7C0%7C0%7C637515648567686059%7CUnknown%7C
> TWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C3000&amp;sdata=fbtmKSRCItgbPj3rg6cFP2de64%2BFtY
> ZR3oH5DPQKJJs%3D&amp;reserved=0
> >[2]
> >https://eur03.safelinks.protection.outlook.com/?url=https%3A%2F%2Fyou
> tu
> >.be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-
> pLrL6pRFP6SOywVJWdEHlmQE51q&amp;data=
> >04%7C01%%7Cf659d6914e00464
> >a59b708d8e91ac167%7C612607c95af74e7f8976faf1ae77be60%7C0%7C0%7C
> 63751564
> >8567686059%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
> IjoiV2luMzIi
> >LCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=USe2ZeUgtpxLon
> lBl2yHA7e
> >8KwnnwM0ehIlLNtYzm50%3D&amp;reserved=0
> 
> Hi Jan,
> 
> First link is down. Can you check it?
If I am guessing correctly, it is now found at https://events.static.linuxfound.org/sites/events/files/slides/ELCE2016-Jailhouse-Tutorial.pdf

> 
> Markel.
> 
> --

Best, Bram

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB6663D7B254E27AAD507D3C34B66A9%40AS8PR02MB6663.eurprd02.prod.outlook.com.
