Return-Path: <jailhouse-dev+bncBDAMFR7JZAEBB3FZTKAAMGQEDPHXIAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id AF69E2FB481
	for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 09:48:44 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id u18sf5580272wmu.4
        for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 00:48:44 -0800 (PST)
ARC-Seal: i=3; a=rsa-sha256; t=1611046124; cv=pass;
        d=google.com; s=arc-20160816;
        b=dFu0+/tIYB6qyXrtjZ/n7ySm+oysY93PGEMtiw9luiAD5o2vZzfZnC4U3y2vL08zkX
         NoMseFpdhZvtnxwKfcF2w7L01pW2DjuRhLOMQBp5wMHbFi/0iKn3umyORyJOFJoeBnwU
         WCp7p0c4WJh4RqHcUj5NJhTSBDV90IihdExS1CqQ6VtPq99/6igjpE/8isrCsPm/sL1c
         c1yN3edILiYpN5PMtQ8cYf17RMshVOFHsNFA9ZtmpDh1IGx5uIB0tctiW6XG13zYoNS/
         ddVJmpRGcXTj5dn6JB/aPkU/T18Kem1bSP3HHEydlygie6M6xN64oCPB4ZpYUqjqI31r
         I5AQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:sender:dkim-signature;
        bh=1DsH3znNH9pp/gconBYqEEtBSpagyOtpJWzK7mtpICQ=;
        b=aj7s8tg/K4y8Lqbmt2H4D2rgbvpxWA4CfLmOERifLktz+C9ftyRm7QkfkRzJMA3JNe
         VDjTJ9lA9qZ6uJSyCqwkvu30etNfZ7ZwvQ/3+DPbYqB55ygUEzyc71L66Pe2y/RNWLtx
         w4k29IH3AYbr3PTp0D3h3SvXWFxHpk+Mt8PkgovECBZWgRO/NCvTJJNGUD7xKqofAotS
         CtV7Lfp4EP83Z7+d1gKrG/WvOxSIUz/OaoliTL2jk6zhC1CzGOx8lgep9PmZVsuap2ph
         wuNBRK1i8JAyXD50UFmG6yX1gF6XK+meQBu7whgyeOKsMqe30s4Rv+ZbDcQVQH2mlJLK
         4kdg==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WO6AYgyQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.60 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DsH3znNH9pp/gconBYqEEtBSpagyOtpJWzK7mtpICQ=;
        b=GzgFSU1uLI3FYeIOeMmmkD6yfrf3Zm81Q26QQGAzupB5qiWZzZ6bFKSqdDBuMBfvq5
         N6Yn+1s8Q0GkOoTjn9JPzoietIV3Wf8MWbXzJcBHFv8t1OMf5AzUECNN82KzT0/a4Tk4
         1vhJjTkPqs9mEvJLsSquZEZiKLS6F9F3rlvDsH765pMAn+eu5asCRC4DuokyI9RW3zHs
         eds5gNQFoDv1NBbJWTr6oP7ygJWh8EI6/vqueEhaUzJImLtvE6R7COBGTCIHZ9Xo8d4s
         yZjytcK18N9F2YtWTcU7v/FYVbkZs51JmpTlUCxa7N21K+AJSqJUU7shzcqUs6Zbg7Hs
         fglw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:thread-topic
         :thread-index:date:message-id:references:in-reply-to:accept-language
         :content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=1DsH3znNH9pp/gconBYqEEtBSpagyOtpJWzK7mtpICQ=;
        b=BFOi6+p5ASOag2AtXNM+d5JJpS431SJCjBj45ezMsJ5NmrLgWuXveWvoJQnAkxSgPB
         q+nSByWMXH3p8VbWuQivp+ZXuTqZRprUIpJt/JJH4/8jMIFiCL8+H1ioE55ZQjCDjEYA
         1dmkCNSlbJeGIpMoIufxFOItCernw8eHMrDX/PyNpx9SlLhijNsJHk8UHwFtJRs/e+lV
         BVntyPC/YGKz7w2GifZamWzIKnzW5pvkTHJIHFowIH1DysEXKwCNe1AmWtu1uFI4QiB/
         5imzNmcIPmj/yIOSIbmKxM4lKME5EwAK9Unj+MBuhhdyNN7ls8Veqlez2h1krim9lS3h
         5abQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531qJF0V2LGxI4iYVPkBO9xGhTONasWBtuBVHLoxuoOA8oe/DeNc
	nekwLO1qix/8tQzX3dv3PkI=
