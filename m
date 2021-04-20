Return-Path: <jailhouse-dev+bncBDGILGE54ELBBHFL7KBQMGQENIW6BSY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D0836548B
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 10:49:33 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id j4-20020adfe5040000b0290102bb319b87sf10535463wrm.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Apr 2021 01:49:33 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1618908573; cv=pass;
        d=google.com; s=arc-20160816;
        b=N0dRQegRoGUlMKMC8CrQi5DdVu5oQurykzmFZxurr3WmhFxgDnWs3ZPPrcPAZpq93X
         eTmuZpxD41KLHdOE1lNngpGuPAz/Ay5TqjvU/a1HZjrMw33M3o2Mm1ufJNcigEX+JnMo
         LyXfdQxwil4cKT3M8/jCZufC1YLe8v3B1iYNkbe6llci2kZ1s8LgaVd/5ky0yvG3JU1k
         8zhlKskN8NIDgVj5qSkmBtM0ZIIrIdELfbM6fPgFrKhqxZjUHTV5sjNc4c4bYGw5NuB5
         UpDpkQFfpXeP/y3kClltUjGqJzDMVS9G6vM2CIaZK57sVcLJZVvbwP5/QKBgXiKv1DgZ
         TXFg==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=YdGNGrJTZcslqW3tNmrvAdIEs0gLOQWQ3cXy640DsIQ=;
        b=eEZvqD5DGmaJjqaIN7sGofMGJ9TNUVylYAN41s65atgF6eR6BKoUOmSBWn2I4v68jo
         RDU1z8Hp34knxxt1jPjVc3zGKE9x/UXkh/x08m0sLc7COFtfnlc3pHkUpuO29bwqUCMN
         II+KRiKVBbd4E7lX8UvqyXCmDyHy225pA9Pt++VSSJIXi5pXvi+nxn1NxR37bppsErmw
         r48BXGS0Aw46+sHtlBNCj6U9GB2JgdFsgJuBuinSZFfC0XlPb7gYD4ctPVu7CJeguSXc
         2Dq04gK2JA3X9QunDF+AcIimDflr57aTKid4WY3G9mhrpOGf7xZcfqzxR1X7h2RfmhvD
         dYcQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=mPmdGSSi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.118 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YdGNGrJTZcslqW3tNmrvAdIEs0gLOQWQ3cXy640DsIQ=;
        b=Z59YBVHgqm73Os6Cc8/RnSBV/dZq9GAduZKo9kwAlBO4h2FdFesbVdjnkaPN6b+CBL
         nmGbVRoJrHrDv8EMNsgtxvKwNlrMvjLScHtdphdRxD5u3SBmekV7CGP3J3fj3MkTEESI
         L9ZWrNnwrTITQjnyhB1JQyF1AkM1zHYabNfVNtO+jyPFzDgj8jVkjUfCi4CHvMxNYSRr
         i9WxHr4F5s476dcSrECTxqBu58MVfqN9ASIp7yk62wDMoRH0IXk2SIWJmkSUrrpealE5
         WSWA/oLPhJ5Le0jOul+srZIYOGMacjd9/cj8m3SZrOMnPcD1dvya+XU3My6rhyAfihPP
         +JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=YdGNGrJTZcslqW3tNmrvAdIEs0gLOQWQ3cXy640DsIQ=;
        b=tYxQzSHbWt1NYTXQUk4krZHalaVqDeNHiz9xIIhqfrNtjtPaL36qDzQ/8TxDkrK1iO
         NnSB0r6ykG4jFIZRjg1vbpJSCXt2aiQ8p7ubAQDLwl5gsk7oK5hWMPtZq7gM2Rp7z0Ii
         +LFBnPak/FKyFPwrgTOUtLIhWanLHZFxxuIm18O/FRqt3P9g8o+CRATMX7lc90+irs0h
         pdQg2cy8ApvL9HFq1crVW9oRaLilCusw7IIkPEWsGmIMNWnFg1maHXZsFmIupXkmiPVQ
         FiyOyk4YM+fVvuH2TQl/N2yMAJ0CGCl4MiOXdgoPIlIeXSTMITY+ci9ggu6pciY/CUrg
         7dPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530e+k6XLUZ4yOpK6SkS62nda2NnBl7jgMELLWGUL/gANZGdeG9Y
	CQzqg0vl7oK7FVBnGsngR4A=
