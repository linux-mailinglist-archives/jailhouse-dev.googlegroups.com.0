Return-Path: <jailhouse-dev+bncBAABBZF552AAMGQERKCSVCI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id C517F30ED0C
	for <lists+jailhouse-dev@lfdr.de>; Thu,  4 Feb 2021 08:14:44 +0100 (CET)
Received: by mail-wr1-x43d.google.com with SMTP id x12sf2073436wrw.21
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Feb 2021 23:14:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1612422884; cv=pass;
        d=google.com; s=arc-20160816;
        b=D5fKdN1rcfOWbppm3rZb0+VqaYD7jiqVSWJ2NXsmXS7OBCgEO3+8EgSX+oXYt+n2b+
         14NIyR19iivhV8jTcA708MxdTEq+QdJsua2Vh3pZnm5La8KlC7OnJ9u5wvPNuZLDY0we
         vQkBgTc/O9+Z4IshGTvA48fTtAxzi8ta9V2TLbqLvEwKwtFF4bgpCDVr/zVVhYbqZo66
         aEDOPlUzyvQDzJ8px2QbDokMc7EWZVG3QYJfY6bNQNa76K/XxlMMd98lkcL1qtTO458O
         CupJ8Y0U72WASwYYYikWQlsU+pv/v5orpBmxFl4jwFosaP5KwxRP6lq0OAl0Pkfjs2se
         6Y5A==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:sender:dkim-signature;
        bh=36wd4DqaJdJ8tJ9tkUAzvBm/PQnKtZfqAOozNs4XSs4=;
        b=kqqGtogWYzf+hsgM5u3m3k4Fytlt5MrH3hdLHPs0YEn3QKQwfyWJQFEtDvVUDhZK6c
         Rkoy/SiuWolQfo8XRjdv3bwlQbdnNvKG6qPvnaoNRgQGnpli2aFXRO3/8sakm537vFol
         ezfYXSBilPaFUBzngmWfC+imdkgu/IdAi37WIUHxXOzKPuL5bIBgReKxwQ7jjHjHfWfm
         oODyY5DNmfCzjiLDB6B3PjnPwO+mr60/zUTIebDo/VraTIlHQJJG6T+Pt5XT5f8i+lQn
         sE5QKokVQqaXZAo0AIIWHfMu4FAgT2N5sZFrnVdmwlCW2PuViXcnqhk2IcAzTH6HhUsL
         0InQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="JUyBG1/B";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.60 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=36wd4DqaJdJ8tJ9tkUAzvBm/PQnKtZfqAOozNs4XSs4=;
        b=a5ErfHqTbR/Qv1OF1wraNtqpiWyvDGk0L3fWPs3sRQTuC0HJhtLdjQQyX+ife3cFE0
         pPYxN4Bzhgd+D/8u27kJKbifG0R8hzaLeyb3S+SuxMBV/Bp02R/C2bHC1gqVGb7ZRgF1
         0Xj5eskVzfnAK84kM/WZq0oKesGWDSGrW1m5cxVFacHtuWBw/WFvrL2dnqEN+WqKVvk3
         zdSvfTZCwzbit0NoaV+iKajq7L0OpAU1ciiddwpjwO5bVhgxreDtdwgd3k11WLpuP/NZ
         OGzNy/m/tnpFpW7QK62KuXpGHDjSfNcD2CUF7TCTHvF36DUq7RKRAuUeYNA48/9/0WRZ
         sv0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=36wd4DqaJdJ8tJ9tkUAzvBm/PQnKtZfqAOozNs4XSs4=;
        b=NI5nitYIzq0zkueppKmtVt6Lp3bDEBISelulr+KhSsiOQFWdunjVcKhtk+AYMyqyEK
         Y2MLK2lsANjScZNTMB7yLFZGQlka1LHq3CY3+ZPzdFbpMXdC1z9xntdXW64v5hhZ04Dj
         ESQUL4qHSpPW4i/0JX61RdLzt902sLz9D2wAU5vt50pQiwvdaf5CHH5xOPZeR8GENjKP
         7mI8NXNr8S7DLgGmdaX7KhdtFqUT8qg3iJVrbP4ZgXXGIdiSDVrNVSIdQbEG5h//4K+3
         cJuIgnk2E3a686kzv4nYGNZhaoYT/ZN+4ESUU/PBaXzuYhRpNaWZVMG7whouSKAQAp8+
         kKzw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533WdGPVQRBFwJipszgM4gquXetufeVSLoPhZuY0waVPTlkIXWEI
	/ficAVe2lgGC4J8e1eJcUNg=