X-Google-Smtp-Source: ABdhPJxDJjTlFnfD1X07m6LQLJV0Hd6TyINFApXRyHI3Oc1q8PkmF1eTiGUUZ3DWBHW7GzigV41QRA==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr3345821wrt.114.1611046124418;
        Tue, 19 Jan 2021 00:48:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls11978681wru.1.gmail; Tue, 19
 Jan 2021 00:48:43 -0800 (PST)
X-Received: by 2002:a5d:40d2:: with SMTP id b18mr3081822wrq.369.1611046123634;
        Tue, 19 Jan 2021 00:48:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611046123; cv=pass;
        d=google.com; s=arc-20160816;
        b=0nwHiJm6YOhkIt7GRtaOvJx6YCY9iWivzeXp6g8RXdFqORcmgKetJOFo2B0MTvuMbp
         pqCCrFL9BXsBCJ4Lr/JLRPVC5iStTtTXOzafzNNq0B2nKeSxAYliuwrk97uK+4aRHK2/
         FqNk9Kli6WFMKMo0TutOejezHyQb9DWu6IKGOwkzMXtSZTC3yMJcjl6kWsVMj9Rn665Z
         T7e9PQBdtMyydfjILgBk3KlmCN9lmv7C8fdEkgaLla0tZTnujMKj+q8LwnZpc7ec4Xds
         F1nAx7EfF9AfH7Z5cG8Wdp4K26i/yDzZyzP+oBdAqVHB21qpln7OSIWqlMmzK79IiDFJ
         Iy/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from:dkim-signature;
        bh=+e1qsgXCtLhvnnAhcWwfd+ASgAkDH4A4/KzzyssV5Jg=;
        b=EFXFjqQXbT/PLVp1RDreBpZLQQEeCu4iKsW5MDVyJ7lS4UWx9J3Lyl5A8BeoOgYlit
         aPvb17V93NBijfu3S6eX40ifNxywTjcN6A5ldYvaDrxuOcJ0+4yBobbgDosfnm4AArZz
         3ABrGikiLtteXhST1b3olDAtilhT1x6y8acQVwwwby43u2sWKDf+GusFvRP9bpLpKIcN
         1JpX+G5+pOzYxqPLUSy6b6knUFvJWHUm4xEEgbYAST8NWrHIV+pjU+6LTXnOxcxf0NU1
         8Nt80vIcWuIDAyzbUEZEJf9/JwJINt1htN8JB2HMSj/O95gx0K/uiwsRjtMSmU/ZZQeA
         TErQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@nxp.com header.s=selector2 header.b=WO6AYgyQ;
       arc=pass (i=1 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass fromdomain=nxp.com);
       spf=pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.60 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nxp.com
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60060.outbound.protection.outlook.com. [40.107.6.60])
        by gmr-mx.google.com with ESMTPS id 18si87553wmg.2.2021.01.19.00.48.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 00:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of peng.fan@nxp.com designates 40.107.6.60 as permitted sender) client-ip=40.107.6.60;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ipwwDpoQN2Ir6X+4afxXBXq32TeiWMv+50MDLjPzIdX/dMpA6KRCN5/l1kh0v/0hz6/+307Bj8GsjRAcYweyIUTzGxXX3vaGfjwAfQ4xxqPFC/eByQfgVlUgZbrDEi/+o+qaUWuGDpPxBZ9s7vqGazM+AiweyFj0M7ArYmwj7kHQxajEsdP2PnSV1YUT2s1DVdchIYb2gqDW/JAaAS8b+dxnlwNBvqfWFkUNJvVO37nAL3C+guWxfZ1FhdMjfvQFAcMXBhIpLWrzmje88KO3tNL/8DCThuDWqFPo7/YhsKU2BpaGqcMu3bMmbgDAkulJtr5VFem8wGz5L4Cf8QQnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+e1qsgXCtLhvnnAhcWwfd+ASgAkDH4A4/KzzyssV5Jg=;
 b=ofxCdLG4CL3fkwtuG4+yTqL3uge/Ue2paZjluWNNXbJJNZEMSL5/VVys/1Ul5Mcv1AqVRYHy2B9gw7LXq5+T4ypFrm2AbKASMFFkOwjTnqzcxGLieP74epi90DLNhAg/NxRiaYhz313Ztvt31H5e4I+drMpHs74tD73MV9eAGkSCwOjVfqm9Pu93u6ye7LhE6TLANtyFyV+d0dH9Dc7QJB/cMavw0Sd2vqoUH4cUT4orRe4tW6Am3nhWC5OLV4HaoqWEK2NBmuDR2PDex30ntinYVwo9Ge0fUeu+caw3s8hVCOp5YmDN76bkR1D97eqtwNdia0C032tRou0siJ39SQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com (2603:10a6:4:a1::14)
 by DBBPR04MB6027.eurprd04.prod.outlook.com (2603:10a6:10:c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.9; Tue, 19 Jan
 2021 08:48:42 +0000
Received: from DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5]) by DB6PR0402MB2760.eurprd04.prod.outlook.com
 ([fe80::c964:9:850a:fc5%10]) with mapi id 15.20.3763.014; Tue, 19 Jan 2021
 08:48:41 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Peng Fan <peng.fan@nxp.com>, Jan Kiszka <jan.kiszka@siemens.com>, Angelo
 Ruocco <angelo.ruocco.90@gmail.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "lokeshvutla@ti.com" <lokeshvutla@ti.com>,
	"nikhil.nd@ti.com" <nikhil.nd@ti.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Topic: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