X-Google-Smtp-Source: ABdhPJxgb9RSdoj1VdzIh+MqHmdslqu42u1p1+KdHlf3W8BolJNSicMixcUwtZjY0QUCixELX2nwqA==
X-Received: by 2002:a05:600c:b4b:: with SMTP id k11mr3320120wmr.180.1618908573111;
        Tue, 20 Apr 2021 01:49:33 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4101:: with SMTP id j1ls1178281wmi.2.canary-gmail;
 Tue, 20 Apr 2021 01:49:32 -0700 (PDT)
X-Received: by 2002:a05:600c:25ca:: with SMTP id 10mr3384877wml.0.1618908572265;
        Tue, 20 Apr 2021 01:49:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618908572; cv=pass;
        d=google.com; s=arc-20160816;
        b=b1zWPqaNgLsO44UUBXnUyfBxeC/WMVWbnajhw8jHyahr87TO7qk0YoG/lMh8LrhJfY
         NOyF9tp2MeA3J8HCUQWMZw+a1pTFOvAbQBb+hYVx9MlHP/Zy4U8I9jgSrue+ldy/dsmk
         mp9Y3lOQptih6pExVBcjwoTJiVgkm34ebjLl2/L/MzsuzIcVa/an3zCLrZwHoT+ZjWHW
         5H+mHerpofX2w3Y/+LiEH2MzrxblFXIDTQYpTSLNFA18WVzFcye4w+84zY2UFcbgJnFM
         MUr0l2ZfcTy38Ra2KTodYWGINVIV6QaDzs2Sov5FuSVQUSNIWounvkNGunmoO8n8mz6j
         53gg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:dkim-signature;
        bh=fF/bo4yRz5AUdGWoTXT298yqPl0ir+XZs/e2hH5+yLY=;
        b=B1NYCCRDol3a9uBQNcZv4K7Kr5O40sQVtRakZnv9fMk2f9jazM0fwVLOofR8rmqWbs
         Wh19edZqHvc4DOftgQzZSJOPNn/4mn/t7BPvcUZEA5Djo3u8VRslXvEsB7DgQKADMVgb
         NJzc+IQZv5mSp9jB6Wb4MsuXsaFauQ0Cgl+MSgI5GQ5iGqZnNbmdsF60sXu5wm+sV4+5
         CuyIUPy5csT6nV/AiSM0quUcN/FqC62Dblz1OKqIGwiyb9JFqbRBIz+KMq1oSk5gvMFV
         8Iu08C8wC1JVjbMM1dHX6dwHhw8D6KgFdiZ0TRgb6SfvdDGU8hWKOEz1Y4+B3w89vL4a
         j/Vw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@prodrive-technologies.com header.s=selector1 header.b=mPmdGSSi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.118 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (mail-eopbgr50118.outbound.protection.outlook.com. [40.107.5.118])
        by gmr-mx.google.com with ESMTPS id x16si175318wmi.1.2021.04.20.01.49.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Apr 2021 01:49:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com designates 40.107.5.118 as permitted sender) client-ip=40.107.5.118;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDndJu+tFq0tKtXRkMIwuqp63XZErZv/Be+6CY+Wug6mhlFUgQSpVeDv0j2IpP+vSY/ROTzkPCNdLNcWDibcpbqPyu0T42o565jXPYdbxIzhU3WhAljUtSVqhUKYlAoXhX+p29zYV85QLsca6Ry1ObpAuBGIFNzrRFq7w1zmIyBSXYNcqO1MUUOtF2hX8K0RnhunUgE7hM+OLvS83lcpbYaj8YJPpwtHYynYN13vYRREzC9niUUQKLZDMIy6bb6ZQWXXk7o/xp+D9iaDJhiy7ehnib6h466MNxDTMl6aKxKghMYmSX5Xa4uHCD4MM5E9jWXeUK7C5CYisuCj5+lwUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fF/bo4yRz5AUdGWoTXT298yqPl0ir+XZs/e2hH5+yLY=;
 b=XdzM17xgii+iqIKzvCd8wzVA6O/y1RwuC5zxWVGXHVleHJZ2F4CG+hjmU2B4SB38PYZfeLCEZ4wZfrZwHQpbfSc+vmPbj86guwUE5KABZKFJlqMAuMJQ+vaiFpgiy38nl3EFUUrPwF/wkOH/cUZUhwvS1Ijg/KmL7Q4HMjbPnxf0Rq/LwkFjm/QCiRiUZWNkCfHNIC7Ii5TkyCHBuQCRORtGjBL12LmJ/H+rAE8prOL0/JiX1H+urAY/qEpT6KNSDfwFOwdH6kp5NK89cEMRaZRnhBMqDlIwutGkS8M6f+xCSbZK3vywMLSyROwNRilF9bl9u8cowxLfBVyxLbwrFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prodrive-technologies.com; dmarc=pass action=none
 header.from=prodrive-technologies.com; dkim=pass
 header.d=prodrive-technologies.com; arc=none
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com (2603:10a6:20b:257::14)
 by AS8PR02MB6615.eurprd02.prod.outlook.com (2603:10a6:20b:258::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.18; Tue, 20 Apr
 2021 08:49:29 +0000
Received: from AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151]) by AS8PR02MB6663.eurprd02.prod.outlook.com
 ([fe80::69b5:15e2:476c:e151%3]) with mapi id 15.20.4042.024; Tue, 20 Apr 2021
 08:49:29 +0000