X-Google-Smtp-Source: ABdhPJw914GoE2OklBMuxtaj2JTTuAIvQmRKs5Ilm6B72gQgbps1LZKSVdPrXeYuwydz+Zk4GBLz+Q==
X-Received: by 2002:a7b:cd07:: with SMTP id f7mr6038475wmj.126.1612422884464;
        Wed, 03 Feb 2021 23:14:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:2ecd:: with SMTP id u196ls2112027wmu.1.gmail; Wed, 03
 Feb 2021 23:14:43 -0800 (PST)
X-Received: by 2002:a1c:9dcb:: with SMTP id g194mr6110433wme.59.1612422883785;
        Wed, 03 Feb 2021 23:14:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612422883; cv=pass;
        d=google.com; s=arc-20160816;
        b=nBQfrHF5EALaiNN0+G/M6IhH5O15nmMiKRO4zYyKmEvz0u9tOf1Pe1/Ever+XOm3bo
         /7mFlxiKZAWeARA6nfI3yJi1agmqDZxnTP1LEz4w2aV3lvfbU/G6ybFDdez9LguuRyXm
         /NuretTdNiOe5XexPKE9N0TSpIpooTdY3hwse/8GLHutJ1nmwakSK+Tx8PHHb1aXPCcr
         nqiz4PBdfxhnTOClPvgK9gIPuDDDVT63FStkwZrr4fdKNviOhbCefHFtl96oZfC8crXZ
         yS+LcXO6IU7uQG+QPvAHFYiTODxddE+5u2kGxRlgYOcejwHAlsjpCHSnJHJnnTSsh891
         wXlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature;
        bh=24Jppe6eUb73TXVuYFA5UyHABOyw57w89BeUwLITBVY=;
        b=t/3+UPGqbi+5wncV/6bzdH5t1ZAQ14145prnD+MAvA0Me+CJQO0DAz/C3FMVgi6fdr
         swYXpZNzSFf3BFy/B2ZdLDB78R+EBykF+rf24odwNBWvgKqeP1RZSLHeDAyZQvAGtDAD
         UxXtOiC3o8DHHjxp8dStBk6tAzkTbcbD/UbC6i/fIXNkS9TZDT9KIfzikyNPyFQpJ0ld
         UZ4+uhtznyqqggSNdo2ihQZOUjVsuS+ZCJHVvEbV5rm3kOp0/c2LC+oucVPdYU/mlAAE
         84nxUqZRdbP08E/cmELV+uKqc4ku6E+4M21txS3LuLUuNBlUMTO1Fc9ZOz4qWMRLAG6n
         UA3Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b="JUyBG1/B";
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.60 as permitted sender) smtp.mailfrom=hongbo.wang@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2060.outbound.protection.outlook.com. [40.107.22.60])
        by gmr-mx.google.com with ESMTPS id z188si329032wmc.1.2021.02.03.23.14.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 23:14:43 -0800 (PST)