Thread-Index: AQHWbGQ7sCfqYTCIg0iVKNihnvHAXakyjcmAgAABblCA/RU5kA==
Date: Tue, 19 Jan 2021 08:48:41 +0000
Message-ID: <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
In-Reply-To: <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [92.121.68.129]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: af8f5a35-cde0-4188-5a61-08d8bc5705dc
x-ms-traffictypediagnostic: DBBPR04MB6027:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DBBPR04MB6027CFF991CE0C56D2BA7E1588A30@DBBPR04MB6027.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PGVEqX2/0vMipFTft4uR85gGZ6Xmx7Fk/EKWtEMbuv/egtZWBXM38dQTHV62eIZjq+pVFgbDw9Noy/sPvfawyYBVLzgvWyRjnYrUuKoVRnjjlsIHbDzlXEHrWb0pp43mpWN6V4oI1FTtzYjG1xUbGzGd8S+DBs4VZOodIyTO23A7MliKMlmj3zA8w6TYvsD2rsBG8kxLFcC2yv8t50hHj2W4DjoPLynSRbuoBIz4Ot0uxvKCD2bW3b7wFvY02AqmJU4NWgEgH/L+1z4TTywp8bgM8J4AqAMMdS8lAnvxDkpO3Oy77V5MrSgtBsa3d7byrBpWMd1UKQUtrPlBdg4TxPRSn5TtjwpTZNTd0XWd21LpdPiuC4r/g0g7mp7ooMKpsNxE9WdSFlgivXHjr3uP/2wqoLGmMbR4HzmKNkfWO43DM8a+Kwo8Peq/seZqLulrklGIsf3Yfj3tJKDfdKrQ+TAd2GXFnCLu6G3I8/BjZtxV7T3s4Xx3h7g2AHAI+lfeTNa+d7xOamFwGeTnzblksZUVet1EhydDY4MuiIqdjE2M2b7vaC4K6gAzmF0k0kf4m5RXlFtK66OTuIrtNs1s61zwIN57XtRuZkJlyDneIAY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB6PR0402MB2760.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(52536014)(2906002)(186003)(26005)(966005)(53546011)(33656002)(498600001)(86362001)(4326008)(45080400002)(8676002)(7696005)(6506007)(9686003)(83380400001)(55016002)(66476007)(64756008)(110136005)(66946007)(76116006)(66446008)(44832011)(54906003)(5660300002)(66556008)(71200400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?bFVVeE5vSDVvR3JDLy84T1RMOTNlVmxpRkNOc3lnT2FVS2k5Rjg1YzJXRXdN?=
 =?utf-8?B?R2ovNTlmankrZE9KZi9IMWxpVVJweHcyT2tjaDZqS1d2VEtycXdLamJjVmpW?=
 =?utf-8?B?bjRoUDgyZDl6NWpBMUtUdGMvbTdRYXFCZTVUZHRJR1lhdGhiRGswR2JqU0lC?=
 =?utf-8?B?a1JZUWNpRzZXOVo4ckJyb3NjSVpSdWc1WjFrU2FqVHBvOEJuQmxkMjJpcHZV?=
 =?utf-8?B?cE9YdDdiNHRRVExYTDc3MXRkRk81SmNFOCtIVkcxa0kwRWdTSU9MQmpJT2Ew?=
 =?utf-8?B?MnNXandzT3dieTBIalNxQTllQkNYMjFlMFRURzREenVSam1hUTl2eTNrVzI2?=
 =?utf-8?B?Zks5c1A4Z0RSVSt6N2RwSXBCdUZBcnZ4VmQ0ckFXYU01KzhraDN0cUVsWnVv?=
 =?utf-8?B?NnIrRE5DMjZvZ29PeUx4eHFmb1dKKzJNR1NPanhVL3dsTjRJRXZ5K2NsMjcv?=
 =?utf-8?B?cDhSczZLOTJMT2ZHVlQ3Qm50TlhlYzVXdHM2NUhjWUJldFhhYVpLU29tYW9E?=
 =?utf-8?B?Z1BNMENwUDBkcjNodUJ1REpFOG4xeGFjNXl2N1pLK3Z1YlN5VWJmQmR3T0lt?=
 =?utf-8?B?b1VDNS82K2VpQlc1NlpwSkFSTjdMZFd6Q01jV3lZWUd3UmNkK2tZb0tuVU0z?=
 =?utf-8?B?SHFyNnJLUk9obEZMdVNhUTZuSFZsZDBxa1FocEl4ZjQwbnBVVGxtdE5ZalJ4?=
 =?utf-8?B?enpHUzdaamRYZy9oWWtEQWx4eDVSTVA4bURhUS9USGFycUJGWVd3Q0VHOXJo?=
 =?utf-8?B?NEVQS09BUlhVUWY2ajVvZTcySXdxKzM1VmdlL1ZCNCtCQ1Y3WVdtbzBsajBY?=
 =?utf-8?B?UDhRU3VaUXBDQWtEeldzcXhqa2hHanJGT1ZuOG5ESWZxVjFXRWQ3OFM4WEhN?=
 =?utf-8?B?bk1rT0w3dzBXMlc1MGJUY1JNbkp2a24xNmVGS2xJdlBuUEVKc3VCMWVFemhR?=
 =?utf-8?B?OWNKS2xtWFR6NnQ0WnhuRndvYzNpYmMwMjhWUWZxZ0hyUlN3ci82cm1vZ1Zq?=
 =?utf-8?B?YU1uUHNSeG9vSTg3K21OUTZHY0xTajl0NUthcER2WW9LNnA5TmFNMVJaUTh4?=
 =?utf-8?B?QTRIb05SdmdVeDVYbnJDOFQ5bk9Xa3lCMEMxYjI5dEliTGlKSWE4RjZydXU5?=
 =?utf-8?B?YlFpYWQybHN2TnArNmR3TzRON21SNnhvN3NEcjd2Z09hSGV5cElMdW1VdkRQ?=
 =?utf-8?B?ayt4WFJkb2N5T1lmUm9TNVBYZmM1c2lySDVyQ2svMi91eUMrelBPc2RnL2dn?=
 =?utf-8?B?c0pyNi9nV25SMlNINjBJdHg2MUw1QWRndFAxRWJRQjF6dUQ1cEk2SmdKTUd0?=
 =?utf-8?Q?drtdtJCd1PJkw=3D?=
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB6PR0402MB2760.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af8f5a35-cde0-4188-5a61-08d8bc5705dc
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jan 2021 08:48:41.8809
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6jjukz+Gb+te7GcgYkhJmZhhI9D+Ley8Obdq7IJ98JDY96HvilAQjizqgTsTI+QX8fwABLDk/lCZT9IXEV+QCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB6027
X-Original-Sender: peng.fan@nxp.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@nxp.com header.s=selector2 header.b=WO6AYgyQ;       arc=pass (i=1
 spf=pass spfdomain=nxp.com dkim=pass dkdomain=nxp.com dmarc=pass
 fromdomain=nxp.com);       spf=pass (google.com: domain of peng.fan@nxp.com
 designates 40.107.6.60 as permitted sender) smtp.mailfrom=peng.fan@nxp.com;
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

All,

> Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell Linux


I wanna restart this topic and hope we could move forward
to land this feature in Jailhouse mainline.

The initial thread:
https://groups.google.com/g/jailhouse-dev/c/IZEFz-e2lh4

Angelo also post a Linux-less RFC mail:
https://groups.google.com/g/jailhouse-dev/c/gctNUieKd8Q/m/ekSKqBa2BQAJ

I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); China UTC + 8(17:00pm)
in Jan/22. If you need the other timeslot, please raise, then I try
to find one that make all happy.