From: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: [PATCH V3 1/1] inmates/lib: Add zeroed alloc, and update usage
Thread-Topic: [PATCH V3 1/1] inmates/lib: Add zeroed alloc, and update usage
Thread-Index: Adc1wffKr4/khhq+QEqglFoxEojIgg==
Date: Tue, 20 Apr 2021 08:49:29 +0000
Message-ID: <AS8PR02MB66632030F576308C52270C07B6489@AS8PR02MB6663.eurprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [213.127.64.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61d0cb03-ea0a-4fb2-8689-08d903d935c3
x-ms-traffictypediagnostic: AS8PR02MB6615:
x-microsoft-antispam-prvs: <AS8PR02MB66150BD11C95C1FEB7800BDDB6489@AS8PR02MB6615.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: o8wlvDO1oOGFnAM5eRFKk/mqUkc4ETv3raLTbx3c9zZjal1Z755zlePo2Sd3c7Grigtrr7X6p+SbGL0oKG3WW9hdQoyHRBFaZKOeU0TLd0iVHQJo0w4PfGcMA1FT8F4WjuUxPlZZtwRXgAJnvladM16CVhxom71/H/4s5+c5azC+kcVeZGJqzb5o8Og3hu6SYeyCvK+KLCqaAEFPqOl04fJr+/qFoOVF0lfmKZd/40I47b7D5jzuUAJhwVJSrDfeCJC/fCxkmfouIAmRdvXcQBKUuKWms/A6qBYHzKRvmMIa3KvzUfCkW8zZvzvJyLqIKfCh+rWj5Q2rVHp/YnH1B2SrLVMSpoOrHONzvbm+g2cdVoq9vFDataQpLiAmpmbyILGlC/HF7j3IFfvIK66JUgZ06f/hzTTzjLSbzCaxr/z7Le6gY5aa4NG64JOwwDDchaJyz5LgXOYpJKrsdFXBBsO2fDrzLEtm6iabmzLMOkI8VsYG6N6ziZTv8Yx21SfZjMza8rRAgCXtjUUPyMRGSDoeW5tciZd0IuaYHwcIhS9xt9dlS3vYoETbmInEwCama6YBh8PS3NvGl19qW2PeNfbk4ewkL0tQNc9KfLhV2VY=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR02MB6663.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(186003)(7696005)(498600001)(52536014)(44832011)(26005)(6916009)(6506007)(64756008)(33656002)(86362001)(66556008)(5660300002)(76116006)(122000001)(66476007)(66946007)(55016002)(38100700002)(83380400001)(2906002)(8936002)(8676002)(71200400001)(66446008)(9686003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?CRrAttcJVUmNcX0zUNnDdKCney5Bs+YSF1g3qWQ4Wkiwm8Jk6dQlfN+mQyda?=
 =?us-ascii?Q?HQZXwkVitu47ZUmMZmeNXQBFsCs4spbws2160pIZN2rlug9SAqwTyFLzjzPU?=
 =?us-ascii?Q?d0PEat4W3UmFJQLcx4//pz1yw6bXwgTT3QvNXqatb/1C3mG1SbGgcLFCJxds?=
 =?us-ascii?Q?NUSB816nrFTOZ1Q2j0RIycN2xHxZh+25gd/D2ZV+RH1KLMyhzrD0OJMTz7+I?=
 =?us-ascii?Q?RvbzdNoazG3RjNnETdG6eYHKicJiLkDLwLpp+0as34cUoyO5lBd3tvkN32kF?=
 =?us-ascii?Q?bMe94OBhCtTFCKB4UIFwb1Lhy0yWIRw/srSZpnfmc5ljQqYWMZxNf897ZYdD?=
 =?us-ascii?Q?6Q2b3kqXhNZN6AXrR2vYy0avLoA3HkSNInqH1uAXalig8vOi5FNBIlq8Ukk7?=
 =?us-ascii?Q?COCEnQ3OBfeONXiuZaPbO6Y+/kR0UEjYIUCQJ5biv5rDjdU4LVnH7oVhP1F4?=
 =?us-ascii?Q?uX097sKPTinoX9VTCL8tcYHMf53M6tIAnWbKeoh7F3AWQIoLa4zWrCLPqsWV?=
 =?us-ascii?Q?0nK9UgCBr8+eEuaWG1dA/PZTSC/P7mFyht+ZE7AsnX2J2/miyxqKJz/4WvGQ?=
 =?us-ascii?Q?y6ndLx9W/tG2i0FpSDURvO0+cXIZCfCEkov7KwA81n5fM9u3v+s7sBFqDWl1?=
 =?us-ascii?Q?Yzz94yHKqCKhbCBt/LHYDt30R9Cy7NfCCIlkJykm973s2BqIOIhUTopsFThw?=
 =?us-ascii?Q?QfsZnkdxB2uxBR+nBo8LPAcKnawNLhr2GHrR84peG63p25Gg2D/4b9cW0gY/?=
 =?us-ascii?Q?BMX5Aj5fL/o7QYPpuU1xO5wgttDhekrpq07Qv5eyhSKMCyXbBcR8ytMFxXY6?=
 =?us-ascii?Q?/3Yk5OYn4t75ak5X/hfoXTy2TpoghkYTX27udeL9bqjM/evvGhxYiru9veJc?=
 =?us-ascii?Q?QDqwgILMlsdPDkCqWXI+tCpUKt3o3yU0WIRkoYrnG+QoL+qttQb0v35yNJyL?=
 =?us-ascii?Q?80DyVgHQOiUsAeAym4/fJ95JOTYnTxGUEIh4/N7GYKRGEuSNYSLFj6I6+Vzc?=
 =?us-ascii?Q?F0Hn7dQwNs+a2lK1ehmdTBclpjvY8f2Nk9ugecJJdGrr9QzPucjddOkrwiQN?=
 =?us-ascii?Q?M83G5bdhwKjBlb7zrzMZSaV4MqSM569N+EIl6e3WR8/ly3xWJ8JgS6iguMKr?=
 =?us-ascii?Q?2Qba8hTKrIEWBhoA/48yC+TNZ2YzMELL99foNpnIqvMXid4tyhPiQF/R0z5x?=
 =?us-ascii?Q?M0LO2TMi1r/aYB4Go7FqNCxGkn3BxIYtm8To+wMQznndefATBum5uj9WShpc?=
 =?us-ascii?Q?qQjTgTpPUzuQvoGSgAd4hh+H2PecwpWHwn10GKbbWevx7W9rR52TcWV675MF?=
 =?us-ascii?Q?5cI=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
X-OriginatorOrg: prodrive-technologies.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR02MB6663.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61d0cb03-ea0a-4fb2-8689-08d903d935c3
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Apr 2021 08:49:29.3771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 612607c9-5af7-4e7f-8976-faf1ae77be60
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +uqdIOfJ5nsWfzVitnmPA/iJWhZBGY5O7y+ZuzpUWiFHITxzSoULdT3qgR7nSDb7/YQPl0qPNQJZnTP/E/HHkLKRcIFvTk6ffMJipUBVWWIBF1LwkInaO094SD35SaK3WpUKVe2H5dO5ZQovI1aA/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR02MB6615
X-Original-Sender: bram.hooimeijer@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@prodrive-technologies.com header.s=selector1 header.b=mPmdGSSi;
       arc=pass (i=1 spf=pass spfdomain=prodrive-technologies.com dkim=pass
 dkdomain=prodrive-technologies.com dmarc=pass fromdomain=prodrive-technologies.com);
       spf=pass (google.com: domain of bram.hooimeijer@prodrive-technologies.com
 designates 40.107.5.118 as permitted sender) smtp.mailfrom=bram.hooimeijer@prodrive-technologies.com;
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

Adds zalloc(size, align) which allocates memory and fills it with zeros.
Replaces usage of alloc() in inmates/lib with zalloc().

Motivation is that use of alloc without zeroing mem.c:map_range()
results in illegal page tables if memory contains artefacts.

Signed-off-by: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
---
 inmates/lib/alloc.c                 | 9 +++++++++
 inmates/lib/arm-common/mem.c        | 3 +--
 inmates/lib/include/inmate_common.h | 1 +
 inmates/lib/x86/mem.c               | 4 ++--
 inmates/lib/x86/smp.c               | 2 +-
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/inmates/lib/alloc.c b/inmates/lib/alloc.c
index e68e6cc1..5da6828a 100644
--- a/inmates/lib/alloc.c
+++ b/inmates/lib/alloc.c
@@ -5,6 +5,7 @@
  *
  * Authors:
  *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -47,3 +48,11 @@ void *alloc(unsigned long size, unsigned long align)
 	heap_pos = base + size;
 	return (void *)base;
 }
+
+void *zalloc(unsigned long size, unsigned long align)
+{
+	void *base = alloc(size, align);
+	memset(base, 0, size);
+
+	return base;
+}
diff --git a/inmates/lib/arm-common/mem.c b/inmates/lib/arm-common/mem.c
index 5951fafc..5064b002 100644
--- a/inmates/lib/arm-common/mem.c
+++ b/inmates/lib/arm-common/mem.c
@@ -56,8 +56,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 	while (size) {
 		pgd_index = PGD_INDEX(vaddr);
 		if (!(page_directory[pgd_index] & LONG_DESC_TABLE)) {
-			pmd = alloc(PAGE_SIZE, PAGE_SIZE);
-			memset(pmd, 0, PAGE_SIZE);
+			pmd = zalloc(PAGE_SIZE, PAGE_SIZE);
 			/* ensure the page table walker will see the zeroes */
 			synchronization_barrier();
 
diff --git a/inmates/lib/include/inmate_common.h b/inmates/lib/include/inmate_common.h
index 5af1213a..1c20a0af 100644
--- a/inmates/lib/include/inmate_common.h
+++ b/inmates/lib/include/inmate_common.h
@@ -103,6 +103,7 @@ void __attribute__((format(printf, 1, 2))) printk(const char *fmt, ...);
 extern unsigned long heap_pos;
 
 void *alloc(unsigned long size, unsigned long align);
+void *zalloc(unsigned long size, unsigned long align);
 
 void *memset(void *s, int c, unsigned long n);
 void *memcpy(void *d, const void *s, unsigned long n);
diff --git a/inmates/lib/x86/mem.c b/inmates/lib/x86/mem.c
index 7e1c8b83..764bdb4b 100644
--- a/inmates/lib/x86/mem.c
+++ b/inmates/lib/x86/mem.c
@@ -57,7 +57,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
-			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
@@ -65,7 +65,7 @@ void map_range(void *start, unsigned long size, enum map_type map_type)
 		if (*pt_entry & PAGE_FLAG_PRESENT) {
 			pt = (unsigned long *)(*pt_entry & PAGE_MASK);
 		} else {
-			pt = alloc(PAGE_SIZE, PAGE_SIZE);
+			pt = zalloc(PAGE_SIZE, PAGE_SIZE);
 			*pt_entry = (unsigned long)pt | PAGE_DEFAULT_FLAGS;
 		}
 
diff --git a/inmates/lib/x86/smp.c b/inmates/lib/x86/smp.c
index 94ce2913..625ddaf0 100644
--- a/inmates/lib/x86/smp.c
+++ b/inmates/lib/x86/smp.c
@@ -54,7 +54,7 @@ void smp_start_cpu(unsigned int cpu_id, void (*entry)(void))
 	u64 base_val = ((u64)cpu_id << 32) | APIC_LVL_ASSERT;
 
 	ap_entry = entry;
-	stack = alloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
+	stack = zalloc(PAGE_SIZE, PAGE_SIZE) + PAGE_SIZE;
 
 	write_msr(X2APIC_ICR, base_val | APIC_DM_INIT);
 	delay_us(10000);
-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/AS8PR02MB66632030F576308C52270C07B6489%40AS8PR02MB6663.eurprd02.prod.outlook.com.