Received-SPF: pass (google.com: domain of hongbo.wang@nxp.com designates 40.107.22.60 as permitted sender) client-ip=40.107.22.60;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Is+cg4Oqkm8q9dah3LuLg/GSGr3qiU0eootTgIum9hwFYEo7ky/QwI88SFrFuIo+gfep1N8x3EdFhlxRoYt4vcNbzMZN+eiVZKPWix4oHiTVyzJZ5RSv0O6XVYLluRS0ogFq9xxUJsBhsxx2jvxsFZKZNy1F2C4s+hWs7qSmGAa5AG5h+wZQPXCMmwBDE7Ind5vGm+ixYGkQbV5AhwTQ7bNipIcqghdYAkhF7CFrgn/E+Z7yhQFxNGiX+WNCWqG3Oz/795xjsYWbXdwq5up26BC6z+GryZiLyPm6bIqcNRjIhZ89IdIT+3UGNI9wa/RLkzt9Gkc90y45bWV0I+JvCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=24Jppe6eUb73TXVuYFA5UyHABOyw57w89BeUwLITBVY=;
 b=MBhCjXRj+fEU2mFWTDHyK9Ks2nNewumaTGEztJzi8DxcxTSb1uZAhDsu28OXVG9XhGTkKk6xninbrHYD9xjxSSwCNnVUMt8ECVnygnEsHRx+L3hVFIM1Bpt+zrqOBkLID0vM0FFiT9UMdmY+NWfhtmGtuCZlTqm3M7TJTrix0STKOgiUrhmDf1j5Yucge9d6bJvzxD+fgEk0d59g6nhlmdiMLW/zYryMd1DYRUTQWPHU5zBO4f4GcfmETzg9HdbvsFTj3jQPllqu7237vBISMfsXbhj1BnoS+s+r0+265v5jneKkPOFdF6rkuQcKUjoFB/843XPs1HWYlFuI4WANHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com (2603:10a6:803:ed::22)
 by VI1PR04MB6206.eurprd04.prod.outlook.com (2603:10a6:803:fa::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.17; Thu, 4 Feb
 2021 07:14:42 +0000
Received: from VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093]) by VI1PR04MB5677.eurprd04.prod.outlook.com
 ([fe80::b960:3e65:4aa7:7093%4]) with mapi id 15.20.3805.024; Thu, 4 Feb 2021
 07:14:42 +0000
From: Hongbo Wang <hongbo.wang@nxp.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>, Mingkai Hu <mingkai.hu@nxp.com>, Xiaobo Xie
	<xiaobo.xie@nxp.com>, Jiafei Pan <jiafei.pan@nxp.com>, Henning Schild
	<henning.schild@siemens.com>
Subject: RE: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Topic: [EXT] Re: [PATCH v1 0/3] Jailhouse: Add DPAA support for NXP
 ls1043ardb platform
Thread-Index: AQHW+fhwiGCPlADjr0ijwf7ZcFksWapGN2yAgAEMz8CAAE0JAIAABLKw
Date: Thu, 4 Feb 2021 07:14:41 +0000
Message-ID: <VI1PR04MB56774CD0CC9889815A27F98AE1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
References: <20210203065057.27914-1-hongbo.wang@nxp.com>
 <c3290c3f-c2fe-9090-b06e-9a786496a772@siemens.com>
 <VI1PR04MB56778B493C1FAF9D87782F81E1B39@VI1PR04MB5677.eurprd04.prod.outlook.com>
 <eeaa285e-c9ff-c007-51bb-fa3d8194aa36@siemens.com>