[1] https://webchat.freenode.net/#jailhouse

Thanks,
Peng.

> 
> > Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell
> > linux
> >
> > On 07.08.20 05:06, peng.fan@nxp.com wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > This patchset is to support boot jailhouse before Linux.
> > > The previous RFC patchset:
> > > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgr
> > > ou
> > >
> >
> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
> > pIQAJ
> > >
> >
> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
> > 8d83dca6
> > >
> >
> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
> > 022610&am
> > >
> >
> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
> > ed=
> > > 0
> > >
> > > Patch 1~6 is to create an new folder libbaremetal to hold files that
> > > could shared between inmates and new bootloader.
> > >
> > > Patch 9 is the central part to boot jailhouse with a baremetal
> > > bootloader, which only support ARM64 + GIC_V3 now. It will use psci
> > > to power up secondary cores, do GIC_V3 dist initialization, Then
> > > kick inmate cell.
> > >
> > > Images/cells loading is done by U-Boot bootm command to boot a fit
> image.
> > >
> > > Patch 10 is to support using jailhouse userspace tool even boot
> > > jailhouse before linux, just do as "insmod jailhouse.ko
> > > early_loader=1", then it will bypass fw loading and etc, but setup
> > information for linux usage.
> > >
> >
> > I'm missing the big picture description here:
> >  - how is the memory structure that the boot loader needs to set up?
> 
> Nothing special, just put the cells/inmates to the fit file, as 8mm.its.
> 
> >  - how is the handover between loader and root linux?
> 
> Nothing special, the boot args are reserved when U-Boot kick the loader, the
> loader will pass the args to Linux after jailhouse initialization done.
> 
> >  - how are things configured?
> >
> > From a first glance at the code, it seems a lot of things are still
> > hard-coded, likely imx8-specific. That may mean we need to work on the
> > user story further.
> 
> I use bootloader/include/config.h to define some addresses. Since I using Fit
> image, do you think it is good to parse fit image to get out the info?
> This will need porting code from U-Boot or write from scratch.
> 
> >
> > Also, a qemu-arm64 target would be good.
> 
> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
> I need to let U-Boot boot Linux, then could add the feature.
> 
> Regards,
> Peng.
> 
> >
> > Jan
> >
> > --
> > Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
> > Competence Center Embedded Linux
> 
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgroups
> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606FED0
> 1836E49F644C2E88450%2540AM5PR0402MB2756.eurprd04.prod.outlook.co
> m&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Caa5cbde61bf944b03f45
> 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
> 327292966107007&amp;sdata=C7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I
> bwqI%2BRZw%3D&amp;reserved=0.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/DB6PR0402MB2760EC86B40254F8CC07A1FF88A30%40DB6PR0402MB2760.eurprd04.prod.outlook.com.
