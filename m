Return-Path: <jailhouse-dev+bncBCJN5Z66VINBBJXOY2BAMGQE3D27FRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3b.google.com (mail-io1-xd3b.google.com [IPv6:2607:f8b0:4864:20::d3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4F833EAF6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 09:00:39 +0100 (CET)
Received: by mail-io1-xd3b.google.com with SMTP id y2sf24903770ioa.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Mar 2021 01:00:39 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1615968038; cv=pass;
        d=google.com; s=arc-20160816;
        b=BbVJvHsRHCoY0PXEIdvegTT504CC4yWHXbbYpeAu1tZjF5OdPjQU7X9gvGHlx2V3fK
         YoawdyIwGn2OM1QA+WALIEA3Yvc0HCPR2tT2LD+3Okm93YVc24zI571eHJE9h5pjEzxi
         QGfCbHQmG4ey9kK5OkwNb5nEju0gyBQ8wL5MYoNtatlelGDWwIiV8fMZ5R/s1qbz+fqD
         owy8Xyzm+ivjzHrKKKrMg+Szl48vI4zetBlz3wWXThQ6WBlxPWAK0YmcsVCeLljEssMW
         64XG+BQU6DUPYh7ahpqVOG2YxzphdkEvTzVedZ37Yb4ezA4jhj4jwEh533oo81PP+tLe
         zv0A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=JPku88i8TZyFkWwtRS2aIRaIhs9Tk0VvLjQSyWRdux0=;
        b=tZrY9xpJiVreyuuJD5lM9trACgQ0xJlxaJ/g2pX0AYaHfGwjVkXfxf9Qpk+HGf1qYH
         ZWJOWPePskXIDPlr7E1jIB8TPZv5T630IP99vZxb9hvxoC+hkPdFt73JecieshzBAPJG
         y02W9bxmmqM+m5R1Tt8igx1rgXpMI+1edqgm/AzAshxiWJpne8Oom9HO46gaAaPSWoYg
         vH7tTVrMS8bCpU6+pDXHyG0x8gV2RZPTQ/O9z3XMb+Vw1aUQv7AKakgX+DePRXCH6Kh2
         BEX00v6Q0x9Tr3G08lCAX4IAE3pEz50DR7mCp4pV3O66w4M1GXTVvnIC3iphTl3enQ+V
         1hsg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=llZyRAry;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.1.98 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=JPku88i8TZyFkWwtRS2aIRaIhs9Tk0VvLjQSyWRdux0=;
        b=avU/Z/ou/lw4/8ZrA2L0etaVemKblFk1CrZj8NKiYsXRbKDu6xUth4cuJzbqvvE7kk
         sHrIHEte+9Li7KrTiiuD8WOvyCJWJ/xeuhrhoJOkRWFMeh2iKoRh7n9OGzhXjQcUDc1R
         +HUcs9WtaGixnkuDK9ecJjPFP+K7T2wfQsWpQ6zWL3Elze8zzyuA1A+0Dln5DHavQIDS
         FPZHO93U/rcSJgYm5lBbZMoENjN75fzY2MwkqfHrIl3gBJkwWl+dJIoVimffIss4Pmxl
         mcxlUVG2CGfdU+PzLGQQY/MQ0VQhWE56zvXtotZnI9BcEa+lqRd3V8hwxu3ffawwlwAW
         HSWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=JPku88i8TZyFkWwtRS2aIRaIhs9Tk0VvLjQSyWRdux0=;
        b=sKAhTLb1ybgIxPZf9WCFG17cO4kbArrBQftZ+MovYUYSr46dYFn7rsFTD4ErdWPiM1
         Vz2oeuyN865YyJewEdFAd49OGDQSU6nUnTSjjslWXIj2gOcvQfFb0wwJy00i0shiuKx1
         whl/f2kxVAGzKlvrjiLmMMlVgwLSqOfu/mDMRgNmQg/SfQYzCBdSbTYQSrXVAPdAt6qr
         2T8Z1rpCNPRXiKV9P9kQ8OHKTyPTYAvpsM8c9fYt5KdYznx3M9BdR8Wdgw/2E4/W9KoR
         HcQGJsIh4E8svw/pEGKVDkldLH0H+aJIAmIO6tp0jVSyxGmhf9ODxnm/jAeTmmuABUyn
         kPeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM53142q8RwXumyz+4zw/f1tZqzhmzA83FjbWktpk3MhhY4yZJTprD
	u1rCk2l/u541uppORLrfAvc=
X-Google-Smtp-Source: ABdhPJx+lNjfeDSGzJnojCoFCANnlE/no1Lq1K3OdE4CB1lUiG85zSfIYsgUFfNMrM9M+up3EE19Gw==
X-Received: by 2002:a92:2a04:: with SMTP id r4mr6268469ile.56.1615968038300;
        Wed, 17 Mar 2021 01:00:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6602:22d6:: with SMTP id e22ls3090895ioe.0.gmail; Wed,
 17 Mar 2021 01:00:37 -0700 (PDT)
X-Received: by 2002:a6b:7112:: with SMTP id q18mr6079051iog.174.1615968037744;
        Wed, 17 Mar 2021 01:00:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1615968037; cv=pass;
        d=google.com; s=arc-20160816;
        b=j7fHuaMXj0KE2wb92PB4Ncy3QijWmEQyZZBM0ZaBJ3lqER+qtVu/UUiJRS9QPYjBrb
         Qblu0e75oEmFl53EBGmvhz6rW2MkHf/LXPSRdSBVSrO5BB/pTqT335VEjV9pLjwPF21Q
         8ssUNgB6I7Fa6urfyJ+0eRc1jwaoCxNcCrEQnHDpdOWXp5Bd7WkowE/ADGRDSpRvxCTc
         hDl8nJWUV43uOMyR04HF4ZpS34I7l3dVyyVEFxmQEUaoFRN344jQaquIqV6VsIwTsMPe
         UjXBgpnr3jFs7djg/zX0CEjHVGr6e5yQx/GKcg7fR8hk30eGq6DaE5Oi8qS54GvC73Gp
         q2YA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=BLgB0XgpewF9v1XPhXag10o1YLLHv9Hxo1IlKWWDxtM=;
        b=aZK2ihYCtunLFrY0ErmSiaCE/0c6E8SBQJ5LyJQXqvRsuBMwOG1aRAUEz6uBlBBOfw
         woMp9A5wBc2YULl+RMc1UoXqjOHHsu+354WMYhgXHNDKJvhF2+FMRKRp5DjAJePzic66
         Bta8mKEnbDLt0C13ew9UGumNRJDXlm5Mo8wk/mepQnqsbhDkxi8Yu3j7uOdxInMBDaZO
         4xAsRhDphSdNI7ynOstmlQeaJrBuJArIugh4H/qApC33UrFVp6ZY1IHyM6FcxEL4AEzO
         XekKtmCXkedZS31RdDqoRqpPKK5xI2Z6CAEuYADcInJtMfBXNlu5EPfxvE16uCCG7hiF
         ld9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ikerlan.es header.s=selector2 header.b=llZyRAry;
       arc=pass (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass fromdomain=ikerlan.es);
       spf=pass (google.com: domain of msainz@ikerlan.es designates 40.107.1.98 as permitted sender) smtp.mailfrom=Msainz@ikerlan.es;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ikerlan.es
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (mail-eopbgr10098.outbound.protection.outlook.com. [40.107.1.98])
        by gmr-mx.google.com with ESMTPS id i28si58131ila.3.2021.03.17.01.00.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 01:00:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of msainz@ikerlan.es designates 40.107.1.98 as permitted sender) client-ip=40.107.1.98;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TPNWOdoj95X7eqkZwv/l1GyLolCav4lhx2uY+p11Yj+uI09Roos5M+aZUuJaTBiHB0IxgAh4wzU/PfweS8BCz2XKiJk770quARi8AaVTtoyPAue/0NnLs+uLjhti33UBLieiM52FO5u+t4T/u1Q06MVCGMxEnaPyYhmb3M90ikBrjqmW9QgMcWpymJcQAT/zfcqVHeaWYYtN6Uavf/Buoi0Q+Dz5N/ykMKcXRKA5FAaFhDq9zEJIzhhxwGct/GbM3CuvMhcespqeB3sWHkpD80QmO3HtMbr1As3Sza9HkyOLNY3qQUxvDO5tLaRUOqXNRc1p2+NjqEb+T9T9504aiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BLgB0XgpewF9v1XPhXag10o1YLLHv9Hxo1IlKWWDxtM=;
 b=i2WuDYUgt+I+gfKui7v9X/KTm4xJEOSHX5zgOkgi1bUc302ylJtvTQ0Gr3+t+Tv1wY0YPyoEMmRQgzK+M8Z52lBNZeJWnlJHQkxz2Uhsjn9Roe1HNHqGuDjIU624w+xBeLzgQntR5Vp7XM0dmJofEeHhosDKvMSMLCxy3rBYBPtZx0+6YrkJwdeR2ekcuT14U1oZSskwGKbu92Mo8234RGosysmqX+Db+/azGFD/CElthrAaNyvNNsi70Mvt7YDYcnsnBTrs+THRdJf2P9SP78PGIN/iNBx7+puNV3RASZ7H2pSlsruZ4r3kr+GggsQRxYs8MaFKaIKuDfeqCI6/Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ikerlan.es; dmarc=pass action=none header.from=ikerlan.es;
 dkim=pass header.d=ikerlan.es; arc=none
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com (2603:10a6:208:ca::33)
 by AM9PR03MB6691.eurprd03.prod.outlook.com (2603:10a6:20b:2d7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 08:00:29 +0000
Received: from AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::3007:83e8:91ca:2b8f]) by AM0PR03MB4450.eurprd03.prod.outlook.com
 ([fe80::3007:83e8:91ca:2b8f%5]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 08:00:29 +0000
From: Sainz Markel <Msainz@ikerlan.es>
To: Jan Kiszka <jan.kiszka@siemens.com>, Smith li <v6543210@gmail.com>,
	Jailhouse <jailhouse-dev@googlegroups.com>
Subject: RE: where can I get configuration document ?
Thread-Topic: where can I get configuration document ?
Thread-Index: AQHXGwLegvUwVQtp5kaKjLbc9MIQ76qH0Iww
Date: Wed, 17 Mar 2021 08:00:29 +0000
Message-ID: <AM0PR03MB44504D2242854324D3B00F16B66A9@AM0PR03MB4450.eurprd03.prod.outlook.com>
References: <0a370a48-b0d4-4f90-aed8-70da23638afan@googlegroups.com>
 <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
In-Reply-To: <b736e651-8add-7e49-f103-728173b0b751@siemens.com>
Accept-Language: en-US
Content-Language: es-ES
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [193.145.247.253]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 25907f22-30cc-4008-5179-08d8e91abb89
x-ms-traffictypediagnostic: AM9PR03MB6691:
x-microsoft-antispam-prvs: <AM9PR03MB669101A39C2D135BC637FA09B66A9@AM9PR03MB6691.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8mdtRxFJILjPSadTQvwbIHQI70cibv2Gv5kylyuMvvvl6v8MA5LkvVj+LwTNsM46lIaPDq2E8AnyLXudBibOyPDLFJQWz8v8JjkSEjBvc1XrXysMI0z+zIAomdMFQjRyIKnVKoa4nbILbsmttLlC947fr7PBXHfvXYo86RRIfYcCwOkkqZk134YHk5N3LYe5S0q5ty/EKlenB9dCynWWPaB4LapBSZv4NmCGnmbczFcK7FmU5+3jvZrQquSH3occPxn1I+AyTfQ6nzgpySEH/bJ89uNObM9OWPNl5lWSY4kNWd8qeEHHUJtkpo5fbvHWPznLf6mABBrHErEyz2m7dL5LaPAN9Y4eag3p645ymaBpmSU4dGpqrDGhCgUS9iZQJO/rztp2Gz34nq2I1NfsITTRlTuZTf6ZL4eTCeOyRBVVbRTEbcf169u+jYwXJh2kc2zfVH3j1icCfDPeg1QUdfhs3xwXP04mVCcNL1FuIoKur7IwrsN34s2xwKmD9wIswTjinhrhlYZPYZW2IazfehSVAM3IAGuumJLzyqMtmos/HKEAl+1glT3LzfH+oFiXiJzEdW+E37DVn1jPzGxwDP+HjsYysc/0WiQyY/3xG2qRez5Y6d5lRV3J9pFmmklN
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR03MB4450.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39840400004)(376002)(396003)(136003)(346002)(366004)(966005)(316002)(55016002)(110136005)(9686003)(33656002)(478600001)(2906002)(66574015)(45080400002)(8676002)(52536014)(76116006)(64756008)(66556008)(66946007)(66476007)(7696005)(71200400001)(86362001)(26005)(8936002)(66446008)(5660300002)(6506007)(186003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?d6rabtVwBNoPpKAwGuBslONLlaipmvjrSBaX13WNfzT3GhWFYRc7TLwV0T?=
 =?iso-8859-1?Q?gCE/KbqRngIvB5oyYuNi+adqZwM8Th8+fo7b82U5KXiZLUj01EHnJKSxO+?=
 =?iso-8859-1?Q?GeC692nj57rY620LYTkohpvZqc+b0KM7KEfi9NoNewmfGPA4jnVUa3eWZZ?=
 =?iso-8859-1?Q?7W9cMlj/o1kImPzT2U2hyTC6v5eQ+Nd45cF5oc2q52dITHd5pccawj1qE3?=
 =?iso-8859-1?Q?iHQpN0FdaInMiMwuqfuETZDPmkQSP+1zU7BXR1l1DLe+lEAE6/HsHCPjkK?=
 =?iso-8859-1?Q?rhobq0zATWyZV7lHljujST0TSRICns7O0aqld823b6xKeAFgCap8t/SV1R?=
 =?iso-8859-1?Q?C5TwDxZbJf3l6miYawtHWYzqQpY4SphPa9y0kq45SmoeBMbs8JoOK/Xp4f?=
 =?iso-8859-1?Q?XcC2RNXYJA3TC3iY+5c0boKqXHN4HOe6WmPG8crDk7oRQcLJJT+BduGqy5?=
 =?iso-8859-1?Q?RZTBwmM1NWelMgYqfVMYueDPixzKadvNG3tEA7+FF7JsPEjMwk3Rtdw+nQ?=
 =?iso-8859-1?Q?iLpAZzrF/WYV9FRmCKMGFteQapBjV0czW/Ce4Ci7Mgyg+iza84O9V9foLu?=
 =?iso-8859-1?Q?Bm+N1wtLlW8z5T4guXdJddRRa7Y8oJw8Ches5pOTPloS70a1rhJ/pgOrsh?=
 =?iso-8859-1?Q?2NVku3ZvUCtzuJemmmTlmMAv4jHrHlYlhh0d5VPWapYWU+9uHemrL1Lv1C?=
 =?iso-8859-1?Q?nMIl+cfwH8FMxL/BW2+vgclqXouEUuEuehZsOTKCwuw3Gvv6uJ+F5Hm0cF?=
 =?iso-8859-1?Q?L+EG+5H2K3Qc6jh4eAWPBEL8z4da1PjArgXx7ltemhsOsKzZZmQjbrW/j6?=
 =?iso-8859-1?Q?fHXD4Aw/yqyduHL3ArtC1fe5UgG7z2eYg+oZeaGewH2RECP9BZ07sZ4ySu?=
 =?iso-8859-1?Q?0Jpigcaiko0Q17WN1WQve5QbO9kiNCztKNoPAHP0XufQ/4gNYvAF+Ag9JY?=
 =?iso-8859-1?Q?73SSf+lB5wtNTrsZIApppkgigkh8lD1+/gdXqNk5mtFpT+zacFxOAuOC5m?=
 =?iso-8859-1?Q?KoNdbWaj8690LJ86FWmKPiensT0MNLN7lpi1hLb1EnxxA3iJihF6W3/8CL?=
 =?iso-8859-1?Q?4Fvm/CFEPQaDZJ6ZDNbyT73oS5QEL/BX3D9kl95lUkaGyUAvLtRoFGT/Er?=
 =?iso-8859-1?Q?AXqaEQa1IjmYhiw7C5cWG2ALzHFFnqkf2wLT3ivXhNb6m//6rgjw702beV?=
 =?iso-8859-1?Q?bj2QB/pCzmvj2b/RzQQIFADS841I/mMAE2bEcW02JJZl11ixKgGQ1kgT9I?=
 =?iso-8859-1?Q?/URyICnJoCVNT3LzYpNnBEA7VowKuSYUcIV5ffkwlA+38VL09XMqp24CMz?=
 =?iso-8859-1?Q?Aq7V8R4SCyF5eHuaOzUS8PLd2yhFXPCfbdaTkrNc5VGNeqNmvXnO4ozBOk?=
 =?iso-8859-1?Q?hH7qZG/p1a?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: ikerlan.es
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR03MB4450.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25907f22-30cc-4008-5179-08d8e91abb89
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2021 08:00:29.6835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 910ac815-f855-4a08-bf29-90b46552cf11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RPHxKI5MCOZcq7uMdRw5C1yoQQUO73aNaX9MNiskVuwB2/vluz1kAKTjAXb3YwBJ5a2Ifqzrv7VdrfgtW6Wf+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6691
X-Original-Sender: msainz@ikerlan.es
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ikerlan.es header.s=selector2 header.b=llZyRAry;       arc=pass
 (i=1 spf=pass spfdomain=ikerlan.es dkim=pass dkdomain=ikerlan.es dmarc=pass
 fromdomain=ikerlan.es);       spf=pass (google.com: domain of
 msainz@ikerlan.es designates 40.107.1.98 as permitted sender)
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


-----Mensaje original-----
De: jailhouse-dev@googlegroups.com <jailhouse-dev@googlegroups.com> En nomb=
re de Jan Kiszka
Enviado el: mi=C3=A9rcoles, 17 de marzo de 2021 8:48
Para: Smith li <v6543210@gmail.com>; Jailhouse <jailhouse-dev@googlegroups.=
com>
Asunto: Re: where can I get configuration document ?

CAUTION: This email originated from outside of the organization. Do not cli=
ck links or open attachments unless you recognize the sender and know the c=
ontent is safe.


>On 15.03.21 07:47, Smith li wrote:
>> In
>> https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgith
>> ub.com%2Fsiemens%2Fjailhouse%2Fblob%2Fmaster%2FDocumentation%2Fconfigu
>> ration-format.md&amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f34
>> 43ea28df08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7C6375
>> 15645170386416%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2l
>> uMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DwldQEArIJ%2FcFxGw
>> 4x6SskbaxOJyVdBLeDuM1vOMWO%2Bc%3D&amp;reserved=3D0
>> It only shows "To be written..." .
>>
>> I found how to write  right .c configuration is very important .
>> For example , I want  add a new inmate,   a new inmate to run linux,  I
>> don't know how to set the value in the document.
>>
>> The result is I can't   easily run a new  inmate.
>> I think it's not good.
>>
>> Will  the document be written ?
>> or
>> Where  can  I found some  good tips  about  how to write a  right  .c=20
>> configuration?
>> Thanks very much!

>Eventually, this document needs to be written, at least to describe the bi=
nary format (which is expected to stay). The way we generate it >right now =
via C may change, though.

>For the time being, have a look at existing configurations, in the main tr=
ee as well as in jailhouse-images (depending on your target) and >also stud=
y the tutorial I gave a long time ago [1][2]. Some aspects have changed sin=
ce then but not essential concepts.

>When details are unclear, ask questions here.

>Jan.

>[1]
https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fevents.=
linuxfoundation.org%2Fsites%2Fevents%2Ffiles%2Fslides%2FELCE2016-Jailhouse-=
Tutorial.pdf&amp;data=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3443ea28d=
f08d8e919c2b7%7C910ac815f8554a08bf2990b46552cf11%7C0%7C0%7C6375156451703864=
16%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1h=
aWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3Deli3PRBWeg4PUcrt%2BU6XJdukfxxwwqNjilc=
8h1YzrRY%3D&amp;reserved=3D0
>[2] https://eur02.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fyo=
utu.be%2F7fiJbwmhnRw%3Flist%3DPLbzoR-pLrL6pRFP6SOywVJWdEHlmQE51q&amp;data=
=3D04%7C01%7Cmsainz%40ikerlan.es%7Ce416bf160f3443ea28df08d8e919c2b7%7C910ac=
815f8554a08bf2990b46552cf11%7C0%7C0%7C637515645170386416%7CUnknown%7CTWFpbG=
Zsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C=
3000&amp;sdata=3Dnm0vus3DsupHfxZ7sDPu4yhbVKkQbRHNtBcMezsykzk%3D&amp;reserve=
d=3D0

Hi Jan,

First link is down. Can you check it?

Markel.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/AM0PR03MB44504D2242854324D3B00F16B66A9%40AM0PR03MB4450.eurprd=
03.prod.outlook.com.