In-Reply-To: <eeaa285e-c9ff-c007-51bb-fa3d8194aa36@siemens.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 504eee7e-48ba-498c-34e8-08d8c8dc8ae7
x-ms-traffictypediagnostic: VI1PR04MB6206:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <VI1PR04MB6206025A78AB0EB6256E25A5E1B39@VI1PR04MB6206.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CZudacTwJEMDID3oALHcTWZKY4JHC/7FAAnUzvHrDld5ntOps9lSxHAL/l6D83uO75EhfOYX0dCSFBTiFVxCSB3PvAIrRc/JbxAlnjZ4AoW+3eWxNa4sMq/mmNyVHkHMpMHfO4OX8F9FvD/01k14/S8HX8hjTjleGx55gRwkNGmyNN54V6wsYq1onwraRS7T3rvXWdlLjQ0/XwnGqLd7YF83UT5uuiLc69FaTxtsU2ERKbVyfu75PekqzcOP+p7lgIEJozF97jIQFQOQ6HctygUxhy8/Ab2wLk5ZJcrJl0CeZwb+78yKiead+hFt2b9yQCJNEnc3u+SLMRdpJYF0IHe61cwCHQp5jo847br65MV1IG+2TWSkw29NemU01hF6ArbR/Kttel3TJE60+mOc+dsPdkH5LWfTOXKgDkfkamesgei7muxsE8dgWivRhoNiCoaycvpH8o9sGyEaZfQF3j6xVB/oFRSAF/sr23ZOjeLVjBxjKTu3Bn6vLbnWHTIPfSkTkBNd6tuDszoInUC6tA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5677.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(44832011)(7696005)(5660300002)(186003)(86362001)(76116006)(33656002)(71200400001)(8676002)(64756008)(8936002)(66476007)(316002)(110136005)(66946007)(26005)(55016002)(9686003)(478600001)(4744005)(83380400001)(6506007)(66446008)(52536014)(66556008)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?TS8vc09BdzRnM2FpQ1hZa2wzcXZJbVpzY2hQdkgwdFpHZDRXQVZrMU5WM1RO?=
 =?utf-8?B?Wm1pVTVSUUF0SEF3Q0NOcFJiSmVtcmNhQkVoYUwzM2I1eERqYnZUK2tuSkJR?=
 =?utf-8?B?eXlRYis3KzhBSWVOdFI2akNhNXMxZkJlejhEdUJJUyt0TmlRTXVlaVJzL01R?=
 =?utf-8?B?ajdhZkdaZzFUT3BkaWcxZnNZNXFpd0pQMFRoZzI2eHNUVzduejBQaStoS3Zp?=
 =?utf-8?B?eHdyRnZJY0RZZGxpUExsR3VyZU5KN1dwL2U2RmxCM09UeU1BM1JNWSswbXcx?=
 =?utf-8?B?dXd6dTdleWtVL2x6WVZTTzZlQmt6VTdKQWVzd3VIWi9zVThVek5oM2xja1JH?=
 =?utf-8?B?anRmNUZiR1JGQW5ZRU5TMGlDZXBiYnRnUjQ3bEt4K0VIaExybVZnVUgrZ2sy?=
 =?utf-8?B?T24rcTZBcDI3SXdrczR1aXQ2SnZOcHVzcUhDb0gvTjlyREFZcThJUDRjeW9u?=
 =?utf-8?B?WVU0OEM2QnZQMWhMWGRPWEtuUUZVNDcvSWJTVGlXS0QrR3NmSmpiNmtqZXoy?=
 =?utf-8?B?eXBYZnZWeEszRVNmNU1ka3lDbXJXRHNia2FKZG5uMDI3Rys5VlpzTW1OR2pj?=
 =?utf-8?B?UW1QWHFuZlBFVnVSRmt0QVR0YnVlTTJpR21xdmt6a1h6dFRWckdVQktSQStZ?=
 =?utf-8?B?UzdjY09NODQ1NVROOFB4VXRMSXFGTTJlTEMvUTkzK3JsQ293bzdsL3h4WHNK?=
 =?utf-8?B?R2c5MWdKa3VVbHBGUmM2M1FJQktiU0ZnZitMQkxQeS9aZi85ZVRzcE1ScHJB?=
 =?utf-8?B?RGxTTCt2MXFPbFR2eE9la0tCWmxHNDhRUnYrbkxiWmxKdjdQblRkVWhRckRs?=
 =?utf-8?B?QnlEdXhDSUszQVZGdEhsWWlHNERXTnF6MUFKWGFsdHltVjVodDFjTU1UYXkr?=
 =?utf-8?B?dnZOL0g3VU1lQWtFWHIyUFRGRTd1RmNKU0FYY285ZXlUejc5RFBLUTR1WEt6?=
 =?utf-8?B?Qnd3L3JJMThXQm1GT0xMby9rY3MwY0h4MTYrRXhiNWlXazhIYks4b3RtUzRI?=
 =?utf-8?B?OXBIdzR3V3NhS21seEExdmYzbGl0MDVPbGV1aTl3aG5qcmlaQUt1MStNcFRR?=
 =?utf-8?B?MW1zWW80Tm1RUU1sYnFJZFpjL3lCQ0xFY2gwMnNIVUFrc2E2U2t2T1NPYUtJ?=
 =?utf-8?B?YmJNUk1GV0ViTm41bUgzdDV0aEdsZndWUlA4bTZmaDcwbEI3MkM5VUJiQ2o3?=
 =?utf-8?B?T2h6ZEVMYjZaU0dZOW5VMXh5aURPU2poaTlINnJ3bDlXU2RaOUlJUU5qcy9N?=
 =?utf-8?B?TURCZmFDVDErYXRSa0gwSnhPVmszUzN4V2VZdFlZNmxYMUd3T25pZ3JSaFNh?=
 =?utf-8?B?ZFIva3dCcXlRU2RNSXFnTWdLRDV1Z05CUmp3OUJZMFp6V28rU205M1NsMDJY?=
 =?utf-8?B?WVhrcUU5cUVoOU1qR0RjQWVyUCtoZW92NVVGRnlSWCtLeU1VYjVTdnBjOVB5?=
 =?utf-8?B?N3dFbmxPM0dmR2xjeUorUmRpUFgyL0RKVU14R3ZUOGZkQytBcmRIb1dCSVRy?=
 =?utf-8?B?ditTODZqamdxcVRwSmxtWVJZSk5IS2ttR3h6ZGwxOEtRVmtHeFFxbFVneXN1?=
 =?utf-8?B?SFNVSkUzQXVlbHhMOHI5T0U3YzZIUmh5ZXc0VUtyUkRVMVF2aEZCSUZabVBJ?=
 =?utf-8?B?aFp1RHh6YXFOQVUyeVpWS3F6ODNKTXNiV0V0VWxWTTgzbUJHN0lLU2N5eC9p?=
 =?utf-8?B?Uk4rK1QzVGxZS1FXa0NEYWVFLy9ES0dxamxoci9VSFV2M3ZrOGFWWlovajRT?=
 =?utf-8?Q?B9kNM9y9xuC4vkgHhuXPxwOFH2noH/vph8S2s4g?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5677.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 504eee7e-48ba-498c-34e8-08d8c8dc8ae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2021 07:14:42.0414
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pWVih6IR7E3f/Ac4nyM4UJjVO4WwGKq1YFgh2pbvDr993Lf0pqp8ex20gtUQFGwP7i/V8eHUU7aHw1D4+nZrtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6206
X-Original-Sender: hongbo.wang@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b="JUyBG1/B";       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of
 hongbo.wang@nxp.com designates 40.107.22.60 as permitted sender)
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

> >>
> >> What exactly will that allow the non-root cell to do? Own the DPAA
> >> completely (taking it from the root cell)? Or does this enable
> >> sharing (and then only in a cooperative way, due to architectural limitations
> of the DPAAv1)?
> >>
> >
> > there are some case that user want to non-root cell can connect
> > ethernet and cloud via DPAA1 port, and test their performance, so we plan to
> add DPAAv1 support in jailhouse.
> >
> > in this patch set, all DPAA ports are owned by non-root cell, root cell don't
> connect ethernet directly via DPAA.
> >
> 
> But then we need better documentation and possibly a separate linux-demo
> config for this rather unusual setup.
> 

ok, I will add separate dts and linux-demo config file.
thanks,

Best Regards,
hongbo


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/VI1PR04MB56774CD0CC9889815A27F98AE1B39%40VI1PR04MB5677.eurprd04.prod.outlook.com.
